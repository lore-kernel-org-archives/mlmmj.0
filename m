From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 26 Jan 2010 12:13:38 +0000
Subject: PATCH: Notify moderation
Message-Id: <4B5EDC72.7040104@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070307030700000508040703"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------070307030700000508040703
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This patch allows posters to be sent notification when their posts are held for 
moderation. Requires new listtext.

Tests fine for me (as have all the patches I have sent, though I neglected to 
mention once or twice).

Could this be included in mlmmj?

I realise I'm sending quite a few patches for consideration here! I believe these 
are all useful additions, though. They are features that are present in other 
mailing list programs, and which I need and use.

This will be all for a little while, too. The few other things I'm interested in 
are lower priority. I'm keen to have these patches I've already sent included in 
mlmmj (after discussion and modification as appropriate)!

Ben.



--------------070307030700000508040703
Content-Type: text/x-patch;
 name="mlmmj-notifymod.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="mlmmj-notifymod.patch"

diff -r 2918436fa450 TUNABLES
--- a/TUNABLES	Tue Jan 26 22:19:57 2010 +1100
+++ b/TUNABLES	Tue Jan 26 22:45:06 2010 +1100
@@ -103,6 +103,11 @@
    If this file is present, the owner(s) will get a mail with the address of
    someone sub/unsubscribing to a mailinglist.
 
+ ��� notifymod			(boolean)
+
+   If this file is present, the poster (based on the envelope from) will
+   get a mail when their post is being moderation.
+
  ��� digestinterval		(normal)
 
    This file specifies how many seconds will pass before the next digest is
diff -r 2918436fa450 contrib/web/perl-admin/conf/tunables.pl
--- a/contrib/web/perl-admin/conf/tunables.pl	Tue Jan 26 22:19:57 2010 +1100
+++ b/contrib/web/perl-admin/conf/tunables.pl	Tue Jan 26 22:45:06 2010 +1100
@@ -100,6 +100,11 @@
 			  "Notify subscribers",
 			  "If this option is set, the owner(s) will get a mail with the address of someone sub/unsubscribing to a mailinglist.");
 
+mlmmj_boolean("notifymod",
+			  "Notify moderation",
+			  "If this option is set, the poster (based on the envelope from) will ".
+			  "get a mail when their post is being moderation.");
+
 mlmmj_string("digestinterval",
 			 "Digest interval",
 			 "This option specifies how many seconds will pass before the ".
diff -r 2918436fa450 contrib/web/php-admin/conf/tunables.pl
--- a/contrib/web/php-admin/conf/tunables.pl	Tue Jan 26 22:19:57 2010 +1100
+++ b/contrib/web/php-admin/conf/tunables.pl	Tue Jan 26 22:45:06 2010 +1100
@@ -100,6 +100,11 @@
 			  "Notify subscribers",
 			  "If this option is set, the owner(s) will get a mail with the address of someone sub/unsubscribing to a mailinglist.");
 
+mlmmj_boolean("notifymod",
+			  "Notify moderation",
+			  "If this option is set, the poster (based on the envelope from) will ".
+			  "get a mail when their post is being moderation.");
+
 mlmmj_string("digestinterval",
 			 "Digest interval",
 			 "This option specifies how many seconds will pass before the ".
diff -r 2918436fa450 listtexts/en/moderation-poster
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/listtexts/en/moderation-poster	Tue Jan 26 22:45:06 2010 +1100
@@ -0,0 +1,11 @@
+Subject: Post waiting for approval
+
+Hi, this is the mlmmj program managing the mailinglist
+
+$listaddr$
+
+This list is configured to have moderated posts, the post has been queued
+for approval.
+
+--- Below this line are the first 100 lines of the message up for moderation --->
+$originalmail$
diff -r 2918436fa450 src/mlmmj-process.c
--- a/src/mlmmj-process.c	Tue Jan 26 22:19:57 2010 +1100
+++ b/src/mlmmj-process.c	Tue Jan 26 22:45:06 2010 +1100
@@ -76,8 +76,9 @@
 	char *buf, *replyto, *listaddr = getlistaddr(listdir), *listdelim;
 	char *queuefilename = NULL, *moderatorsfilename, *efromismod = NULL;
 	char *mailbasename = mybasename(mailfilename), *tmp, *to;
-	int moderatorsfd, foundaddr = 0;
+	int moderatorsfd, foundaddr = 0, notifymod = 0, status;
 	char *maildata[4] = { "moderateaddr", NULL, "moderators", NULL };
+	pid_t childpid, pid;
 #if 0
 	printf("mailfilename = [%s], mailbasename = [%s]\n", mailfilename,
 			                                     mailbasename);
@@ -131,24 +132,59 @@
 	myfree(listfqdn);
 
 	queuefilename = prepstdreply(listdir, "moderation", "$listowner$",
-				     to, replyto, 2, maildata, NULL, mailfilename);
+				     to, replyto, 2, maildata, NULL,
+				     mailfilename);
 
-	if(efromismod)
-		execlp(mlmmjsend, mlmmjsend,
-				"-l", "1",
-				"-L", listdir,
-				"-F", from,
-				"-m", queuefilename,
-				"-T", efromsender, (char *)NULL);
-	else
-		execlp(mlmmjsend, mlmmjsend,
-				"-l", "2",
-				"-L", listdir,
-				"-F", from,
-				"-m", queuefilename, (char *)NULL);
+	/* we might need to exec more than one mlmmj-send */
+	
+	notifymod = !efromismod && statctrl(listdir,"notifymod");
+	
+	if (notifymod) {
+		childpid = fork();
+		if(childpid < 0)
+			log_error(LOG_ARGS, "Could not fork; poster not notified");
+	} else
+		childpid = -1;
+
+	if(childpid != 0) {
+		if(childpid > 0) {
+			do /* Parent waits for the child */
+				pid = waitpid(childpid, &status, 0);
+			while(pid == -1 && errno == EINTR);
+		}
+		if(efromismod)
+			execlp(mlmmjsend, mlmmjsend,
+					"-l", "1",
+					"-L", listdir,
+					"-F", from,
+					"-m", queuefilename,
+					"-T", efromsender, (char *)NULL);
+		else
+			execlp(mlmmjsend, mlmmjsend,
+					"-l", "2",
+					"-L", listdir,
+					"-F", from,
+					"-m", queuefilename, (char *)NULL);
+		log_error(LOG_ARGS, "execlp() of '%s' failed", mlmmjsend);
+		exit(EXIT_FAILURE);
+	}
+
+	myfree(queuefilename);
+
+	/* send mail to poster that the list is moderated */
+
+	queuefilename = prepstdreply(listdir, "moderation-poster",
+				     "$listowner$", efromsender,
+				     NULL, 1, maildata+2, NULL, mailfilename);
+
+	execlp(mlmmjsend, mlmmjsend,
+			"-l", "1",
+			"-L", listdir,
+			"-F", from,
+			"-m", queuefilename,
+			"-T", efromsender, (char *)NULL);
 
 	log_error(LOG_ARGS, "execlp() of '%s' failed", mlmmjsend);
-
 	exit(EXIT_FAILURE);
 }
 

--------------070307030700000508040703--


