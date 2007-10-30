From: Sascha Sommer <ssommer@suse.de>
Date: Tue, 30 Oct 2007 15:53:46 +0000
Subject: [PATCH] mlmmj more verbose access denied mails
Message-Id: <200710301653.46807.ssommer@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_KO1JHGbfoACQoIx"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

--Boundary-00=_KO1JHGbfoACQoIx
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

the attached patch adds another parameter to the prepheader function. This=
=20
parameter can be used to pass the filename of the mail that is going to be=
=20
rejected.

If the parameter is set the first 100 lines of the rejected mail will be=20
appended to the reply.

I implemented this for the rejections due to maxmailsize, access denied and=
=20
list adress not passed in the to cases.
What do you think?

Regards

Sascha

P.S. The mails will then look like:

"Hi, this is the mlmmj program managing the mailinglist

test@cuba.sommer.dynalias.net

I'm sorry to inform you that your message could not be delivered to the
list. Your mail was rejected because it matched a rule set up by the
list administrator.

Thanks.

X-Original-To: test@cuba.sommer.dynalias.net
Delivered-To: test@cuba.sommer.dynalias.net
Received: by cuba.sommer.dynalias.net (Postfix, from userid 1000)
=A0=A0=A0=A0=A0=A0=A0=A0id 56FB719B3AC; Mon, 29 Oct 2007 18:13:03 +0100 (CE=
T)
=46rom: Sascha Sommer <sascha@cuba.sommer.dynalias.net>
To: test@cuba.sommer.dynalias.net
Subject: test4
User-Agent: KMail/1.9.6 (enterprise 20070904.708012)
MIME-Version: 1.0
Content-Disposition: inline
Date: Mon, 29 Oct 2007 18:13:02 +0100
Content-Type: text/plain;
=A0 charset=3D"iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200710291813.02497.sascha@cuba.sommer.dynalias.net>

blah blah blah
"

--Boundary-00=_KO1JHGbfoACQoIx
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mlmmj-verbose-access-bounce.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mlmmj-verbose-access-bounce.patch"

diff -Naur org/mlmmj-1.2.15/include/prepstdreply.h mlmmj-1.2.15/include/prepstdreply.h
--- org/mlmmj-1.2.15/include/prepstdreply.h	2007-06-13 22:54:41.000000000 +0200
+++ mlmmj-1.2.15/include/prepstdreply.h	2007-10-29 16:46:03.000000000 +0100
@@ -31,6 +31,6 @@
 int open_listtext(const char *listdir, const char *filename);
 char *prepstdreply(const char *listdir, const char *filename, const char *from,
 		   const char *to, const char *replyto, size_t tokencount,
-		   char **data, char *customheaders);
+		   char **data, char *customheaders, const char *mailname);
 
 #endif /* PREPSTDREPLY_H */
diff -Naur org/mlmmj-1.2.15/src/mlmmj-bounce.c mlmmj-1.2.15/src/mlmmj-bounce.c
--- org/mlmmj-1.2.15/src/mlmmj-bounce.c	2006-08-06 10:36:47.000000000 +0200
+++ mlmmj-1.2.15/src/mlmmj-bounce.c	2007-10-29 17:00:01.000000000 +0100
@@ -139,7 +139,7 @@
 
 	maildata[1] = indexstr;
 	queuefilename = prepstdreply(listdir, "bounce-probe", "$listowner$",
-					myaddr, NULL, 1, maildata, NULL);
+					myaddr, NULL, 1, maildata, NULL, NULL);
 	MY_ASSERT(queuefilename);
 	myfree(indexstr);
 
diff -Naur org/mlmmj-1.2.15/src/mlmmj-process.c mlmmj-1.2.15/src/mlmmj-process.c
--- org/mlmmj-1.2.15/src/mlmmj-process.c	2007-05-09 18:59:23.000000000 +0200
+++ mlmmj-1.2.15/src/mlmmj-process.c	2007-10-29 17:46:36.000000000 +0100
@@ -123,7 +123,7 @@
 	myfree(listfqdn);
 
 	queuefilename = prepstdreply(listdir, "moderation", "$listowner$",
-				     to, replyto, 2, maildata, NULL);
+				     to, replyto, 2, maildata, NULL, NULL);
 
 	if((queuefd = open(queuefilename, O_WRONLY|O_APPEND)) < 0) {
 		log_error(LOG_ARGS, "Could not open '%s'", queuefilename);
@@ -657,7 +657,7 @@
 			queuefilename = prepstdreply(listdir,
 					"maxmailsize", "$listowner$",
 					fromemails.emaillist[0],
-					NULL, 2, maildata, NULL);
+					NULL, 2, maildata, NULL, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listdelim);
 			myfree(listname);
@@ -768,7 +768,7 @@
 				     listfqdn);
 		queuefilename = prepstdreply(listdir, "notintocc",
 					"$listowner$", fromemails.emaillist[0],
-					     NULL, 0, NULL, NULL);
+					     NULL, 0, NULL, NULL, donemailname);
 		MY_ASSERT(queuefilename)
 		myfree(listdelim);
 		myfree(listname);
@@ -829,7 +829,7 @@
 					"bounces-help@", listfqdn);
 			queuefilename = prepstdreply(listdir, "subonlypost",
 					"$listowner$", fromemails.emaillist[0],
-						     NULL, 1, maildata, NULL);
+						     NULL, 1, maildata, NULL, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listaddr);
 			myfree(listdelim);
@@ -880,7 +880,7 @@
 			queuefilename = prepstdreply(listdir, "access",
 							"$listowner$",
 							fromemails.emaillist[0],
-						     NULL, 0, NULL, NULL);
+						     NULL, 0, NULL, NULL, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listaddr);
 			myfree(listdelim);
diff -Naur org/mlmmj-1.2.15/src/mlmmj-sub.c mlmmj-1.2.15/src/mlmmj-sub.c
--- org/mlmmj-1.2.15/src/mlmmj-sub.c	2007-06-10 20:40:20.000000000 +0200
+++ mlmmj-1.2.15/src/mlmmj-sub.c	2007-10-29 16:59:07.000000000 +0100
@@ -147,7 +147,7 @@
 	maildata[5] = moderators;
 
 	queuefilename = prepstdreply(listdir, "submod-moderator",
-				"$listowner$", to, replyto, 3, maildata, NULL);
+				"$listowner$", to, replyto, 3, maildata, NULL, NULL);
 	
 	myfree(maildata[1]);
 	
@@ -181,7 +181,7 @@
 
 	from = concatstr(4, listname, listdelim, "bounces-help@", listfqdn);
 	queuefilename = prepstdreply(listdir, "submod-requester", "$listowner$",
-					subaddr, NULL, 0, NULL, NULL);
+					subaddr, NULL, 0, NULL, NULL, NULL);
 	
 	myfree(listname);
 	myfree(listfqdn);
@@ -274,7 +274,7 @@
 	}
 
 	queuefilename = prepstdreply(listdir, listtext, "$helpaddr$",
-				     subaddr, NULL, 0, NULL, NULL);
+				     subaddr, NULL, 0, NULL, NULL, NULL);
 	MY_ASSERT(queuefilename);
 	myfree(listtext);
 
@@ -321,7 +321,7 @@
 	}
 
 	queuefilename = prepstdreply(listdir, listtext, "$listowner$",
-				"$listowner$", NULL, 1, maildata, NULL);
+				"$listowner$", NULL, 1, maildata, NULL, NULL);
 	MY_ASSERT(queuefilename)
 	myfree(listtext);
 	myfree(maildata[1]);
@@ -408,7 +408,7 @@
 	maildata[3] = mystrdup(confirmaddr);
 
 	queuefilename = prepstdreply(listdir, listtext, "$helpaddr$", subaddr,
-				     confirmaddr, 2, maildata, NULL);
+				     confirmaddr, 2, maildata, NULL, NULL);
 
 	myfree(maildata[1]);
 	myfree(maildata[3]);
@@ -460,7 +460,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, "sub-subscribed", "$helpaddr$",
-				     subaddr, NULL, 0, NULL, NULL);
+				     subaddr, NULL, 0, NULL, NULL, NULL);
 	MY_ASSERT(queuefilename);
 
 	myfree(listaddr);
diff -Naur org/mlmmj-1.2.15/src/mlmmj-unsub.c mlmmj-1.2.15/src/mlmmj-unsub.c
--- org/mlmmj-1.2.15/src/mlmmj-unsub.c	2006-08-23 21:37:18.000000000 +0200
+++ mlmmj-1.2.15/src/mlmmj-unsub.c	2007-10-29 16:59:44.000000000 +0100
@@ -76,7 +76,7 @@
 	}
 
 	queuefilename = prepstdreply(listdir, listtext, "$helpaddr$",
-				     subaddr, NULL, 0, NULL, NULL);
+				     subaddr, NULL, 0, NULL, NULL, NULL);
 	MY_ASSERT(queuefilename);
 	myfree(listtext);
 
@@ -124,7 +124,7 @@
 	}
 	
 	queuefilename = prepstdreply(listdir, listtext, "$listowner$",
-				     "$listowner$", NULL, 1, maildata, NULL);
+				     "$listowner$", NULL, 1, maildata, NULL, NULL);
 	MY_ASSERT(queuefilename);
 	myfree(listtext);
 	myfree(maildata[1]);
@@ -213,7 +213,7 @@
 	maildata[3] = mystrdup(confirmaddr);
 
 	queuefilename = prepstdreply(listdir, listtext, "$helpaddr$", subaddr,
-				     confirmaddr, 2, maildata, NULL);
+				     confirmaddr, 2, maildata, NULL, NULL);
 
 	myfree(maildata[1]);
 	myfree(maildata[3]);
@@ -305,7 +305,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, "unsub-notsubscribed",
-				     "$helpaddr$", subaddr, NULL, 0, NULL, NULL);
+				     "$helpaddr$", subaddr, NULL, 0, NULL, NULL, NULL);
 	MY_ASSERT(queuefilename);
 
 	myfree(listaddr);
diff -Naur org/mlmmj-1.2.15/src/prepstdreply.c mlmmj-1.2.15/src/prepstdreply.c
--- org/mlmmj-1.2.15/src/prepstdreply.c	2007-06-14 00:27:21.000000000 +0200
+++ mlmmj-1.2.15/src/prepstdreply.c	2007-10-29 18:09:46.000000000 +0100
@@ -187,9 +187,9 @@
 
 char *prepstdreply(const char *listdir, const char *filename, const char *from,
 		   const char *to, const char *replyto, size_t tokencount,
-		   char **data, char *customheaders)
+		   char **data, char *customheaders, const char *mailname)
 {
-	int infd, outfd;
+	int infd, outfd, mailfd;
 	char *listaddr, *listdelim, *myfrom, *tmp, *subject, *retstr = NULL;
 	char *listfqdn, *line, *utfline, *utfsub, *utfsub2;
 	char *myreplyto, *myto, *str = NULL, *mydate, *mymsgid;
@@ -198,6 +198,12 @@
 		return NULL;
 	}
 
+        if (mailname) {
+	   if((mailfd = open(mailname, O_RDONLY)) < 0) {
+		return NULL;
+	   }
+	}
+
 	listaddr = getlistaddr(listdir);
 	listdelim = getlistdelim(listdir);
 	listfqdn = genlistfqdn(listaddr);
@@ -310,6 +316,24 @@
 		}
 		myfree(str);
 	}
+
+	/* append the mail inline */
+	if(mailname) {
+		size_t count = 0;
+		while(count < 100 && (str = mygetline(mailfd))) {
+			if(writen(outfd, str, strlen(str)) < 0) {
+				myfree(str);
+				myfree(listaddr);
+				myfree(listdelim);
+				myfree(listfqdn);
+				log_error(LOG_ARGS, "Could not append mail");
+				return NULL;
+			}
+			myfree(str);
+			count++;
+		}
+		close(mailfd);
+	}
 	
 	fsync(outfd);
 	close(outfd);
diff -Naur org/mlmmj-1.2.15/src/send_help.c mlmmj-1.2.15/src/send_help.c
--- org/mlmmj-1.2.15/src/send_help.c	2006-12-06 22:29:27.000000000 +0100
+++ mlmmj-1.2.15/src/send_help.c	2007-10-29 16:56:12.000000000 +0100
@@ -57,7 +57,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, textfile, "$listowner$",
-					emailaddr, NULL, 0, NULL, NULL);
+					emailaddr, NULL, 0, NULL, NULL, NULL);
 	if(queuefilename == NULL) {
 		log_error(LOG_ARGS, "Could not prepare %s mail", name);
 		exit(EXIT_FAILURE);
diff -Naur org/mlmmj-1.2.15/src/send_list.c mlmmj-1.2.15/src/send_list.c
--- org/mlmmj-1.2.15/src/send_list.c	2006-08-06 10:36:48.000000000 +0200
+++ mlmmj-1.2.15/src/send_list.c	2007-10-29 16:57:34.000000000 +0100
@@ -61,7 +61,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, "listsubs", "$listowner$",
-					emailaddr, NULL, 0, NULL, NULL);
+					emailaddr, NULL, 0, NULL, NULL, NULL);
 	if(queuefilename == NULL) {
 		log_error(LOG_ARGS, "Could not prepare sub list mail");
 		exit(EXIT_FAILURE);

--Boundary-00=_KO1JHGbfoACQoIx--
