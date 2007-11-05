From: Sascha Sommer <ssommer@suse.de>
Date: Mon, 05 Nov 2007 15:06:11 +0000
Subject: Re: [PATCH] mlmmj more verbose access denied mails
Message-Id: <200711051606.11853.ssommer@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_jFzLHmmrOcWS8pp"
List-Id: <mlmmj.mlmmj.org>
References: <200710301653.46807.ssommer@suse.de>
In-Reply-To: <200710301653.46807.ssommer@suse.de>
To: mlmmj@mlmmj.org

--Boundary-00=_jFzLHmmrOcWS8pp
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

On Sonntag, 4. November 2007, Morten K. Poulsen wrote:
> Hi Sascha,
>
> Sorry about the delay.
>

No problem. Thanks for the review.

> Sascha Sommer wrote:
> > the attached patch adds another parameter to the prepheader function.
> > This parameter can be used to pass the filename of the mail that is going
> > to be rejected.
>
> Thanks for the patch. I like the idea.
>
> Perhaps you could extend it a bit, with support for a keyword (or magic
> line, to ease implementation) in the listtext files? Something like this:
>
> ---
> Subject: Post to $listaddr$ denied due to size limit
> [...]
> Thanks.
>
> This mail was generated in response to the following mail:
> $original-mail$
> ---
>
> As it is now, the original mail is just appended without any information
> about what it is.
>
> I know that it is a bit more work, but I think it would add a lot of
> value :-)
>

Ok. See the attached patch.
The keyword $originalmail$ can now be set in the
access
maxmailsize
moderation
notintocc
subonlypost

listtext files. If set the first 100 lines of the denied mail will be 
attached.
I also removed the code that currently does the same for the moderation case 
and made it use the new keyword.

Only the de and en listtexts have been updated.

Regards

Sascha

--Boundary-00=_jFzLHmmrOcWS8pp
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="mlmmj-verbose-access-bounce_try2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mlmmj-verbose-access-bounce_try2.patch"

diff -Naur mlmmj-1.2.15.org/include/prepstdreply.h mlmmj-1.2.15/include/prepstdreply.h
--- mlmmj-1.2.15.org/include/prepstdreply.h	2007-11-05 15:29:41.000000000 +0100
+++ mlmmj-1.2.15/include/prepstdreply.h	2007-11-05 15:51:44.000000000 +0100
@@ -25,12 +25,12 @@
 #define PREPSTDREPLY_H
 
 char *substitute(const char *line, const char *listaddr, const char *listdelim,
-		 size_t datacount, char **data);
+		 size_t datacount, char **data, const char* mailname);
 char *substitute_one(const char *line, const char *listaddr,
-		 const char *listdelim, size_t datacount, char **data);
+		 const char *listdelim, size_t datacount, char **data, const char* mailname);
 int open_listtext(const char *listdir, const char *filename);
 char *prepstdreply(const char *listdir, const char *filename, const char *from,
 		   const char *to, const char *replyto, size_t tokencount,
-		   char **data, char *customheaders);
+		   char **data, char *customheaders, const char *mailname);
 
 #endif /* PREPSTDREPLY_H */
diff -Naur mlmmj-1.2.15.org/listtexts/de/access mlmmj-1.2.15/listtexts/de/access
--- mlmmj-1.2.15.org/listtexts/de/access	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/de/access	2007-11-05 15:51:44.000000000 +0100
@@ -10,3 +10,6 @@
 Filter, den der Administrator dieser Liste aufgesetzt hat, traf 
 auf Ihre Mail zu.
 
+--- Unterhalb dieser Linie sehen Sie die ersten 100 Zeilen der abgelehnten Nachricht. --->
+$originalmail$
+
diff -Naur mlmmj-1.2.15.org/listtexts/de/maxmailsize mlmmj-1.2.15/listtexts/de/maxmailsize
--- mlmmj-1.2.15.org/listtexts/de/maxmailsize	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/de/maxmailsize	2007-11-05 15:51:44.000000000 +0100
@@ -9,3 +9,7 @@
 Tut mir leid aber Ihre Mail konnte nicht versandt werden. Die von
 Ihnen verschickte Mail \u00FCberschreitet das bestehende Gr\u00F6\u00DFenlimit
 von $maxmailsize$ Bytes.
+
+--- Unterhalb dieser Linie sehen Sie die ersten 100 Zeilen der abgelehnten Nachricht. --->
+$originalmail$
+
diff -Naur mlmmj-1.2.15.org/listtexts/de/moderation mlmmj-1.2.15/listtexts/de/moderation
--- mlmmj-1.2.15.org/listtexts/de/moderation	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/de/moderation	2007-11-05 15:51:44.000000000 +0100
@@ -23,3 +23,5 @@
 $moderators$
 
 --- Unterhalb dieser Linie sehen Sie die ersten 100 Zeilen der Nachricht, welche moderiert werden muss. --->
+$orignalmail$
+
diff -Naur mlmmj-1.2.15.org/listtexts/de/notintocc mlmmj-1.2.15/listtexts/de/notintocc
--- mlmmj-1.2.15.org/listtexts/de/notintocc	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/de/notintocc	2007-11-05 15:51:44.000000000 +0100
@@ -14,3 +14,6 @@
 
 Danke.
 
+--- Unterhalb dieser Linie sehen Sie die ersten 100 Zeilen der abgelehnten Nachricht. --->
+$originalmail$
+
diff -Naur mlmmj-1.2.15.org/listtexts/de/subonlypost mlmmj-1.2.15/listtexts/de/subonlypost
--- mlmmj-1.2.15.org/listtexts/de/subonlypost	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/de/subonlypost	2007-11-05 15:51:44.000000000 +0100
@@ -26,3 +26,6 @@
 sind, Nachrichten an die Liste schicken zu k\u00F6nnen, tragen Sie die neue
 Adresse bitte auf die Nomail-Version dieser Liste ein.
 
+--- Unterhalb dieser Linie sehen Sie die ersten 100 Zeilen der abgelehnten Nachricht. --->
+$originalmail$
+
diff -Naur mlmmj-1.2.15.org/listtexts/en/access mlmmj-1.2.15/listtexts/en/access
--- mlmmj-1.2.15.org/listtexts/en/access	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/en/access	2007-11-05 15:51:44.000000000 +0100
@@ -10,3 +10,6 @@
 
 Thanks.
 
+--- below this line the first 100 lines of the denied message --->
+$originalmail$
+
diff -Naur mlmmj-1.2.15.org/listtexts/en/maxmailsize mlmmj-1.2.15/listtexts/en/maxmailsize
--- mlmmj-1.2.15.org/listtexts/en/maxmailsize	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/en/maxmailsize	2007-11-05 15:51:44.000000000 +0100
@@ -9,3 +9,6 @@
 
 Thanks.
 
+--- below this line the first 100 lines of the denied message --->
+$originalmail$
+
diff -Naur mlmmj-1.2.15.org/listtexts/en/moderation mlmmj-1.2.15/listtexts/en/moderation
--- mlmmj-1.2.15.org/listtexts/en/moderation	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/en/moderation	2007-11-05 15:51:44.000000000 +0100
@@ -19,3 +19,5 @@
 $moderators$
 
 --- below this line the first 100 lines of the message up for moderation --->
+$originalmail$
+
diff -Naur mlmmj-1.2.15.org/listtexts/en/notintocc mlmmj-1.2.15/listtexts/en/notintocc
--- mlmmj-1.2.15.org/listtexts/en/notintocc	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/en/notintocc	2007-11-05 15:51:44.000000000 +0100
@@ -12,3 +12,6 @@
 
 Thanks.
 
+--- below this line the first 100 lines of the denied message --->
+$originalmail$
+
diff -Naur mlmmj-1.2.15.org/listtexts/en/subonlypost mlmmj-1.2.15/listtexts/en/subonlypost
--- mlmmj-1.2.15.org/listtexts/en/subonlypost	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/listtexts/en/subonlypost	2007-11-05 15:51:44.000000000 +0100
@@ -18,3 +18,6 @@
 If you want to be able to post from more than one email address, you
 can subscribe the other addresses to the nomail version of the list.
 
+--- below this line the first 100 lines of the denied message --->
+$originalmail$
+
diff -Naur mlmmj-1.2.15.org/src/mlmmj-bounce.c mlmmj-1.2.15/src/mlmmj-bounce.c
--- mlmmj-1.2.15.org/src/mlmmj-bounce.c	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/src/mlmmj-bounce.c	2007-11-05 15:51:44.000000000 +0100
@@ -139,7 +139,7 @@
 
 	maildata[1] = indexstr;
 	queuefilename = prepstdreply(listdir, "bounce-probe", "$listowner$",
-					myaddr, NULL, 1, maildata, NULL);
+					myaddr, NULL, 1, maildata, NULL, NULL);
 	MY_ASSERT(queuefilename);
 	myfree(indexstr);
 
diff -Naur mlmmj-1.2.15.org/src/mlmmj-process.c mlmmj-1.2.15/src/mlmmj-process.c
--- mlmmj-1.2.15.org/src/mlmmj-process.c	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/src/mlmmj-process.c	2007-11-05 15:51:44.000000000 +0100
@@ -76,8 +76,7 @@
 	char *buf, *replyto, *listaddr = getlistaddr(listdir), *listdelim;
 	char *queuefilename = NULL, *moderatorsfilename;
 	char *mailbasename = mybasename(mailfilename), *tmp, *to;
-	int queuefd, moderatorsfd, mailfd;
-	size_t count = 0;
+	int moderatorsfd;
 	char *maildata[4] = { "moderateaddr", NULL, "moderators", NULL };
 #if 0
 	printf("mailfilename = [%s], mailbasename = [%s]\n", mailfilename,
@@ -86,11 +85,6 @@
 	listfqdn = genlistfqdn(listaddr);
 	listname = genlistname(listaddr);
 
-	if((mailfd = open(mailfilename, O_RDONLY)) < 0) {
-		log_error(LOG_ARGS, "Could not open '%s'", mailfilename);
-		exit(EXIT_FAILURE);
-	}
-
 	moderatorsfilename = concatstr(2, listdir, "/control/moderators");
 	if((moderatorsfd = open(moderatorsfilename, O_RDONLY)) < 0) {
 		log_error(LOG_ARGS, "Could not open '%s'", moderatorsfilename);
@@ -123,25 +117,7 @@
 	myfree(listfqdn);
 
 	queuefilename = prepstdreply(listdir, "moderation", "$listowner$",
-				     to, replyto, 2, maildata, NULL);
-
-	if((queuefd = open(queuefilename, O_WRONLY|O_APPEND)) < 0) {
-		log_error(LOG_ARGS, "Could not open '%s'", queuefilename);
-		myfree(queuefilename);
-		exit(EXIT_FAILURE);
-	}
-	
-	while(count < 100 && (buf = mygetline(mailfd))) {
-		tmp = concatstr(2, " ", buf);
-		myfree(buf);
-		if(writen(queuefd, tmp, strlen(tmp)) < 0)
-			log_error(LOG_ARGS, "Could not write line for "
-					    "moderatemail");
-		myfree(tmp);
-		count++;
-	}
-	close(queuefd);
-	close(mailfd);
+				     to, replyto, 2, maildata, NULL, mailfilename);
 
 	execlp(mlmmjsend, mlmmjsend,
 				"-l", "2",
@@ -657,7 +633,7 @@
 			queuefilename = prepstdreply(listdir,
 					"maxmailsize", "$listowner$",
 					fromemails.emaillist[0],
-					NULL, 2, maildata, NULL);
+					NULL, 2, maildata, NULL, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listdelim);
 			myfree(listname);
@@ -768,7 +744,7 @@
 				     listfqdn);
 		queuefilename = prepstdreply(listdir, "notintocc",
 					"$listowner$", fromemails.emaillist[0],
-					     NULL, 0, NULL, NULL);
+					     NULL, 0, NULL, NULL, donemailname);
 		MY_ASSERT(queuefilename)
 		myfree(listdelim);
 		myfree(listname);
@@ -829,7 +805,7 @@
 					"bounces-help@", listfqdn);
 			queuefilename = prepstdreply(listdir, "subonlypost",
 					"$listowner$", fromemails.emaillist[0],
-						     NULL, 1, maildata, NULL);
+						     NULL, 1, maildata, NULL, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listaddr);
 			myfree(listdelim);
@@ -880,7 +856,7 @@
 			queuefilename = prepstdreply(listdir, "access",
 							"$listowner$",
 							fromemails.emaillist[0],
-						     NULL, 0, NULL, NULL);
+						     NULL, 0, NULL, NULL, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listaddr);
 			myfree(listdelim);
diff -Naur mlmmj-1.2.15.org/src/mlmmj-sub.c mlmmj-1.2.15/src/mlmmj-sub.c
--- mlmmj-1.2.15.org/src/mlmmj-sub.c	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/src/mlmmj-sub.c	2007-11-05 15:51:44.000000000 +0100
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
diff -Naur mlmmj-1.2.15.org/src/mlmmj-unsub.c mlmmj-1.2.15/src/mlmmj-unsub.c
--- mlmmj-1.2.15.org/src/mlmmj-unsub.c	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/src/mlmmj-unsub.c	2007-11-05 15:51:44.000000000 +0100
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
diff -Naur mlmmj-1.2.15.org/src/prepstdreply.c mlmmj-1.2.15/src/prepstdreply.c
--- mlmmj-1.2.15.org/src/prepstdreply.c	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/src/prepstdreply.c	2007-11-05 15:51:44.000000000 +0100
@@ -44,13 +44,13 @@
 #include "unistr.h"
 
 char *substitute(const char *line, const char *listaddr, const char *listdelim,
-		 size_t datacount, char **data)
+		 size_t datacount, char **data, const char *mailname)
 {
 	char *s1, *s2;
 
-	s1 = substitute_one(line, listaddr, listdelim, datacount, data);
+	s1 = substitute_one(line, listaddr, listdelim, datacount, data, mailname);
 	while(s1) {
-		s2 = substitute_one(s1, listaddr, listdelim, datacount, data);
+		s2 = substitute_one(s1, listaddr, listdelim, datacount, data, mailname);
 		if(s2) {
 			myfree(s1);
 			s1 = s2;
@@ -62,7 +62,7 @@
 }
 
 char *substitute_one(const char *line, const char *listaddr,
-		     const char *listdelim, size_t datacount, char **data)
+		     const char *listdelim, size_t datacount, char **data, const char* mailname)
 {
 	char *fqdn, *listname, *d1, *d2, *token, *value = NULL;
 	char *retstr, *origline;
@@ -132,7 +132,28 @@
 		value = concatstr(4, listname, listdelim, "subscribe-nomail@",
 				  fqdn);
 		goto concatandreturn;
-	}
+	} else if(strcmp(token, "originalmail") == 0) {
+	        /* append the first 100 lines of the mail inline */
+		int mailfd;
+		if(mailname && 
+                     ((mailfd = open(mailname, O_RDONLY)) > 0)){
+                	size_t count = 0;
+			char* str = NULL;
+                	while(count < 100 && (str = mygetline(mailfd))) {
+				char* tmp = value;
+				value = concatstr(3, value, " ", str);
+				if(tmp)
+					myfree(tmp);
+                        	count++;
+                        }
+			if(str)
+                        	myfree(str);
+                	close(mailfd);
+                }else{
+			log_error(LOG_ARGS, "Could not substitute $originalmail$ (mailname == %s)",mailname);
+		}
+		goto concatandreturn;
+        }
 	if(data) {
 		for(i = 0; i < datacount; i++) {
 			if(strcmp(token, data[i*2]) == 0) {
@@ -187,7 +208,7 @@
 
 char *prepstdreply(const char *listdir, const char *filename, const char *from,
 		   const char *to, const char *replyto, size_t tokencount,
-		   char **data, char *customheaders)
+		   char **data, char *customheaders, const char *mailname)
 {
 	int infd, outfd;
 	char *listaddr, *listdelim, *myfrom, *tmp, *subject, *retstr = NULL;
@@ -211,7 +232,7 @@
 		chomp(line);
 		utfsub = unistr_escaped_to_utf8(line + 9);
 		utfsub2 = substitute(utfsub, listaddr, listdelim, tokencount,
-				     data);
+				     data, NULL);
 		subject = unistr_utf8_to_header(utfsub2);
 		myfree(utfsub);
 		myfree(utfsub2);
@@ -231,14 +252,14 @@
 		utfline = NULL;
 	}
 	
-	myfrom = substitute(from, listaddr, listdelim, tokencount, data);
-	myto = substitute(to, listaddr, listdelim, tokencount, data);
+	myfrom = substitute(from, listaddr, listdelim, tokencount, data, NULL);
+	myto = substitute(to, listaddr, listdelim, tokencount, data, NULL);
 	mydate = gendatestr();
 	mymsgid = genmsgid(listfqdn);
 
 	if(replyto) {
 		myreplyto = substitute(replyto, listaddr, listdelim,
-				       tokencount, data);
+				       tokencount, data, NULL);
 		tmp = concatstr(3, "Reply-To: ", myreplyto, "\n");
 		myfree(myreplyto);
 		myreplyto = tmp;
@@ -297,7 +318,7 @@
 		myfree(tmp);
 
 		tmp = utfline;
-		str = substitute(utfline, listaddr, listdelim, tokencount, data);
+		str = substitute(utfline, listaddr, listdelim, tokencount, data, mailname);
 		myfree(tmp);
 
 		if(writen(outfd, str, strlen(str)) < 0) {
diff -Naur mlmmj-1.2.15.org/src/send_digest.c mlmmj-1.2.15/src/send_digest.c
--- mlmmj-1.2.15.org/src/send_digest.c	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/src/send_digest.c	2007-11-05 15:51:44.000000000 +0100
@@ -263,7 +263,7 @@
 		utfsub = unistr_escaped_to_utf8(line + 9);
 	}
 
-	utfsub2 = substitute(utfsub, listaddr, listdelim, 5, subst_data);
+	utfsub2 = substitute(utfsub, listaddr, listdelim, 5, subst_data, NULL);
 	subject = unistr_utf8_to_header(utfsub2);
 	myfree(utfsub);
 	myfree(utfsub2);
@@ -362,7 +362,7 @@
 				myfree(line);
 
 				tmp = substitute(utfline, listaddr, listdelim,
-						5, subst_data);
+						5, subst_data, NULL);
 				myfree(utfline);
 
 				if(writen(fd, tmp, strlen(tmp)) < 0) {
diff -Naur mlmmj-1.2.15.org/src/send_help.c mlmmj-1.2.15/src/send_help.c
--- mlmmj-1.2.15.org/src/send_help.c	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/src/send_help.c	2007-11-05 15:51:44.000000000 +0100
@@ -57,7 +57,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, textfile, "$listowner$",
-					emailaddr, NULL, 0, NULL, NULL);
+					emailaddr, NULL, 0, NULL, NULL, NULL);
 	if(queuefilename == NULL) {
 		log_error(LOG_ARGS, "Could not prepare %s mail", name);
 		exit(EXIT_FAILURE);
diff -Naur mlmmj-1.2.15.org/src/send_list.c mlmmj-1.2.15/src/send_list.c
--- mlmmj-1.2.15.org/src/send_list.c	2007-11-05 15:29:40.000000000 +0100
+++ mlmmj-1.2.15/src/send_list.c	2007-11-05 15:51:44.000000000 +0100
@@ -61,7 +61,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, "listsubs", "$listowner$",
-					emailaddr, NULL, 0, NULL, NULL);
+					emailaddr, NULL, 0, NULL, NULL, NULL);
 	if(queuefilename == NULL) {
 		log_error(LOG_ARGS, "Could not prepare sub list mail");
 		exit(EXIT_FAILURE);

--Boundary-00=_jFzLHmmrOcWS8pp--
