From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Wed, 23 Mar 2005 16:01:30 +0000
Subject: [PATCH] Text part in digests
Message-Id: <20050323160130.GA16328@mopo.webdmz.tv2.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Attached is a patch which adds support for a text/plain part in digest mails.

If the listtext "digest" exists, the digest function will try to get a subject
from it.

If the option "nodigesttext" is not set, and the listtext "digest" exists, the
digest function vi add a text/plain part at the beginning of the digest mail.

There is a few extra keywords which will be substituded:
- $digestfirst$ the archive index of the first mail (eg. "234")
- $digestlast$ the archive index of the last mail (eg. "245")
- $digestinterval$ the archive index interval (eg. "234-245" or "255")
- $digestissue$ the issue number (increments at each digest)
- $digestsubjects$ a ezmlmish thread list

The issue number is stored in the lastdigest file. If you don't want it to
begin at 1, append ":882" to the first line, where 822 is the number ONE BELOW
the next issue number.

The patch does not handle any kind of encoding of Subject: and From: headers. I
will add that soon, but I think that some people (hi Andrea :) would like to
have this patch now.

It would be nice if someone would translate the listtexts/digest file.

Also, I would be grateful if someone could try it out before I commit it. I
have tested it and I think it is stable, and it doesn't leak any memory, AFIK.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="digest-text.diff"

--- mlmmj/include/send_digest.h	13 Sep 2004 23:01:31 -0000	1.1
+++ mlmmj/include/send_digest.h	23 Mar 2005 15:16:21 -0000
@@ -25,6 +25,6 @@
 #define SEND_DIGEST_H
 
 int send_digest(const char *listdir, int lastindex, int index,
-		const char *addr, const char *mlmmjsend);
+		int issue, const char *addr, const char *mlmmjsend);
 
 #endif /* SEND_DIGEST_H */
--- mlmmj/src/Makefile.am	3 Feb 2005 14:53:15 -0000	1.37
+++ mlmmj/src/Makefile.am	23 Mar 2005 15:16:21 -0000
@@ -49,7 +49,8 @@
 mlmmj_maintd_SOURCES = mlmmj-maintd.c print-version.c log_error.c mygetline.c \
 		       strgen.c random-int.c chomp.c writen.c memory.c \
 		       ctrlvalue.c send_digest.c getlistaddr.c dumpfd2fd.c \
-		       mylocking.c log_oper.c
+		       mylocking.c log_oper.c prepstdreply.c statctrl.c \
+		       gethdrline.c
 
 mlmmj_list_SOURCES = mlmmj-list.c strgen.c writen.c print-version.c memory.c \
 		     log_error.c random-int.c
--- mlmmj/src/mlmmj-maintd.c	14 Feb 2005 09:32:02 -0000	1.51
+++ mlmmj/src/mlmmj-maintd.c	23 Mar 2005 15:16:21 -0000
@@ -724,12 +724,12 @@
 
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
 	
@@ -767,9 +767,15 @@
 
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
@@ -785,6 +791,7 @@
 		/* If lastdigest is empty, we start from scratch */
 		lasttime = 0;
 		lastindex = 0;
+		lastissue = 0;
 	}
 	
 	indexname = concatstr(2, listdir, "/index");
@@ -818,15 +825,18 @@
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
--- mlmmj/src/send_digest.c	19 Jan 2005 19:22:14 -0000	1.8
+++ mlmmj/src/send_digest.c	23 Mar 2005 15:16:21 -0000
@@ -29,6 +29,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/wait.h>
+#include <ctype.h>
 
 #include "mlmmj.h"
 #include "send_digest.h"
@@ -37,15 +38,142 @@
 #include "memory.h"
 #include "getlistaddr.h"
 #include "wrappers.h"
+#include "prepstdreply.h"
+#include "mygetline.h"
+#include "gethdrline.h"
+#include "statctrl.h"
+
+struct subject {
+	char *str;
+	int num_mails;
+	char **mails;
+};
 
+/* TODO this should decode subject and from address */
+static char *subject_list(const char *listdir, int firstindex, int lastindex)
+{
+	int i, j, archivefd, subj_idx;
+	char *ret, *line, *tmp, *subj, *from;
+	char *archivename;
+	int num_subjects = 0;
+	struct subject *subjects = NULL;
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
+				subj = mystrdup(line + 9);
+			}
+			if (strncasecmp(line, "From: ", 6) == 0) {
+				myfree(from);
+				from = mystrdup(line + 6);
+			}
+			myfree(line);
+		}
+
+		if (!subj) {
+			subj = mystrdup("no subject\n");
+		}
+
+		if (!from) {
+			from = mystrdup("anonymous\n");
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
+		subj_idx = -1;
+		for (j=0; j<num_subjects; j++) {
+			if (strcasecmp(tmp, subjects[j].str) == 0) {
+				subj_idx = j;
+				break;
+			}
+		}
+		if (subj_idx == -1) {
+			num_subjects++;
+			subjects = myrealloc(subjects,
+					num_subjects*sizeof(struct subject));
+			subjects[num_subjects-1].str = mystrdup(tmp);
+			subjects[num_subjects-1].num_mails = 0;
+			subjects[num_subjects-1].mails = NULL;
+			subj_idx = num_subjects-1;
+		}
+	
+		subjects[subj_idx].num_mails++;
+		subjects[subj_idx].mails = myrealloc(subjects[subj_idx].mails,
+				subjects[subj_idx].num_mails*sizeof(char *));
+		subjects[subj_idx].mails[subjects[subj_idx].num_mails-1] =
+				concatstr(4, "      ", buf, " - ", from);
+
+		myfree(subj);
+		myfree(from);
+
+		close(archivefd);
+	}
+
+	ret = mystrdup("");
+
+	for (i=0; i<num_subjects; i++) {
+		
+		tmp = concatstr(2, ret, subjects[i].str);
+		myfree(ret);
+		ret = tmp;
+		myfree(subjects[i].str);
+		
+		for (j=0; j<subjects[i].num_mails; j++) {
+			tmp = concatstr(2, ret, subjects[i].mails[j]);
+			myfree(ret);
+			ret = tmp;
+			myfree(subjects[i].mails[j]);
+		}
+		myfree(subjects[i].mails);
+		
+		tmp = concatstr(2, ret, "\n");
+		myfree(ret);
+		ret = tmp;
+	}
+	myfree(subjects);
+
+	return ret;
+}
 
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
@@ -82,19 +210,51 @@
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
@@ -117,11 +277,84 @@
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

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=digest

Subject: Digest of $listaddr$ issue $digestissue$ ($digestinterval$)

Topics (messages $digestfirst$ throught $digestlast$):

$digestsubjects$

--UugvWAfsgieZRqgk--
