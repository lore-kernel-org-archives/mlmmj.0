From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Thu, 21 Jul 2005 17:27:41 +0000
Subject: Re: [PATCH] Text part in digests
Message-Id: <20050721172741.GA12829@mopo.webdmz.tv2.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mYCpIKhGyMATD0i+"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 23, 2005 at 05:01:30PM +0100, Morten K. Poulsen wrote:
> The patch does not handle any kind of encoding of Subject: and From: headers.
> I will add that soon, but I think that some people (hi Andrea :) would like
> to have this patch now.

So, here it is - the patch with support for any kind of encoding anybody would
ever want :-)

Please test it.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="digest-text-v2.diff"

Index: include/send_digest.h
===================================================================
RCS file: /home/mmj/MMJCVS/mlmmj/include/send_digest.h,v
retrieving revision 1.1
diff -u -r1.1 send_digest.h
--- include/send_digest.h	13 Sep 2004 23:01:31 -0000	1.1
+++ include/send_digest.h	21 Jul 2005 17:24:32 -0000
@@ -25,6 +25,6 @@
 #define SEND_DIGEST_H
 
 int send_digest(const char *listdir, int lastindex, int index,
-		const char *addr, const char *mlmmjsend);
+		int issue, const char *addr, const char *mlmmjsend);
 
 #endif /* SEND_DIGEST_H */
Index: include/unistr.h
===================================================================
RCS file: include/unistr.h
diff -N include/unistr.h
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ include/unistr.h	21 Jul 2005 17:24:32 -0000
@@ -0,0 +1,47 @@
+/* Copyright (C) 2005 Morten K. Poulsen <morten at afdelingp.dk>
+ *
+ * $Id$
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#ifndef UNISTR_H
+#define UNISTR_H
+
+typedef unsigned int unistr_char;
+
+typedef struct _unistr {
+	size_t len;
+	size_t alloc_len;
+	unistr_char *chars;
+} unistr;
+
+unistr *unistr_new(void);
+void unistr_free(unistr *str);
+int unistr_cmp(unistr *str1, unistr *str2);
+unistr *unistr_dup(unistr *str);
+void unistr_append_char(unistr *str, unistr_char uc);
+void unistr_append_usascii(unistr *str, char *binary, size_t bin_len);
+void unistr_append_utf8(unistr *str, char *binary, size_t bin_len);
+void unistr_append_iso88591(unistr *str, char *binary, size_t bin_len);
+void unistr_dump(unistr *str);
+char *unistr_to_utf8(unistr *str);
+char *unistr_header_to_utf8(char *str);
+
+#endif
Index: src/Makefile.am
===================================================================
RCS file: /home/mmj/MMJCVS/mlmmj/src/Makefile.am,v
retrieving revision 1.39
diff -u -r1.39 Makefile.am
--- src/Makefile.am	2 May 2005 17:39:10 -0000	1.39
+++ src/Makefile.am	21 Jul 2005 17:24:32 -0000
@@ -50,7 +50,8 @@
 mlmmj_maintd_SOURCES = mlmmj-maintd.c print-version.c log_error.c mygetline.c \
 		       strgen.c random-int.c chomp.c writen.c memory.c \
 		       ctrlvalue.c send_digest.c getlistaddr.c dumpfd2fd.c \
-		       mylocking.c log_oper.c readn.c
+		       mylocking.c log_oper.c prepstdreply.c statctrl.c \
+		       gethdrline.c readn.c unistr.c
 
 mlmmj_list_SOURCES = mlmmj-list.c strgen.c writen.c print-version.c memory.c \
 		     log_error.c random-int.c readn.c
Index: src/mlmmj-maintd.c
===================================================================
RCS file: /home/mmj/MMJCVS/mlmmj/src/mlmmj-maintd.c,v
retrieving revision 1.55
diff -u -r1.55 mlmmj-maintd.c
--- src/mlmmj-maintd.c	20 Jun 2005 13:23:55 -0000	1.55
+++ src/mlmmj-maintd.c	21 Jul 2005 17:24:32 -0000
@@ -743,12 +743,12 @@
 
 int run_digests(const char *listdir, const char *mlmmjsend)
 {
-	char *lasttimestr, *lastindexstr;
+	char *lasttimestr, *lastindexstr, *lastissuestr;
 	char *digestname, *indexname;
 	char *digestintervalstr, *digestmaxmailsstr;
 	char *s1, *s2, *s3;
 	time_t digestinterval, t, lasttime;
-	long digestmaxmails, lastindex, index;
+	long digestmaxmails, lastindex, index, lastissue;
 	int fd, indexfd, lock;
 	size_t lenbuf, lenstr;
 	
@@ -786,9 +786,15 @@
 
 	s1 = mygetline(fd);
 
-	/* Syntax is lastindex:lasttime */
+	/* Syntax is lastindex:lasttime or lastindex:lasttime:lastissue */
 	if (s1 && (lasttimestr = strchr(s1, ':'))) {
 		*(lasttimestr++) = '\0';
+		if ((lastissuestr = strchr(lasttimestr, ':'))) {
+			*(lastissuestr++) = '\0';
+			lastissue = atol(lastissuestr);
+		} else {
+			lastissue = 0;
+		}
 		lasttime = atol(lasttimestr);
 		lastindexstr = s1;
 		lastindex = atol(lastindexstr);
@@ -804,6 +810,7 @@
 		/* If lastdigest is empty, we start from scratch */
 		lasttime = 0;
 		lastindex = 0;
+		lastissue = 0;
 	}
 	
 	indexname = concatstr(2, listdir, "/index");
@@ -837,15 +844,18 @@
 		if (index > lastindex+digestmaxmails)
 			index = lastindex+digestmaxmails;
 
-		send_digest(listdir, lastindex+1, index, NULL, mlmmjsend);
+		if (index > lastindex) {
+			lastissue++;
+			send_digest(listdir, lastindex+1, index, lastissue, NULL, mlmmjsend);
+		}
 
 		if (lseek(fd, 0, SEEK_SET) < 0) {
 			log_error(LOG_ARGS, "Could not seek '%s'", digestname);
 		} else {
-			/* index + ':' + time + '\n' + '\0' */
-			lenbuf = 20 + 1 + 20 + 2;
+			/* index + ':' + time + ':' + issue + '\n' + '\0' */
+			lenbuf = 20 + 1 + 20 + 1 + 20 + 2;
 			s3 = mymalloc(lenbuf);
-			lenstr = snprintf(s3, lenbuf, "%ld:%ld\n", index, (long)t);
+			lenstr = snprintf(s3, lenbuf, "%ld:%ld:%ld\n", index, (long)t, lastissue);
 			if (lenstr >= lenbuf)
 				lenstr = lenbuf - 1;
 			if (writen(fd, s3, lenstr) == -1) {
Index: src/send_digest.c
===================================================================
RCS file: /home/mmj/MMJCVS/mlmmj/src/send_digest.c,v
retrieving revision 1.8
diff -u -r1.8 send_digest.c
--- src/send_digest.c	19 Jan 2005 19:22:14 -0000	1.8
+++ src/send_digest.c	21 Jul 2005 17:24:32 -0000
@@ -1,4 +1,4 @@
-/* Copyright (C) 2004 Morten K. Poulsen <morten at afdelingp.dk>
+/* Copyright (C) 2004, 2005 Morten K. Poulsen <morten at afdelingp.dk>
  *
  * $Id: send_digest.c,v 1.8 2005/01/19 19:22:14 mmj Exp $
  *
@@ -29,6 +29,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/wait.h>
+#include <ctype.h>
 
 #include "mlmmj.h"
 #include "send_digest.h"
@@ -37,15 +38,149 @@
 #include "memory.h"
 #include "getlistaddr.h"
 #include "wrappers.h"
+#include "prepstdreply.h"
+#include "mygetline.h"
+#include "gethdrline.h"
+#include "statctrl.h"
+#include "unistr.h"
+
+struct mail {
+	int idx;
+	char *from;
+};
+
+struct thread {
+	char *subject;
+	int num_mails;
+	struct mail *mails;
+};
 
 
+static char *subject_list(const char *listdir, int firstindex, int lastindex)
+{
+	int i, j, archivefd, thread_idx;
+	char *ret, *line, *tmp, *subj, *from;
+	char *archivename;
+	int num_threads = 0;
+	struct thread *threads = NULL;
+	char buf[45];
+
+	for (i=firstindex; i<=lastindex; i++) {
+
+		snprintf(buf, sizeof(buf), "%d", i);
+
+		archivename = concatstr(3, listdir, "/archive/", buf);
+		archivefd = open(archivename, O_RDONLY);
+		myfree(archivename);
+		
+		if (archivefd < 0)
+			continue;
+
+		subj = NULL;
+		from = NULL;
+
+		while ((line = gethdrline(archivefd))) {
+			if (strcmp(line, "\n") == 0) {
+				myfree(line);
+				break;
+			}
+			if (strncasecmp(line, "Subject: ", 9) == 0) {
+				myfree(subj);
+				subj = unistr_header_to_utf8(line + 9);
+			}
+			if (strncasecmp(line, "From: ", 6) == 0) {
+				myfree(from);
+				from = unistr_header_to_utf8(line + 6);
+			}
+			myfree(line);
+		}
+
+		if (!subj) {
+			subj = mystrdup("no subject");
+		}
+
+		if (!from) {
+			from = mystrdup("anonymous");
+		}
+
+		tmp = subj;
+		for (;;) {
+			if (isspace(*tmp)) {
+				tmp++;
+				continue;
+			}
+			if (strncasecmp(tmp, "Re:", 3) == 0) {
+				tmp += 3;
+				continue;
+			}
+			break;
+		}
+		/* tmp is now the clean subject */
+		
+		thread_idx = -1;
+		for (j=0; j<num_threads; j++) {
+			if (strcmp(subj, threads[j].subject) == 0) {
+				thread_idx = j;
+				break;
+			}
+		}
+		if (thread_idx == -1) {
+			num_threads++;
+			threads = myrealloc(threads,
+					num_threads*sizeof(struct thread));
+			threads[num_threads-1].subject = mystrdup(tmp);
+			threads[num_threads-1].num_mails = 0;
+			threads[num_threads-1].mails = NULL;
+			thread_idx = num_threads-1;
+		}
+	
+		threads[thread_idx].num_mails++;
+		threads[thread_idx].mails = myrealloc(threads[thread_idx].mails,
+				threads[thread_idx].num_mails*sizeof(struct mail));
+		threads[thread_idx].mails[threads[thread_idx].num_mails-1].idx = i;
+		threads[thread_idx].mails[threads[thread_idx].num_mails-1].from =
+				concatstr(5, "      ", buf, " - ", from, "\n");
+
+		myfree(subj);
+		myfree(from);
+
+		close(archivefd);
+	}
+
+	ret = mystrdup("");
+
+	for (i=0; i<num_threads; i++) {
+		
+		tmp = concatstr(3, ret, threads[i].subject, "\n");
+		myfree(ret);
+		ret = tmp;
+		myfree(threads[i].subject);
+		
+		for (j=0; j<threads[i].num_mails; j++) {
+			tmp = concatstr(2, ret, threads[i].mails[j].from);
+			myfree(ret);
+			ret = tmp;
+			myfree(threads[i].mails[j].from);
+		}
+		myfree(threads[i].mails);
+		
+		tmp = concatstr(2, ret, "\n");
+		myfree(ret);
+		ret = tmp;
+	}
+	myfree(threads);
+
+	return ret;
+}
+
 int send_digest(const char *listdir, int firstindex, int lastindex,
-		const char *addr, const char *mlmmjsend)
+		int issue, const char *addr, const char *mlmmjsend)
 {
-	int i, fd, archivefd, status, hdrfd;
+	int i, fd, archivefd, status, hdrfd, txtfd;
 	char buf[45];
-	char *tmp, *queuename = NULL, *archivename, *fromstr;
+	char *tmp, *queuename = NULL, *archivename, *fromstr, *subject, *line;
 	char *boundary, *listaddr, *listname, *listfqdn;
+	char *subst_data[10];
 	pid_t childpid, pid;
 
 	if (addr) {
@@ -82,19 +217,51 @@
 	listaddr = getlistaddr(listdir);
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
-	myfree(listaddr);
+
+	tmp = concatstr(2, listdir, "/text/digest");
+	txtfd = open(tmp, O_RDONLY);
+	myfree(tmp);
+	if (txtfd < 0) {
+		log_error(LOG_ARGS, "Notice: Could not open std mail digest");
+	}
 	
+	subst_data[0] = "digestfirst";
+	snprintf(buf, sizeof(buf), "%d", firstindex);
+	subst_data[1] = mystrdup(buf);
+
+	subst_data[2] = "digestlast";
+	snprintf(buf, sizeof(buf), "%d", lastindex);
+	subst_data[3] = mystrdup(buf);
+
+	subst_data[4] = "digestinterval";
 	if (lastindex == firstindex) {
-		snprintf(buf, sizeof(buf), " (%d)", firstindex);
+		snprintf(buf, sizeof(buf), "%d", firstindex);
 	} else {
-		snprintf(buf, sizeof(buf), " (%d-%d)", firstindex, lastindex);
+		snprintf(buf, sizeof(buf), "%d-%d", firstindex, lastindex);
+	}
+	subst_data[5] = mystrdup(buf);
+
+	subst_data[6] = "digestissue";
+	snprintf(buf, sizeof(buf), "%d", issue);
+	subst_data[7] = mystrdup(buf);
+
+	subst_data[8] = "digestsubjects";
+	subst_data[9] = subject_list(listdir, firstindex, lastindex);
+
+	if ((txtfd > 0) && (line = mygetline(txtfd)) &&
+			(strncasecmp(line, "Subject: ", 9) == 0)) {
+		subject = substitute(line + 9, listaddr, 5, subst_data);
+	} else {
+		subject = substitute("Digest of $listaddr$ issue $digestissue$ ($digestinterval$)\n",
+							 listaddr, 5, subst_data);
 	}
 
 	fromstr = concatstr(5, "From: ", listname, "+help@", listfqdn, "\n");
-	tmp = concatstr(6, "MIME-Version: 1.0"
+	tmp = concatstr(5, "MIME-Version: 1.0"
 			    "\nContent-Type: multipart/" DIGESTMIMETYPE "; "
 			    "boundary=", boundary,
-			    "\nSubject: Digest of ", listname, buf, "\n\n");
+			    "\nSubject: ", subject,  /* subject includes a newline */
+				"\n");
 	myfree(listfqdn);
 
 	if (writen(fd, fromstr, strlen(fromstr)) < -1)
@@ -117,11 +284,84 @@
 		myfree(fromstr);
 		myfree(tmp);
 		myfree(queuename);
+		myfree(listaddr);
 		myfree(listname);
+		myfree(subst_data[1]);
+		myfree(subst_data[3]);
+		myfree(subst_data[5]);
+		myfree(subst_data[7]);
+		myfree(subst_data[9]);
+		myfree(subject);
+		if (txtfd > 0) {
+			close(txtfd);
+			myfree(line);
+		}
 		return -1;
 	}
 	myfree(tmp);
 	myfree(fromstr);
+	myfree(subject);
+
+	if ((txtfd > 0) && !statctrl(listdir, "nodigesttext")) {
+
+		tmp = concatstr(3, "--", boundary,
+				"\nContent-Type: text/plain; charset=UTF-8"
+				"\n\n");
+		if (writen(fd, tmp, strlen(tmp)) == -1) {
+			log_error(LOG_ARGS, "Could not write digest text/plain "
+					"part headers "
+					"'%s'", queuename);
+			close(fd);
+			unlink(queuename);
+			myfree(boundary);
+			myfree(tmp);
+			myfree(queuename);
+			myfree(listaddr);
+			myfree(listname);
+			myfree(subst_data[1]);
+			myfree(subst_data[3]);
+			myfree(subst_data[5]);
+			myfree(subst_data[7]);
+			myfree(subst_data[9]);
+			if (txtfd > 0) {
+				close(txtfd);
+				myfree(line);
+			}
+			return -1;
+		}
+		myfree(tmp);
+
+		if (line && (strncasecmp(line, "Subject: ", 9) == 0)) {
+			myfree(line);
+			line = mygetline(txtfd);
+			if (line && (strcmp(line, "\n") == 0)) {
+				/* skip empty line after Subject: */
+				line[0] = '\0';
+			}
+		}
+
+		if (line) {
+			do {
+				tmp = substitute(line, listaddr, 5, subst_data);
+				myfree(line);
+				if(writen(fd, tmp, strlen(tmp)) < 0) {
+					myfree(tmp);
+					log_error(LOG_ARGS, "Could not write std mail");
+					break;
+				}
+				myfree(tmp);
+			} while ((line = mygetline(txtfd)));
+		}
+		
+		close(txtfd);
+	}
+
+	myfree(listaddr);
+	myfree(subst_data[1]);
+	myfree(subst_data[3]);
+	myfree(subst_data[5]);
+	myfree(subst_data[7]);
+	myfree(subst_data[9]);
 
 	for (i=firstindex; i<=lastindex; i++) {
 		snprintf(buf, sizeof(buf), "%d", i);
Index: src/unistr.c
===================================================================
RCS file: src/unistr.c
diff -N src/unistr.c
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ src/unistr.c	21 Jul 2005 17:24:32 -0000
@@ -0,0 +1,455 @@
+/* Copyright (C) 2005 Morten K. Poulsen <morten at afdelingp.dk>
+ *
+ * $Id$
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include <unistd.h>
+#include <string.h>
+#include <stdio.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/wait.h>
+#include <ctype.h>
+
+#include "mlmmj.h"
+#include "unistr.h"
+#include "log_error.h"
+#include "memory.h"
+
+
+unistr *unistr_new(void)
+{
+	unistr *ret;
+
+	ret = mymalloc(sizeof(unistr));
+	ret->len = 0;
+	ret->alloc_len = 64;
+	ret->chars = mymalloc(ret->alloc_len * sizeof(unistr_char));
+
+	return ret;
+}
+
+
+void unistr_free(unistr *str)
+{
+	if (!str)
+		return;
+	myfree(str->chars);
+	myfree(str);
+}
+
+
+int unistr_cmp(unistr *str1, unistr *str2)
+{
+	unsigned int i;
+
+	for (i=0; i<str1->len; i++) {
+		if (str1->chars[i] < str2->chars[i]) {
+			return -1;
+		} else if (str1->chars[i] > str2->chars[i]) {
+			return 1;
+		}
+	}
+	if (str2->len > str1->len) {
+		return 1;
+	}
+	return 0;
+}
+
+
+unistr *unistr_dup(unistr *str)
+{
+	unistr *ret;
+	unsigned int i;
+
+	ret = unistr_new();
+	for (i=0; i<str->len; i++) {
+		unistr_append_char(ret, str->chars[i]);
+	}
+
+	return ret;
+}
+
+
+void unistr_append_char(unistr *str, unistr_char uc)
+{
+	if (str->len >= str->alloc_len) {
+		str->alloc_len *= 2;
+		str->chars = myrealloc(str->chars, str->alloc_len * sizeof(unistr_char));
+	}
+	str->chars[str->len++] = uc;
+}
+
+
+void unistr_append_usascii(unistr *str, char *binary, size_t bin_len)
+{
+	unsigned int i;
+
+	for (i=0; i<bin_len; i++) {
+		if ((unsigned char)binary[i] > 0x7F) {
+			unistr_append_char(str, '?');
+		} else {
+			unistr_append_char(str, (unsigned char)binary[i]);
+		}
+	}
+}
+
+
+void unistr_append_utf8(unistr *str, char *binary, size_t bin_len)
+{
+	unsigned int i, j;
+	unistr_char ch;
+	unsigned char *bin = (unsigned char *)binary;
+
+	for (i=0; i<bin_len; i++) {
+		if (bin[i] <= 0x7F) {  /* 1 */
+			unistr_append_char(str, bin[i]);
+		} else {
+			if ((bin[i] & 224) == 192) {  /* 2 */
+				ch = bin[i] & 31;
+				j = 1;
+			} else if ((bin[i] & 240) == 224) {  /* 3 */
+				ch = bin[i] & 15;
+				j = 2;
+			} else if ((bin[i] & 248) == 240) {  /* 4 */
+				ch = bin[i] & 7;
+				j = 3;
+			} else if ((bin[i] & 252) == 248) {  /* 5 */
+				ch = bin[i] & 3;
+				j = 4;
+			} else if ((bin[i] & 254) == 252) {  /* 6 */
+				ch = bin[i] & 1;
+				j = 5;
+			} else {
+				/* invalid byte sequence */
+				unistr_append_char(str, '?');
+				continue;
+			}
+			if (ch == 0) {
+				/* invalid encoding, no data bits set in first byte */
+				unistr_append_char(str, '?');
+				continue;
+			}
+			for (;j>0; j--) {
+				i++;
+				ch <<= 6;
+				if ((bin[i] & 192) != 128) {
+					/* invalid byte sequence */
+					ch = '?';
+					break;
+				}
+				ch |= bin[i] & 63;
+			}
+			unistr_append_char(str, ch);
+		}
+	}
+}
+
+
+void unistr_append_iso88591(unistr *str, char *binary, size_t bin_len)
+{
+	unsigned int i;
+
+	for (i=0; i<bin_len; i++) {
+		if (binary[i] == 0x00) {
+			unistr_append_char(str, '?');
+		} else {
+			unistr_append_char(str, (unsigned char)binary[i]);
+		}
+	}
+}
+
+
+void unistr_dump(unistr *str)
+{
+	unsigned int i;
+
+	printf("unistr_dump(%p)\n", (void *)str);
+	printf(" ->len = %d\n", str->len);
+	printf(" ->alloc_len = %d\n", str->alloc_len);
+	printf(" ->chars [ ");
+	for (i=0; i<str->len; i++) {
+		if ((str->chars[i] <= 0x7F) && (str->chars[i] != '\n')) {
+			printf("'%c' ", str->chars[i]);
+		} else {
+			printf("0x%02X ", str->chars[i]);
+		}
+	}
+	printf("]\n");
+}
+
+
+char *unistr_to_utf8(unistr *str)
+{
+	unsigned int i;
+	size_t len = 0;
+	char *ret;
+	char *p;
+
+	for (i=0; i<str->len; i++) {
+		if (str->chars[i] <= 0x7F) {
+			len++;
+		} else if (str->chars[i] <= 0x7FF) {
+			len += 2;
+		} else if (str->chars[i] <= 0xFFFF) {
+			len += 3;
+		} else if (str->chars[i] <= 0x1FFFFF) {
+			len += 4;
+		} else if (str->chars[i] <= 0x3FFFFFF) {
+			len += 5;
+		} else if (str->chars[i] <= 0x7FFFFFFF) {
+			len += 6;
+		} else {
+			errno = 0;
+			log_error(LOG_ARGS, "unistr_to_utf8(): can not utf-8 encode"
+					"U+%04X", str->chars[i]);
+			return mystrdup("");
+		}
+	}
+	len++;  /* NUL */
+
+	ret = mymalloc(len);
+	p = ret;
+
+	for (i=0; i<str->len; i++) {
+		if (str->chars[i] <= 0x7F) {  /* 1 */
+			*(p++) = str->chars[i];
+		} else if (str->chars[i] <= 0x7FF) {  /* 2 */
+			*(p++) = 192 + ((str->chars[i] & 1984) >> 6);
+			*(p++) = 128 + (str->chars[i] & 63);
+		} else if (str->chars[i] <= 0xFFFF) {  /* 3 */
+			*(p++) = 224 + ((str->chars[i] & 61440) >> 12);
+			*(p++) = 128 + ((str->chars[i] & 4032) >> 6);
+			*(p++) = 128 + (str->chars[i] & 63);
+		} else if (str->chars[i] <= 0x1FFFFF) {  /* 4 */
+			*(p++) = 240 + ((str->chars[i] & 1835008) >> 18);
+			*(p++) = 128 + ((str->chars[i] & 258048) >> 12);
+			*(p++) = 128 + ((str->chars[i] & 4032) >> 6);
+			*(p++) = 128 + (str->chars[i] & 63);
+		} else if (str->chars[i] <= 0x3FFFFFF) {  /* 5 */
+			*(p++) = 248 + ((str->chars[i] & 50331648) >> 24);
+			*(p++) = 128 + ((str->chars[i] & 16515072) >> 18);
+			*(p++) = 128 + ((str->chars[i] & 258048) >> 12);
+			*(p++) = 128 + ((str->chars[i] & 4032) >> 6);
+			*(p++) = 128 + (str->chars[i] & 63);
+		} else if (str->chars[i] <= 0x7FFFFFFF) {  /* 6 */
+			*(p++) = 252 + ((str->chars[i] & 1073741824) >> 30);
+			*(p++) = 128 + ((str->chars[i] & 1056964608) >> 24);
+			*(p++) = 128 + ((str->chars[i] & 16515072) >> 18);
+			*(p++) = 128 + ((str->chars[i] & 258048) >> 12);
+			*(p++) = 128 + ((str->chars[i] & 4032) >> 6);
+			*(p++) = 128 + (str->chars[i] & 63);
+		} else {
+			errno = 0;
+			log_error(LOG_ARGS, "unistr_to_utf8(): can not utf-8 encode"
+					"U+%04X", str->chars[i]);
+		}
+	}
+	*(p++) = '\0';
+
+	return ret;
+}
+
+
+static int hexval(char ch)
+{
+	ch = tolower(ch);
+
+	if ((ch >= 'a') && (ch <= 'f')) {
+		return 10 + ch - 'a';
+	}
+
+	if ((ch >= '0') && (ch <= '9')) {
+		return ch - '0';
+	}
+
+	return 0;
+}
+
+
+static void decode_qp(char *str, char **binary, size_t *bin_len)
+{
+	int i;
+
+	/* decoded string will never be longer, and we don't include a NUL */
+	*binary = mymalloc(strlen(str));
+	*bin_len = 0;
+
+	for (i=0; str[i]; i++) {
+		if ((str[i] == '=') && isxdigit(str[i+1]) && isxdigit(str[i+2])) {
+			(*binary)[(*bin_len)++] = (hexval(str[i+1]) << 4) + hexval(str[i+2]);
+			i += 2;
+		} else if (str[i] == '_') {
+			(*binary)[(*bin_len)++] = 0x20;
+		} else {
+			(*binary)[(*bin_len)++] = str[i];
+		}
+	}
+}
+
+
+static void decode_base64(char *str, char **binary, size_t *bin_len)
+{
+	int tab[] = {
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
+		52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
+		-1,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
+		15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
+		-1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
+		41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
+	};
+	size_t len;
+	unsigned int i;
+	unsigned int out;
+	int out_numbits;
+	int val;
+
+	/* decoded string will never be longer, and we don't include a NUL */
+	len = strlen(str);
+	*binary = mymalloc(len);
+	*bin_len = 0;
+
+	out = 0;
+	out_numbits = 0;
+	for (i=0; i<strlen(str); i++) {
+		val = tab[(unsigned char)str[i]];
+		if (val == -1)
+			continue;
+		out <<= 6;
+		out |= val;
+		out_numbits += 6;
+		if (out_numbits >= 8) {
+			(*binary)[(*bin_len)++] = (out >> (out_numbits - 8)) & 255;
+			out_numbits -= 8;
+		}
+	}
+}
+
+
+static void header_decode_word(char *word, unistr *ret)
+{
+	char *my_word;
+	char *charset, *encoding, *string, *end;
+	char *binary;
+	size_t bin_len;
+
+	my_word = mystrdup(word);
+
+	if ((my_word[0] == '=') && (my_word[1] == '?')) {
+
+		charset = my_word + 2;
+
+		if ((encoding = strchr(charset, '?')) == NULL) {
+			/* missing encoding */
+			unistr_append_usascii(ret, "???", 3);
+			return;
+		}
+		*(encoding++) = '\0';
+
+		if ((string = strchr(encoding, '?')) == NULL) {
+			/* missing string */
+			unistr_append_usascii(ret, "???", 3);
+			return;
+		}
+		*(string++) = '\0';
+
+		if ((end = strchr(string, '?')) == NULL) {
+			/* missing end */
+			unistr_append_usascii(ret, "???", 3);
+			return;
+		}
+		*(end++) = '\0';
+		if ((end[0] != '=') || (end[1] != '\0')) {
+			/* broken end */
+			unistr_append_usascii(ret, "???", 3);
+			return;
+		}
+
+		if (tolower(encoding[0]) == 'q') {
+			decode_qp(string, &binary, &bin_len);
+		} else if (tolower(encoding[0]) == 'b') {
+			decode_base64(string, &binary, &bin_len);
+		} else {
+			/* unknown encoding */
+			unistr_append_usascii(ret, "???", 3);
+			return;
+		}
+
+	} else {
+		charset = mystrdup("us-ascii");
+		binary = my_word;
+		bin_len = strlen(my_word);
+	}
+
+	if (strcasecmp(charset, "us-ascii") == 0) {
+		unistr_append_usascii(ret, binary, bin_len);
+	} else if (strcasecmp(charset, "utf-8") == 0) {
+		unistr_append_utf8(ret, binary, bin_len);
+	} else if (strcasecmp(charset, "iso-8859-1") == 0) {
+		unistr_append_iso88591(ret, binary, bin_len);
+	} else {
+		/* unknown charset */
+		unistr_append_usascii(ret, "???", 3);
+	}
+}
+
+
+/* IN: "=?iso-8859-1?Q?hyggem=F8de?= torsdag"
+ * OUT: "hyggem\xC3\xB8de torsdag"
+ */
+char *unistr_header_to_utf8(char *str)
+{
+	char *my_str;
+	char *word;
+	char *p;
+	unistr *us;
+	char *ret;
+
+	my_str = mystrdup(str);
+	us = unistr_new();
+
+	word = strtok_r(my_str, " \t\n", &p);
+	while (word) {
+		header_decode_word(word, us);
+		word = strtok_r(NULL, " \t\n", &p);
+		if (word)
+			unistr_append_char(us, ' ');
+	}
+
+	myfree(my_str);
+
+	ret = unistr_to_utf8(us);
+	myfree(us);
+
+	return ret;
+}

--mYCpIKhGyMATD0i+--
