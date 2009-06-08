From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Mon, 08 Jun 2009 11:12:47 +0000
Subject: Re: Patch to extend list command
Message-Id: <59407.172.16.32.1.1244459567.squirrel@130.83.185.211>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_20090608131247_37891"
List-Id: <mlmmj.mlmmj.org>
References: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
In-Reply-To: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
To: mlmmj@mlmmj.org

------=_20090608131247_37891
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 8bit

On Sun, June 7, 2009 14:37, Morten K. Poulsen wrote:
> Hi Chris,
>
> On Mon, 2009-06-01 at 20:50 +0200, Christoph Wilke wrote:
[...]
>
>> So I plugged together a simple patch to support this.
>> It's fairly straightforward, but I don't have a test system so if
>> someone might have a look at it and does some tests would be really
>> nice.
>
> It looks clean, but would you mind moving the code to a function, so we
> don't have three copies of the same code?

The loop is now in the function print_subs(), as you sugested.
This time I made tests by running mlmmj-process with an appropriate
mail file, a test list and the "-P" switch. The resulting queue file
looked fine.

Best regards,
Christoph Wilke
------=_20090608131247_37891
Content-Type: text/x-diff; name="all_subs-send_list_part-rev2.diff"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
      filename="all_subs-send_list_part-rev2.diff"

--- send_list.c.orig	2008-10-30 21:06:36.000000000 +0100
+++ send_list.c	2009-06-08 12:26:15.000000000 +0200
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
------=_20090608131247_37891--


