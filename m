From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:24 +0000
Subject: [mlmmj] [PATCH 06 of 10] Add comment to make it clear what string
Message-Id: <b380028a2c36091bd1d4.1296169164@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295974069 0
# Node ID b380028a2c36091bd1d4f9077024432abf4cfefe
# Parent  b0e22772a1c784ad07b4431d7542b68a46d3990f
Add comment to make it clear what string manipulations achieve

diff -r b0e22772a1c7 -r b380028a2c36 src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Tue Jan 25 16:46:52 2011 +0000
+++ b/src/mlmmj-maintd.c	Tue Jan 25 16:47:49 2011 +0000
@@ -565,6 +565,7 @@
 			t = time(NULL);
 			if(t - probetime > WAITPROBE) {
 				unlink(filename);
+				/* remove -probe onwards from filename */
 				*s = '\0';
 				unlink(filename);
 				s = concatstr(2, filename, ".lastmsg");

