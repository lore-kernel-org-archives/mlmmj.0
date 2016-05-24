From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Tue, 24 May 2016 17:21:07 +0000
Subject: [mlmmj] [PATCH] ereg() removed in PHP 7.0
Message-Id: <57448D83.1090009@coredump.us>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PntFBXRn62cKN33RE2kRSXvE8dGrMIrpm"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PntFBXRn62cKN33RE2kRSXvE8dGrMIrpm
Content-Type: multipart/mixed; boundary="s206W5tH3aOAle8LnXjjTP7h7UMAmdK7J"
From: Chris Knadle <Chris.Knadle@coredump.us>
To: mlmmj@mlmmj.org
Message-ID: <57448D83.1090009@coredump.us>
Subject: [PATCH] ereg() removed in PHP 7.0

--s206W5tH3aOAle8LnXjjTP7h7UMAmdK7J
Content-Type: multipart/mixed;
 boundary="------------040303030107030305080408"

This is a multi-part message in MIME format.
--------------040303030107030305080408
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Debian is transitioning from PHP 5 to PHP 7.0, and PHP 5 is soon to be
removed.  The current mlmmj PHP code has 2 to calls to ereg() functions
which were deprecated in PHP 5.3.0 and removed from PHP 7.0.0, thus
requiring modification.  Attached is a patch that does this.

Note that the regex in contrib/web/php-user/mlmmj.php for matching email
addresses could also use updating to allow for the full range of special
characters that are allowed in email addresses:

   https://tools.ietf.org/html/rfc5322#section-3.4.1

Right now it looks like these special characters might not be accepted by=

the regex AFAICT:
   ! # $ % & ' * + / =3D ? ^ ` { | } ~

Thanks
   -- Chris

--=20
Chris Knadle
Chris.Knadle@coredump.us

--------------040303030107030305080408
Content-Type: text/x-diff;
 name="06_fix-php-web-for-php7.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="06_fix-php-web-for-php7.diff"

Description: Update for PHP 5 -> PHP 7 transition
 ereg() and eregi() were deprecated with PHP 5.3.0 and removed in PHP 7.0=
=2E0
   https://secure.php.net/manual/en/function.ereg.php
   https://secure.php.net/manual/en/function.eregi.php
 Also remove min 2, max 4 character TLD portion of regex, as there are
 top-level domains > 4 chars now.
 Thanks to Ron Guerin <ron@vnetworx.net> for his help with the PHP regexe=
s.
Author: Christopher Knadle <Chris.Knadle@coredump.us>
Bug-Debian: https://bugs.debian.org/821532
Bug-Debian: https://bugs.debian.org/821533
Last-Updated: 2016-05-22

--- a/contrib/web/php-user/mlmmj.php
+++ b/contrib/web/php-user/mlmmj.php
@@ -37,7 +37,7 @@
=20
     function is_email($string=3D"")=20
 	{
-	    if (eregi("^[a-z0-9\._-]+".chr(64)."+[a-z0-9\._-]+\.+[a-z]{2,4}$", =
$string))=20
+	    if (preg_match(chr(7)."^[a-z0-9\._-]+@+[a-z0-9\._-]+\.+[a-z]+$".chr=
(7).'i', $string))=20
 	    {=20
 		return TRUE;=20
 	    }

--- a/contrib/web/php-admin/htdocs/index.php
+++ b/contrib/web/php-admin/htdocs/index.php
@@ -37,7 +37,7 @@
=20
 # use scandir to have alphabetical order
 foreach (scandir($topdir) as $file) {
-    if (!ereg("^\.",$file))
+    if (substr($file,0,1) !=3D '.')
     {
 	$lists .=3D "<p>".htmlentities($file)."<br/>\n";
 	$lists .=3D "<a href=3D\"edit.php?list=3D".urlencode($file)."\">Config<=
/a> - <a href=3D\"subscribers.php?list=3D".urlencode($file)."\">Subscribe=
rs</a>\n";

--------------040303030107030305080408--

--s206W5tH3aOAle8LnXjjTP7h7UMAmdK7J--

--PntFBXRn62cKN33RE2kRSXvE8dGrMIrpm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJXRI2HAAoJEEkSKbZEGfmqhEoP/19H99MASNCfrTFTWaF78dej
jqib3WwvL2GYAYxoS6VxYdvCfWi5LpUJC3lDuPbYe9Yu5JjF+f5X5JhpzQYtpQje
YyrvVIBEY9So53zhRJlinM0tN0KcSJfGjwpebOx50Jz9p4yqCvuAEYgEm2/49S+9
qgyYJITFcBBB/I0lqHHomHZBTwz8oVSvF2MmYdL8uNX0uaTpBIUnk9xcdX518T9Y
4BVX3flCtFvIKjr5lFOj1x1YmMfEYP3gNxhCoZ2+tF00UqS3YTFLGhKkHNCvx2rq
b5wDtZxabzEJWePGvWMcb1h68Jppt+zFKI+0z10RIGpyd23DPjeZY8SYRuKi5QZJ
9LIpQlCPmyjeHmGVqtnr88wCorA9BVznc32Ch30YDHmh7T5igm5KvoIVFMzAfy5w
oNtXR/S+OW1fcLHEpYlRw73ioMFM9HHtLtLKegs3y8Wg24Ur+cvGCqTHpFKkSSai
5Z0a+4MISwRIx4WH2GT9CNffBF6rlgBfvdmHiRPloqnXjwkFbGjskwiv27qOmF6S
dO57eSXuoUkFGoyUlOwDpIFZY/k+k0sXvPrl3zfFOlBs4hiLAYn/fYS45DcDsxkT
Tkv0oTw8EfP4WeP0D0+zhmDsKhSmxGEp8LfA/54EZS0MZVt65UlBhccf5uIAxFNR
SaicMoZUO1b4ti/+787W
=+1zY
-----END PGP SIGNATURE-----

--PntFBXRn62cKN33RE2kRSXvE8dGrMIrpm--

