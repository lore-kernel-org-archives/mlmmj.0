From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 22 Jan 2012 07:52:20 +0000
Subject: [mlmmj] [patch] Remove bashism from src/mlmmj-make-ml.sh.in
Message-Id: <4F1BC034.5060304@goirand.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050608090201060103080607"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------050608090201060103080607
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

src/mlmmj-make-ml.sh.in declares it uses sh and not bash, but it has
bashism which may fail if dash is the default implementation for sh
(which is the case now in both Debian and Ubuntu).

Please apply the attached patch which removes bashism in
src/mlmmj-make-ml.sh.in. I've been carrying this patch for too long, and
I'd like to have it removed from the debian/patches folder for the next
release of MLMMJ.

Thanks,

Thomas Goirand (zigo)

--------------050608090201060103080607
Content-Type: text/x-diff;
 name="06_fix_bashisms_mlmmj-make-ml.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="06_fix_bashisms_mlmmj-make-ml.diff"

From: <dan@icarus.sumodave.com>
Subject: Remove bashisms from make-mlmmj-ml script.
Forwarded: no
diff -urNad a/src/mlmmj-make-ml.sh.in b/src/mlmmj-make-ml.sh.in
--- a/src/mlmmj-make-ml.sh.in	2008-10-30 21:01:13.000000000 +0000
+++ b/src/mlmmj-make-ml.sh.in	2010-01-04 20:44:42.000000000 +0000
@@ -21,7 +21,7 @@
 do
 case "$Option" in 
 	h )
-	echo -e "$USAGE"
+	echo "$USAGE"
 	exit 0
 	;;
 	z )
@@ -42,7 +42,8 @@
 	CHOWN="$OPTARG"
 	;;
 	* )
-	echo -e "$0: invalid option\nTry $0 -h for more information."
+	echo "$0: invalid option"
+	echo "Try $0 -h for more information."
 	exit 1
 esac
 done

--------------050608090201060103080607--

