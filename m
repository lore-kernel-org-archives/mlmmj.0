From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 25 Jan 2010 13:54:30 +0000
Subject: An answer to a question in code comment
Message-Id: <4B5DA296.4040406@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

See below.
Ben.



diff -ru mlmmj-1.2.17/src/mlmmj-process.c mlmmj-1.2.17-mod/src/mlmmj-process.c
--- mlmmj-1.2.17/src/mlmmj-process.c	2010-01-11 00:40:57.000000000 +1100
+++ mlmmj-1.2.17-mod/src/mlmmj-process.c	2010-01-26 00:05:34.000000000 +1100
@@ -561,6 +562,8 @@
  	}

  	/* Why is this here, and not in listcontrol() ?  -- mortenp 20060409 */
+	/* Presumably so that it can use mailfile before it is unlinked prior
+		to entering listcontrol() below -- Ben Schmidt 2010-01-25 */
  	if(recipextra) {
  		owner = concatstr(2, listdir, "/control/owner");
  		if(owner && strcmp(recipextra, "owner") = 0) {





