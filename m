From: Drake Wyrm <wyrm@haell.com>
Date: Sat, 27 Nov 2004 06:41:23 +0000
Subject: Makefiles modified to install listtexts templates
Message-Id: <20041127064122.GA13063@phaenix.haell.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cNdxnHkX5QqsyA0e"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I installed mlmmj a few days ago, and I am certainly impressed. There
are a few minor issues that irk me, but these can be quickly remedied.
After a quick cruise through your list archive, I decided to help out
with mlmmj-make-ml. The first step I took was creating automake rules to
install the listtexts templates in /usr/share/mlmmj/text.skel. This
should make it a bit easier to run through mlmmj-make-ml.sh without
pulling out the source tarball.

-- 
Batou: Hey, Major... You ever hear of "human rights"?
Kusanagi: I understand the concept, but I've never seen it in action.
  --Ghost in the Shell

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-1.1.0-RC4.patch"

diff -ruN Makefile.am Makefile.am
--- Makefile.am
+++ Makefile.am
@@ -1,7 +1,7 @@
 ## Process this file with automake to produce Makefile.in
 
 AUTOMAKE_OPTIONS = foreign dist-bzip2
-EXTRA_DIST = include VERSION LICENSE UPGRADE listtexts src/log_error.c FAQ \
+EXTRA_DIST = include VERSION LICENSE UPGRADE src/log_error.c FAQ \
 	     TUNABLES README.access contrib man
 CLEANFILES = *~ mlmmj-*.tar.*
 
@@ -12,4 +12,4 @@
 	    man/mlmmj-sub.1 man/mlmmj-maintd.1 man/mlmmj-process.1 \
 	    man/mlmmj-send.1 man/mlmmj-unsub.1
 
-SUBDIRS = src
+SUBDIRS = src listtexts
diff -ruN VERSION VERSION
--- VERSION
+++ VERSION
@@ -1 +1 @@
-1.1.0-RC3
+1.1.0-RC4
diff -ruN configure.ac configure.ac
--- configure.ac
+++ configure.ac
@@ -31,4 +31,5 @@
 
 AC_CONFIG_FILES([Makefile])
 AC_CONFIG_FILES([src/Makefile])
+AC_CONFIG_FILES([listtexts/Makefile])
 AC_OUTPUT
diff -ruN listtexts/Makefile.am listtexts/Makefile.am
--- listtexts/Makefile.am
+++ listtexts/Makefile.am
@@ -0,0 +1,10 @@
+## Process this file with automake to produce Makefile.in
+
+
+textlibdir = $(pkgdatadir)/text.skel
+dist_textlib_DATA = access bounce-probe listhelp moderation notifysub \
+	notifysub-digest notifysub-nomail notifyunsub notifyunsub-digest \
+	notifyunsub-nomail notintocc sub-confirm sub-confirm-digest \
+	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail subonlypost \
+	unsub-confirm unsub-confirm-digest unsub-confirm-nomail unsub-ok \
+	unsub-ok-digest unsub-ok-nomail

--cNdxnHkX5QqsyA0e--
