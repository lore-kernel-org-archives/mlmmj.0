From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Thu, 29 May 2008 23:09:03 +0000
Subject: Changing mailing list subscription process
Message-Id: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="924gEkU1VlJlwnwX"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--924gEkU1VlJlwnwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Presently, we have been suffering some spam attacks against some of the
Gentoo mailing lists, because of spammers using auto-responders.

Here's how they are conducting the attack:

1. Spammer forges a mail from $LIST+subscibe@gentoo.org, sending it to
   an auto-responder.
2. Lists sends a confirmation mail to the auto-responder.
3. Auto-responder sends mail, with intact confirmation data back to the
   confirmation address (in Reply-To).
4. Auto-responder is now subscribed to the mailing list.
5. Spammer forges a mail from the auto-responder, to the normal mailing
   list address.

I tried adding a specific Reply-To address in the header of the list
text/ file, but it's made to part of the mail body instead of the
header.

Here's what I wanted to do, but isn't taken:
--- original/sub-confirm	2008-05-29 20:42:06.000000000 +0000
+++ spamproof/sub-confirm	2008-05-29 21:28:51.000000000 +0000
@@ -1,4 +1,5 @@
 Subject: Confirm subscription to $listaddr$
+Reply-To: DO NOT REPLY <devnull@localhost.invalid>
=20
 Hi, this is the mlmmj program managing the mailinglist
=20
@@ -16,8 +17,8 @@
 your address. Secondly it makes sure someone else did not try and
 subscribe your emailaddress without your permission.
=20
-Your mailer may automatically reply to the confirmation address when you h=
it
-the reply button.
+Due to repeat spam abuse, you must copy the $confaddr$ in your mail client
+manually. Just hitting reply will not deliver to a valid location.
=20
 The subject and the body of the mail can be anything.

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--924gEkU1VlJlwnwX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkg/N48ACgkQPpIsIjIzwiyDYACgvIDdWuAhuv7DzXHldAB/1uih
FtMAoLW61FUgu8SnUkCHFs4tZEFB9KeH
=xkhX
-----END PGP SIGNATURE-----

--924gEkU1VlJlwnwX--
