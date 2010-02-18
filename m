From: "Gerd v. Egidy" <lists@egidy.de>
Date: Thu, 18 Feb 2010 15:30:24 +0000
Subject: [PATCH] add MIME-aware footers
Message-Id: <201002181630.24401.lists@egidy.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_Q0VfL7PKAwAQarf"
List-Id: <mlmmj.mlmmj.org>
References: <200812140123.13634.lists@egidy.de>
In-Reply-To: <200812140123.13634.lists@egidy.de>
To: mlmmj@mlmmj.org

--Boundary-00=_Q0VfL7PKAwAQarf
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Morten,

this patch has already been sent in dec 2008 and jan 2010 to this ml but was 
not yet applied. I guess it was forgotten. You said something about pestering 
you until you commited it. So here I am...

The patch allows adding footers to different MIME-types. It uses altermime to 
add the footers before giving the mail to the regular mlmmj-functions. Mlmmj 
itself doesn't need to be changed to use this.

How to use it:

- install altermime to /usr/bin/altermime
- copy the mlmmj-amime-receive from the contrib-dir into /usr/bin
- put the footer-text for the different MIME-types into 
control/amime-footer-text
control/amime-footer-html
control/amime-footer-base64
- replace mlmmj-recieve with mlmmj-amime-receive in /etc/aliases, e.g.
myml:   "|/usr/bin/mlmmj-amime-receive -L /var/spool/mlmmj/myml/"
watch out for recieve vs. receive...
- newaliases

If this patch is not acceptable in its current form or missing something 
please speak up.

Kind regards,

Gerd

-- 
Address (better: trap) for people I really don't want to get mail from:
jonas@cactusamerica.com

--Boundary-00=_Q0VfL7PKAwAQarf
Content-Type: text/x-patch;
  charset="utf-8";
  name="mlmmj-amime.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mlmmj-amime.patch"

diff -r -u -N mlmmj-1.2.16-RC1.orig/contrib/Makefile.am mlmmj-1.2.16-RC1/contrib/Makefile.am
--- mlmmj-1.2.16-RC1.orig/contrib/Makefile.am	2008-10-30 21:06:16.000000000 +0100
+++ mlmmj-1.2.16-RC1/contrib/Makefile.am	2008-12-13 23:39:33.000000000 +0100
@@ -2,3 +2,5 @@
 
 EXTRA_DIST = web
 SUBDIRS = recievestrip
+
+bin_SCRIPTS = mlmmj-amime-receive
diff -r -u -N mlmmj-1.2.16-RC1.orig/contrib/mlmmj-amime-receive mlmmj-1.2.16-RC1/contrib/mlmmj-amime-receive
--- mlmmj-1.2.16-RC1.orig/contrib/mlmmj-amime-receive	1970-01-01 01:00:00.000000000 +0100
+++ mlmmj-1.2.16-RC1/contrib/mlmmj-amime-receive	2008-12-13 23:23:23.000000000 +0100
@@ -0,0 +1,89 @@
+#!/bin/bash
+# 
+# mlmmj-amime-receive
+#
+# Take mail from stdin, pipe it through altermime and then to mlmmj-recieve
+# needed to add footers in a MIME-aware way
+#
+# requires altermime, see http://www.pldaniels.com/altermime/
+#
+# just replace mlmmj-recieve (sic) with mlmmj-amime-receive, e.g. in /etc/aliases:
+# myml:   "|/usr/bin/mlmmj-amime-receive -L /var/spool/mlmmj/myml/"
+#
+# put the footer-text for the different MIME-types into 
+# control/amime-footer-text
+# control/amime-footer-html
+# control/amime-footer-base64
+#
+# Copyright 2008 by Gerd v. Egidy, <gerd@egidy.de>
+#
+# Licensed under MIT License, see LICENSE file coming with mlmmj
+#
+
+MLMMJRECIEVE=/usr/bin/mlmmj-recieve
+ALTERMIME=/usr/bin/altermime
+
+# check executables
+if ! [ -x $MLMMJRECIEVE ]; then
+    echo "can't find $MLMMJRECIEVE executable, aborting"
+    exit 1
+fi
+
+if ! [ -x $ALTERMIME ]; then
+    echo "can't find $ALTERMIME executable, aborting"
+    exit 1
+fi
+
+# read parameters
+I=1
+PARAM_L=0
+while [ $I -le $# ] && [ $PARAM_L == 0 ]; do
+    if [ "${!I}" == "-L" ]; then
+        PARAM_L=1
+    fi
+    I=$[$I+1]
+done
+
+if [ $PARAM_L == 1 ] && [ $I -le $# ]; then
+    MLPATH="${!I}"
+else
+    echo "parameter -L /path/to/listdir missing, aborting"
+    exit 1
+fi
+
+if ! [ -d "${MLPATH}" ]; then
+    echo "${MLPATH} is not existing or no directory, aborting"
+    exit 1
+fi
+
+CONTROLD="${MLPATH}/control"
+
+if ! [ -d "${CONTROLD}" ]; then
+    echo "${CONTROLD} is not existing or no directory, aborting"
+    exit 1
+fi
+
+# look for footer-files and build parameters
+
+if ! [ -f "${CONTROLD}/amime-footer-text" ]; then
+    echo "${CONTROLD}/amime-footer-text is not existing or no regular file, aborting"
+    exit 1
+fi
+
+PARAM="--disclaimer=${CONTROLD}/amime-footer-text"
+
+if [ -f "${CONTROLD}/amime-footer-html" ]; then
+    PARAM="${PARAM} --disclaimer-html=${CONTROLD}/amime-footer-html --htmltoo --force-for-bad-html"
+fi
+
+if [ -f "${CONTROLD}/amime-footer-base64" ]; then
+    PARAM="${PARAM} --disclaimer-b64=${CONTROLD}/amime-footer-base64"
+fi
+
+PARAM="${PARAM} --altersigned --log-syslog"
+
+# go to a dir where altermime can write it's tmp-files safely
+cd $MLPATH
+
+# pipe the calls
+$ALTERMIME --input=- ${PARAM} | $MLMMJRECIEVE "$@"

--Boundary-00=_Q0VfL7PKAwAQarf--

