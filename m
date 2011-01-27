From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:26 +0000
Subject: [mlmmj] [PATCH 08 of 10] Ensure that address and bouncedata are freed in
Message-Id: <4be2135bfd08219a8a84.1296169166@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295981979 0
# Node ID 4be2135bfd08219a8a84adb4ecd38ca6fe46a14e
# Parent  a1ae4cff691cd9f5f652d5a04d32ce2517e6de80
Ensure that address and bouncedata are freed in unsub_bouncers()

diff -r a1ae4cff691c -r 4be2135bfd08 src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Tue Jan 25 18:33:14 2011 +0000
+++ b/src/mlmmj-maintd.c	Tue Jan 25 18:59:39 2011 +0000
@@ -745,6 +745,7 @@
 		a = strchr(firstbounce, ':');
 		if(a = NULL) {
 			myfree(firstbounce);
+			myfree(bouncedata);
 			continue;
 		}
 
@@ -752,14 +753,17 @@
 		bouncetime = (time_t)strtol(a, NULL, 10);
 		myfree(firstbounce);
 		t = time(NULL);
-		if(t - bouncetime < bouncelife + WAITPROBE)
+		if(t - bouncetime < bouncelife + WAITPROBE) {
+			myfree(bouncedata);
 			continue; /* ok, don't unsub this one */
+		}
 		
 		/* Ok, go ahead and unsubscribe the address */
 		address = mystrdup(dp->d_name);
 		a = strchr(address, '=');
 		if(a = NULL) { /* skip malformed */
 			myfree(address);
+			myfree(bouncedata);
 			continue;
 		}
 		*a = '@';
@@ -768,6 +772,8 @@
 		
 		if(childpid < 0) {
 			log_error(LOG_ARGS, "Could not fork");
+			myfree(address);
+			myfree(bouncedata);
 			continue;
 		}
 

