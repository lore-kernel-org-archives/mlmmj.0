From: Kurt Lieber <klieber@gentoo.org>
Date: Thu, 04 Nov 2004 17:43:18 +0000
Subject: bug report: don't force your /etc/aliases on me! :)
Message-Id: <20041104174318.GN10927@mail.lieber.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1Morrmav4zT5FEml"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--1Morrmav4zT5FEml
Content-Type: multipart/mixed; boundary="J9yoL8xDAiWYN5Km"
Content-Disposition: inline


--J9yoL8xDAiWYN5Km
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

I was just perusing mlmmj-make-ml.sh and realized it expects the alias file
to be at /etc/aliases.  By default, Gentoo places this file in
/etc/mail/aliases and I imagine other distros may place it elsewhere.  I've
attached a patch that *should* handle this more gracefully -- I've tested
it on our system, but additional testing (and feedback) is welcome.

If I can find some time in the next week or so, I'll take a crack at
re-writing mlmmj-make-ml.sh to add in the /etc/skel features I asked about
previously.

--kurt

--J9yoL8xDAiWYN5Km
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="mlmmj-make-ml.patch"

--- mlmmj-make-ml.sh    2004-11-04 17:37:14.000000000 +0000
+++ mlmmj-make-ml.gentoo.sh     2004-11-04 17:36:21.000000000 +0000
@@ -114,15 +114,24 @@
 ALIAS="$LISTNAME:  \"|$MLMMJRECIEVE -L $SPOOLDIR/$LISTNAME/\""
 CRONENTRY="0 */2 * * * \"$MLMMJMAINTD -F -L $SPOOLDIR/$LISTNAME/\""

+ALIASFILE="/etc/aliases"
+function ask_aliasfile {
+       echo "I can't find your mail alias file.  Please tell me where it is:"
+       read ALIASFILE
+}
+until [ -f $ALIASFILE ]; do
+    ask_aliasfile
+done
+
 if [ -n "$A_CREATE" ]; then
-       echo "I want to add the following to your /etc/aliases file:"
+       echo "I want to add the following to your $ALIASFILE file:"
        echo "$ALIAS"

        echo -n "is this ok? [y/N] : "
        read OKIDOKI
        case $OKIDOKI in
                y|Y)
-               echo "$ALIAS" >> /etc/aliases
+               echo "$ALIAS" >> $ALIASFILE
                ;;
                n|N)
                exit 0
@@ -132,7 +141,7 @@
        esac
 else
        echo
-       echo "Don't forget to add this to /etc/aliases:"
+       echo "Don't forget to add this to $ALIASFILE:"
        echo "$ALIAS"
 fi

--J9yoL8xDAiWYN5Km--

--1Morrmav4zT5FEml
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBimo2JPpRNiftIEYRAhW4AKCZwY1mxu7UQAD03MccCmQkGQnUpgCgllu5
64NXJwckS4dgYYCnR35FhyM=
=BjYq
-----END PGP SIGNATURE-----

--1Morrmav4zT5FEml--
