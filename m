From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Mon, 01 Jun 2009 18:50:44 +0000
Subject: Patch to extend list command
Message-Id: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_20090601205044_33475"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

------=_20090601205044_33475
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 8bit

Hej,

I noticed recently that the list command supports only subscribers but
not digesters and nomailers.
So I plugged together a simple patch to support this.
It's fairly straightforward, but I don't have a test system so if
someone might have a look at it and does some tests would be really
nice.

Best regards,
Chris
------=_20090601205044_33475
Content-Type: text/x-diff; name="all_subs-send_list.diff"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="all_subs-send_list.diff"

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
 
--- src/send_list.c.orig	2009-05-18 13:05:07.000000000 +0200
+++ src/send_list.c	2009-05-18 13:15:33.000000000 +0200
@@ -46,7 +46,7 @@
 	       const char *mlmmjsend)
 {
 	char *queuefilename, *listaddr, *listdelim, *listname, *listfqdn;
-	char *fromaddr, *subdir, *fileiter;
+	char *fromaddr, *subdir, *nomaildir, *digestdir, *fileiter;
 	DIR *dirp;
 	struct dirent *dp;
 	int fd, subfd;
@@ -56,6 +56,8 @@
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
 	subdir = concatstr(2, listdir, "/subscribers.d/");
+	nomaildir = concatstr(2, listdir, "/nomailsubs.d/");
+	digestdir = concatstr(2, listdir, "/digesters.d/");
 
 	fromaddr = concatstr(4, listname, listdelim, "bounces-help@", listfqdn);
 	myfree(listdelim);
@@ -78,6 +80,8 @@
 		exit(EXIT_FAILURE);
 	}
 
+
+	/* normal subscriptions*/
 	dirp = opendir(subdir);
 	if(dirp == NULL) {
 		fprintf(stderr, "Could not opendir(%s);\n", subdir);
@@ -104,6 +108,64 @@
 		myfree(fileiter);
 	}
 
+	writen(fd, "\n--\n", 5);
+
+	/* nomail subscriptions */
+	dirp = opendir(nomaildir);
+	if(dirp == NULL) {
+		fprintf(stderr, "Could not opendir(%s);\n", nomaildir);
+		exit(EXIT_FAILURE);
+	}
+	while((dp = readdir(dirp)) != NULL) {
+		if((strcmp(dp->d_name, "..") == 0) ||
+		   (strcmp(dp->d_name, ".") == 0))
+			continue;
+
+		fileiter = concatstr(2, nomaildir, dp->d_name);
+		subfd = open(fileiter, O_RDONLY);
+		if(subfd < 0) {
+			log_error(LOG_ARGS, "Could not open %s for reading",
+					fileiter);
+			myfree(fileiter);
+			continue;
+		}
+		if(dumpfd2fd(subfd, fd) < 0)
+			log_error(LOG_ARGS, "Error dumping nomail-subfile"
+					"content to sub list mail");
+
+		close(subfd);
+		myfree(fileiter);
+	}
+
+	writen(fd, "\n--\n", 5);
+
+	/* digest subscriptions*/
+	dirp = opendir(digestdir);
+	if(dirp == NULL) {
+		fprintf(stderr, "Could not opendir(%s);\n", digestdir);
+		exit(EXIT_FAILURE);
+	}
+	while((dp = readdir(dirp)) != NULL) {
+		if((strcmp(dp->d_name, "..") == 0) ||
+		   (strcmp(dp->d_name, ".") == 0))
+			continue;
+
+		fileiter = concatstr(2, digestdir, dp->d_name);
+		subfd = open(fileiter, O_RDONLY);
+		if(subfd < 0) {
+			log_error(LOG_ARGS, "Could not open %s for reading",
+					fileiter);
+			myfree(fileiter);
+			continue;
+		}
+		if(dumpfd2fd(subfd, fd) < 0)
+			log_error(LOG_ARGS, "Error dumping digest-subfile "
+					"content to sub list mail");
+
+		close(subfd);
+		myfree(fileiter);
+	}
+
 	writen(fd, "\n-- \nend of output\n", 19);
 
 	close(fd);
------=_20090601205044_33475--


