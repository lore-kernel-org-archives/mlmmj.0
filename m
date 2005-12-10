From: Jakob Hirsch <jh@plonk.de>
Date: Sat, 10 Dec 2005 03:51:38 +0000
Subject: Re: MIME footer patch, was: mlmmj-1.2.9-RC2 and scooping up patches
Message-Id: <439A50CA.2020703@plonk.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050205000205020106010606"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------050205000205020106010606
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Mads Martin Joergensen wrote:

>   http://mlmmj.mmj.dk/files/mlmmj-1.2.9-RC2.tar.bz2

nice!


And I finally reworked the infamous MIME footer patch. The behaviour is
now controlled by a new control (footer_mime).

There are some major changes in the vodoo file:
- rebuild the while loop that works through the headers
- removed the strlen(hdrline)==1 check. gethdrline() never returns more
than one LF and it's always the rightmost character.
- removed the special handling of headers starting with "mime" (usually
only the "MIME-Version" header). What was the purpose of it? AFAIK it's
a header like every else.
- the result of every writen() is checked now

The changes are really big, but the code is much clearer now and fairly
straightforward. As always, comments welcome.



Regards,
Jakob

--------------050205000205020106010606
Content-Type: text/plain;
 name="mlmmj-footer-mime4.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="mlmmj-footer-mime4.patch"

diff -ru mlmmj-1.2.9-RC2/ChangeLog mlmmj-1.2.9-RC2-jh1/ChangeLog
--- mlmmj-1.2.9-RC2/ChangeLog	2005-12-06 14:44:01.000000000 +0100
+++ mlmmj-1.2.9-RC2-jh1/ChangeLog	2005-12-10 04:11:01.000000000 +0100
@@ -11,6 +11,7 @@
    It makes sense to be able to confirm a request submitted by the sysadmin
    on the commandline
  o Add 'subonlyget' tunable which makes +get-N only work for subscribers
+ o Added MIME handling for the footer (controlled by 'footer_mime')
 1.2.8
  o Don't closedir() before done (GOOD spotting Christian Laursen)
  o Make sure the resend of queue files will not loop indefinately
diff -ru mlmmj-1.2.9-RC2/include/do_all_the_voodo_here.h mlmmj-1.2.9-RC2-jh1/include/do_all_the_voodo_here.h
--- mlmmj-1.2.9-RC2/include/do_all_the_voodo_here.h	2004-06-20 19:27:22.000000000 +0200
+++ mlmmj-1.2.9-RC2-jh1/include/do_all_the_voodo_here.h	2005-12-10 00:50:08.000000000 +0100
@@ -30,6 +30,6 @@
 void getinfo(const char *line, struct mailhdr *readhdrs);
 int do_all_the_voodo_here(int infd, int outfd, int hdrfd, int footfd,
 	      const char **delhdrs, struct mailhdr *readhdrs,
-	      struct strlist *allhdrs, const char *subjectprefix);
+	      struct strlist *allhdrs, const char *subjectprefix, int footmime);
 
 #endif /* DO_ALL_THE_VOODO_HERE_H */
diff -ru mlmmj-1.2.9-RC2/src/do_all_the_voodo_here.c mlmmj-1.2.9-RC2-jh1/src/do_all_the_voodo_here.c
--- mlmmj-1.2.9-RC2/src/do_all_the_voodo_here.c	2005-05-09 14:50:15.000000000 +0200
+++ mlmmj-1.2.9-RC2-jh1/src/do_all_the_voodo_here.c	2005-12-10 04:31:05.000000000 +0100
@@ -77,57 +77,20 @@
 
 int do_all_the_voodo_here(int infd, int outfd, int hdrfd, int footfd,
 		 const char **delhdrs, struct mailhdr *readhdrs,
-		 struct strlist *allhdrs, const char *prefix)
+		 struct strlist *allhdrs, const char *prefix, int footmime)
 {
-	char *hdrline, *subject, *unqp;
-	int hdrsadded = 0;
+	char *hdrline, *unqp, *buf;
 	int subject_present = 0;
 
+	char *content_type_orig = NULL;	/* original Content-Type header */
+	char *content_te_orig = NULL;   /* original Content-Transfer-Encoding */
+	char *boundary = NULL;
+
 	allhdrs->count = 0;
 	allhdrs->strs = NULL;
 
-	while((hdrline = gethdrline(infd))) {
-		/* Done with headers? Then add extra if wanted*/
-		if((strncasecmp(hdrline, "mime", 4) == 0) ||
-			((strlen(hdrline) == 1) && (hdrline[0] == '\n'))){
-
-			/* add extra headers */
-			if(!hdrsadded && hdrfd >= 0) {
-				if(dumpfd2fd(hdrfd, outfd) < 0) {
-					log_error(LOG_ARGS, "Could not "
-						"add extra headers");
-					myfree(hdrline);
-					return -1;
-				} else
-					hdrsadded = 1;
-			}
-			
-			fsync(outfd);
-
-			/* end of headers, write single LF */ 
-			if(hdrline[0] == '\n') {
-				/* but first add Subject if none is present
-				 * and a prefix is defined */
-				if (prefix && !subject_present)
-				{
-					subject = concatstr(3, "Subject: ", 
-								prefix, "\n");
-					writen(outfd, subject, strlen(subject));
-					myfree(subject);
-					subject_present = 1;
-				}
-
-				if(writen(outfd, hdrline, strlen(hdrline))
-						< 0) {
-					myfree(hdrline);
-					log_error(LOG_ARGS,
-							"Error writing hdrs.");
-					return -1;
-				}
-				myfree(hdrline);
-				break;
-			}
-		}
+	while( (hdrline = gethdrline(infd)) && (hdrline[0] != '\n') )
+	{
 		/* Do we want info from hdrs? Get it before it's gone */
 		if(readhdrs)
 			getinfo(hdrline, readhdrs);
@@ -140,51 +103,162 @@
 		allhdrs->strs[allhdrs->count] = NULL;  /* XXX why, why, why? */
 
 		/* Add Subject: prefix if wanted */
-		if(prefix) {
-			if(strncasecmp(hdrline, "Subject:", 8) == 0) {
-				subject_present = 1;
-				unqp = cleanquotedp(hdrline + 8);
-				if(strstr(hdrline + 8, prefix) == NULL &&
-				   strstr(unqp, prefix) == NULL) {
-					subject = concatstr(3,
-							"Subject: ", prefix,
-							hdrline + 8);
-					writen(outfd, subject,
-							strlen(subject));
-					myfree(subject);
-					myfree(hdrline);
-					myfree(unqp);
-					continue;
-				}
+		if(prefix && (strncasecmp(hdrline, "Subject:", 8) == 0)) {
+			subject_present = 1;
+			unqp = cleanquotedp(hdrline + 8);
+			if(strstr(hdrline + 8, prefix) == NULL 
+				&& strstr(unqp, prefix) == NULL) {
 				myfree(unqp);
+				buf = concatstr(3, "Subject: ", prefix, hdrline + 8);
+				myfree(hdrline);
+				if (writen(outfd, buf, strlen(buf)) < 0)
+					return -1;
+				myfree(buf);
+				continue;
 			}
+			myfree(unqp);
 		}
-		
-		/* Should it be stripped? */
-		if(delhdrs) {
-			if(!findit(hdrline, delhdrs))
-				writen(outfd, hdrline, strlen(hdrline));
-		} else
-			writen(outfd, hdrline, strlen(hdrline));
 
+		/* save MIME headers for later (only if wanted) */
+		if (footmime && (footfd >= 0)) {
+			if (!strncasecmp(hdrline, "Content-Type:", 13))	{
+				if (!content_type_orig)
+					content_type_orig = hdrline;
+				else
+					myfree(hdrline); /* drop surplus */
+				continue;
+			} else
+				if (!strncasecmp(hdrline, "Content-Transfer-Encoding:", 26)) {
+					if (!content_te_orig)
+						content_te_orig = hdrline;
+					else
+						myfree(hdrline); /* drop surplus */
+					continue;
+			}
+		}
+
+		/* Should it be stripped? */
+		if(! (delhdrs && findit(hdrline, delhdrs)) )
+			if (writen(outfd, hdrline, strlen(hdrline)) < 0) {
+				log_error(LOG_ARGS, "Error writing header line");
+				return -1;
+			}
 
 		myfree(hdrline);
-	}
 
-	/* Just print the rest of the mail */
-	if(dumpfd2fd(infd, outfd) < 0) {
-		log_error(LOG_ARGS, "Error when dumping rest of mail");
-		return -1;
+	} /* header loop */
+
+	myfree(hdrline);
+
+	/* add extra headers */
+	if (hdrfd >= 0)
+		if(dumpfd2fd(hdrfd, outfd) < 0) {
+			log_error(LOG_ARGS, "Could not add extra headers");
+			return -1;
+		}
+
+	/* add Subject if none was present and a prefix is defined */
+	if (prefix && !subject_present) {
+		buf = concatstr(3, "Subject: ", prefix, "\n");
+		if (writen(outfd, buf, strlen(buf)) < 0)
+			return -1;
+		myfree(buf);
 	}
 
-	/* No more, lets add the footer if one */
-	if(footfd >= 0)
+	fsync(outfd);
+
+	/* add MIME stuff now if this is MIME message or MIME is forced */
+	if (content_type_orig || content_te_orig || (footmime > 1)) {
+
+		/* create new boundary for MIME-encapsulation */
+		buf = random_str();
+		boundary = concatstr(2, "=_", buf);
+		myfree(buf);
+
+		/* and write new content-type header */
+		buf = concatstr(3, "Content-Type: multipart/mixed; boundary=\"",
+				boundary, "\"\n\n");
+		if (writen(outfd, buf, strlen(buf)) < 0)
+			return -1;
+		myfree(buf);
+
+		/* end of message headers */
+
+		buf = concatstr(3,
+			"This is a multi-part message in MIME format.\n\n--",
+			boundary, "\n");
+		if (writen(outfd, buf, strlen(buf)) < 0)
+			return -1;
+		myfree(buf);
+
+		if (content_type_orig) {
+			if (writen(outfd, content_type_orig, strlen(content_type_orig)) < 0)
+				return -1;
+			myfree(content_type_orig);
+		}
+
+		if (content_te_orig) {
+			if (writen(outfd, content_te_orig, strlen(content_te_orig)) < 0)
+				return -1;
+			myfree(content_te_orig);
+		}
+
+		if (writen(outfd, "\n", 1) < 0)
+			return -1;
+
+		/* put message body into this MIME part */
+		if(dumpfd2fd(infd, outfd) < 0) {
+			log_error(LOG_ARGS, "Error when dumping rest of mail");
+			return -1;
+		}
+
+		/* end of original message body, start next MIME part */
+		buf = concatstr(3, "\n--", boundary, "\n");
+		if (writen(outfd, buf, strlen(buf)) < 0)
+			return -1;
+		myfree(buf);
+
+		/* footer with default MIME headers? */ 
+		if (!(footmime > 2)) {
+			buf = mystrdup("Content-Type: text/plain\nContent-Disposition: inline\n\n");
+			if (writen(outfd, buf, strlen(buf)) < 0)
+				return -1;
+			myfree(buf);
+		}
+
+		/* write footer into next MIME part */
 		if(dumpfd2fd(footfd, outfd) < 0) {
-			log_error(LOG_ARGS, "Error when adding footer");
+			log_error(LOG_ARGS, "Error adding footer");
+			return -1;
+		}
+
+		buf = concatstr(3, "\n--", boundary, "--\n");
+		myfree(boundary);
+		if (writen(outfd, buf, strlen(buf)) < 0)
+			return -1;
+		myfree(buf);
+
+	} else {
+		/* no MIME handling, just print the rest of the message */
+
+		if (writen(outfd, "\n", 1) < 0)
+			return -1;
+
+		if(dumpfd2fd(infd, outfd) < 0) {
+			log_error(LOG_ARGS, "Error when dumping rest of mail");
 			return -1;
 		}
 
+		/* Add plain footer if needed */
+		if(footfd >= 0)
+			if(dumpfd2fd(footfd, outfd) < 0) {
+				log_error(LOG_ARGS, "Error when adding footer");
+				return -1;
+			}
+	}
+
 	fsync(outfd);
 
 	return 0;
 }
+
Only in mlmmj-1.2.9-RC2-jh1/src: .do_all_the_voodo_here.c.swp
diff -ru mlmmj-1.2.9-RC2/src/mlmmj-process.c mlmmj-1.2.9-RC2-jh1/src/mlmmj-process.c
--- mlmmj-1.2.9-RC2/src/mlmmj-process.c	2005-12-06 14:29:42.000000000 +0100
+++ mlmmj-1.2.9-RC2-jh1/src/mlmmj-process.c	2005-12-10 02:29:56.000000000 +0100
@@ -315,10 +315,10 @@
 {
 	int i, j, opt, noprocess = 0, moderated = 0;
 	int hdrfd, footfd, rawmailfd, donemailfd;
-	int subonlypost = 0, addrtocc = 1, intocc = 0;
+	int subonlypost = 0, addrtocc = 1, intocc = 0, footmime = 0;
 	int notoccdenymails = 0, noaccessdenymails = 0, nosubonlydenymails = 0;
 	char *listdir = NULL, *mailfile = NULL, *headerfilename = NULL;
-	char *footerfilename = NULL, *donemailname = NULL;
+	char *footerfilename = NULL, *donemailname = NULL, *footmimestr = NULL;
 	char *randomstr = NULL, *mqueuename;
 	char *mlmmjsend, *mlmmjsub, *mlmmjunsub, *mlmmjbounce;
 	char *bindir, *subjectprefix, *discardname, *listaddr, *listdelim;
@@ -453,10 +453,17 @@
 	delheaders->strs[delheaders->count] = NULL;
 	
 	subjectprefix = ctrlvalue(listdir, "prefix");	
+
+	if ((footfd >= 0) && 
+		(footmimestr = ctrlvalue(listdir, "footer_mime")) )
+	{
+		footmime = atoi(footmimestr);
+		myfree(footmimestr);
+	}
 	
 	if(do_all_the_voodo_here(rawmailfd, donemailfd, hdrfd, footfd,
 				(const char**)delheaders->strs, readhdrs,
-				&allheaders, subjectprefix) < 0) {
+				&allheaders, subjectprefix, footmime) < 0) {
 		log_error(LOG_ARGS, "Error in do_all_the_voodo_here");
 		exit(EXIT_FAILURE);
 	}
@@ -550,7 +557,7 @@
 			}
 			if(do_all_the_voodo_here(rawmailfd, donemailfd, -1,
 					-1, (const char**)delheaders->strs,
-					NULL, &allheaders, NULL) < 0) {
+					NULL, &allheaders, NULL, 0) < 0) {
 				log_error(LOG_ARGS, "do_all_the_voodo_here");
 				exit(EXIT_FAILURE);
 			}
diff -ru mlmmj-1.2.9-RC2/TUNABLES mlmmj-1.2.9-RC2-jh1/TUNABLES
--- mlmmj-1.2.9-RC2/TUNABLES	2005-10-09 16:20:49.000000000 +0200
+++ mlmmj-1.2.9-RC2-jh1/TUNABLES	2005-12-10 04:08:42.000000000 +0100
@@ -151,3 +151,21 @@
 
    This specifies what to use as recipient delimiter for the list.
    Default is "+".
+
+ ��� footer				(normal)
+   
+   The contents in this file are added to every message to the list members.
+
+ ��� footer_mime			(integer)
+
+   The value in this file controls the MIME handling. It is ignored if there
+   is no footer.
+
+	0	Add the plain footer (default, same as a emtpy or nonexisting file).
+	1	If the message is a MIME message, the footer is added in a new MIME part.
+		Else simply append the plain text.
+	2	Rebuild every message into a MIME message and add the footer as a MIME
+		part.
+	3	same as 2, but you have to use your own MIME headers (useful for special
+		character sets etc.)
+

--------------050205000205020106010606--
