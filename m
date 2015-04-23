From: "A. Schulze" <sca@andreasschulze.de>
Date: Thu, 23 Apr 2015 19:26:51 +0000
Subject: Re: [mlmmj] Mlmmj 1.2.19b1 released
Message-Id: <20150423212651.Horde.9G1AregFpYOWoN5Je3xhAA9@horde.andreasschulze.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_jU4yx7h8weoD5xptOrR3BA1"
List-Id: <mlmmj.mlmmj.org>
References: <5538D63E.9050606@yahoo.com.au>
In-Reply-To: <5538D63E.9050606@yahoo.com.au>
To: mlmmj@mlmmj.org

This message is in MIME format.

--=_jU4yx7h8weoD5xptOrR3BA1
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


Ben Schmidt:
> A beta release for the upcoming Mlmmj 1.2.19 has been published.

Thanks for your work.

I just build a version for Debian Jessie and noticed these warnings:

gcc -DHAVE_CONFIG_H -I. -I.. -I./../include  -D_FORTIFY_SOURCE=2 -g  
-Wall -pedantic -Wsign-compare  
-DDEFAULTTEXTDIR='"/usr/share/mlmmj/text.skel"' -g -O2  
-fstack-protector-strong -Wformat -Werror=format-security -Wall -c -o  
unistr.o unistr.c
unistr.c: In function 'unistr_utf8_to_header':
unistr.c:570:9: warning: assignment discards 'const' qualifier from  
pointer target type
      wsp = p;
          ^

gcc -DHAVE_CONFIG_H -I. -I.. -I./../include  -D_FORTIFY_SOURCE=2 -g  
-Wall -pedantic -Wsign-compare  
-DDEFAULTTEXTDIR='"/usr/share/mlmmj/text.skel"' -g -O2  
-fstack-protector-strong -Wformat -Werror=format-security -Wall -c -o  
mlmmj-sub.o mlmmj-sub.c
mlmmj-sub.c: In function 'subscribe_type':
mlmmj-sub.c:589:4: warning: ignoring return value of 'setgid',  
declared with attribute warn_unused_result [-Wunused-result]
     setgid(st.st_gid);
     ^

gcc -DHAVE_CONFIG_H -I. -I.. -I./../include  -D_FORTIFY_SOURCE=2 -g  
-Wall -pedantic -Wsign-compare  
-DDEFAULTTEXTDIR='"/usr/share/mlmmj/text.skel"' -g -O2  
-fstack-protector-strong -Wformat -Werror=format-security -Wall -c -o  
mlmmj-list.o mlmmj-list.c
mlmmj-list.c: In function 'main':
mlmmj-list.c:103:11: warning: variable 'ret' set but not used  
[-Wunused-but-set-variable]
   int opt, ret, count = 0, docount = 0;
            ^

I also have a patch for 1.2.18.1 to set the SMTP HELO/EHLO name.
No surprise, this patch does not apply cleanly anymore. But I would  
love to see the feature included in 1.2.19 ...

I'll report again once I /installed/ the new Version ...

Andreas

--=_jU4yx7h8weoD5xptOrR3BA1
Content-Type: text/x-diff; charset=utf-8; name=smtp_helo_name.patch
Content-Disposition: attachment; size=6680; filename=smtp_helo_name.patch
Content-Transfer-Encoding: quoted-printable

Index: mlmmj-1.2.18.1/src/mlmmj-send.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- mlmmj-1.2.18.1.orig/src/mlmmj-send.c	2014-11-28 20:04:14.000000000 +0=
100
+++ mlmmj-1.2.18.1/src/mlmmj-send.c	2014-12-01 20:33:44.000000000 +0100
@@ -376,11 +376,10 @@
 	return 0;
 }
=20
-int initsmtp(int *sockfd, const char *relayhost, unsigned short port)
+int initsmtp(int *sockfd, const char *relayhost, unsigned short port, co=
nst char *heloname)
 {
 	int retval =3D 0;
 	char *reply =3D NULL;
-	char *myhostname =3D hostnamestr();
=20
 	init_sockfd(sockfd, relayhost, port);
=20
@@ -394,8 +393,7 @@
 		retval =3D MLMMJ_CONNECT;
 		/* FIXME: Queue etc. */
 	}=09
-	write_helo(*sockfd, myhostname);
-	myfree(myhostname);
+	write_helo(*sockfd, heloname);
 	if((reply =3D checkwait_smtpreply(*sockfd, MLMMJ_HELO)) !=3D NULL) {
 		log_error(LOG_ARGS, "Error with HELO. Reply: [%s]", reply);
 		/* FIXME: quit and tell admin to configure correctly */
@@ -728,7 +726,7 @@
 	char *mlmmjbounce =3D NULL, *bindir, *mailmap, *probefile, *a;
 	char *body =3D NULL, *hdrs =3D NULL, *memmailsizestr =3D NULL, *verp =3D=
 NULL;
 	char relay[16], *listname, *listfqdn, *verpfrom, *maxverprecipsstr;
-	char strindex[32], *reply, *strport, *requeuefilename;
+	char strindex[32], *reply, *strport, *smtphelo, *requeuefilename;
 	ssize_t memmailsize =3D 0;
 	DIR *subddir;
 	struct dirent *dp;
@@ -1012,10 +1010,14 @@
 	if(strport)
 		smtpport =3D (unsigned short)atol(strport);
=20
+	if ((smtphelo =3D ctrlvalue(listdir, "smtphelo")) =3D=3D NULL) {
+		smtphelo =3D hostnamestr();
+	}
+
 	switch(listctrl[0]) {
 	case '1': /* A single mail is to be sent */
 	case '6':
-		initsmtp(&sockfd, relay, smtpport);
+		initsmtp(&sockfd, relay, smtpport, smtphelo);
 		if(send_mail(sockfd, bounceaddr, to_addr, replyto,
 				mailmap, st.st_size, listdir, NULL,
 				hdrs, hdrslen, body, bodylen)) {
@@ -1073,7 +1075,7 @@
 		}
 		break;
 	case '2': /* Moderators */
-		initsmtp(&sockfd, relay, smtpport);
+		initsmtp(&sockfd, relay, smtpport, smtphelo);
 		if(send_mail_many_fd(sockfd, bounceaddr, NULL, mailmap,
 				     st.st_size, subfd, NULL, NULL, NULL,
 				     listdir, NULL, hdrs, hdrslen,
@@ -1085,7 +1087,7 @@
 		}
 		break;
 	case '3': /* resending earlier failed mails */
-		initsmtp(&sockfd, relay, smtpport);
+		initsmtp(&sockfd, relay, smtpport, smtphelo);
 		if(send_mail_many_fd(sockfd, NULL, NULL, mailmap, st.st_size,
 				subfd, listaddr, listdelim, mailfilename,
 				listdir, mlmmjbounce, hdrs, hdrslen,
@@ -1098,7 +1100,7 @@
 		unlink(subfilename);
 		break;
 	case '4': /* send mails to owner */
-		initsmtp(&sockfd, relay, smtpport);
+		initsmtp(&sockfd, relay, smtpport, smtphelo);
 		if(send_mail_many_fd(sockfd, bounceaddr, NULL, mailmap,
 				st.st_size, subfd, listaddr, listdelim,
 				mailfilename, listdir, mlmmjbounce,
@@ -1110,7 +1112,7 @@
 		}
 		break;
 	case '5': /* bounceprobe - handle relayhost local users bouncing*/
-		initsmtp(&sockfd, relay, smtpport);
+		initsmtp(&sockfd, relay, smtpport, smtphelo);
 		if(send_mail(sockfd, bounceaddr, to_addr, replyto,
 				mailmap, st.st_size, listdir, NULL,
 				hdrs, hdrslen, body, bodylen)) {
@@ -1175,7 +1177,7 @@
 		}
 	=09
 		if(verp) {
-			initsmtp(&sockfd, relay, smtpport);
+			initsmtp(&sockfd, relay, smtpport, smtphelo);
 			if(sockfd > -1) {
 			    if(write_mail_from(sockfd, verpfrom, verp)) {
 				log_error(LOG_ARGS,
@@ -1239,7 +1241,7 @@
 					}
 				}
 				if(stl.count =3D=3D maxverprecips) {
-					initsmtp(&sockfd, relay, smtpport);
+					initsmtp(&sockfd, relay, smtpport, smtphelo);
 					if(verp) {
 						sendres =3D send_mail_verp(
 								sockfd, &stl,
@@ -1283,7 +1285,7 @@
=20
 		}
 		if(stl.count) {
-			initsmtp(&sockfd, relay, smtpport);
+			initsmtp(&sockfd, relay, smtpport, smtphelo);
 			if(verp) {
 				sendres =3D send_mail_verp(sockfd, &stl, mailmap,
 						st.st_size, verpfrom, listdir,
@@ -1324,6 +1326,7 @@
 	munmap(mailmap, st.st_size);
 	close(mailfd);
 	myfree(verp);
+	myfree(smtphelo);
=20
 	if(archive) {
 		if(!ctrlarchive) {
Index: mlmmj-1.2.18.1/include/mlmmj-send.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- mlmmj-1.2.18.1.orig/include/mlmmj-send.h	2014-11-28 20:04:14.00000000=
0 +0100
+++ mlmmj-1.2.18.1/include/mlmmj-send.h	2014-12-01 20:33:44.000000000 +01=
00
@@ -45,7 +45,7 @@
 		   size_t mailsize, const char *from, const char *listdir,
 		   const char *hdrs, size_t hdrslen, const char *body,
 		   size_t bodylen, const char *extra);
-int initsmtp(int *sockfd, const char *relayhost, unsigned short port);
+int initsmtp(int *sockfd, const char *relayhost, unsigned short port, co=
nst char *heloname);
 int endsmtp(int *sockfd);
=20
 #endif /* MMJML_SEND_H */
Index: mlmmj-1.2.18.1/TUNABLES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- mlmmj-1.2.18.1.orig/TUNABLES	2014-12-01 20:35:45.000000000 +0100
+++ mlmmj-1.2.18.1/TUNABLES	2014-12-01 20:41:38.000000000 +0100
@@ -243,3 +243,7 @@
    from the distribution list for that post so people don't receive copi=
es
    of their own posts.
=20
+ =C2=B7 smtphelo			(normal)
+
+   When this file is present, it contains the hostname to send in the SM=
TP
+   EHLO or HELO command. Otherwise the machine hostname is used.
Index: mlmmj-1.2.18.1/contrib/web/perl-admin/conf/tunables.pl
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- mlmmj-1.2.18.1.orig/contrib/web/perl-admin/conf/tunables.pl	2014-12-0=
1 20:43:00.000000000 +0100
+++ mlmmj-1.2.18.1/contrib/web/perl-admin/conf/tunables.pl	2014-12-01 20:=
45:40.000000000 +0100
@@ -222,3 +222,7 @@
 			  "from the distribution list for that post so people don't receive c=
opies ".
 			  "of their own posts.");
=20
+mlmmj_string("smtphelo",
+			  "SMTP Helo Name",
+			  "When this file is present, it contains the hostname to send in the=
 SMTP ".
+			  "EHLO or HELO command. Otherwise the machine hostname is used.");
Index: dv-mlmmj-1.2.18.1/contrib/web/php-admin/conf/tunables.pl
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- mlmmj-1.2.18.1.orig/contrib/web/php-admin/conf/tunables.pl	2014-12-01=
 20:45:54.000000000 +0100
+++ mlmmj-1.2.18.1/contrib/web/php-admin/conf/tunables.pl	2014-12-01 20:4=
6:33.000000000 +0100
@@ -222,3 +222,7 @@
 			  "from the distribution list for that post so people don't receive c=
opies ".
 			  "of their own posts.");
=20
+mlmmj_string("smtphelo",
+			  "SMTP Helo Name",
+			  "When this file is present, it contains the hostname to send in the=
 SMTP ".
+			  "EHLO or HELO command. Otherwise the machine hostname is used.");

--=_jU4yx7h8weoD5xptOrR3BA1--


