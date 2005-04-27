From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 27 Apr 2005 12:27:03 +0000
Subject: Fix for moderation race
Message-Id: <20050427122703.GL97827@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

Andrea Barisani pointed out that if mlmmj-send is in the middle of
sending a moderated mail and someone else moderates it as well, the mail
could possibly be sent more than once.

I wonder why noone have hit it before, or maybe they did but just never
told me? ... anyway, here's the fix:

--- ChangeLog
+++ ChangeLog
@@ -1,3 +1,5 @@
+ o When sending moderated mails, rename them so that they wont be moderated
+   again while sending
 1.2.5
  o Make listname+list send the list of regular subscribers to the owner who
    requested it.
--- src/listcontrol.c
+++ src/listcontrol.c
@@ -102,7 +102,7 @@
 {
 	char *atsign, *recipdelimsign, *bouncenr, *tmpstr;
 	char *controlstr, *param, *conffilename, *moderatefilename;
-	char *c, *archivefilename;
+	char *c, *archivefilename, *sendfilename;
 	const char *subswitch;
 	size_t len;
 	struct stat stbuf;
@@ -483,16 +483,25 @@
 		/* TODO Add accept/reject parameter to moderate */
 		unlink(mailname);
 		moderatefilename = concatstr(3, listdir, "/moderation/", param);
+		sendfilename = concatstr(2, moderatefilename, ".sending");
 		myfree(param);
+
 		if(stat(moderatefilename, &stbuf) < 0) {
 			myfree(moderatefilename);
 			exit(EXIT_SUCCESS); /* just exit, no mail to moderate */
 		}
+		/* Rename it to avoid mail being sent twice */
+		if(rename(moderatefilename, sendfilename) < 0) {
+			log_error(LOG_ARGS, "Could not rename to .sending");
+			exit(EXIT_FAILURE);
+		}
+
 		log_oper(listdir, OPLOGFNAME, "%s moderated %s",
 				fromemails->emaillist[0], moderatefilename);
+		myfree(moderatefilename);
 		execlp(mlmmjsend, mlmmjsend,
 				"-L", listdir,
-				"-m", moderatefilename, (char *)NULL);
+				"-m", sendfilename, (char *)NULL);
 		log_error(LOG_ARGS, "execlp() of '%s' failed",
 					mlmmjsend);
 		exit(EXIT_FAILURE);

I'll of course release 1.2.6 soon with this, but I want to fold in
another couple of things before. I wont wait more than a week though.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
