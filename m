From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:25 +0000
Subject: [mlmmj] [PATCH 07 of 10] Fixup missing myfree of from to and repto in
Message-Id: <a1ae4cff691cd9f5f652.1296169165@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295980394 0
# Node ID a1ae4cff691cd9f5f652d5a04d32ce2517e6de80
# Parent  b380028a2c36091bd1d4f9077024432abf4cfefe
Fixup missing myfree of from to and repto in resend_queue()

diff -r b380028a2c36 -r a1ae4cff691c src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Tue Jan 25 16:47:49 2011 +0000
+++ b/src/mlmmj-maintd.c	Tue Jan 25 18:33:14 2011 +0000
@@ -336,6 +336,9 @@
 		if(t - st.st_mtime > bouncelife) {
 			unlink(mailname);
 			myfree(mailname);
+			myfree(from);
+			myfree(to);
+			myfree(repto);
 			continue;
 		}
 

