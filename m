From: Peter Volkov <pva@gentoo.org>
Date: Thu, 13 Dec 2007 10:07:35 +0000
Subject: MIME encodings when dealing with adding the footer
Message-Id: <1197540455.6128.23.camel@camobap>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-lZnK4amYzSL0IEvoaGxt"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--=-lZnK4amYzSL0IEvoaGxt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello, list.

There is a problem in the current version of mlmmj in handling footer
which in combination of gmail effectively makes impossible usage of this
feature. In short if you have mail mime encoded (which happens very
often this days) footer like this:

[footer]
--=20
gentoo-doc-ru@gentoo.org mailing list
[/footer]

will be displayed in evolution as=20

&#0;=E2=94=82=D0=98=D0=9C=E2=95=92=E2=96=80=E2=95=9Bz=E2=95=A8=D0=9D=E2=94=
=82=D0=98=D0=9C=E2=95=92=E2=94=BC+=E2=94=8Cf=E2=95=92=E2=88=9A)=D0=AE=E2=88=
=9A+-

But the worst thing is that our Russian users reported that it
completely impossible to read such messages in gmail. See bug
bugs.gentoo.org/173159 for additional details. And quoting Robin Johnson
for the mentioned bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The best fix would be, if the body has a non-plaintext type, add the
footer in another MIME block, rather than trying to add it to the
existing block.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is still the issue with net-mail/mlmmj-1.2.14, but I do not see any
flag in ChangeLog that this is fixed in 1.2.15. So the question is are
there any plans to fix this issue?

Thank you very much for your time,
--=20
Peter.

--=-lZnK4amYzSL0IEvoaGxt
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: =?UTF-8?Q?=D0=AD=D1=82=D0=B0?=
	=?UTF-8?Q?_=D1=87=D0=B0=D1=81=D1=82=D1=8C?=
	=?UTF-8?Q?_=D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D1=8F?=
	=?UTF-8?Q?_=D0=BF=D0=BE=D0=B4=D0=BF=D0=B8=D1=81=D0=B0=D0=BD=D0=B0?=
	=?UTF-8?Q?_=D1=86=D0=B8=D1=84=D1=80=D0=BE=D0=B2=D0=BE=D0=B9?=
	=?UTF-8?Q?_=D0=BF=D0=BE=D0=B4=D0=BF=D0=B8=D1=81=D1=8C=D1=8E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBHYQRmz6tlgEWSarMRAj+WAJ933+OkuAMwXWiUEZO34nn6800gowCeIPN/
g3tOhEQYwipV0aFmIIcG3cc=
=+ox3
-----END PGP SIGNATURE-----

--=-lZnK4amYzSL0IEvoaGxt--

