From: "Gerd v. Egidy" <lists@egidy.de>
Date: Sun, 14 Dec 2008 00:23:12 +0000
Subject: [PATCH] add MIME-aware footers
Message-Id: <200812140123.13634.lists@egidy.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_xHFRJHCWaMOPtGS"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

--Boundary-00=_xHFRJHCWaMOPtGS
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I've been bitten by the footer-function not being MIME-aware. I've read up the 
topic on the list-archive and found out that I'm not the only one and that a 
solution has to be separatable from the core mlmmj.

I found the altermime program (http://www.pldaniels.com/altermime/) which 
seems to be a perfect match for the MIME-munging required. So I wrote a small 
shell script to integrate altermime and mlmmj.

How to use it:

- install altermime to /usr/bin/altermime
- copy the attached mlmmj-amime-receive into /usr/bin
- put the footer-text for the different MIME-types into 
control/amime-footer-text
control/amime-footer-html
control/amime-footer-base64
- replace mlmmj-recieve with mlmmj-amime-receive in /etc/aliases, e.g.
myml:   "|/usr/bin/mlmmj-amime-receive -L /var/spool/mlmmj/myml/"
watch out for recieve vs. receive...
- newaliases

Morten, I hope this solution is acceptable for inclusion into mlmmj. I 
attached mlmmj-amime.patch too, this is intended for you and adds mlmmj-amime-
receive into contrib.

Kind regards,

Gerd


--Boundary-00=_xHFRJHCWaMOPtGS
Content-Type: application/x-shellscript;
  name="mlmmj-amime-receive"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mlmmj-amime-receive"

#!/bin/bash
# 
# mlmmj-amime-receive
#
# Take mail from stdin, pipe it through altermime and then to mlmmj-recieve
# needed to add footers in a MIME-aware way
#
# requires altermime, see http://www.pldaniels.com/altermime/
#
# just replace mlmmj-recieve (sic) with mlmmj-amime-receive, e.g. in /etc/aliases:
# myml:   "|/usr/bin/mlmmj-amime-receive -L /var/spool/mlmmj/myml/"
#
# put the footer-text for the different MIME-types into 
# control/amime-footer-text
# control/amime-footer-html
# control/amime-footer-base64
#
# Copyright 2008 by Gerd v. Egidy, <gerd@egidy.de>
#
# Licensed under MIT License, see LICENSE file coming with mlmmj
#

MLMMJRECIEVE=/usr/bin/mlmmj-recieve
ALTERMIME=/usr/bin/altermime

# check executables
if ! [ -x $MLMMJRECIEVE ]; then
    echo "can't find $MLMMJRECIEVE executable, aborting"
    exit 1
fi

if ! [ -x $ALTERMIME ]; then
    echo "can't find $ALTERMIME executable, aborting"
    exit 1
fi

# read parameters
I=1
PARAM_L=0
while [ $I -le $# ] && [ $PARAM_L == 0 ]; do
    if [ "${!I}" == "-L" ]; then
        PARAM_L=1
    fi
    I=$[$I+1]
done

if [ $PARAM_L == 1 ] && [ $I -le $# ]; then
    MLPATH="${!I}"
else
    echo "parameter -L /path/to/listdir missing, aborting"
    exit 1
fi

if ! [ -d "${MLPATH}" ]; then
    echo "${MLPATH} is not existing or no directory, aborting"
    exit 1
fi

CONTROLD="${MLPATH}/control"

if ! [ -d "${CONTROLD}" ]; then
    echo "${CONTROLD} is not existing or no directory, aborting"
    exit 1
fi

# look for footer-files and build parameters

if ! [ -f "${CONTROLD}/amime-footer-text" ]; then
    echo "${CONTROLD}/amime-footer-text is not existing or no regular file, aborting"
    exit 1
fi

PARAM="--disclaimer=${CONTROLD}/amime-footer-text"

if [ -f "${CONTROLD}/amime-footer-html" ]; then
    PARAM="${PARAM} --disclaimer-html=${CONTROLD}/amime-footer-html --htmltoo --force-for-bad-html"
fi

if [ -f "${CONTROLD}/amime-footer-base64" ]; then
    PARAM="${PARAM} --disclaimer-b64=${CONTROLD}/amime-footer-base64"
fi

PARAM="${PARAM} --altersigned --log-syslog"

# go to a dir where altermime can write it's tmp-files safely
cd $MLPATH

# pipe the calls
$ALTERMIME --input=- ${PARAM} | $MLMMJRECIEVE "$@"

--Boundary-00=_xHFRJHCWaMOPtGS
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

--Boundary-00=_xHFRJHCWaMOPtGS--
