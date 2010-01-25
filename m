From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 25 Jan 2010 13:37:21 +0000
Subject: Re: PATCH: Not me too
Message-Id: <4B5D9E91.8090800@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030908040907040903000809"
List-Id: <mlmmj.mlmmj.org>
References: <4B5D78F3.30600@yahoo.com.au>
In-Reply-To: <4B5D78F3.30600@yahoo.com.au>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------030908040907040903000809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Attached is a second version of this patch. The comments below all
still apply (and I have added another regarding this second part).

> The attached patch adds a 'not me too' feature to mlmmj, where post
> senders are excluded from the post distribution so people don't get
> copies of their own mail. A number of people, particularly those who
> aren't familiar with traditional email mailing lists, prefer this. It
> applies on top of the tunables patch I emailed earlier (which I
> neglected to mention applies over 1.2.17).
>
> Some info and design decisions:
>
> I decided a simple boolean tunable would suffice for this, at least in
> the short term, and quite probably long term, too. For now, people who
> really want confirmation their mail has arrived on the list can always
> subscribe a nomail email to post from. I will devote my mind to how this
> could neatly be extended later if it seems warranted.
>
> Thanks to Franky for getting me started on this. The from address in
> those low level sending functions is the envelope sender, so based on
> the list address, not the sender of the mail, though. The sender of the
> mail is parsed with the other mail headers in mlmmj-process. This means
> I needed to communicate that information from mlmmj-process to
> mlmmj-send. Commandline paramaters seemed the way most consistent with
> the rest of the program, so I added an option.
>
> I also had to decide whether the tunable should be tested in
> mlmmj-process or mlmmj-send. I opted for mlmmj-process, as that's where
> most decisions about whether and where to send mail are made, and as a
> general rule it's best if commandline arguments can override tunables
> rather than be affected by them. Thus I added an '-o' option to omit a
> specified address. The alternative is making the option specify an
> originator address, and testing the tunable in mlmmj-send to see whether
> or not to omit them from the distribution.
>
> I decided to do an extra pass through the recipients list in main() to
> do the filtering rather than modify the lower level functions, as the
> functions are used in numerous locations, but this filtering is only
> required once, so an interface change doesn't seem warranted, and
> iterating the recipients shouldn't be too slow, even for large lists.

To make it work for moderated mail, it saves a <cookie>.orig
filealongside the file in $LISTDIR/moderation in which it writes the
address extracted from the From: header if it is to be omitted from the
distribution. listcontrol() picks this up and adds the -o argument to
mlmmj-send when the mail is approved. mlmmj-maintd should remove these
extra files along with their counterparts as they will be the same age,
though this has not yet been tested.

> Comments? Questions?
>
> I have tested it and it works fine for me.
>
> Could this be included in mlmmj?
>
> The patch includes updating the php and perl web admin interfaces'
> tunables.pl file. Should I be CCing people of that code specifically?

And also the php-moderation script now.

Cheers,

Ben.




--------------030908040907040903000809
Content-Type: text/x-patch;
 name="mlmmj-notmetoo-2.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="mlmmj-notmetoo-2.patch"

diff -ru mlmmj-1.2.17/TUNABLES mlmmj-1.2.17-mod/TUNABLES
--- mlmmj-1.2.17/TUNABLES	2010-01-26 00:12:06.000000000 +1100
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
--- mlmmj-1.2.17/contrib/web/perl-admin/conf/tunables.pl	2010-01-26 00:12:06.000000000 +1100
+++ mlmmj-1.2.17-mod/contrib/web/perl-admin/conf/tunables.pl	2010-01-25 22:16:57.000000000 +1100
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
--- mlmmj-1.2.17/contrib/web/php-admin/conf/tunables.pl	2010-01-26 00:12:06.000000000 +1100
+++ mlmmj-1.2.17-mod/contrib/web/php-admin/conf/tunables.pl	2010-01-25 22:17:02.000000000 +1100
@@ -205,3 +205,9 @@
 			  "Footer",
 			  "The content of this option is appended to mail sent to the list.");
 
+mlmmj_boolean("notmetoo",
+			  "Not me too",
+			  "If this is set, mlmmj attempts to exclude the sender of a post ".
+			  "from the distribution list for that post so people don't receive copies ".
+			  "of their own posts.");
+
diff -ru mlmmj-1.2.17/contrib/web/php-moderation/mlmmj-moderation.php mlmmj-1.2.17-mod/contrib/web/php-moderation/mlmmj-moderation.php
--- mlmmj-1.2.17/contrib/web/php-moderation/mlmmj-moderation.php	2010-01-26 00:11:50.000000000 +1100
+++ mlmmj-1.2.17-mod/contrib/web/php-moderation/mlmmj-moderation.php	2010-01-25 23:57:55.000000000 +1100
@@ -116,6 +116,7 @@
 	if (is_dir($mod_dir)) {
 		if ($dh = opendir($mod_dir)) {
 			while (($file = readdir($dh)) !== false) {
+				if( !ereg("^([0-9a-f]+)\$",$file) ) continue;
 				$full_path = $mod_dir . "/" . $file;
 				if(filetype($full_path) == "file"){
 					if(FALSE === ($input = file_get_contents($full_path))){
Only in mlmmj-1.2.17-mod/listtexts: Makefile
diff -ru mlmmj-1.2.17/man/mlmmj-send.1 mlmmj-1.2.17-mod/man/mlmmj-send.1
--- mlmmj-1.2.17/man/mlmmj-send.1	2010-01-26 00:11:50.000000000 +1100
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
diff -ru mlmmj-1.2.17/src/listcontrol.c mlmmj-1.2.17-mod/src/listcontrol.c
--- mlmmj-1.2.17/src/listcontrol.c	2010-01-26 00:11:50.000000000 +1100
+++ mlmmj-1.2.17-mod/src/listcontrol.c	2010-01-25 23:58:33.000000000 +1100
@@ -105,7 +105,8 @@
 		const char *mlmmjbounce, const char *mailname)
 {
 	char *bouncenr, *tmpstr;
-	char *param = NULL, *conffilename, *moderatefilename;
+	char *param = NULL, *conffilename, *moderatefilename, *omitfilename;
+	char *omit = NULL;
 	char *c, *archivefilename, *sendfilename;
 	const char *subswitch;
 	struct stat stbuf;
@@ -604,7 +605,6 @@
 		}
 
 		sendfilename = concatstr(2, moderatefilename, ".sending");
-
 		if(stat(moderatefilename, &stbuf) < 0) {
 			myfree(moderatefilename);
 			/* no mail to moderate */
@@ -620,12 +620,33 @@
 			exit(EXIT_FAILURE);
 		}
 
+		omitfilename = concatstr(2, moderatefilename, ".omit");
+		if(stat(omitfilename, &stbuf) == 0) {
+			tmpfd = open(omitfilename, O_RDONLY);
+			if(tmpfd < 0) {
+				log_error(LOG_ARGS, "Could not open %s",
+						omitfilename);
+			} else {
+				omit = mygetline(tmpfd);
+				close(tmpfd);
+				chomp(omit);
+			}
+			unlink(omitfilename);
+			myfree(omitfilename);
+		}
+
 		log_oper(listdir, OPLOGFNAME, "%s moderated %s",
 				fromemails->emaillist[0], moderatefilename);
 		myfree(moderatefilename);
-		execlp(mlmmjsend, mlmmjsend,
-				"-L", listdir,
-				"-m", sendfilename, (char *)NULL);
+		if (omit != NULL)
+			execlp(mlmmjsend, mlmmjsend,
+					"-L", listdir,
+					"-o", omit,
+					"-m", sendfilename, (char *)NULL);
+		else
+			execlp(mlmmjsend, mlmmjsend,
+					"-L", listdir,
+					"-m", sendfilename, (char *)NULL);
 		log_error(LOG_ARGS, "execlp() of '%s' failed",
 					mlmmjsend);
 		exit(EXIT_FAILURE);
diff -ru mlmmj-1.2.17/src/mlmmj-process.c mlmmj-1.2.17-mod/src/mlmmj-process.c
--- mlmmj-1.2.17/src/mlmmj-process.c	2010-01-26 00:11:50.000000000 +1100
+++ mlmmj-1.2.17-mod/src/mlmmj-process.c	2010-01-26 00:05:34.000000000 +1100
@@ -331,14 +331,15 @@
 int main(int argc, char **argv)
 {
 	int i, j, opt, noprocess = 0, moderated = 0;
-	int hdrfd, footfd, rawmailfd, donemailfd;
+	int hdrfd, footfd, rawmailfd, donemailfd, omitfd;
 	int subonlypost = 0, addrtocc = 1, intocc = 0, modnonsubposts = 0;
 	int maxmailsize = 0;
 	int notoccdenymails = 0, noaccessdenymails = 0, nosubonlydenymails = 0;
 	int nomaxmailsizedenymails = 0;
+	int notmetoo = 0;
 	char *listdir = NULL, *mailfile = NULL, *headerfilename = NULL;
 	char *footerfilename = NULL, *donemailname = NULL;
-	char *randomstr = NULL, *mqueuename;
+	char *randomstr = NULL, *mqueuename, *omitfilename;
 	char *mlmmjsend, *mlmmjsub, *mlmmjunsub, *mlmmjbounce;
 	char *bindir, *subjectprefix, *discardname, *listaddr, *listdelim;
 	char *listfqdn, *listname, *fromaddr;
@@ -920,6 +923,8 @@
 		}
 	}
 
+	notmetoo = statctrl(listdir, "notmetoo");
+
 	if(!moderated)
 		moderated = statctrl(listdir, "moderated");
 	if(moderated) {
@@ -934,6 +939,27 @@
 			exit(EXIT_FAILURE);
 		}
 		myfree(donemailname);
+		if (notmetoo) {
+			omitfilename = concatstr(2, mqueuename, ".omit");
+			omitfd = open(omitfilename, O_RDWR|O_CREAT|O_EXCL, S_IRUSR|S_IWUSR);
+			if (omitfd < 0) {
+				log_error(LOG_ARGS, "could not open %s",
+					    	    omitfilename);
+				myfree(mqueuename);
+				myfree(omitfilename);
+				exit(EXIT_FAILURE);
+			}
+			myfree(omitfilename);
+			if(writen(omitfd, fromemails.emaillist[0],
+					strlen(fromemails.emaillist[0])) < 0) {
+				log_error(LOG_ARGS,
+						"could not write omit file");
+				myfree(mqueuename);
+				exit(EXIT_FAILURE);
+			}
+			fsync(omitfd);
+			close(omitfd);
+		}
 		newmoderated(listdir, mqueuename, mlmmjsend, efrom);
 		return EXIT_SUCCESS;
 	}
@@ -946,7 +972,13 @@
 		exit(EXIT_SUCCESS);
 	}
 
-	execlp(mlmmjsend, mlmmjsend,
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
--- mlmmj-1.2.17/src/mlmmj-send.c	2010-01-26 00:11:50.000000000 +1100
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

--------------030908040907040903000809--


