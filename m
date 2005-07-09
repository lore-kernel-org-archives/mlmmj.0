From: Jakob Hirsch <jh@plonk.de>
Date: Sat, 09 Jul 2005 18:10:48 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality
Message-Id: <42D01328.3010606@plonk.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030402020409070801080800"
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------030402020409070801080800
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Mads Martin Joergensen wrote:

>>Mads, would you accept a patch?
> Of course :-)

Hah, I was not so sure, the patch is somewhat invasive and I'm not
totally happy with all the things, but it works and I think it takes
measures not to break things. Corrections and suggestions welcome.

--------------030402020409070801080800
Content-Type: text/plain;
 name="mlmmj-footer-mime.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mlmmj-footer-mime.patch"

--- mlmmj-1.2.8/src/do_all_the_voodo_here.c	2005-05-09 14:50:15.000000000 +0200
+++ mlmmj-1.2.8-jh1/src/do_all_the_voodo_here.c	2005-07-09 19:57:43.000000000 +0200
@@ -82,6 +82,9 @@
 	char *hdrline, *subject, *unqp;
 	int hdrsadded = 0;
 	int subject_present = 0;
+	int mime = 0;
+	char *content_orig = NULL;  /* original content-type header */
+	char *boundary = NULL;
 
 	allhdrs->count = 0;
 	allhdrs->strs = NULL;
@@ -160,6 +163,51 @@
 			}
 		}
 		
+		/* Content-Type */
+		if(footfd>=0 && !strncasecmp(hdrline, "Content-Type:", 13)) {
+			char* p;
+			int len;
+			/* search first non-LWSP */
+			for (p = hdrline+13; *p==' ' || *p=='\t'; p++);
+
+			if (!strncasecmp(p, "multipart/mixed", 15)) {
+				mime = 1;
+                
+				/* get boundary string */
+				p = strstr(p, "boundary");
+				p = index(p, '=');
+				p = index(p, '"') + 1;
+				if (p == NULL) {
+	                log_error(LOG_ARGS, "MIME multipart but no boundary");
+	                mime = 0;
+				} else {
+					/* find closing quote */
+					/* for(len=0; p[len]!='"' && p[len]!=0; ++len); */
+					len = index(p, '"') - p;
+					if(p[len] == 0) {
+	                    log_error(LOG_ARGS, "no closing quote in boundary");
+	                    mime = 0;
+					} else {
+						boundary = mymalloc(len + 1);
+						strncpy(boundary, p, len);
+						boundary[len] = 0;
+					}
+				}
+			} else if (!strncasecmp(p, "multipart/alternative", 21)) {
+				mime = 2;
+				/* create new boundary for MIME-encapsulation */
+				boundary = random_str();
+				
+				/* save for later use */
+				content_orig = hdrline; 
+				/* and create new content-type header */
+				hdrline = concatstr(3,
+					"Content-Type: multipart/mixed; boundary=\"", 
+				    boundary, "\"\n");
+
+			}
+		}
+
 		/* Should it be stripped? */
 		if(delhdrs) {
 			if(!findit(hdrline, delhdrs))
@@ -171,18 +219,102 @@
 		myfree(hdrline);
 	}
 
-	/* Just print the rest of the mail */
-	if(dumpfd2fd(infd, outfd) < 0) {
-		log_error(LOG_ARGS, "Error when dumping rest of mail");
-		return -1;
-	}
+    /* MIME-Handling */
+	switch (mime) {
+		char* s;
+		unsigned int i;
+		
+		case 0 : /* no MIME, plain message */
+            log_error(LOG_ARGS, "no MIME, plain message"); /* debug */
+			/* Just print the rest of the mail */
+			if(dumpfd2fd(infd, outfd) < 0) {
+				log_error(LOG_ARGS, "Error when dumping rest of mail");
+				return -1;
+			}
 
-	/* No more, lets add the footer if one */
-	if(footfd >= 0)
-		if(dumpfd2fd(footfd, outfd) < 0) {
-			log_error(LOG_ARGS, "Error when adding footer");
-			return -1;
-		}
+			/* No more, lets add the footer if one */
+			if(footfd >= 0)
+				if(dumpfd2fd(footfd, outfd) < 0) {
+					log_error(LOG_ARGS, "Error when adding footer");
+					return -1;
+				}
+				
+			break;
+			
+		case 1 : /* multipart/mixed */
+
+			if(dumpfd2fd(infd, outfd) < 0) {
+				log_error(LOG_ARGS, "Error when dumping rest of mail");
+				return -1;
+			}
+
+			/* seek back to the end of the close-delimiter to kill
+			  the last two hyphens. hopefully nobody puts too
+			  much garbage in the epilogue or else this will fail... */
+			i = 2 * strlen(boundary) - 1;
+			lseek(outfd, -i, SEEK_END);
+			s = mymalloc(i+1);
+			read(outfd, s, i);
+			s[i] = 0;
+			i -= strstr(s, boundary) - s + strlen(boundary);
+			myfree(s);
+			if (i>2*strlen(boundary)) {
+				log_error(LOG_ARGS, "Error seeking MIME close-delimiter");
+			} else {
+				lseek(outfd, -i, SEEK_END);
+
+				s = concatstr(2, "\nContent-Type: text/plain\n",
+					"Content-Disposition: inline\n\n");
+				writen(outfd, s, strlen(s));
+				myfree(s);
+
+				if(dumpfd2fd(footfd, outfd) < 0) {
+					log_error(LOG_ARGS, "Error when adding footer");
+					myfree(boundary);
+					return -1;
+				}
+
+				s = concatstr(3, "\n--", boundary, "--\n");
+				writen(outfd, s, strlen(s));
+				myfree(s);
+			}
+			myfree(boundary);
+
+			break;
+
+		case 2 : /* multipart/alternative */
+			s = concatstr(5,
+				"This is a multi-part message in MIME format.\n\n--",
+				boundary, "\n",
+				content_orig, "\n");
+			myfree(content_orig);
+			writen(outfd, s, strlen(s));
+			myfree(s);
+
+			if(dumpfd2fd(infd, outfd) < 0) {
+				log_error(LOG_ARGS, "Error when dumping rest of mail");
+				return -1;
+			}
+
+		    s = concatstr(4,
+		        "\n--", boundary,
+		        "\nContent-Type: text/plain\n",
+		        "Content-Disposition: inline\n\n");
+			writen(outfd, s, strlen(s));
+			myfree(s);
+			
+			if(dumpfd2fd(footfd, outfd) < 0) {
+				log_error(LOG_ARGS, "Error when adding footer");
+				return -1;
+			}
+
+			s = concatstr(3, "\n--", boundary, "--\n");
+			myfree(boundary);
+			writen(outfd, s, strlen(s));
+			myfree(s);
+
+			break;
+	}
 
 	fsync(outfd);
 

--------------030402020409070801080800--
