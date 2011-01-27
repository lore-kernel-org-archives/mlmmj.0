From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:22 +0000
Subject: [mlmmj] [PATCH 04 of 10] Only stat files after discounting ignored filenames
Message-Id: <a3c801ea8a7a2f32d9c7.1296169162@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295973325 0
# Node ID a3c801ea8a7a2f32d9c7dcccd167de27ddb8e697
# Parent  e2c655527310ac0b26ff151d31ebef51178e2a20
Only stat files after discounting ignored filenames.
This eliminates confusing log messages similar to

mlmmj-maintd.c:511: Could not stat(auser=example.com.lastmsg): No such file or directory

These occur when bouncing users are unsubscribed because the .lastmsg files
are checked after the auser=example.com files with no extensions.

diff -r e2c655527310 -r a3c801ea8a7a src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Tue Jan 25 16:18:50 2011 +0000
+++ b/src/mlmmj-maintd.c	Tue Jan 25 16:35:25 2011 +0000
@@ -538,14 +538,16 @@
 		   (strcmp(dp->d_name, ".") = 0))
 				continue;
 
-		if(stat(dp->d_name, &st) < 0) {
-			log_error(LOG_ARGS, "Could not stat(%s)", dp->d_name);
-			continue;
-		}
-
 		filename = mystrdup(dp->d_name);
 
 		if((s = strstr(filename, "-probe"))) {
+			if(stat(filename, &st) < 0) {
+				log_error(LOG_ARGS, "Could not stat(%s)",
+					  filename);
+				myfree(filename);
+				continue;
+			}
+
 			probefd = open(filename, O_RDONLY);
 			if(probefd < 0)
 				continue;
@@ -602,11 +604,6 @@
 		   (strcmp(dp->d_name, ".") = 0))
 				continue;
 
-		if(stat(dp->d_name, &st) < 0) {
-			log_error(LOG_ARGS, "Could not stat(%s)", dp->d_name);
-			continue;
-		}
-		
 		if(strstr(dp->d_name, "-probe"))
 			continue;
 
@@ -614,6 +611,11 @@
 		if(s && (strcmp(s, ".lastmsg") = 0))
 			continue;
 			
+		if(stat(dp->d_name, &st) < 0) {
+			log_error(LOG_ARGS, "Could not stat(%s)", dp->d_name);
+			continue;
+		}
+		
 		probefile = concatstr(2, dp->d_name, "-probe");
 		
 		/* Skip files which already have a probe out */
@@ -689,11 +691,6 @@
 		   (strcmp(dp->d_name, ".") = 0))
 				continue;
 
-		if(stat(dp->d_name, &st) < 0) {
-			log_error(LOG_ARGS, "Could not stat(%s)", dp->d_name);
-			continue;
-		}
-		
 		if(strstr(dp->d_name, "-probe"))
 			continue;
 
@@ -701,6 +698,11 @@
 		if(a && (strcmp(a, ".lastmsg") = 0))
 			continue;
 		
+		if(stat(dp->d_name, &st) < 0) {
+			log_error(LOG_ARGS, "Could not stat(%s)", dp->d_name);
+			continue;
+		}
+		
 		probefile = concatstr(2, dp->d_name, "-probe");
 		
 		/* Skip files which already have a probe out */

