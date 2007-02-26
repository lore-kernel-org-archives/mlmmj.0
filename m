From: Sascha Sommer <ssommer@suse.de>
Date: Mon, 26 Feb 2007 12:35:13 +0000
Subject: [PATCH] mimestrip / mimereject
Message-Id: <200702261335.13954.ssommer@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_BQt4FNpOIvZbGvX"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

--Boundary-00=_BQt4FNpOIvZbGvX
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

this is a first attempt to implement stripping and rejecting of multipart/mime 
messages for mlmmj.

There are 2 patches.
mlmmj-1.2.13-split_do_all_the_vodoo_here.patch
splits do_all_the_vodoo_here()
so that the header reading can be found in an extra function.
This function can then later be reused to read the mime headers. 

mlmmj-1.2.13-mimestrip-mimereject.patch
makes it possible to add the files
mimereject and mimeremove to the control/ directory. 
Each of them can contain a list with different mime types 
like "application/octet-stream" or "text/html"
Messages that contain parts with one of these mime types then either get 
rejected or the unwanted part gets removed.

It also parses "multipart/alternative" parts that contain multiple parts 
themselves.

I'm not sure if the parser should always be enabled, though.

Please review.

Thanks.

Sascha

--Boundary-00=_BQt4FNpOIvZbGvX
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mlmmj-1.2.13-mimestrip-mimereject.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mlmmj-1.2.13-mimestrip-mimereject.patch"

diff -Naur mlmmj-1.2.13-split/include/do_all_the_voodo_here.h mlmmj-1.2.13/=
include/do_all_the_voodo_here.h
=2D-- mlmmj-1.2.13-split/include/do_all_the_voodo_here.h	2007-02-26 11:01:1=
9.000000000 +0100
+++ mlmmj-1.2.13/include/do_all_the_voodo_here.h	2007-02-26 11:08:01.000000=
000 +0100
@@ -30,6 +30,6 @@
 void getinfo(const char *line, struct mailhdr *readhdrs);
 int do_all_the_voodo_here(int infd, int outfd, int hdrfd, int footfd,
 	      const char **delhdrs, struct mailhdr *readhdrs,
=2D	      struct strlist *allhdrs, const char *subjectprefix);
+	      struct strlist *allhdrs, const char *subjectprefix, const char** de=
lmime, struct strlist *allmime);
=20
 #endif /* DO_ALL_THE_VOODO_HERE_H */
diff -Naur mlmmj-1.2.13-split/README mlmmj-1.2.13/README
=2D-- mlmmj-1.2.13-split/README	2007-02-26 11:01:19.000000000 +0100
+++ mlmmj-1.2.13/README	2007-02-26 11:54:53.000000000 +0100
@@ -126,6 +126,13 @@
=20
 10) Have a look at the file TUNABLES for runtime configurable things.
=20
+11) If you want to strip parts with certain mimetypes from multipart/mime =
messages
+    add a file called 'mimestrip' containing these mimetypes to the contro=
l/ directory.
+
+12) If you want to deny multipart/mime messages with certain mimetypes add=
 a file
+    called 'mimedeny' continaing these mimetypes to the control/directory
+
+
 Tunables in include/mlmmj.h:
  =B7 There's some time intervals for how mlmmj-maintd operates. I've choos=
en
    non-strict defaults, so depending on your BOFH rate you might want to t=
weak.
diff -Naur mlmmj-1.2.13-split/src/do_all_the_voodo_here.c mlmmj-1.2.13/src/=
do_all_the_voodo_here.c
=2D-- mlmmj-1.2.13-split/src/do_all_the_voodo_here.c	2007-02-26 11:01:19.00=
0000000 +0100
+++ mlmmj-1.2.13/src/do_all_the_voodo_here.c	2007-02-26 11:45:09.000000000 =
+0100
@@ -107,11 +107,156 @@
 	return 0;
 }
=20
+/* check if the supplied headers contain a Content-Type header with bounda=
ry  */
+static int find_boundary(struct strlist *allhdrs, char** mime_type, char**=
 boundary)
+{
+	int x;
+	*boundary =3D NULL;
+	*mime_type =3D NULL;
+	for( x =3D 0 ; x < allhdrs->count ; x++ ){
+		char* hdr =3D allhdrs->strs[x];
+		if(hdr && !strncasecmp(hdr,"Content-Type:",13)){
+			char* pos =3D hdr + 13;
+			size_t len =3D 0;
+
+			/* find the start of the mimetype */
+			while(*pos && (*pos =3D=3D ' ' || *pos =3D=3D '\t'))
+				++pos;
+
+			if(*pos =3D=3D '"'){                   /* handle quoted mime types */
+				++pos;
+				while(pos[len] && pos[len] !=3D '"')
+					++len;
+			}else{
+				while(pos[len] && pos[len] !=3D ' ' && pos[len] !=3D '\t' && pos[len] =
!=3D ';')
+					++len;
+			}
+
+			/* extract mime type */
+			if(len){
+				*mime_type =3D mymalloc(len+1);
+				strncpy(*mime_type,pos,len);
+				(*mime_type)[len] =3D '\0';
+			}
+
+			pos +=3D len;
+			len =3D 0;
+			/* find start of the boundary info */
+			while(*pos && strncasecmp(pos,"boundary=3D",9))
+				++pos;
+			if(*pos =3D=3D '\0')         /* no boundary */
+				return 0;
+			pos +=3D 9;
+			if(*pos =3D=3D '"'){         /* quoted boundary */
+				++pos;
+				while(pos[len] && pos[len] !=3D '"')
+					++len;
+			}else{                  /* unquoted boundary */
+				while(pos[len] && pos[len] !=3D ' ' && pos[len] !=3D '\t' && pos[len] =
!=3D ';')
+					++len;
+			}
+
+			/* extract boundary */
+			*boundary =3D mymalloc(len + 3);
+			strcpy(*boundary,"--");
+			strncat(*boundary,pos,len);
+
+			return 0;
+		}
+	}
+	return 0;
+}
+
+/* dump multipart messages skipping parts specified in delmime*/
+static int dump_multipart(int infd, int outfd, char* boundary, const char =
**delmime, struct strlist *allmime)
+{
+	char* line;
+	int strip_part =3D 0;
+	int end_of_part =3D 0;
+
+	/* parse mail line by line */
+        while((line =3D mygetline(infd)) !=3D NULL) {
+		int i;
+		struct strlist hdrs;
+		char* new_boundary =3D NULL;
+		hdrs.count =3D 0;
+		hdrs.strs =3D NULL;
+
+		/* found a boundary that has been mentioned in the header */
+		if(!strncmp(line,boundary,strlen(boundary))){
+			strip_part =3D 0;
+			/* check if the boundary is the beginning of a new part */
+			if(strncmp(line + strlen(boundary),"--",2)){
+				char* mime_type =3D NULL;
+
+				/* read headers */
+				if( gethdrs(infd, &hdrs) < 0) {
+					log_error(LOG_ARGS, "could not read headers");
+					return -1;
+				}
+				/* get mimetype and boundary from the headers */
+				if(find_boundary(&hdrs,&mime_type,&new_boundary) < 0) {
+					log_error(LOG_ARGS, "Error searching for mime_type and boundary");
+					return -1;
+				}
+
+				/* append mime type to mimelist and check if the part should be stripp=
ed */
+				if(mime_type) {
+					append_strtolist(allmime,mime_type);
+					if(delmime && findit(mime_type, delmime))
+						strip_part =3D 1;
+					myfree(mime_type);
+				}
+			}else{
+				end_of_part=3D1;
+			}
+		}
+		if(!strip_part) {
+			if(writen(outfd, line, strlen(line)) < 0){
+				log_error(LOG_ARGS, "Error when dumping rest of mail");
+				return -1;
+			}
+			/* write headers if any */
+			if(hdrs.count) {
+				for(i =3D 0; i < hdrs.count ; i++) {
+					if(writen(outfd, hdrs.strs[i], strlen(hdrs.strs[i])) < 0){
+						log_error(LOG_ARGS, "Error when dumping headers for rest of mail");
+						return -1;
+					}
+				}
+				if(writen(outfd, "\n", 1) < 0) {
+					log_error(LOG_ARGS,"Error writting end of hdrs.");
+					return -1;
+				}
+			}
+			/* dump embedded (multipart) part */
+			if(new_boundary) {
+				if( dump_multipart(infd,outfd, new_boundary, delmime, allmime) < 0){
+					log_error(LOG_ARGS, "Error when dumping nested part");
+					return -1;
+				}
+				myfree(new_boundary);
+			}
+		}
+		/* free headers if any */
+		if(hdrs.strs) {
+			for(i =3D 0; i < hdrs.count ; i++)=20
+				myfree(hdrs.strs[i]);
+			myfree(hdrs.strs);
+		}
=20
+		myfree(line);
+
+		if(end_of_part)
+			break;
+	}
+	return 0;
+}
=20
 int do_all_the_voodo_here(int infd, int outfd, int hdrfd, int footfd,
 		 const char **delhdrs, struct mailhdr *readhdrs,
=2D		 struct strlist *allhdrs, const char *prefix)
+		 struct strlist *allhdrs, const char *prefix,
+		 const char **delmime, struct strlist *allmime)
 {
 	char *subject, *unqp;
 	int hdrsadded =3D 0;
@@ -120,6 +265,10 @@
=20
 	allhdrs->count =3D 0;
 	allhdrs->strs =3D NULL;
+	if(allmime) {
+		allmime->count =3D 0;
+		allmime->strs =3D NULL;
+	}
=20
 	/* copy headers */
 	gethdrs(infd,allhdrs);
@@ -203,6 +352,28 @@
 			return -1;
 	}
=20
+	if(allmime){
+		char* mime_type =3D NULL,*boundary=3DNULL;
+		if(find_boundary(allhdrs,&mime_type,&boundary) < 0) {
+			log_error(LOG_ARGS, "Error searching for mime_type and boundary");
+			return -1;
+		}
+
+		if(mime_type) {
+			append_strtolist(allmime,mime_type);
+			myfree(mime_type);
+		}
+
+		if(boundary) {
+			/* dump multipart message */
+			if(dump_multipart(infd, outfd, boundary, delmime, allmime) < 0) {
+				log_error(LOG_ARGS, "Error when dumping multipart");
+				return -1;
+			}
+			myfree(boundary);
+		}
+	}
+
 	/* Just print the rest of the mail */
 	if(dumpfd2fd(infd, outfd) < 0) {
 		log_error(LOG_ARGS, "Error when dumping rest of mail");
diff -Naur mlmmj-1.2.13-split/src/mlmmj-process.c mlmmj-1.2.13/src/mlmmj-pr=
ocess.c
=2D-- mlmmj-1.2.13-split/src/mlmmj-process.c	2007-02-26 11:01:19.000000000 =
+0100
+++ mlmmj-1.2.13/src/mlmmj-process.c	2007-02-26 11:52:26.000000000 +0100
@@ -166,6 +166,21 @@
 	}
 }
=20
+static enum action check_mime(struct strlist *denymime, struct strlist * a=
llmime)
+{
+	int i;
+	for(i=3D0;i<allmime->count;i++){
+		int x;
+		for(x=3D0; x < denymime->count ; x++){
+			if(!strcasecmp(allmime->strs[i],denymime->strs[x])){
+				log_error(LOG_ARGS, "A mail with mime %s was denied",
+						    allmime->strs[i]);
+				return DENY;=20
+			}
+		}
+	}
+	return ALLOW;
+}
=20
 static enum action do_access(struct strlist *rule_strs, struct strlist *hd=
rs)
 {
@@ -366,8 +381,11 @@
 	struct email_container rpemails =3D { 0, NULL };
 	struct email_container dtemails =3D { 0, NULL };
 	struct strlist *access_rules =3D NULL;
+	struct strlist *mime_deny =3D NULL;
 	struct strlist *delheaders =3D NULL;
 	struct strlist allheaders;
+	struct strlist *delmime =3D NULL;
+	struct strlist allmime;
 	struct strlist *alternates =3D NULL;
 	struct mailhdr readhdrs[] =3D {
 		{ "From:", 0, NULL },
@@ -483,12 +501,21 @@
 	delheaders->strs[delheaders->count++] =3D mystrdup("From ");
 	delheaders->strs[delheaders->count++] =3D mystrdup("Return-Path:");
 	delheaders->strs[delheaders->count] =3D NULL;
=2D=09
+
+	/* get a list of mime parts that should be stripped */
+	delmime =3D ctrlvalues(listdir, "mimestrip");
+	if(delmime =3D=3D NULL) {
+		delmime =3D mymalloc(sizeof(struct strlist));
+		delmime->count =3D 0;
+		delmime->strs =3D NULL;
+	}
+
+
 	subjectprefix =3D ctrlvalue(listdir, "prefix");=09
 =09
 	if(do_all_the_voodo_here(rawmailfd, donemailfd, hdrfd, footfd,
 				(const char**)delheaders->strs, readhdrs,
=2D				&allheaders, subjectprefix) < 0) {
+				&allheaders, subjectprefix,(const char**)delmime->strs, &allmime) < 0)=
 {
 		log_error(LOG_ARGS, "Error in do_all_the_voodo_here");
 		exit(EXIT_FAILURE);
 	}
@@ -599,7 +626,7 @@
 			}
 			if(do_all_the_voodo_here(rawmailfd, donemailfd, -1,
 					-1, (const char**)delheaders->strs,
=2D					NULL, &allheaders, NULL) < 0) {
+					NULL, &allheaders, NULL, (const char**)delmime->strs, &allmime) < 0) {
 				log_error(LOG_ARGS, "do_all_the_voodo_here");
 				exit(EXIT_FAILURE);
 			}
@@ -654,6 +681,12 @@
=20
 	myfree(delheaders);
=20
+	for(i =3D 0; i < delmime->count; i++)
+		myfree(delmime->strs[i]);
+	myfree(delmime->strs);
+	myfree(delmime);
+
+
 	if(strcmp(efrom, "") =3D=3D 0) { /* don't send mails with <> in From
 					     to the list */
 		discardname =3D concatstr(3, listdir,
@@ -808,11 +841,34 @@
 	noaccessdenymails =3D statctrl(listdir, "noaccessdenymails");
=20
 	access_rules =3D ctrlvalues(listdir, "access");
=2D	if (access_rules) {
=2D		enum action accret;
+	mime_deny =3D ctrlvalues(listdir,"mimedeny");
+	if (access_rules || mime_deny) {
+		enum action accret =3D ALLOW;
 		/* Don't send a mail about denial to the list, but silently
 		 * discard and exit. Also do this in case it's turned off */
=2D		accret =3D do_access(access_rules, &allheaders);
+
+		/* check rules */
+		if(access_rules)
+			accret =3D do_access(access_rules, &allheaders);
+
+		/* check allowed mime types */
+		if(accret =3D=3D ALLOW && mime_deny)
+			accret =3D check_mime(mime_deny, &allmime);
+
+		/* free rules */
+		if(access_rules) {
+			for(i =3D 0; i < access_rules->count; i++)
+				myfree(access_rules->strs[i]);
+			myfree(access_rules->strs);
+			myfree(access_rules);
+		}
+		if(mime_deny) {
+			for(i =3D 0; i < mime_deny->count; i++)
+				myfree(mime_deny->strs[i]);
+			myfree(mime_deny->strs);
+			myfree(mime_deny);
+		}
+
 		if (accret =3D=3D DENY) {
 			if ((strcasecmp(listaddr, fromemails.emaillist[0]) =3D=3D
 						0) || noaccessdenymails) {

--Boundary-00=_BQt4FNpOIvZbGvX
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mlmmj-1.2.13-split_do_all_the_vodoo_here.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mlmmj-1.2.13-split_do_all_the_vodoo_here.patch"

diff -Naur mlmmj-1.2.13.org/src/do_all_the_voodo_here.c mlmmj-1.2.13/src/do_all_the_voodo_here.c
--- mlmmj-1.2.13.org/src/do_all_the_voodo_here.c	2007-02-26 09:55:32.000000000 +0100
+++ mlmmj-1.2.13/src/do_all_the_voodo_here.c	2007-02-26 12:26:57.000000000 +0100
@@ -75,28 +75,64 @@
 	}
 }
 
+/* append a string to a stringlist */
+static void append_strtolist(struct strlist *list, char* str)
+{
+	list->count++;
+	list->strs = myrealloc(list->strs,
+		sizeof(char *) * (list->count + 1));
+	list->strs[list->count-1] = mystrdup(str);
+	list->strs[list->count] = NULL;  /* XXX why, why, why? */
+}
+
+
+/* get a copy of all headers */
+static int gethdrs(int infd, struct strlist *allhdrs)
+{
+	char* hdrline;
+	while((hdrline = gethdrline(infd))) {
+
+		/* Done with headers?*/
+		if((strlen(hdrline) == 1) && (hdrline[0] == '\n')) {
+			myfree(hdrline);
+			break;
+		}
+
+		/* Snatch a copy of the header */
+		append_strtolist(allhdrs,hdrline);
+
+		myfree(hdrline);
+
+	}
+	return 0;
+}
+
+
+
 int do_all_the_voodo_here(int infd, int outfd, int hdrfd, int footfd,
 		 const char **delhdrs, struct mailhdr *readhdrs,
 		 struct strlist *allhdrs, const char *prefix)
 {
-	char *hdrline, *subject, *unqp;
+	char *subject, *unqp;
 	int hdrsadded = 0;
 	int subject_present = 0;
+	int i;
 
 	allhdrs->count = 0;
 	allhdrs->strs = NULL;
 
-	while((hdrline = gethdrline(infd))) {
-		/* Done with headers? Then add extra if wanted*/
-		if((strncasecmp(hdrline, "mime", 4) == 0) ||
-			((strlen(hdrline) == 1) && (hdrline[0] == '\n'))){
+	/* copy headers */
+	gethdrs(infd,allhdrs);
 
+	/* write headers */
+	for(i = 0 ; i < allhdrs->count ; i++) {
+		char* hdrline = allhdrs->strs[i];
+		if(strncasecmp(hdrline, "mime", 4) == 0) {
 			/* add extra headers */
 			if(!hdrsadded && hdrfd >= 0) {
 				if(dumpfd2fd(hdrfd, outfd) < 0) {
 					log_error(LOG_ARGS, "Could not "
 						"add extra headers");
-					myfree(hdrline);
 					return -1;
 				} else
 					hdrsadded = 1;
@@ -104,41 +140,11 @@
 			
 			fsync(outfd);
 
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
 		}
 		/* Do we want info from hdrs? Get it before it's gone */
 		if(readhdrs)
 			getinfo(hdrline, readhdrs);
 
-		/* Snatch a copy of the header */
-		allhdrs->count++;
-		allhdrs->strs = myrealloc(allhdrs->strs,
-					sizeof(char *) * (allhdrs->count + 1));
-		allhdrs->strs[allhdrs->count-1] = mystrdup(hdrline);
-		allhdrs->strs[allhdrs->count] = NULL;  /* XXX why, why, why? */
-
 		/* Add Subject: prefix if wanted */
 		if(prefix) {
 			if(strncasecmp(hdrline, "Subject:", 8) == 0) {
@@ -152,7 +158,6 @@
 					writen(outfd, subject,
 							strlen(subject));
 					myfree(subject);
-					myfree(hdrline);
 					myfree(unqp);
 					continue;
 				}
@@ -166,9 +171,36 @@
 				writen(outfd, hdrline, strlen(hdrline));
 		} else
 			writen(outfd, hdrline, strlen(hdrline));
+	}
 
 
-		myfree(hdrline);
+	/* add extra headers */
+	if(!hdrsadded && hdrfd >= 0) {
+		if(dumpfd2fd(hdrfd, outfd) < 0) {
+			log_error(LOG_ARGS, "Could not "
+                                            "add extra headers");
+			return -1;
+		} else
+			hdrsadded = 1;
+	}
+
+	fsync(outfd);
+
+	/* end of headers, write single LF */
+	/* but first add Subject if none is present
+	 * and a prefix is defined */
+	if (prefix && !subject_present)
+	{
+		subject = concatstr(3, "Subject: ",
+       					prefix, "\n");
+		writen(outfd, subject, strlen(subject));
+		myfree(subject);
+		subject_present = 1;
+	}
+
+	if(writen(outfd, "\n", 1) < 0) {
+		log_error(LOG_ARGS,"Error writing hdrs.");
+			return -1;
 	}
 
 	/* Just print the rest of the mail */

--Boundary-00=_BQt4FNpOIvZbGvX--
