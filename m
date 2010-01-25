From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 25 Jan 2010 10:56:51 +0000
Subject: PATCH: Not me too
Message-Id: <4B5D78F3.30600@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020800090209050804010004"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------020800090209050804010004
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The attached patch adds a 'not me too' feature to mlmmj, where post senders are 
excluded from the post distribution so people don't get copies of their own mail. 
A number of people, particularly those who aren't familiar with traditional email 
mailing lists, prefer this. It applies on top of the tunables patch I emailed 
earlier (which I neglected to mention applies over 1.2.17).

Some info and design decisions:

I decided a simple boolean tunable would suffice for this, at least in the short 
term, and quite probably long term, too. For now, people who really want 
confirmation their mail has arrived on the list can always subscribe a nomail 
email to post from. I will devote my mind to how this could neatly be extended 
later if it seems warranted.

Thanks to Franky for getting me started on this. The from address in those low 
level sending functions is the envelope sender, so based on the list address, not 
the sender of the mail, though. The sender of the mail is parsed with the other 
mail headers in mlmmj-process. This means I needed to communicate that information 
from mlmmj-process to mlmmj-send. Commandline paramaters seemed the way most 
consistent with the rest of the program, so I added an option.

I also had to decide whether the tunable should be tested in mlmmj-process or 
mlmmj-send. I opted for mlmmj-process, as that's where most decisions about 
whether and where to send mail are made, and as a general rule it's best if 
commandline arguments can override tunables rather than be affected by them. Thus 
I added an '-o' option to omit a specified address. The alternative is making the 
option specify an originator address, and testing the tunable in mlmmj-send to see 
whether or not to omit them from the distribution.

I decided to do an extra pass through the recipients list in main() to do the 
filtering rather than modify the lower level functions, as the functions are used 
in numerous locations, but this filtering is only required once, so an interface 
change doesn't seem warranted, and iterating the recipients shouldn't be too slow, 
even for large lists.

Comments? Questions?

I have tested it and it works fine for me.

Could this be included in mlmmj?

The patch includes updating the php and perl web admin interfaces' tunables.pl 
file. Should I be CCing people of that code specifically?

Cheers,

Ben.



--------------020800090209050804010004
Content-Type: text/x-patch;
 name="mlmmj-notmetoo.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="mlmmj-notmetoo.patch"

diff -ru mlmmj-1.2.17/TUNABLES mlmmj-1.2.17-mod/TUNABLES
--- mlmmj-1.2.17/TUNABLES	2010-01-25 02:27:05.000000000 +1100
+++ mlmmj-1.2.17-mod/TUNABLES	2010-01-25 02:23:14.000000000 +1100
@@ -217,3 +217,9 @@
 
    The content of this file is appended to mail sent to the list.
 
+ ��� notmetoo			(boolean)
+
+   If this file is present, mlmmj attempts to exclude the sender of a post
+   from the distribution list for that post so people don't receive copies
+   of their own posts.
+
diff -ru mlmmj-1.2.17/contrib/web/perl-admin/conf/tunables.pl mlmmj-1.2.17-mod/contrib/web/perl-admin/conf/tunables.pl
--- mlmmj-1.2.17/contrib/web/perl-admin/conf/tunables.pl	2010-01-25 02:27:05.000000000 +1100
+++ mlmmj-1.2.17-mod/contrib/web/perl-admin/conf/tunables.pl	2010-01-25 02:22:59.000000000 +1100
@@ -205,3 +205,9 @@
 			  "Footer",
 			  "The content of this option is appended to mail sent to the list.");
 
+mlmmj_boolean("notmetoo",
+			  "Not me too",
+			  "If this is set, mlmmj attempts to exclude the sender of a post ".
+			  "from the distribution list for that post so people don't receive copies ".
+			  "of their own posts.");
+
diff -ru mlmmj-1.2.17/contrib/web/php-admin/conf/tunables.pl mlmmj-1.2.17-mod/contrib/web/php-admin/conf/tunables.pl
--- mlmmj-1.2.17/contrib/web/php-admin/conf/tunables.pl	2010-01-25 02:27:05.000000000 +1100
+++ mlmmj-1.2.17-mod/contrib/web/php-admin/conf/tunables.pl	2010-01-25 02:23:18.000000000 +1100
@@ -205,3 +205,9 @@
 			  "Footer",
 			  "The content of this option is appended to mail sent to the list.");
 
+mlmmj_boolean("notmetoo",
+			  "Not me too",
+			  "If this is set, mlmmj attempts to exclude the sender of a post ".
+			  "from the distribution list for that post so people don't receive copies ".
+			  "of their own posts.");
+
diff -ru mlmmj-1.2.17/man/mlmmj-send.1 mlmmj-1.2.17-mod/man/mlmmj-send.1
--- mlmmj-1.2.17/man/mlmmj-send.1	2008-10-31 07:06:33.000000000 +1100
+++ mlmmj-1.2.17-mod/man/mlmmj-send.1	2010-01-25 02:05:35.000000000 +1100
@@ -1,11 +1,11 @@
-.TH mlmmj-send "1" "September 2004" mlmmj-send
+.TH mlmmj-send "1" "January 2010" mlmmj-send
 .SH NAME
 mlmmj-send \- send mail to a mailinglist or similar
 .SH SYNOPSIS
 .B mlmmj-send
 [\fI-L\fR /path/to/list | \fI-l\fR listctrl] \fI\-m\fR /path/to/mail
-[\fI-a\fR] [\fI-D\fR] [\fI-F\fR] [\fI-h\fR] [\fI-r\fR] [\fI-R\fR] [\fI-s\fR]
-[\fI-T\fR] [\fI-V\fR]
+[\fI-a\fR] [\fI-D\fR] [\fI-F\fR] [\fI-h\fR] [\fI-o\fR] [\fI-r\fR] [\fI-R\fR]
+[\fI-s\fR] [\fI-T\fR] [\fI-V\fR]
 .HP
 \fB\-a\fR: Don't archive the mail
 .HP
@@ -21,6 +21,8 @@
 .HP
 \fB\-m\fR: Full path to mail file
 .HP
+\fB\-o\fR: Address to omit from distribution (normal mail only)
+.HP
 \fB\-r\fR: Relayhost IP address (defaults to 127.0.0.1)
 .HP
 \fB\-R\fR: What to use as Reply-To: header
diff -ru mlmmj-1.2.17/src/mlmmj-process.c mlmmj-1.2.17-mod/src/mlmmj-process.c
--- mlmmj-1.2.17/src/mlmmj-process.c	2010-01-11 00:40:57.000000000 +1100
+++ mlmmj-1.2.17-mod/src/mlmmj-process.c	2010-01-25 02:23:23.000000000 +1100
@@ -336,6 +336,7 @@
 	int maxmailsize = 0;
 	int notoccdenymails = 0, noaccessdenymails = 0, nosubonlydenymails = 0;
 	int nomaxmailsizedenymails = 0;
+	int notmetoo = 0;
 	char *listdir = NULL, *mailfile = NULL, *headerfilename = NULL;
 	char *footerfilename = NULL, *donemailname = NULL;
 	char *randomstr = NULL, *mqueuename;
@@ -946,7 +950,14 @@
 		exit(EXIT_SUCCESS);
 	}
 
-	execlp(mlmmjsend, mlmmjsend,
+	notmetoo = statctrl(listdir, "notmetoo");
+	if (notmetoo)
+		execlp(mlmmjsend, mlmmjsend,
+				"-L", listdir,
+				"-o", fromemails.emaillist[0],
+				"-m", donemailname, (char *)NULL);
+	else
+		execlp(mlmmjsend, mlmmjsend,
 				"-L", listdir,
 				"-m", donemailname, (char *)NULL);
 	log_error(LOG_ARGS, "execlp() of '%s' failed", mlmmjsend);
diff -ru mlmmj-1.2.17/src/mlmmj-send.c mlmmj-1.2.17-mod/src/mlmmj-send.c
--- mlmmj-1.2.17/src/mlmmj-send.c	2008-11-01 02:43:37.000000000 +1100
+++ mlmmj-1.2.17-mod/src/mlmmj-send.c	2010-01-25 02:06:18.000000000 +1100
@@ -672,9 +672,9 @@
 
 static void print_help(const char *prg)
 {
-        printf("Usage: %s [-L /path/to/list || -l listctrl] \n"
-	       "       -m /path/to/mail [-a] [-D] [-F] [-h] [-r] [-R] "
-	       "[-s] [-T] [-V]\n"
+	printf("Usage: %s [-L /path/to/list || -l listctrl] \n"
+	       "       -m /path/to/mail [-a] [-D] [-F] [-h] [-o] [-r] [-R] "
+	       "[-R] [-s] [-T] [-V]\n"
 	       " -a: Don't archive the mail\n"
 	       " -D: Don't delete the mail after it's sent\n"
 	       " -F: What to use as MAIL FROM:\n"
@@ -689,6 +689,7 @@
 	       "    '7' means 'digest'\n"
 	       " -L: Full path to list directory\n"
 	       " -m: Full path to mail file\n"
+	       " -o: Address to omit from distribution (normal mail only)\n"
 	       " -r: Relayhost IP address (defaults to 127.0.0.1)\n"
 	       " -R: What to use as Reply-To: header\n"
 	       " -s: Subscribers file name\n"
@@ -704,7 +705,7 @@
 	int deletewhensent = 1, sendres = 0, archive = 1, digest = 0;
 	int ctrlarchive, res;
 	char *listaddr = NULL, *listdelim = NULL;
-	char *mailfilename = NULL, *subfilename = NULL;
+	char *mailfilename = NULL, *subfilename = NULL, *omit = NULL;
 	char *replyto = NULL, *bounceaddr = NULL, *to_addr = NULL;
 	char *relayhost = NULL, *archivefilename = NULL, *tmpstr;
 	char *listctrl = NULL, *subddirname = NULL, *listdir = NULL;
@@ -737,7 +738,7 @@
 	if(sigaction(SIGTERM, &sigact, NULL) < 0)
 		log_error(LOG_ARGS, "Could not install SIGTERM handler!");
 
-	while ((opt = getopt(argc, argv, "aVDhm:l:L:R:F:T:r:s:")) != -1){
+	while ((opt = getopt(argc, argv, "aVDhm:l:L:R:F:T:r:s:o:")) != -1){
 		switch(opt) {
 		case 'a':
 			archive = 0;
@@ -760,6 +761,9 @@
 		case 'm':
 			mailfilename = optarg;
 			break;
+		case 'o':
+			omit = optarg;
+			break;
 		case 'r':
 			relayhost = optarg;
 			break;
@@ -1179,6 +1183,22 @@
 			do {
 				res = getaddrsfromfd(&stl, subfd,
 						maxverprecips);
+				if(omit != NULL && maxverprecips > 1) {
+					for(i = 0; i < stl.count; i++) {
+						if(strcmp(stl.strs[i], omit)
+							== 0) {
+						    myfree(stl.strs[i]);
+						    stl.count--;
+						    while (i < stl.count) {
+							stl.strs[i] =
+								stl.strs[i+1];
+							i++;
+						    }
+						    stl.strs[stl.count] = NULL;
+						    break;
+						}
+					}
+				}
 				if(stl.count == maxverprecips) {
 					initsmtp(&sockfd, relay, smtpport);
 					if(verp) {

--------------020800090209050804010004--


