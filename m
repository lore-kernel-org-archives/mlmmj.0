From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Tue, 24 May 2016 17:44:11 +0000
Subject: [mlmmj] [PATCH] add user to crontab instructions
Message-Id: <574492EB.2020101@coredump.us>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nkXv9R8ja5rWfpNNk2AKerVoboxoOkxif"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nkXv9R8ja5rWfpNNk2AKerVoboxoOkxif
Content-Type: multipart/mixed; boundary="l3FaFAtIcat414mkKmacWJcQOHF3gPKq9"
From: Chris Knadle <Chris.Knadle@coredump.us>
To: mlmmj@mlmmj.org
Message-ID: <574492EB.2020101@coredump.us>
Subject: [PATCH] add user to crontab instructions

--l3FaFAtIcat414mkKmacWJcQOHF3gPKq9
Content-Type: multipart/mixed;
 boundary="------------010705000700080806030408"

This is a multi-part message in MIME format.
--------------010705000700080806030408
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The instructions for making a crontab entry for mlmmj-maintd currently
leaves out the user to execute the entry with.  Unfortunately if an
administrator does as suggested by the output of mlmmj-make-ml and
copy/pastes the suggestion to /etc/crontab, it seems other crontab entrie=
s
fail to run.

mlmmj-make-ml also mentions running mlmmj-maintd "in daemon mode" which
seems to add confusion; it seems better to simplify this to discussing a
crontab entry, given that the suggestion in both the mlmmj-make-ml output=

and the README is to run it that way and there isn't further discussion o=
f
"daemon mode" in the README nor an init script shipped for doing so.

The attach patch addresses both issues.
Thanks
  -- Chris

--=20
Chris Knadle
Chris.Knadle@coredump.us

--------------010705000700080806030408
Content-Type: text/x-diff;
 name="07_fix-crontab-suggestions.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="07_fix-crontab-suggestions.diff"

Description: Alter the mlmmj instructions for making a crontab entry, whi=
ch
 by default tells the user to add an entry without specifying the user.
Author: Christopher Knadle <Chris.Knadle@coredump.us>
Bug-Debian: https://bugs.debian.org/804436
Last-Updated: 2016-05-22

--- a/src/mlmmj-make-ml
+++ b/src/mlmmj-make-ml
@@ -133,7 +133,7 @@
 fi
=20
 ALIAS=3D"$LISTNAME:  \"|$MLMMJRECEIVE -L $SPOOLDIR/$LISTNAME/\""
-CRONENTRY=3D"0 */2 * * * \"$MLMMJMAINTD -F -L $SPOOLDIR/$LISTNAME/\""
+CRONENTRY=3D"0 */2 * * * root $MLMMJMAINTD -F -L $SPOOLDIR/$LISTNAME/"
=20
 if [ -n "$A_CREATE" ]; then
 	echo "I want to add the following to your $ALIASFILE file:"
@@ -175,8 +175,10 @@
 fi
=20
 echo
-echo "If you're not starting mlmmj-maintd in daemon mode,"
-echo "don't forget to add this to your crontab:"
+echo "If you're not running mlmmj-maintd for all mailing lists"
+echo "in /var/spool/mlmmj such as"
+echo "   /usr/bin/mlmmj-maintd -F -d /var/spool/mlmmj"
+echo "via cron, then don't forget to add this to your crontab:"
 echo "$CRONENTRY"
=20
 echo
--- a/README
+++ b/README
@@ -95,11 +95,11 @@
  4) Start mlmmj-maintd (remember full path when starting it!) or add it =
to
     crontab with -F switch. The recommended way for now is to run it via=
 cron:
=20
-    "0 */2 * * *  /usr/bin/mlmmj-maintd -F -L /var/spool/mlmmj/mlmmj-tes=
t"
+    0 */2 * * *  root /usr/bin/mlmmj-maintd -F -L /var/spool/mlmmj/mlmmj=
-test
=20
-    It should be started as root, as mlmmj-maintd will become the user o=
wning
-    the listdir (/var/spool/mlmmj/mlmmj-test), and log it's last mainten=
ance
-    run to listdir/mlmmj-maintd.lastrun.log.
+    Started as root, as mlmmj-maintd will become the user owning the lis=
tdir
+    (/var/spool/mlmmj/mlmmj-test), and log it's last maintenance run to
+    listdir/mlmmj-maintd.lastrun.log.
=20
     If you have several lists below /var/spool/mlmmj you can use -d:
     /usr/bin/mlmmj-maintd -F -d /var/spool/mlmmj

--------------010705000700080806030408--

--l3FaFAtIcat414mkKmacWJcQOHF3gPKq9--

--nkXv9R8ja5rWfpNNk2AKerVoboxoOkxif
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJXRJLrAAoJEEkSKbZEGfmqcJkP/A3mcuukv+ft8BmnHa7JhSWK
yiJ7BFCcXUMYGJsQNqwhdpiLY7cios3GY0nWiWTA13QOrQm8UV4Stk5psZuvy/0N
xwi1cZpzMsa2bXGL8AVALTCJFRRd3Z3Vj2HjAFbX7ww7bW+/rl14+oDpShWMbW3O
SJpk0TYNYOQVMuEBySEjhOO9JqWQ7B8CBGKPjp6JNwdvUmW6KFA6zlj82fnDAvjp
rtFtrjSCXtdacdlfhNn/cIuaYRFUAp0qFDYCXTftv+E0LzOKouz/LbH5zhM7Vo/d
8Yp0LGPZhafx3EOUGnfn3BtcQNj3/pDS3Gqbpr8UdtgjnXiLwBukLaNQK09RKz69
0zQmyPmdpNgqZM53TYgQPJvb2A604m5LlEZ18tJv3DHRJYvdvp15BiV/3TH4ca4f
xt70NxmBsjVjmIdUZhnrdLkm5psb8+eXWH1eyTVZhmIhYZyAuNm1DMIsCNXh5fjq
wFpEhr+5FpKNAx2CvKyY65cjUIczhfibppnxZtyStsNRkxqVVjFYiCCI5Tf1bNmi
rtr9WCVeCtZJuBRjnmsMBjvhZeCtJEXkFkxdudkXT5JjClC/oVzFSrQhy9TM25kg
Lr87sWGZ3PVA8aqtrjft0374+b+n95N/wR0S76zO57xI0bSUY4jnzBiIGLUsFM6l
+HdJXdT+rG5GFa7nGbLb
=53Ez
-----END PGP SIGNATURE-----

--nkXv9R8ja5rWfpNNk2AKerVoboxoOkxif--

