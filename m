From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 26 Jan 2010 11:58:43 +0000
Subject: Re: PATCH: silent subscription
Message-Id: <4B5ED8F3.8070404@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070300020004000801040103"
List-Id: <mlmmj.mlmmj.org>
References: <4B5EC0DD.1020106@yahoo.com.au>
In-Reply-To: <4B5EC0DD.1020106@yahoo.com.au>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------070300020004000801040103
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This is a better version of the patch. As I was implementing the notification of 
moderation, I realised this forking behaviour was far from ideal and could be 
better. Now it does the forking similarly to how it is done for confirming 
subscriptions while notifying the list owner. It, too, makes sending the 
notification the lower priority, with the exit status representing whether it 
succeeded in sending the mail to moderators.

The comments below still apply.

On 26/01/10 9:15 PM, Ben Schmidt wrote:
> Got bitten by this one, too! The documentation for mlmmj-sub has an
> interesting use of the word 'silent'. I've changed the documentation and
> added an option to actually allow silent subscription even when
> moderation is turned on.
>
> I also added a tunable to disable the message to the requester. Mail
> moderation doesn't spam the requester each time they send a mail, so why
> should subscription requests? (Though notifying posters that their mail
> is awaiting moderation is a feature I will need, too, and will send a
> patch shortly for that as it should be fairly straightforward.)
>
> Patch attached. Could it be included in mlmmj?
>
> Cheers,
>
> Ben.




--------------070300020004000801040103
Content-Type: text/x-patch;
 name="mlmmj-sub-silent.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="mlmmj-sub-silent.patch"

diff -r 5ede2d9142c2 TUNABLES
--- a/TUNABLES	Tue Jan 26 22:19:31 2010 +1100
+++ b/TUNABLES	Tue Jan 26 22:19:57 2010 +1100
@@ -158,6 +158,12 @@
    when it was rejected due to an access rule (see 'access') or whether it's a
    subscribers only posting list (see 'subonlypost').
 
+ ��� nosubmodmails		(boolean)
+
+   This switch turns off whether mlmmj sends out notification about
+   subscription being moderated to the person requesting subscription
+   (see 'submod').
+
  ��� smtpport			(normal)
 
    In this file a port other than port 25 for connecting to the relayhost
diff -r 5ede2d9142c2 contrib/web/perl-admin/conf/tunables.pl
--- a/contrib/web/perl-admin/conf/tunables.pl	Tue Jan 26 22:19:31 2010 +1100
+++ b/contrib/web/perl-admin/conf/tunables.pl	Tue Jan 26 22:19:57 2010 +1100
@@ -156,6 +156,12 @@
 			  "This switch turns off whether mlmmj sends out notification about postings ".
 			  "being rejected due to a subscribers only posting list (see 'subonlypost').");
 
+mlmmj_boolean("nosubmodmails",
+			  "No subscription moderated mails",
+			  "This switch turns off whether mlmmj sends out notification about ".
+			  "subscription being moderated to the person requesting subscription".
+			  "(see 'submod').");
+
 mlmmj_boolean("nodigesttext",
 			  "No digest text summary",
 			  "This switch turns off whether digest mails will have a text part with a thread ".
diff -r 5ede2d9142c2 contrib/web/php-admin/conf/tunables.pl
--- a/contrib/web/php-admin/conf/tunables.pl	Tue Jan 26 22:19:31 2010 +1100
+++ b/contrib/web/php-admin/conf/tunables.pl	Tue Jan 26 22:19:57 2010 +1100
@@ -156,6 +156,12 @@
 			  "This switch turns off whether mlmmj sends out notification about postings ".
 			  "being rejected due to a subscribers only posting list (see 'subonlypost').");
 
+mlmmj_boolean("nosubmodmails",
+			  "No subscription moderated mails",
+			  "This switch turns off whether mlmmj sends out notification about ".
+			  "subscription being moderated to the person requesting subscription".
+			  "(see 'submod').");
+
 mlmmj_boolean("nodigesttext",
 			  "No digest text summary",
 			  "This switch turns off whether digest mails will have a text part with a thread ".
diff -r 5ede2d9142c2 man/mlmmj-sub.1
--- a/man/mlmmj-sub.1	Tue Jan 26 22:19:31 2010 +1100
+++ b/man/mlmmj-sub.1	Tue Jan 26 22:19:57 2010 +1100
@@ -1,18 +1,20 @@
-.TH mlmmj-sub "1" "September 2004" mlmmj-sub
+.TH mlmmj-sub "1" "January 2010" mlmmj-sub
 .SH NAME
 mlmmj-sub \- subscribe address to a mailinglist run by mlmmj
 .SH SYNOPSIS
 .B mlmmj-sub
 \fI-L /path/to/list -a john@doe.org \fR[\fI-c\fR | \fI-C\fR] \fR[\fI-d\fR | \fI-n\fR]
-[\fI-h\fR] [\fI-U\fR] [\fI-V\fR]
+[\fI-f\fR] [\fI-h\fR] [\fI-U\fR] [\fI-V\fR]
 .HP
 \fB\-a\fR: Email address to subscribe
 .HP
 \fB\-c\fR: Send welcome mail
 .HP
+\fB\-C\fR: Request mail confirmation
+.HP
 \fB\-d\fR: Subscribe to digest version of the list
 .HP
-\fB\-C\fR: Request mail confirmation
+\fB\-f\fR: Force subscription (do not moderate)
 .HP
 \fB\-h\fR: This help
 .HP
@@ -44,8 +46,11 @@
 Normally a mail is sent to the subscriber if the address is already subscribed
 to the list. If the \fB\-s\fR switch is used such a mail will not be sent.
 
-When neither \fB\-c\fR nor \fB\-C\fR are specified, subscription silently
-happens.
+Subscription may be moderated (if <listdir>/control/submod exists) unless the
+\fB\-f\fR switch is given.
+
+To ensure a silent subscription, use \fB\-f\fR, but neither \fB\-c\fR
+nor \fB\-C\fR.
 .SH "SEE ALSO"
 mlmmj-unsub(1), setuid(2)
 .SH AUTHORS
diff -r 5ede2d9142c2 src/mlmmj-sub.c
--- a/src/mlmmj-sub.c	Tue Jan 26 22:19:31 2010 +1100
+++ b/src/mlmmj-sub.c	Tue Jan 26 22:19:57 2010 +1100
@@ -54,12 +54,12 @@
 		const char *listdelim, const char *subaddr,
 		const char *mlmmjsend, enum subtype typesub)
 {
-	int i, fd;
+	int i, fd, status, nosubmodmails = 0;
 	char *a = NULL, *queuefilename, *from, *listname, *listfqdn, *str;
 	char *modfilename, *randomstr, *mods, *to, *replyto, *moderators = NULL;
 	char *modfilebase;
 	struct strlist *submods;
-	pid_t pid;
+	pid_t childpid, pid;
 	char *maildata[6] = { "subaddr", NULL, "moderateaddr", NULL,
 				"moderators", NULL };
 
@@ -151,16 +151,24 @@
 	
 	myfree(maildata[1]);
 	
-	/* we need to exec more than one mlmmj-send */
+	/* we might need to exec more than one mlmmj-send */
 	
-	pid = fork();
+	nosubmodmails = statctrl(listdir,"nosubmodmails");
+	
+	if (nosubmodmails)
+		childpid = -1;
+	else {
+		childpid = fork();
+		if(childpid < 0)
+			log_error(LOG_ARGS, "Could not fork; requester not notified");
+	}
 
-	if(pid < 0) {
-		log_error(LOG_ARGS, "Could not fork for mlmmj-send"
-				"Request in %s not served", modfilename);
-		exit(EXIT_FAILURE);
-	}
-	if(pid == 0) {
+	if(childpid != 0) {
+		if(childpid > 0) {
+			do /* Parent waits for the child */
+				pid = waitpid(childpid, &status, 0);
+			while(pid == -1 && errno == EINTR);
+		}
 		execl(mlmmjsend, mlmmjsend,
 				"-a",
 				"-l", "4",
@@ -172,7 +180,7 @@
 		log_error(LOG_ARGS, "execl() of '%s' failed", mlmmjsend);
 		exit(EXIT_FAILURE);
 	}
-	
+
 	myfree(to);
 	myfree(replyto);
 	myfree(moderators);
@@ -429,11 +437,12 @@
 static void print_help(const char *prg)
 {
 	printf("Usage: %s -L /path/to/list [-a john@doe.org | -m str]"
-	       "[-c] [-C] [-h]\n       [-L] [-d | -n] [-s] [-U] [-V]\n"
+	       "[-c] [-C] [-f]\n       [-h] [-L] [-d | -n] [-s] [-U] [-V]\n"
 	       " -a: Email address to subscribe \n"
 	       " -c: Send welcome mail\n"
 	       " -C: Request mail confirmation\n"
 	       " -d: Subscribe to digest of list\n"
+	       " -f: Force subscription (do not moderate)\n"
 	       " -h: This help\n"
 	       " -L: Full path to list directory\n"
 	       " -m: moderation string\n"
@@ -441,8 +450,8 @@
 	printf(" -s: Don't send a mail to subscriber if already subscribed\n"
 	       " -U: Don't switch to the user id of the listdir owner\n"
 	       " -V: Print version\n"
-	       "When no options are specified, subscription silently "
-	       "happens\n");
+	       "When no options are specified, subscription may be "
+	       "moderated;\nto ensure a silent subscription, use -f\n");
 	exit(EXIT_SUCCESS);
 }
 
@@ -487,6 +496,7 @@
 	int subconfirm = 0, confirmsub = 0, opt, subfilefd, lock, notifysub;
 	int changeuid = 1, status, digest = 0, nomail = 0, i = 0, submod = 0;
 	int groupwritable = 0, sublock, sublockfd, nogensubscribed = 0, subbed;
+	int force = 0;
 	size_t len;
 	struct stat st;
 	pid_t pid, childpid;
@@ -501,7 +511,7 @@
 	mlmmjsend = concatstr(2, bindir, "/mlmmj-send");
 	myfree(bindir);
 
-	while ((opt = getopt(argc, argv, "hcCdm:nsVUL:a:")) != -1) {
+	while ((opt = getopt(argc, argv, "hcCdfm:nsVUL:a:")) != -1) {
 		switch(opt) {
 		case 'a':
 			address = optarg;
@@ -515,6 +525,9 @@
 		case 'd':
 			digest = 1;
 			break;
+		case 'f':
+			force = 1;
+			break;
 		case 'h':
 			print_help(argv[0]);
 			break;
@@ -670,7 +683,7 @@
 	subbed = is_subbed_in(subddirname, address);
 	listdelim = getlistdelim(listdir);
 	if(modstr == NULL)
-		submod = statctrl(listdir, "submod");
+		submod = !force && statctrl(listdir, "submod");
 	
 	if(subbed) {
 		if(subconfirm) {
@@ -719,7 +732,7 @@
 		childpid = fork();
 
 		if(childpid < 0) {
-			log_error(LOG_ARGS, "Could not fork");
+			log_error(LOG_ARGS, "Could not fork; owner not notified");
 			confirm_sub(listdir, listaddr, listdelim, address,
 					mlmmjsend, typesub);
 		}

--------------070300020004000801040103--


