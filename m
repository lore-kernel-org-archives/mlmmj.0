From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:27 +0000
Subject: [mlmmj] [PATCH 09 of 10] Ensure that mlmmjsend, mlmmjbounce,
Message-Id: <35246cb7b5f2f74c07f8.1296169167@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295983347 0
# Node ID 35246cb7b5f2f74c07f863fef859b08836d29bb6
# Parent  4be2135bfd08219a8a84adb4ecd38ca6fe46a14e
Ensure that mlmmjsend, mlmmjbounce, mlmmjunsub are freed on abnormal exit

diff -r 4be2135bfd08 -r 35246cb7b5f2 src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Tue Jan 25 18:59:39 2011 +0000
+++ b/src/mlmmj-maintd.c	Tue Jan 25 19:22:27 2011 +0000
@@ -1116,6 +1116,9 @@
 		if(chdir(dirlists) < 0) {
 			log_error(LOG_ARGS, "Could not chdir(%s).",
 					dirlists);
+			myfree(mlmmjbounce);
+			myfree(mlmmjsend);
+			myfree(mlmmjunsub);
 			exit(EXIT_FAILURE);
 		}
 

