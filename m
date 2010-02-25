From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 25 Feb 2010 11:44:44 +0000
Subject: PATCHES: richer listtext
Message-Id: <4B8662AC.60201@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010300020200030000020005"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------010300020200030000020005
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, all,

Given there has been positive interest, and there will be minimal/no
disruption to mlmmj's operation, I have implemented the richer listtext
features I wrote about earlier.

I'm sending these patches through now, though they have had only minimal
testing, particularly as Robin Johnson has volunteered to help test.



mlmmj-listtext-headers.patch
- Allows arbitrary headers to be included at the beginning of listtexts.
- All the headers in the listtext will be included in the mails mlmmj
   sends.
- Mlmmj standard headers of the same name as those in the listtext will
   be omitted.
- Substitutions using the $whatever$ mechanism can be used.
- \uNNNN escaping is supported in the headers, as with the rest of the
   listtext.
- Automatic =?utf-8?q?...?= quoting is done for (and only for) the
   Subject: header.
- Also includes a couple of bugfixes related to sending digests.
- This is compatible with current behaviour.
- The interface to prepstdreply() is changed, however; there is no
   longer a customheaders argument. It was never used, and since this
   patch allows custom headers to be included in listtext, is not really
   necessary as a function argument. Incorporating it in the
   implementation would have been more trouble than value.

mlmmj-origmail-count.patch
- Alters the way $originalmail$ works; it doesn't buffer the entire
   $originalmail$ substitution in memory, but does it a line at a time.
- $originalmail$ must be first on a line, optionally preceded by
   whitespace. The whitespace is prepended to each line of the mail that
   is included.
- The rest of the line following $originalmail$ is ignored.
- $originalmailNNN$ can be used, where NNN is a number of lines to
   include. Use a large number such as 1000000000 to include the whole
   mail (but be aware of integer overflow so don't go too big!).
- If NNN is omitted, the default is 100.
- To get current behaviour, a space must be prepended to the lines
   currently containing $originalmail$ in the listtexts. Apart from that,
   this is compatible with current behaviour.
- Again, there is an interface change. substitute() and substitute_one()
   no longer take the original mail filename, and cannot be used to do
   $originalmail$ substitution. This was never used except by
   prepstdreply() which now incorporates that substitution itself.

mlmmj-subject-substitute.patch
- Allows $subject$ to be used for the subject of the mail being
   moderated (or denied, etc.).
- Compatible.

mlmmj-random-substitute.patch
- Allows $random0$ through $random5$ to be used as distinct random
   strings.
- Compatible.

mlmmj-efficient-random.patch
- Makes random number generation more efficient by only seeding the
   generator once.
- Compatible, though behaviour will change slightly.

mlmmj-fixed-length-random.patch
- Makes the random strings produced always the same length rather the
   smaller random numbers producing shorter strings which could be
   problematic.
- Compatible, though behaviour will change slightly.



I still plan to include proper documentation (in the patches or as a
separate patch), but for testing purposes, this email should suffice.

The moderation listtext I have tested with is attached.

I believe the patches will not all apply cleanly unless you have already
applied these patches:

- patch-mlmmj-1.2.17-origmail.diff (mlmmj+get-1844@mlmmj.org)
- mlmmj-notifymod.patch (mlmmj+get-1826@mlmmj.org)

(I've attached them for convenience, since one of them doesn't seem to
have made it into the web archive, and the +get trick hasn't worked for
me yet, though I suspect the latter problem is just a delay.)

Nor will all apply cleanly unless you apply them in order.

If you have trouble, let me know. It's possible another of my patches
I have applied affects this, though I don't think so.



The following is a rough list of things that should be tested that I
made as I implemented:

- digests with and without thread summary work
- Content-Transfer-Encoding headers correctly output for both digest and
   listtext
- multiple headers of same type in listtext are preserved
- \uNNNN escaping works
- number of lines of $originalmail$ correctly honoured
    - when larger than mail length
    - when smaller than mail length
    - when equal to mail length
- number of lines of $originalmail$ handled as 100 when not given
- whitespace preceding $originalmail$ correctly prepended to every line
   of included mail
- content after $originalmail$ ignored (no crash)
- six random values are distinct, but the same when reused in the same
   listtext
- subject substitution
    - including when original subject contains utf8
- headerless listtext (warnings output)
    - with and without blank line
- invalid header in listtext OK (no crash)



Help testing will be particularly appreciated. Code review and other
feedback also welcome.

Ben.




--------------010300020200030000020005
Content-Type: text/x-patch;
 name="mlmmj-listtext-headers.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-listtext-headers.patch"

diff -r 6e97ed95f9a8 include/prepstdreply.h
--- a/include/prepstdreply.h	Thu Feb 25 14:55:50 2010 +1100
+++ b/include/prepstdreply.h	Thu Feb 25 19:31:37 2010 +1100
@@ -32,6 +32,6 @@
 int open_listtext(const char *listdir, const char *filename);
 char *prepstdreply(const char *listdir, const char *filename, const char *from,
 		const char *to, const char *replyto, size_t tokencount,
-		char **data, char *customheaders, const char *mailname);
+		char **data, const char *mailname);
 
 #endif /* PREPSTDREPLY_H */
diff -r 6e97ed95f9a8 src/mlmmj-bounce.c
--- a/src/mlmmj-bounce.c	Thu Feb 25 14:55:50 2010 +1100
+++ b/src/mlmmj-bounce.c	Thu Feb 25 19:31:37 2010 +1100
@@ -146,7 +146,7 @@
 
 	maildata[1] = indexstr;
 	queuefilename = prepstdreply(listdir, "bounce-probe", "$listowner$",
-					myaddr, NULL, 1, maildata, NULL, NULL);
+					myaddr, NULL, 1, maildata, NULL);
 	MY_ASSERT(queuefilename);
 	myfree(indexstr);
 
diff -r 6e97ed95f9a8 src/mlmmj-process.c
--- a/src/mlmmj-process.c	Thu Feb 25 14:55:50 2010 +1100
+++ b/src/mlmmj-process.c	Thu Feb 25 19:31:37 2010 +1100
@@ -133,7 +133,7 @@
 	myfree(listfqdn);
 
 	queuefilename = prepstdreply(listdir, "moderation", "$listowner$",
-				     to, replyto, 2, maildata, NULL,
+				     to, replyto, 2, maildata,
 				     mailfilename);
 
 	/* we might need to exec more than one mlmmj-send */
@@ -176,7 +176,7 @@
 
 	queuefilename = prepstdreply(listdir, "moderation-poster",
 				     "$listowner$", efromsender,
-				     NULL, 1, maildata+2, NULL, mailfilename);
+				     NULL, 1, maildata+2, mailfilename);
 
 	execlp(mlmmjsend, mlmmjsend,
 			"-l", "1",
@@ -696,7 +696,7 @@
 			queuefilename = prepstdreply(listdir,
 					"maxmailsize", "$listowner$",
 					fromemails.emaillist[0],
-					NULL, 2, maildata, NULL, donemailname);
+					NULL, 2, maildata, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listdelim);
 			myfree(listname);
@@ -811,7 +811,7 @@
 				     listfqdn);
 		queuefilename = prepstdreply(listdir, "notintocc",
 					"$listowner$", fromemails.emaillist[0],
-					     NULL, 0, NULL, NULL, donemailname);
+					     NULL, 0, NULL, donemailname);
 		MY_ASSERT(queuefilename)
 		myfree(listdelim);
 		myfree(listname);
@@ -872,7 +872,7 @@
 					"bounces-help@", listfqdn);
 			queuefilename = prepstdreply(listdir, "subonlypost",
 					"$listowner$", fromemails.emaillist[0],
-						     NULL, 1, maildata, NULL, donemailname);
+						     NULL, 1, maildata, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listaddr);
 			myfree(listdelim);
@@ -926,7 +926,7 @@
 			queuefilename = prepstdreply(listdir, "access",
 							"$listowner$",
 							fromemails.emaillist[0],
-						     NULL, 0, NULL, NULL, donemailname);
+						     NULL, 0, NULL, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listaddr);
 			myfree(listdelim);
diff -r 6e97ed95f9a8 src/mlmmj-sub.c
--- a/src/mlmmj-sub.c	Thu Feb 25 14:55:50 2010 +1100
+++ b/src/mlmmj-sub.c	Thu Feb 25 19:31:37 2010 +1100
@@ -147,7 +147,7 @@
 	maildata[5] = moderators;
 
 	queuefilename = prepstdreply(listdir, "submod-moderator",
-				"$listowner$", to, replyto, 3, maildata, NULL, NULL);
+				"$listowner$", to, replyto, 3, maildata, NULL);
 	
 	myfree(maildata[1]);
 	
@@ -189,7 +189,7 @@
 
 	from = concatstr(4, listname, listdelim, "bounces-help@", listfqdn);
 	queuefilename = prepstdreply(listdir, "submod-requester", "$listowner$",
-					subaddr, NULL, 0, NULL, NULL, NULL);
+					subaddr, NULL, 0, NULL, NULL);
 	
 	myfree(listname);
 	myfree(listfqdn);
@@ -282,7 +282,7 @@
 	}
 
 	queuefilename = prepstdreply(listdir, listtext, "$helpaddr$",
-				     subaddr, NULL, 0, NULL, NULL, NULL);
+				     subaddr, NULL, 0, NULL, NULL);
 	MY_ASSERT(queuefilename);
 	myfree(listtext);
 
@@ -329,7 +329,7 @@
 	}
 
 	queuefilename = prepstdreply(listdir, listtext, "$listowner$",
-				"$listowner$", NULL, 1, maildata, NULL, NULL);
+				"$listowner$", NULL, 1, maildata, NULL);
 	MY_ASSERT(queuefilename)
 	myfree(listtext);
 	myfree(maildata[1]);
@@ -416,7 +416,7 @@
 	maildata[3] = mystrdup(confirmaddr);
 
 	queuefilename = prepstdreply(listdir, listtext, "$helpaddr$", subaddr,
-				     confirmaddr, 2, maildata, NULL, NULL);
+				     confirmaddr, 2, maildata, NULL);
 
 	myfree(maildata[1]);
 	myfree(maildata[3]);
@@ -469,7 +469,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, "sub-subscribed", "$helpaddr$",
-				     subaddr, NULL, 0, NULL, NULL, NULL);
+				     subaddr, NULL, 0, NULL, NULL);
 	MY_ASSERT(queuefilename);
 
 	myfree(listaddr);
diff -r 6e97ed95f9a8 src/mlmmj-unsub.c
--- a/src/mlmmj-unsub.c	Thu Feb 25 14:55:50 2010 +1100
+++ b/src/mlmmj-unsub.c	Thu Feb 25 19:31:37 2010 +1100
@@ -76,7 +76,7 @@
 	}
 
 	queuefilename = prepstdreply(listdir, listtext, "$helpaddr$",
-				     subaddr, NULL, 0, NULL, NULL, NULL);
+				     subaddr, NULL, 0, NULL, NULL);
 	MY_ASSERT(queuefilename);
 	myfree(listtext);
 
@@ -124,7 +124,7 @@
 	}
 	
 	queuefilename = prepstdreply(listdir, listtext, "$listowner$",
-				     "$listowner$", NULL, 1, maildata, NULL, NULL);
+				     "$listowner$", NULL, 1, maildata, NULL);
 	MY_ASSERT(queuefilename);
 	myfree(listtext);
 	myfree(maildata[1]);
@@ -213,7 +213,7 @@
 	maildata[3] = mystrdup(confirmaddr);
 
 	queuefilename = prepstdreply(listdir, listtext, "$helpaddr$", subaddr,
-				     confirmaddr, 2, maildata, NULL, NULL);
+				     confirmaddr, 2, maildata, NULL);
 
 	myfree(maildata[1]);
 	myfree(maildata[3]);
@@ -305,7 +305,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, "unsub-notsubscribed",
-				     "$helpaddr$", subaddr, NULL, 0, NULL, NULL, NULL);
+				     "$helpaddr$", subaddr, NULL, 0, NULL, NULL);
 	MY_ASSERT(queuefilename);
 
 	myfree(listaddr);
diff -r 6e97ed95f9a8 src/prepstdreply.c
--- a/src/prepstdreply.c	Thu Feb 25 14:55:50 2010 +1100
+++ b/src/prepstdreply.c	Thu Feb 25 19:31:37 2010 +1100
@@ -208,12 +208,14 @@
 
 char *prepstdreply(const char *listdir, const char *filename, const char *from,
 		   const char *to, const char *replyto, size_t tokencount,
-		   char **data, char *customheaders, const char *mailname)
+		   char **data, const char *mailname)
 {
+	size_t i, len;
 	int infd, outfd;
-	char *listaddr, *listdelim, *myfrom, *tmp, *subject, *retstr = NULL;
+	char *listaddr, *listdelim, *tmp, *retstr = NULL;
 	char *listfqdn, *line, *utfline, *utfsub, *utfsub2;
-	char *myreplyto, *myto, *str = NULL, *mydate, *mymsgid;
+	char *str = NULL;
+	char *headers[10] = { NULL }; /* relies on NULL to flag end */
 
 	if ((infd = open_listtext(listdir, filename)) < 0) {
 		return NULL;
@@ -223,49 +225,6 @@
 	listdelim = getlistdelim(listdir);
 	listfqdn = genlistfqdn(listaddr);
 
-	line = mygetline(infd);
-	if(!line || (strncasecmp(line, "Subject: ", 9) != 0)) {
-		log_error(LOG_ARGS, "No Subject in '%s' listtext. Using "
-				"standard subject", filename);
-		subject = mystrdup("mlmmj administrativa");
-	} else {
-		chomp(line);
-		utfsub = unistr_escaped_to_utf8(line + 9);
-		utfsub2 = substitute(utfsub, listaddr, listdelim, tokencount,
-				     data, NULL);
-		subject = unistr_utf8_to_header(utfsub2);
-		myfree(utfsub);
-		myfree(utfsub2);
-		myfree(line);
-
-		/* skip empty line after subject */
-		line = mygetline(infd);
-		if (line && (line[0] == '\n')) {
-			myfree(line);
-			line = NULL;
-		}
-	}
-	if (line) {
-		utfline = unistr_escaped_to_utf8(line);
-		myfree(line);
-	} else {
-		utfline = NULL;
-	}
-	
-	myfrom = substitute(from, listaddr, listdelim, tokencount, data, NULL);
-	myto = substitute(to, listaddr, listdelim, tokencount, data, NULL);
-	mydate = gendatestr();
-	mymsgid = genmsgid(listfqdn);
-
-	if(replyto) {
-		myreplyto = substitute(replyto, listaddr, listdelim,
-				       tokencount, data, NULL);
-		tmp = concatstr(3, "Reply-To: ", myreplyto, "\n");
-		myfree(myreplyto);
-		myreplyto = tmp;
-	} else
-		myreplyto = NULL;
-
 	do {
 		tmp = random_str();
 		myfree(retstr);
@@ -278,48 +237,164 @@
 	
 	if(outfd < 0) {
 		log_error(LOG_ARGS, "Could not open std mail %s", retstr);
-		myfree(str);
-		myfree(listaddr);
-		myfree(listdelim);
-		myfree(listfqdn);
-		myfree(utfline);
-		return NULL;
-	}
-
-	str = concatstr(14,
-			"From: ", myfrom,
-			"\nTo: ", myto,
-			"\n", myreplyto,
-			mymsgid,
-			mydate,
-			"Subject: ", subject,
-			"\nMIME-Version: 1.0"
-			"\nContent-Type: text/plain; charset=utf-8"
-			"\nContent-Encoding: 8bit"
-			"\n", customheaders,
-			"\n", utfline);
-
-	myfree(utfline);
-
-	if(writen(outfd, str, strlen(str)) < 0) {
-		log_error(LOG_ARGS, "Could not write std mail");
-		myfree(str);
 		myfree(listaddr);
 		myfree(listdelim);
 		myfree(listfqdn);
 		return NULL;
 	}
 
-	myfree(str);
+	tmp = substitute(from, listaddr, listdelim,
+	                 tokencount, data, NULL);
+	headers[0] = concatstr(2, "From: ", tmp);
+	myfree(tmp);
+	tmp = substitute(to, listaddr, listdelim,
+	                 tokencount, data, NULL);
+	headers[1] = concatstr(2, "To: ", tmp);
+	myfree(tmp);
+	headers[2] = genmsgid(listfqdn);
+	chomp(headers[2]);
+	headers[3] = gendatestr();
+	chomp(headers[3]);
+	headers[4] = mystrdup("Subject: mlmmj administrivia");
+	headers[5] = mystrdup("MIME-Version: 1.0");
+	headers[6] = mystrdup("Content-Type: text/plain; charset=utf-8");
+	headers[7] = mystrdup("Content-Transfer-Encoding: 8bit");
 
-	while((str = mygetline(infd))) {
-		tmp = str;
+	if(replyto) {
+		tmp = substitute(replyto, listaddr, listdelim,
+		                 tokencount, data, NULL);
+		headers[8] = concatstr(2, "Reply-To: ", tmp);
+		myfree(tmp);
+	}
+
+	for(;;) {
+		line = mygetline(infd);
+		if (!line) {
+			log_error(LOG_ARGS, "No body in '%s' listtext",
+					filename);
+			break;
+		}
+		if (*line == '\n') {
+			/* end of headers */
+			myfree(line);
+			line = NULL;
+			break;
+		}
+		chomp(line);
+		if (*line == ' ' || *line == '\t') {
+			/* line beginning with linear whitespace is a
+			   continuation of previous header line */
+			utfsub = unistr_escaped_to_utf8(line);
+			str = substitute(utfsub, listaddr, listdelim,
+			                 tokencount, data, NULL);
+			myfree(utfsub);
+			len = strlen(str);
+			str[len] = '\n';
+			if(writen(outfd, str, len+1) < 0) {
+				log_error(LOG_ARGS, "Could not write std mail");
+				myfree(str);
+				myfree(line);
+				myfree(listaddr);
+				myfree(listdelim);
+				myfree(listfqdn);
+				return NULL;
+			}
+			myfree(str);
+		} else {
+			tmp = line;
+			len = 0;
+			while (*tmp && *tmp != ':') {
+				tmp++;
+				len++;
+			}
+			if (!*tmp) {
+				log_error(LOG_ARGS, "No headers or invalid "
+						"header in '%s' listtext",
+						filename);
+				break;
+			}
+			tmp++;
+			len++;
+			/* remove the standard header if one matches */
+			for (i=0; headers[i] != NULL; i++) {
+				if (strncasecmp(line, headers[i], len) == 0) {
+					myfree(headers[i]);
+					while (headers[i] != NULL) {
+						headers[i] = headers[i+1];
+						i++;
+					}
+					break;
+				}
+			}
+			utfsub = unistr_escaped_to_utf8(tmp);
+			*tmp = '\0';
+			utfsub2 = substitute(utfsub, listaddr, listdelim,
+			                     tokencount, data, NULL);
+			myfree(utfsub);
+			if (strncasecmp(line, "Subject:", len) == 0) {
+				tmp = unistr_utf8_to_header(utfsub2);
+				myfree(utfsub2);
+				str = concatstr(2, line, tmp);
+				myfree(tmp);
+			} else {
+				str = concatstr(2, line, utfsub2);
+				myfree(utfsub2);
+			}
+			len = strlen(str);
+			str[len] = '\n';
+			if(writen(outfd, str, len+1) < 0) {
+				log_error(LOG_ARGS, "Could not write std mail");
+				myfree(str);
+				myfree(line);
+				myfree(listaddr);
+				myfree(listdelim);
+				myfree(listfqdn);
+				return NULL;
+			}
+			myfree(str);
+		}
+		myfree(line);
+	}
+
+	for (i=0; headers[i] != NULL; i++) {
+		len = strlen(headers[i]);
+		headers[i][len] = '\n';
+		if(writen(outfd, headers[i], len+1) < 0) {
+			log_error(LOG_ARGS, "Could not write std mail");
+			if (line)
+				myfree(line);
+			myfree(str);
+			myfree(listaddr);
+			myfree(listdelim);
+			myfree(listfqdn);
+			return NULL;
+		}
+	}
+
+	/* end the headers */
+	if(writen(outfd, "\n", 1) < 0) {
+		log_error(LOG_ARGS, "Could not write std mail");
+		myfree(str);
+		if (line)
+			myfree(line);
+		myfree(listaddr);
+		myfree(listdelim);
+		myfree(listfqdn);
+		return NULL;
+	}
+
+	if (line) {
+		str = concatstr(2, line, "\n");
+		myfree(line);
+	} else {
+		str = mygetline(infd);
+	}
+	while(str) {
 		utfline = unistr_escaped_to_utf8(str);
-		myfree(tmp);
+		myfree(str);
 
-		tmp = utfline;
 		str = substitute(utfline, listaddr, listdelim, tokencount, data, mailname);
-		myfree(tmp);
+		myfree(utfline);
 
 		if(writen(outfd, str, strlen(str)) < 0) {
 			myfree(str);
@@ -330,8 +405,9 @@
 			return NULL;
 		}
 		myfree(str);
+		str = mygetline(infd);
 	}
-	
+
 	fsync(outfd);
 	close(outfd);
 
diff -r 6e97ed95f9a8 src/send_digest.c
--- a/src/send_digest.c	Thu Feb 25 14:55:50 2010 +1100
+++ b/src/send_digest.c	Thu Feb 25 19:31:37 2010 +1100
@@ -321,7 +321,7 @@
 
 		tmp = concatstr(3, "\n--", boundary,
 				"\nContent-Type: text/plain; charset=UTF-8"
-				"\nContent-Encoding: 8bit"
+				"\nContent-Transfer-Encoding: 8bit"
 				"\n\n");
 		if (writen(fd, tmp, strlen(tmp)) == -1) {
 			log_error(LOG_ARGS, "Could not write digest text/plain"
@@ -376,6 +376,8 @@
 		}
 
 		close(txtfd);
+	} else if (txtfd > 0) {
+		close(txtfd);
 	}
 
 	myfree(line);
diff -r 6e97ed95f9a8 src/send_help.c
--- a/src/send_help.c	Thu Feb 25 14:55:50 2010 +1100
+++ b/src/send_help.c	Thu Feb 25 19:31:37 2010 +1100
@@ -57,7 +57,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, textfile, "$listowner$",
-					emailaddr, NULL, 0, NULL, NULL, NULL);
+					emailaddr, NULL, 0, NULL, NULL);
 	if(queuefilename == NULL) {
 		log_error(LOG_ARGS, "Could not prepare %s mail", name);
 		exit(EXIT_FAILURE);
diff -r 6e97ed95f9a8 src/send_list.c
--- a/src/send_list.c	Thu Feb 25 14:55:50 2010 +1100
+++ b/src/send_list.c	Thu Feb 25 19:31:37 2010 +1100
@@ -99,7 +99,7 @@
 	myfree(listdelim);
 
 	queuefilename = prepstdreply(listdir, "listsubs", "$listowner$",
-					emailaddr, NULL, 0, NULL, NULL, NULL);
+					emailaddr, NULL, 0, NULL, NULL);
 	if(queuefilename == NULL) {
 		log_error(LOG_ARGS, "Could not prepare sub list mail");
 		exit(EXIT_FAILURE);




--------------010300020200030000020005
Content-Type: text/x-patch;
 name="mlmmj-origmail-count.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-origmail-count.patch"

diff -r b4d1fe2b5b93 include/prepstdreply.h
--- a/include/prepstdreply.h	Thu Feb 25 17:55:38 2010 +1100
+++ b/include/prepstdreply.h	Thu Feb 25 17:55:48 2010 +1100
@@ -25,10 +25,9 @@
 #define PREPSTDREPLY_H
 
 char *substitute(const char *line, const char *listaddr, const char *listdelim,
-		size_t datacount, char **data, const char* mailname);
+		size_t datacount, char **data);
 char *substitute_one(const char *line, const char *listaddr,
-		const char *listdelim, size_t datacount, char **data,
-		const char* mailname);
+		const char *listdelim, size_t datacount, char **data);
 int open_listtext(const char *listdir, const char *filename);
 char *prepstdreply(const char *listdir, const char *filename, const char *from,
 		const char *to, const char *replyto, size_t tokencount,
diff -r b4d1fe2b5b93 src/prepstdreply.c
--- a/src/prepstdreply.c	Thu Feb 25 17:55:38 2010 +1100
+++ b/src/prepstdreply.c	Thu Feb 25 17:55:48 2010 +1100
@@ -44,13 +44,13 @@
 #include "unistr.h"
 
 char *substitute(const char *line, const char *listaddr, const char *listdelim,
-		 size_t datacount, char **data, const char *mailname)
+		 size_t datacount, char **data)
 {
 	char *s1, *s2;
 
-	s1 = substitute_one(line, listaddr, listdelim, datacount, data, mailname);
+	s1 = substitute_one(line, listaddr, listdelim, datacount, data);
 	while(s1) {
-		s2 = substitute_one(s1, listaddr, listdelim, datacount, data, mailname);
+		s2 = substitute_one(s1, listaddr, listdelim, datacount, data);
 		if(s2) {
 			myfree(s1);
 			s1 = s2;
@@ -62,8 +62,7 @@
 }
 
 char *substitute_one(const char *line, const char *listaddr,
-			const char *listdelim, size_t datacount, char **data,
-			const char* mailname)
+			const char *listdelim, size_t datacount, char **data)
 {
 	char *fqdn, *listname, *d1, *d2, *token, *value = NULL;
 	char *retstr, *origline;
@@ -133,26 +132,6 @@
 		value = concatstr(4, listname, listdelim, "subscribe-nomail@",
 				  fqdn);
 		goto concatandreturn;
-	} else if(strcmp(token, "originalmail") == 0) {
-		/* append the first 100 lines of the mail inline */
-		int mailfd;
-		if(mailname && 
-		     ((mailfd = open(mailname, O_RDONLY)) > 0)){
-			size_t count = 0;
-			char* str = NULL;
-			while(count < 100 && (str = mygetline(mailfd))) {
-				char* tmp = value;
-				value = concatstr(3, value, " ", str);
-				if(tmp)
-					myfree(tmp);
-				myfree(str);
-				count++;
-			}
-			close(mailfd);
-		}else{
-			log_error(LOG_ARGS, "Could not substitute $originalmail$ (mailname == %s)",mailname);
-		}
-		goto concatandreturn;
 	}
 	if(data) {
 		for(i = 0; i < datacount; i++) {
@@ -211,7 +190,7 @@
 		   char **data, const char *mailname)
 {
 	size_t i, len;
-	int infd, outfd;
+	int infd, outfd, mailfd;
 	char *listaddr, *listdelim, *tmp, *retstr = NULL;
 	char *listfqdn, *line, *utfline, *utfsub, *utfsub2;
 	char *str = NULL;
@@ -244,11 +223,11 @@
 	}
 
 	tmp = substitute(from, listaddr, listdelim,
-	                 tokencount, data, NULL);
+	                 tokencount, data);
 	headers[0] = concatstr(2, "From: ", tmp);
 	myfree(tmp);
 	tmp = substitute(to, listaddr, listdelim,
-	                 tokencount, data, NULL);
+	                 tokencount, data);
 	headers[1] = concatstr(2, "To: ", tmp);
 	myfree(tmp);
 	headers[2] = genmsgid(listfqdn);
@@ -262,7 +241,7 @@
 
 	if(replyto) {
 		tmp = substitute(replyto, listaddr, listdelim,
-		                 tokencount, data, NULL);
+		                 tokencount, data);
 		headers[8] = concatstr(2, "Reply-To: ", tmp);
 		myfree(tmp);
 	}
@@ -286,7 +265,7 @@
 			   continuation of previous header line */
 			utfsub = unistr_escaped_to_utf8(line);
 			str = substitute(utfsub, listaddr, listdelim,
-			                 tokencount, data, NULL);
+			                 tokencount, data);
 			myfree(utfsub);
 			len = strlen(str);
 			str[len] = '\n';
@@ -329,7 +308,7 @@
 			utfsub = unistr_escaped_to_utf8(tmp);
 			*tmp = '\0';
 			utfsub2 = substitute(utfsub, listaddr, listdelim,
-			                     tokencount, data, NULL);
+			                     tokencount, data);
 			myfree(utfsub);
 			if (strncasecmp(line, "Subject:", len) == 0) {
 				tmp = unistr_utf8_to_header(utfsub2);
@@ -393,18 +372,65 @@
 		utfline = unistr_escaped_to_utf8(str);
 		myfree(str);
 
-		str = substitute(utfline, listaddr, listdelim, tokencount, data, mailname);
-		myfree(utfline);
+		tmp = utfline;
+		while (*tmp && (*tmp == ' ' || *tmp == '\t')) {
+			tmp++;
+		}
+		if (strncmp(tmp,"$originalmail",13) == 0) {
+			*tmp = '\0';
+			tmp += 13;
+			str = tmp;
+			while (*tmp >= '0' && *tmp <= '9')
+				tmp++;
+			if (*tmp == '$') {
+				*tmp = '\0';
+				len = 100;
+				if (str != tmp)
+					len = atol(str);
+				if (mailname && 
+		     		   ((mailfd = open(mailname, O_RDONLY)) > 0)){
+		     		    str = NULL;
+				    i = 0;
+				    while (i < len &&
+				           (str = mygetline(mailfd))) {
+				        tmp = str;
+				        str = concatstr(2,utfline,str);
+				        myfree(tmp);
+				        if(writen(outfd,str,strlen(str)) < 0) {
+				            myfree(str);
+				            myfree(utfline);
+				            myfree(listaddr);
+				            myfree(listdelim);
+				            myfree(listfqdn);
+				            log_error(LOG_ARGS, "Could not write std mail");
+				            return NULL;
+				        }
+				        myfree(str);
+				        i++;
+				    }
+				    close(mailfd);
+				} else {
+				    log_error(LOG_ARGS, "Could not substitute $originalmail%d$ (mailname == %s)",len,mailname);
+				}
+			} else {
+				log_error(LOG_ARGS, "Bad $originalmailNNN$ substitution");
+			}
+			myfree(utfline);
+		} else {
+			str = substitute(utfline, listaddr, listdelim,
+			                 tokencount, data);
+			myfree(utfline);
+			if(writen(outfd, str, strlen(str)) < 0) {
+				myfree(str);
+				myfree(listaddr);
+				myfree(listdelim);
+				myfree(listfqdn);
+				log_error(LOG_ARGS, "Could not write std mail");
+				return NULL;
+			}
+			myfree(str);
+		}
 
-		if(writen(outfd, str, strlen(str)) < 0) {
-			myfree(str);
-			myfree(listaddr);
-			myfree(listdelim);
-			myfree(listfqdn);
-			log_error(LOG_ARGS, "Could not write std mail");
-			return NULL;
-		}
-		myfree(str);
 		str = mygetline(infd);
 	}
 
diff -r b4d1fe2b5b93 src/send_digest.c
--- a/src/send_digest.c	Thu Feb 25 17:55:38 2010 +1100
+++ b/src/send_digest.c	Thu Feb 25 17:55:48 2010 +1100
@@ -263,7 +263,7 @@
 		utfsub = unistr_escaped_to_utf8(line + 9);
 	}
 
-	utfsub2 = substitute(utfsub, listaddr, listdelim, 5, subst_data, NULL);
+	utfsub2 = substitute(utfsub, listaddr, listdelim, 5, subst_data);
 	subject = unistr_utf8_to_header(utfsub2);
 	myfree(utfsub);
 	myfree(utfsub2);
@@ -362,7 +362,7 @@
 				myfree(line);
 
 				tmp = substitute(utfline, listaddr, listdelim,
-						5, subst_data, NULL);
+						5, subst_data);
 				myfree(utfline);
 
 				if(writen(fd, tmp, strlen(tmp)) < 0) {




--------------010300020200030000020005
Content-Type: text/x-patch;
 name="mlmmj-subject-substitute.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-subject-substitute.patch"

diff -r 7d9d860c36b3 src/mlmmj-process.c
--- a/src/mlmmj-process.c	Thu Feb 25 20:51:39 2010 +1100
+++ b/src/mlmmj-process.c	Thu Feb 25 22:21:57 2010 +1100
@@ -52,6 +52,7 @@
 #include "memory.h"
 #include "log_oper.h"
 #include "chomp.h"
+#include "unistr.h"
 
 enum action {
 	ALLOW,
@@ -71,14 +72,16 @@
 
 
 void newmoderated(const char *listdir, const char *mailfilename,
-		  const char *mlmmjsend, const char *efromsender)
+		  const char *mlmmjsend, const char *efromsender,
+		  size_t tokencount, char **data)
 {
+	size_t i;
 	char *from, *listfqdn, *listname, *moderators = NULL;
 	char *buf, *replyto, *listaddr = getlistaddr(listdir), *listdelim;
 	char *queuefilename = NULL, *moderatorsfilename, *efromismod = NULL;
 	char *mailbasename = mybasename(mailfilename), *tmp, *to;
 	int moderatorsfd, foundaddr = 0, notifymod = 0, status;
-	char *maildata[4] = { "moderateaddr", NULL, "moderators", NULL };
+	char *maildata[10] = { "moderateaddr", NULL, "moderators", NULL };
 	pid_t childpid, pid;
 #if 0
 	printf("mailfilename = [%s], mailbasename = [%s]\n", mailfilename,
@@ -87,6 +90,13 @@
 	listfqdn = genlistfqdn(listaddr);
 	listname = genlistname(listaddr);
 
+	MY_ASSERT(tokencount<=3)
+	for (i=0; i<tokencount; i++) {
+		maildata[4+2*i] = data[2*i];
+		maildata[5+2*i] = data[1+2*i];
+	}
+	tokencount += 2;
+
 	moderatorsfilename = concatstr(2, listdir, "/control/moderators");
 	if((moderatorsfd = open(moderatorsfilename, O_RDONLY)) < 0) {
 		log_error(LOG_ARGS, "Could not open '%s'", moderatorsfilename);
@@ -133,7 +143,7 @@
 	myfree(listfqdn);
 
 	queuefilename = prepstdreply(listdir, "moderation", "$listowner$",
-				     to, replyto, 2, maildata,
+				     to, replyto, tokencount, maildata,
 				     mailfilename);
 
 	/* we might need to exec more than one mlmmj-send */
@@ -176,7 +186,7 @@
 
 	queuefilename = prepstdreply(listdir, "moderation-poster",
 				     "$listowner$", efromsender,
-				     NULL, 1, maildata+2, mailfilename);
+				     NULL, tokencount-1, maildata+2, mailfilename);
 
 	execlp(mlmmjsend, mlmmjsend,
 			"-l", "1",
@@ -385,7 +395,8 @@
 	char *listfqdn, *listname, *fromaddr;
 	char *queuefilename, *recipextra = NULL, *owner = NULL;
 	char *maxmailsizestr;
-	char *maildata[4] = { "posteraddr", NULL, "maxmailsize", NULL };
+	char *maildata[6] = { "subject", NULL,
+		"posteraddr", NULL, "maxmailsize", NULL };
 	char *envstr, *efrom;
 	struct stat st;
 	uid_t uid;
@@ -404,6 +415,7 @@
 		{ "Cc:", 0, NULL },
 		{ "Return-Path:", 0, NULL },
 		{ "Delivered-To:", 0, NULL },
+		{ "Subject:", 0, NULL },
 		{ NULL, 0, NULL }
 	};
 
@@ -538,6 +550,8 @@
 	for(i = 0; i < readhdrs[0].valuecount; i++) {
 		find_email_adr(readhdrs[0].values[i], &fromemails);
 	}
+	if (fromemails.emailcount)
+		maildata[3] = fromemails.emaillist[0];
 
 	/* To: addresses */
 	for(i = 0; i < readhdrs[1].valuecount; i++) {
@@ -559,6 +573,12 @@
 		find_email_adr(readhdrs[4].values[i], &dtemails);
 	}
 
+	/* Subject: */
+	if (readhdrs[5].valuecount)
+		maildata[1] = unistr_header_to_utf8(readhdrs[5].values[0]);
+	if (!maildata[1])
+		maildata[1] = mystrdup("");
+
 	/* envelope from */
 	if((envstr = getenv("SENDER")) != NULL) {
 		/* qmail, postfix, exim */
@@ -635,7 +655,7 @@
 			close(rawmailfd);
 			close(donemailfd);
 			unlink(mailfile);
-			log_oper(listdir, OPLOGFNAME, "mlmmj-recieve: sending"
+			log_oper(listdir, OPLOGFNAME, "mlmmj-process: sending"
 					" mail from %s to owner",
 					efrom);
 			execlp(mlmmjsend, mlmmjsend,
@@ -692,11 +712,11 @@
 			listfqdn = genlistfqdn(listaddr);
 			fromaddr = concatstr(4, listname, listdelim,
 					"bounces-help@", listfqdn);
-			maildata[3] = maxmailsizestr;
+			maildata[5] = maxmailsizestr;
 			queuefilename = prepstdreply(listdir,
 					"maxmailsize", "$listowner$",
 					fromemails.emaillist[0],
-					NULL, 2, maildata, donemailname);
+					NULL, 3, maildata, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listdelim);
 			myfree(listname);
@@ -811,7 +831,7 @@
 				     listfqdn);
 		queuefilename = prepstdreply(listdir, "notintocc",
 					"$listowner$", fromemails.emaillist[0],
-					     NULL, 0, NULL, donemailname);
+					     NULL, 2, maildata, donemailname);
 		MY_ASSERT(queuefilename)
 		myfree(listdelim);
 		myfree(listname);
@@ -867,12 +887,11 @@
 			listdelim = getlistdelim(listdir);
 			listname = genlistname(listaddr);
 			listfqdn = genlistfqdn(listaddr);
-			maildata[1] = fromemails.emaillist[0];
 			fromaddr = concatstr(4, listname, listdelim,
 					"bounces-help@", listfqdn);
 			queuefilename = prepstdreply(listdir, "subonlypost",
 					"$listowner$", fromemails.emaillist[0],
-						     NULL, 1, maildata, donemailname);
+						     NULL, 2, maildata, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listaddr);
 			myfree(listdelim);
@@ -926,7 +945,7 @@
 			queuefilename = prepstdreply(listdir, "access",
 							"$listowner$",
 							fromemails.emaillist[0],
-						     NULL, 0, NULL, donemailname);
+						     NULL, 2, maildata, donemailname);
 			MY_ASSERT(queuefilename)
 			myfree(listaddr);
 			myfree(listdelim);
@@ -1003,7 +1022,7 @@
 			fsync(omitfd);
 			close(omitfd);
 		}
-		newmoderated(listdir, mqueuename, mlmmjsend, efrom);
+		newmoderated(listdir, mqueuename, mlmmjsend, efrom, 2, maildata);
 		return EXIT_SUCCESS;
 	}
 




--------------010300020200030000020005
Content-Type: text/x-patch;
 name="mlmmj-random-substitute.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-random-substitute.patch"

diff -r 2722586fac60 src/prepstdreply.c
--- a/src/prepstdreply.c	Thu Feb 25 21:37:57 2010 +1100
+++ b/src/prepstdreply.c	Thu Feb 25 21:38:24 2010 +1100
@@ -194,6 +194,7 @@
 	char *listaddr, *listdelim, *tmp, *retstr = NULL;
 	char *listfqdn, *line, *utfline, *utfsub, *utfsub2;
 	char *str = NULL;
+	char **moredata;
 	char *headers[10] = { NULL }; /* relies on NULL to flag end */
 
 	if ((infd = open_listtext(listdir, filename)) < 0) {
@@ -206,7 +207,8 @@
 
 	do {
 		tmp = random_str();
-		myfree(retstr);
+		if (retstr)
+			myfree(retstr);
 		retstr = concatstr(3, listdir, "/queue/", tmp);
 		myfree(tmp);
 
@@ -219,15 +221,27 @@
 		myfree(listaddr);
 		myfree(listdelim);
 		myfree(listfqdn);
+		myfree(retstr);
 		return NULL;
 	}
 
+	moredata = mymalloc(2*(tokencount+6) * sizeof(char *));
+	for (i=0; i<2*tokencount; i++) {
+		moredata[i] = data[i];
+	}
+	for (i=0; i<6; i++) {
+		moredata[2*(tokencount+i)] = mystrdup("randomN");
+		moredata[2*(tokencount+i)][6] = '0' + i;
+		moredata[2*(tokencount+i)+1] = random_str();
+	}
+	tokencount += 6;
+
 	tmp = substitute(from, listaddr, listdelim,
-	                 tokencount, data);
+	                 tokencount, moredata);
 	headers[0] = concatstr(2, "From: ", tmp);
 	myfree(tmp);
 	tmp = substitute(to, listaddr, listdelim,
-	                 tokencount, data);
+	                 tokencount, moredata);
 	headers[1] = concatstr(2, "To: ", tmp);
 	myfree(tmp);
 	headers[2] = genmsgid(listfqdn);
@@ -241,7 +255,7 @@
 
 	if(replyto) {
 		tmp = substitute(replyto, listaddr, listdelim,
-		                 tokencount, data);
+		                 tokencount, moredata);
 		headers[8] = concatstr(2, "Reply-To: ", tmp);
 		myfree(tmp);
 	}
@@ -265,7 +279,7 @@
 			   continuation of previous header line */
 			utfsub = unistr_escaped_to_utf8(line);
 			str = substitute(utfsub, listaddr, listdelim,
-			                 tokencount, data);
+			                 tokencount, moredata);
 			myfree(utfsub);
 			len = strlen(str);
 			str[len] = '\n';
@@ -273,10 +287,9 @@
 				log_error(LOG_ARGS, "Could not write std mail");
 				myfree(str);
 				myfree(line);
-				myfree(listaddr);
-				myfree(listdelim);
-				myfree(listfqdn);
-				return NULL;
+				myfree(retstr);
+				retstr = NULL;
+				goto freeandreturn;
 			}
 			myfree(str);
 		} else {
@@ -308,7 +321,7 @@
 			utfsub = unistr_escaped_to_utf8(tmp);
 			*tmp = '\0';
 			utfsub2 = substitute(utfsub, listaddr, listdelim,
-			                     tokencount, data);
+			                     tokencount, moredata);
 			myfree(utfsub);
 			if (strncasecmp(line, "Subject:", len) == 0) {
 				tmp = unistr_utf8_to_header(utfsub2);
@@ -325,10 +338,9 @@
 				log_error(LOG_ARGS, "Could not write std mail");
 				myfree(str);
 				myfree(line);
-				myfree(listaddr);
-				myfree(listdelim);
-				myfree(listfqdn);
-				return NULL;
+				myfree(retstr);
+				retstr = NULL;
+				goto freeandreturn;
 			}
 			myfree(str);
 		}
@@ -343,10 +355,9 @@
 			if (line)
 				myfree(line);
 			myfree(str);
-			myfree(listaddr);
-			myfree(listdelim);
-			myfree(listfqdn);
-			return NULL;
+			myfree(retstr);
+			retstr = NULL;
+			goto freeandreturn;
 		}
 	}
 
@@ -356,10 +367,9 @@
 		myfree(str);
 		if (line)
 			myfree(line);
-		myfree(listaddr);
-		myfree(listdelim);
-		myfree(listfqdn);
-		return NULL;
+		myfree(retstr);
+		retstr = NULL;
+		goto freeandreturn;
 	}
 
 	if (line) {
@@ -399,11 +409,10 @@
 				        if(writen(outfd,str,strlen(str)) < 0) {
 				            myfree(str);
 				            myfree(utfline);
-				            myfree(listaddr);
-				            myfree(listdelim);
-				            myfree(listfqdn);
 				            log_error(LOG_ARGS, "Could not write std mail");
-				            return NULL;
+					    myfree(retstr);
+					    retstr = NULL;
+					    goto freeandreturn;
 				        }
 				        myfree(str);
 				        i++;
@@ -418,15 +427,14 @@
 			myfree(utfline);
 		} else {
 			str = substitute(utfline, listaddr, listdelim,
-			                 tokencount, data);
+			                 tokencount, moredata);
 			myfree(utfline);
 			if(writen(outfd, str, strlen(str)) < 0) {
 				myfree(str);
-				myfree(listaddr);
-				myfree(listdelim);
-				myfree(listfqdn);
 				log_error(LOG_ARGS, "Could not write std mail");
-				return NULL;
+				myfree(retstr);
+				retstr = NULL;
+				goto freeandreturn;
 			}
 			myfree(str);
 		}
@@ -437,9 +445,16 @@
 	fsync(outfd);
 	close(outfd);
 
+freeandreturn:
 	myfree(listaddr);
 	myfree(listdelim);
 	myfree(listfqdn);
 
+	for (i=tokencount-6; i<tokencount; i++) {
+		myfree(moredata[2*i]);
+		myfree(moredata[2*i+1]);
+	}
+	myfree(moredata);
+
 	return retstr;
 }




--------------010300020200030000020005
Content-Type: text/x-patch;
 name="mlmmj-efficient-random.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-efficient-random.patch"

diff -r b443b4df35ff -r 631a406a220a src/random-int.c
--- a/src/random-int.c	Thu Feb 25 15:30:37 2010 +1100
+++ b/src/random-int.c	Thu Feb 25 15:46:28 2010 +1100
@@ -30,10 +30,13 @@
 
 int random_int()
 {
+	static int init = 0;
 	unsigned int seed;
 	int devrandom;
 	unsigned char ch;
 
+	if (init) return rand();
+
 	seed = (unsigned int)time(NULL);
 
 	devrandom = open("/dev/urandom", O_RDONLY);
@@ -53,6 +56,7 @@
 	}
 
 	srand(seed);
+	init = 1;
 
 	return rand();
 }




--------------010300020200030000020005
Content-Type: text/x-patch;
 name="mlmmj-fixed-length-random.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-fixed-length-random.patch"

diff -r 3478ff663b92 -r 4daaf7c66e1e src/strgen.c
--- a/src/strgen.c	Thu Feb 25 16:18:49 2010 +1100
+++ b/src/strgen.c	Thu Feb 25 16:19:06 2010 +1100
@@ -40,10 +40,10 @@
 
 char *random_str()
 {
-	size_t len = 128;
+	size_t len = 17;
 	char *dest = mymalloc(len);
 
-	snprintf(dest, len, "%x%x", random_int(), random_int());
+	snprintf(dest, len, "%08x%08x", random_int(), random_int());
 
 	return dest;
 }




--------------010300020200030000020005
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="moderation"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="moderation"

U3ViamVjdDogTW9kZXJhdGlvbiBuZWVkZWQ6ICRzdWJqZWN0JApNSU1FLVZlcnNpb246IDEu
MApDb250ZW50LVR5cGU6IG11bHRpcGFydC9taXhlZDsKIGJvdW5kYXJ5PSI9XyRyYW5kb20x
JF89IgpDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgotLT1fJHJhbmRvbTEkXz0K
Q29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PXV0ZjgKQ29udGVudC1UcmFuc2Zl
ci1FbmNvZGluZzogOGJpdAoKSGVsbG8sCgpTb21lb25lIGhhcyBzdWJtaXR0ZWQgYSBtZXNz
YWdlIGZvciBtb2RlcmF0aW9uIHRvICRsaXN0YWRkciQuCkl0IGlzIGF0dGFjaGVkLgoKVG8g
YWNjZXB0IGl0IHNlbmQgYSBtZXNzYWdlIHRvOgoKJG1vZGVyYXRlYWRkciQKCllvdXIgbWFp
bGVyIHByb2JhYmx5IGF1dG9tYXRpY2FsbHkgcmVwbGllcyB0byB0aGlzIGFkZHJlc3MsIHdo
ZW4geW91IGhpdAp0aGUgcmVwbHkgYnV0dG9uLiBJZiB5b3UgZG9uJ3Qgd2FudCBpdCBzZW50
IHRvIHRoZSBsaXN0LCBzaW1wbHkgaWdub3JlIHRoaXMKbWVzc2FnZS4KClRoZSBmb2xsb3dp
bmcgbW9kZXJhdG9ycyBoYXZlIHJlY2VpdmVkIHRoaXMgbWFpbDoKCiRtb2RlcmF0b3JzJAoK
LS09XyRyYW5kb20xJF89CkNvbnRlbnQtVHlwZTogbWVzc2FnZS9yZmM4MjIKQ29udGVudC1U
cmFuc2Zlci1FbmNvZGluZzogOGJpdApDb250ZW50LURpc3Bvc2l0aW9uOiBhdHRhY2htZW50
OyBmaWxlbmFtZT0ibWVzc2FnZS5lbWwiCgokb3JpZ2luYWxtYWlsMTAwMDAwMDAwMCQKLS09
XyRyYW5kb20xJF89LS0K
--------------010300020200030000020005
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch-mlmmj-1.2.17-origmail.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patch-mlmmj-1.2.17-origmail.diff"

SW5kZXg6IHNyYy9wcmVwc3RkcmVwbHkuYwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ClJDUyBmaWxlOiAvaG9t
ZS9tbWovTU1KQ1ZTL21sbW1qL3NyYy9wcmVwc3RkcmVwbHkuYyx2CnJldHJpZXZpbmcgcmV2
aXNpb24gMS4yOApkaWZmIC11IC1yMS4yOCBwcmVwc3RkcmVwbHkuYwotLS0geC9zcmMvcHJl
cHN0ZHJlcGx5LmMJNSBOb3YgMjAwNyAyMToyMzozNyAtMDAwMAkxLjI4CisrKyB4L3NyYy9w
cmVwc3RkcmVwbHkuYwkxNiBGZWIgMjAxMCAwNjoxMzoyNyAtMDAwMApAQCAtMTQ1LDEwICsx
NDUsOSBAQAogCQkJCXZhbHVlID0gY29uY2F0c3RyKDMsIHZhbHVlLCAiICIsIHN0cik7CiAJ
CQkJaWYodG1wKQogCQkJCQlteWZyZWUodG1wKTsKKwkJCQlteWZyZWUoc3RyKTsKIAkJCQlj
b3VudCsrOwogCQkJfQotCQkJaWYoc3RyKQotCQkJCW15ZnJlZShzdHIpOwogCQkJY2xvc2Uo
bWFpbGZkKTsKIAkJfWVsc2V7CiAJCQlsb2dfZXJyb3IoTE9HX0FSR1MsICJDb3VsZCBub3Qg
c3Vic3RpdHV0ZSAkb3JpZ2luYWxtYWlsJCAobWFpbG5hbWUgPT0gJXMpIixtYWlsbmFtZSk7
Cg==
--------------010300020200030000020005
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
 

--------------010300020200030000020005--


