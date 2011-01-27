From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:23 +0000
Subject: [mlmmj] [PATCH 05 of 10] Ensure that filename is always freed in
Message-Id: <b0e22772a1c784ad07b4.1296169163@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295974012 0
# Node ID b0e22772a1c784ad07b4431d7542b68a46d3990f
# Parent  a3c801ea8a7a2f32d9c7dcccd167de27ddb8e697
Ensure that filename is always freed in clean_nolongerbouncing()

diff -r a3c801ea8a7a -r b0e22772a1c7 src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Tue Jan 25 16:35:25 2011 +0000
+++ b/src/mlmmj-maintd.c	Tue Jan 25 16:46:52 2011 +0000
@@ -549,11 +549,15 @@
 			}
 
 			probefd = open(filename, O_RDONLY);
-			if(probefd < 0)
+			if(probefd < 0) {
+				myfree(filename);
 				continue;
+			}
 			probetimestr = mygetline(probefd);
-			if(probetimestr = NULL)
+			if(probetimestr = NULL) {
+				myfree(filename);
 				continue;
+			}
 			close(probefd);
 			chomp(probetimestr);
 			probetime = (time_t)strtol(probetimestr, NULL, 10);

