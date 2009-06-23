From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Tue, 23 Jun 2009 15:36:12 +0000
Subject: Re: Patch to extend list command
Message-Id: <58397.172.16.32.1.1245771372.squirrel@130.83.185.211>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_20090623173611_38395"
List-Id: <mlmmj.mlmmj.org>
References: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
In-Reply-To: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
To: mlmmj@mlmmj.org

------=_20090623173611_38395
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 8bit

Hej,

On Tue, June 16, 2009 13:06, Morten K. Poulsen wrote:
[...]
>
> Perfect! I have committed it to CVS. Thanks a lot for the patch.

maybe you have already discovered it, I forgot a semicolon in
the patch (in send_list.h).

See the attached revised patch.

Regards and sorry for inconvenience,
Chris
------=_20090623173611_38395
Content-Type: text/x-diff; name="all_subs-send_list-rev3.diff"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="all_subs-send_list-rev3.diff"

--- include/send_list.h.orig    2008-10-30 21:06:00.000000000 +0100
+++ include/send_list.h 2009-06-08 12:51:00.000000000 +0200
@@ -24,6 +24,8 @@
 #ifndef SEND_LIST_H
 #define SEND_LIST_H
 
+void print_subs(int cur_fd, char *dirname);
+
 void send_list(const char *listdir, const char *emailaddr,
               const char *mlmmjsend);
 
--- listtexts/de/listsubs.orig    2009-05-18 13:52:21.000000000 +0200
+++ listtexts/de/listsubs 2009-05-18 13:51:15.000000000 +0200
@@ -7,5 +7,6 @@
 
 verwaltet.
 
-Dies ist die Liste der Abonnenten:
+Dies ist die Liste der Abonnenten, Nomail-Abonnennten, und
+Digest-Abonnenten:
 
--- listtexts/en/listsubs.orig       2009-05-18 13:51:58.000000000 +0200
+++ listtexts/en/listsubs    2009-05-18 13:49:38.000000000 +0200
@@ -4,5 +4,5 @@
 
 $listaddr$
 
-Following is the list of subscribers:
+Following is the list of subscribers, nomailers and digesters:
 
--- src/send_list.c.orig	2008-10-30 21:06:36.000000000 +0100
+++ src/send_list.c	2009-06-08 12:26:15.000000000 +0200
@@ -42,21 +42,55 @@
 #include "prepstdreply.h"
 #include "memory.h"
 
+void print_subs(int cur_fd, char *dirname)
+{
+	char *fileiter;
+	DIR *dirp;
+	struct dirent *dp;
+	int subfd;
+
+
+	dirp = opendir(dirname);
+	if(dirp == NULL) {
+		fprintf(stderr, "Could not opendir(%s);\n", dirname);
+		exit(EXIT_FAILURE);
+	}
+	while((dp = readdir(dirp)) != NULL) {
+		if((strcmp(dp->d_name, "..") == 0) ||
+		   (strcmp(dp->d_name, ".") == 0))
+			continue;
+
+		fileiter = concatstr(2, dirname, dp->d_name);
+		subfd = open(fileiter, O_RDONLY);
+		if(subfd < 0) {
+			log_error(LOG_ARGS, "Could not open %s/%s for reading",
+					dirname, fileiter);
+			myfree(fileiter);
+			continue;
+		}
+		if(dumpfd2fd(subfd, cur_fd) < 0)
+			log_error(LOG_ARGS, "Error dumping subfile content "
+					"to sub list mail in directory "
+					"%s", dirname);
+
+		close(subfd);
+		myfree(fileiter);
+	}
+	closedir(dirp);
+}
+
 void send_list(const char *listdir, const char *emailaddr,
 	       const char *mlmmjsend)
 {
 	char *queuefilename, *listaddr, *listdelim, *listname, *listfqdn;
-	char *fromaddr, *subdir, *fileiter;
-	DIR *dirp;
-	struct dirent *dp;
-	int fd, subfd;
+	char *fromaddr, *subdir, *nomaildir, *digestdir;
+	int fd;
 
 	listaddr = getlistaddr(listdir);
 	listdelim = getlistdelim(listdir);
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
-	subdir = concatstr(2, listdir, "/subscribers.d/");
-
+	
 	fromaddr = concatstr(4, listname, listdelim, "bounces-help@", listfqdn);
 	myfree(listdelim);
 
@@ -78,36 +112,18 @@
 		exit(EXIT_FAILURE);
 	}
 
-	dirp = opendir(subdir);
-	if(dirp == NULL) {
-		fprintf(stderr, "Could not opendir(%s);\n", subdir);
-		exit(EXIT_FAILURE);
-	}
-	while((dp = readdir(dirp)) != NULL) {
-		if((strcmp(dp->d_name, "..") == 0) ||
-		   (strcmp(dp->d_name, ".") == 0))
-			continue;
-
-		fileiter = concatstr(2, subdir, dp->d_name);
-		subfd = open(fileiter, O_RDONLY);
-		if(subfd < 0) {
-			log_error(LOG_ARGS, "Could not open %s for reading",
-					fileiter);
-			myfree(fileiter);
-			continue;
-		}
-		if(dumpfd2fd(subfd, fd) < 0)
-			log_error(LOG_ARGS, "Error dumping subfile content "
-					"to sub list mail");
-
-		close(subfd);
-		myfree(fileiter);
-	}
+	subdir = concatstr(2, listdir, "/subscribers.d/");
+	nomaildir = concatstr(2, listdir, "/nomailsubs.d/");
+	digestdir = concatstr(2, listdir, "/digesters.d/");
 
+	print_subs(fd, subdir);
+	writen(fd, "\n-- \n", 5);
+	print_subs(fd, nomaildir);
+	writen(fd, "\n-- \n", 5);
+	print_subs(fd, digestdir);
 	writen(fd, "\n-- \nend of output\n", 19);
 
 	close(fd);
-	closedir(dirp);
 	
 	myfree(listaddr);
 	myfree(listname);

------=_20090623173611_38395--


