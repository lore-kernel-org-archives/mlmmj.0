From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:28 +0000
Subject: [mlmmj] [PATCH 10 of 10] Only match -probe if it appears at the end of a
Message-Id: <68463173a63f8b7b481d.1296169168@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295999110 0
# Node ID 68463173a63f8b7b481d86d78f9a7b17e75514f5
# Parent  35246cb7b5f2f74c07f863fef859b08836d29bb6
Only match -probe if it appears at the end of a filename

diff -r 35246cb7b5f2 -r 68463173a63f src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Tue Jan 25 19:22:27 2011 +0000
+++ b/src/mlmmj-maintd.c	Tue Jan 25 23:45:10 2011 +0000
@@ -543,7 +543,8 @@
 
 		filename = mystrdup(dp->d_name);
 
-		if((s = strstr(filename, "-probe"))) {
+		s = strrchr(filename, '-');
+		if(s && (strcmp(s, "-probe") = 0)) {
 			if(stat(filename, &st) < 0) {
 				log_error(LOG_ARGS, "Could not stat(%s)",
 					  filename);
@@ -612,7 +613,8 @@
 		   (strcmp(dp->d_name, ".") = 0))
 				continue;
 
-		if(strstr(dp->d_name, "-probe"))
+		s = strrchr(dp->d_name, '-');
+		if(s && (strcmp(s, "-probe") = 0))
 			continue;
 
 		s = strrchr(dp->d_name, '.');
@@ -699,7 +701,8 @@
 		   (strcmp(dp->d_name, ".") = 0))
 				continue;
 
-		if(strstr(dp->d_name, "-probe"))
+		a = strrchr(dp->d_name, '-');
+		if(a && (strcmp(a, "-probe") = 0))
 			continue;
 
 		a = strrchr(dp->d_name, '.');

