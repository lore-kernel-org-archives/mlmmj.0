From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Thu, 26 Jun 2008 17:02:53 +0000
Subject: Copying raw mail at a specific point in the access chain?
Message-Id: <20080626170253.GI30105@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="rwgQ89ZNnFUwFHTC"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--rwgQ89ZNnFUwFHTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Looking for suggestions as to how best to accomplish something.

For one of the larger Gentoo lists, we'd like to introduce moderation,
however, we'd like a public record of all mails, even those that get
denied by the moderators.

Here's the existing access file.
=3D=3D=3D=3D=3D=3D
deny ^From: .*@.*paypal.*
deny ^X-BeenThere: gentoo-dev@gentoo.org
deny ^X-BeenThere: gentoo-dev@lists.gentoo.org
deny ^From: .*nospam@chuckit.cjb.net.*
deny ^From: .*@lists.debian.org.*
moderate ^Subject:.* \[gentoo-core\] .*
moderate ^Subject: unsubscribe
allow
=3D=3D=3D=3D=3D=3D

Ideally, I'd like to change the last 'allow' to moderate, and only duplicate
messages (to a second read-only list) at that point. (Messages matching
[gentoo-core] in the Subject should not be duplicated).

Short of adding another ACL keyword 'duplicate', which would be non-termina=
l,
and also have completely different behavior, since it has to take a destina=
tion
parameter AND a regex. Does anybody else have better ideas?

Duplicating the ACLs in procmail is something I'd like to avoid, some of th=
em
are a LOT longer than the above.

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--rwgQ89ZNnFUwFHTC
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkhjy70ACgkQPpIsIjIzwiwkQgCgiKyaykO+MKRuBnRBl3N2wo7V
KEYAoM0fH0Oj+niOg4hKLOE7nUxk/IDy
=sjj1
-----END PGP SIGNATURE-----

--rwgQ89ZNnFUwFHTC--
