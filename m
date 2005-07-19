From: Jakob Hirsch <jh@plonk.de>
Date: Tue, 19 Jul 2005 22:09:22 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality
Message-Id: <42DD7A12.9010108@plonk.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030402060907030209000700"
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------030402060907030209000700
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Jakob Hirsch wrote:

> To make it really reliable, I will take the easy way: Create a new MIME
> envelope with multipart/mixed for every Content-Type (not only for

done. Blatantly simple, compared with the original approach.

> We can even think about doing this with all messages, so the behaviour
> and appearance is consistent. But that should probably be controlled by
> a switch in the control directory (like "footer_always_mime").

ok, maybe later... :)

It could also be used for specifying a charset, but then an encoding
would also be needed (or we assume something, 8bit or qp).


--------------030402060907030209000700
Content-Type: text/plain;
 name="mlmmj-footer-mime3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mlmmj-footer-mime3.patch"

--- mlmmj-1.2.8/src/do_all_the_voodo_here.c	2005-05-09 14:50:15.000000000 +0200
+++ mlmmj-1.2.8-jh4/src/do_all_the_voodo_here.c	2005-07-19 23:55:32.000000000 +0200
@@ -79,9 +79,12 @@
 		 const char **delhdrs, struct mailhdr *readhdrs,
 		 struct strlist *allhdrs, const char *prefix)
 {
-	char *hdrline, *subject, *unqp;
+	char *hdrline, *subject, *unqp, *buf;
 	int hdrsadded = 0;
 	int subject_present = 0;
+	char *content_type_orig = NULL;	/* original Content-Type header */
+	char *content_te_orig = NULL;   /* original Content-Transfer-Encoding */
+	char *boundary = NULL;
 
 	allhdrs->count = 0;
 	allhdrs->strs = NULL;
@@ -116,7 +119,22 @@
 					myfree(subject);
 					subject_present = 1;
 				}
-
+				
+				/* time to add Content-Type */
+				if (content_type_orig || content_te_orig) {
+					/* create new boundary for MIME-encapsulation */
+					buf = random_str();
+					boundary = concatstr(3, "=_=", buf, "=_=");
+					myfree(buf);
+
+					/* and create new content-type header */
+					buf = concatstr(3,
+						"Content-Type: multipart/mixed; boundary=\"",
+						boundary, "\"\n");
+					writen(outfd, buf, strlen(buf));
+					myfree(buf);
+				}
+				
 				if(writen(outfd, hdrline, strlen(hdrline))
 						< 0) {
 					myfree(hdrline);
@@ -159,7 +177,25 @@
 				myfree(unqp);
 			}
 		}
-		
+
+		if (footfd>=0) {
+			/* save MIME header for later use */
+			if (!strncasecmp(hdrline, "Content-Type:", 13)) {
+				if (!content_type_orig)
+					content_type_orig = hdrline;
+				else
+					myfree(hdrline); /* drop surplus */
+				continue;
+			} else if (!strncasecmp(hdrline, 
+					"Content-Transfer-Encoding:", 26)) {
+				if (!content_te_orig)
+				    content_te_orig = hdrline;
+				else
+				    myfree(hdrline); /* drop surplus */
+				continue;
+			}
+		}
+
 		/* Should it be stripped? */
 		if(delhdrs) {
 			if(!findit(hdrline, delhdrs))
@@ -170,20 +206,64 @@
 
 		myfree(hdrline);
 	}
+	
+	if (content_type_orig || content_te_orig) {
 
-	/* Just print the rest of the mail */
-	if(dumpfd2fd(infd, outfd) < 0) {
-		log_error(LOG_ARGS, "Error when dumping rest of mail");
-		return -1;
-	}
+		buf = concatstr(3,
+			"This is a multi-part message in MIME format.\n\n--",
+			boundary, "\n");
+		writen(outfd, buf, strlen(buf));
+		myfree(buf);
+
+		if (content_type_orig) {
+			writen(outfd, content_type_orig, strlen(content_type_orig));
+			myfree(content_type_orig);
+		}
+        
+		if (content_te_orig) {
+			writen(outfd, content_te_orig, strlen(content_te_orig));
+			myfree(content_te_orig);
+		}
+		
+		writen(outfd, "\n", 1);
 
-	/* No more, lets add the footer if one */
-	if(footfd >= 0)
+		/* Just print the rest of the mail */
+		if(dumpfd2fd(infd, outfd) < 0) {
+			log_error(LOG_ARGS, "Error when dumping rest of mail");
+			return -1;
+		}
+
+		buf = concatstr(3, "\n--", boundary,
+			"\nContent-Type: text/plain\nContent-Disposition: inline\n\n");
+		writen(outfd, buf, strlen(buf));
+ 		myfree(buf);
+
+		/* No more, lets add the footer if one */
 		if(dumpfd2fd(footfd, outfd) < 0) {
 			log_error(LOG_ARGS, "Error when adding footer");
 			return -1;
 		}
 
+		buf = concatstr(3, "\n--", boundary, "--\n");
+		myfree(boundary);
+		writen(outfd, buf, strlen(buf));
+		myfree(buf);
+		
+	} else {
+		/* Just print the rest of the mail */
+		if(dumpfd2fd(infd, outfd) < 0) {
+			log_error(LOG_ARGS, "Error when dumping rest of mail");
+			return -1;
+		}
+
+		/* No more, lets add the footer if one */
+		if(footfd >= 0)
+			if(dumpfd2fd(footfd, outfd) < 0) {
+				log_error(LOG_ARGS, "Error when adding footer");
+				return -1;
+			}
+	}
+
 	fsync(outfd);
 
 	return 0;

--------------030402060907030209000700--
