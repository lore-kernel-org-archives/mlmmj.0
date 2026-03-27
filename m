Return-Path: <mlmmj+bounces-3088-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239C310F2865
	for <mlmmj@archiver.kernel.org>; Fri, 27 Mar 2026 19:17:51 +0000 (UTC)
Received: from localhost ([127.0.0.1]:42412 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3088-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w6Bmf-00AmbO-0d
	for mlmmj@archiver.kernel.org;
	Fri, 27 Mar 2026 18:19:49 +0000
Received: from wave.etherlight.link ([164.68.99.115]:59942)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lumin+mlmmj@etherlight.link>)
	id 1w6BmY-00Amaf-0O
	for mlmmj@mlmmj.org;
	Fri, 27 Mar 2026 18:19:42 +0000
From: Lumin Etherlight <lumin+mlmmj@etherlight.link>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=etherlight.link;
	s=default; t=1774635994;
	bh=HLWKC0ppWaXzNoBC9nuriyK2CGdqkHkAsgCdE7sDHG4=;
	h=From:To:Subject:Date;
	b=dBfP0nsOFyG+98EEIN3FR5O0by4QXOMM5BkPXHEnseXtb2d6Ch7olHiJen127A8Nl
	 kNsLQPRdKjX6E/LEzi+J1BVNw7d3uz4fBZEosE/KdGYT9MH1JNddM3027zJb+PWGB9
	 25Is8wbyhnyRzYNUC5W0zYu8z00ahDD+o0cJBtxzWuBjPir2TFVqxho78lPvTjmkhv
	 DZOlPo5oLswqq4/MIXLu9z7/lKetr9c5q5p5lPLhnZH8LZratBlx2bIJ/00SbP9VEn
	 WUmeC+qoShCCalE8c726pg7VRSgpYbcHrbCyu8Pza40I5dQyDO5rIh7fpwQb6RIvdU
	 kiU06VQ57iPQQ==
To: mlmmj@mlmmj.org
Subject: [PATCH] Support display name substitution in customheaders
Date: Fri, 27 Mar 2026 21:14:16 +0300
Organization: Etherlight Systems - https://etherlight.link
Message-ID: <83Su95j/WN8QKsJA6dPhlkwgNx6bkcF5@etherlight.link>
User-Agent: Gnus/5.13 (Gnus v5.13)
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain

Allow substitution of  the variable $postername$ for
the display name  of the user.  The  display name is
extracted from the sender's From: header.  If a name
is not found, then  this variable is substituted for
user's address, i.e. the same value as $posteraddr$.
Proper handling of comments,  and quoted strings, in
the From: address is also included.

This allows the following `customheaders' use-case:

    From: $postername$ via Project-List <project-list@example.com>

Which would render, for example, as:

    From: John Doe via Project-List <project-list@example.com>

For the user:

    John Doe <john@example.com>.
---
 AUTHORS                      |  1 +
 include/find_email_adr.h     |  1 +
 include/wrappers.h           |  2 +-
 src/do_all_the_voodoo_here.c | 22 ++++++++++++---
 src/dumpfd2fd.c              | 14 +++++++++-
 src/find_email_adr.c         | 52 ++++++++++++++++++++++++++++++++++++
 6 files changed, 86 insertions(+), 6 deletions(-)

diff --git a/AUTHORS b/AUTHORS
index be21ced..9d9b7df 100644
--- a/AUTHORS
+++ b/AUTHORS
@@ -1,3 +1,4 @@
 Mads Martin Joergensen <mmj@mmj.dk>
 Morten K. Poulsen <morten@afdelingp.dk>
 Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
+Lumin Etherlight <lumin+mlmmj@etherlight.link>
diff --git a/include/find_email_adr.h b/include/find_email_adr.h
index e5da89b..707fdd6 100644
--- a/include/find_email_adr.h
+++ b/include/find_email_adr.h
@@ -27,5 +27,6 @@
 #include <stddef.h>
 
 strlist *find_email_adr(const char *str, strlist *retval);
+char    *find_display_name(char *name);
 
 #endif /* FIND_EMAIL_ADR_H */
diff --git a/include/wrappers.h b/include/wrappers.h
index 2953bd2..5a2c144 100644
--- a/include/wrappers.h
+++ b/include/wrappers.h
@@ -31,6 +31,6 @@ ssize_t readn(int fd, void *vptr, size_t n);
 int random_int(void);
 int dumpfd2fd(int infd, int outfd);
 int copy_file(int infd, int outfd, size_t bufsiz);
-int process_headers(int infd, FILE *outf, const char *from);
+int process_headers(int infd, FILE *outf, const char *from, const char *name);
 
 #endif /* WRAPPERS_H */
diff --git a/src/do_all_the_voodoo_here.c b/src/do_all_the_voodoo_here.c
index 13aeb74..14214a8 100644
--- a/src/do_all_the_voodoo_here.c
+++ b/src/do_all_the_voodoo_here.c
@@ -80,6 +80,7 @@ int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 	char *hdrline, *unfolded, *unqp;
 	strlist allunfoldeds = tll_init();
 	char *posteraddr = NULL;
+	char *postername = NULL;
 	bool hdrsadded = false;
 	bool subject_present = false;
 	int dupfd = dup(infd);
@@ -111,9 +112,16 @@ int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 	if(hdrfd >= 0) {
 		strlist fromemails = tll_init();
 		if ( readhdrs[0].valuecount == 1 ) {
-		        find_email_adr(readhdrs[0].values[0], &fromemails);
-			if (tll_length(fromemails) > 0)
+			find_email_adr(readhdrs[0].values[0], &fromemails);
+			if (tll_length(fromemails) > 0) {
 				posteraddr = xstrdup(tll_front(fromemails));
+				postername = find_display_name(readhdrs[0].values[0]);
+				if (!postername) {
+					postername = posteraddr ?
+						xstrdup(posteraddr) :
+						xcalloc(1, 1);
+				}
+			}
 		}
 		tll_free_and_free(fromemails, free);
 	}
@@ -129,12 +137,13 @@ int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 		if(!hdrsadded &&
 		    ( strncasecmp(hdrline, "mime", 4) == 0)) {
 			if(hdrfd >= 0) {
-			        if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "") < 0) {
+				if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "", postername ) < 0) {
 					log_error(LOG_ARGS, "Could not "
 						"add extra headers");
 					free(unfolded);
 					tll_free_and_free(allunfoldeds, free);
 					free(posteraddr);
+					free(postername);
 					fclose(outf);
 					fclose(f);
 					return -1;
@@ -174,11 +183,12 @@ int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 
 	if(!hdrsadded ) {
 		if(hdrfd >= 0) {
-		  if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "") < 0) {
+		  if(process_headers(hdrfd,outf,posteraddr ? posteraddr : "", postername) < 0) {
 				log_error(LOG_ARGS, "Could not "
 					"add extra headers");
 				tll_free_and_free(allunfoldeds, free);
 				free(posteraddr);
+				free(postername);
 				fclose(outf);
 				fclose(f);
 				return -1;
@@ -195,6 +205,7 @@ int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 	        tll_free_and_free(allunfoldeds, free);
 		log_error(LOG_ARGS, "Error writing hdrs.");
 		free(posteraddr);
+		free(postername);
 		fclose(outf);
 		fclose(f);
 		return -1;
@@ -209,6 +220,7 @@ int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 	if(dumpfd2fd(infd, outfd) < 0) {
 		log_error(LOG_ARGS, "Error when dumping rest of mail");
 		free(posteraddr);
+		free(postername);
 		fclose(f);
 		return -1;
 	}
@@ -219,11 +231,13 @@ int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 		if(dumpfd2fd(footfd, outfd) < 0) {
 			log_error(LOG_ARGS, "Error when adding footer");
 			free(posteraddr);
+			free(postername);
 			return -1;
 		}
 
 	fsync(outfd);
 
 	free(posteraddr);
+	free(postername);
 	return 0;
 }
diff --git a/src/dumpfd2fd.c b/src/dumpfd2fd.c
index 674e2b0..431bac2 100644
--- a/src/dumpfd2fd.c
+++ b/src/dumpfd2fd.c
@@ -84,7 +84,7 @@ int dumpfd2fd(int from, int to)
 	return (r);
 }
 
-int process_headers(int infd, FILE *outf, const char *from)
+int process_headers(int infd, FILE *outf, const char *from, const char *name)
 {
 	char *line = NULL, *p, *to_be_subst, *new_line;
 	size_t linecap = 0;
@@ -120,6 +120,18 @@ int process_headers(int infd, FILE *outf, const char *from)
 				return -1;
 			}
 			free(new_line);
+		} else if ((to_be_subst = strstr(p, "$postername$")) != NULL) {
+			*to_be_subst = '\0';
+			to_be_subst += 12;
+			xasprintf(&new_line, "%s%s%s", p, name, to_be_subst);
+			if (fprintf(outf, "%s", new_line) < 0) {
+				log_error(LOG_ARGS, "Could not write headers");
+				free(new_line);
+				free(line);
+				fclose(f);
+				return -1;
+			}
+			free(new_line);
 		} else {
 			if (fprintf(outf, "%s", p) < 0) {
 				log_error(LOG_ARGS, "Could not write headers");
diff --git a/src/find_email_adr.c b/src/find_email_adr.c
index 0830098..77b7cef 100644
--- a/src/find_email_adr.c
+++ b/src/find_email_adr.c
@@ -239,3 +239,55 @@ oncemore:
 
 	return retstruct;
 }
+
+/* ---------------------------------------------------------------------------*\
+ * Extract the display name of the first user,
+ * removing comments, for example:
+ *
+ * for the input string:
+ *	"John (Amazing) Smith" <john.smith@example.com>,
+ *	  "Jane Doe" <jane.doe@example.com
+ *
+ * returns: "John Smith"
+\* ---------------------------------------------------------------------------*/
+char *
+find_display_name (char *name)
+{
+	char *p, *nbuf, c;
+	int nbuf_len, saw_angled_brackets;
+
+	if (!name) return NULL;
+	nbuf = xmalloc(strlen(name));
+	saw_angled_brackets = 0;
+	nbuf_len = 0;
+
+	for (p = name; (c = *p) != '\0' && isspace(c); p++);
+	while ((c = *p++) != '\0') {
+		switch (c) {
+		case '(':
+			p = skip_comment(p);
+			/* -------------------------------*\
+			 * Copy at most one space in place
+			 * of the comment.  Don't copy any
+			 * whitespace if we are still at
+			 * the beginning of the string.
+			 */
+			if (nbuf_len > 0 && isspace(*p) &&
+			    !isspace(nbuf[nbuf_len-1])) {
+				nbuf[nbuf_len++] = *p++;
+			}
+			while(isspace(*p)) p++;
+			/* -------------------------------*/
+			break;
+		case '<': saw_angled_brackets = 1; goto finished;
+		case ',':			   goto finished;
+		default:  nbuf[nbuf_len++] = c;	   break;
+		}
+	}
+
+ finished:
+	if (!saw_angled_brackets || nbuf_len == 0) { free(nbuf); return NULL; }
+	for (p--, p--; (c = *p) && isspace(c); p--, nbuf_len--);
+	nbuf[nbuf_len++] = '\0';
+	return nbuf;
+}
-- 
2.46.4



