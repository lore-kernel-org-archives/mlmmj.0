From: Andreas Schneider <mail@cynapses.org>
Date: Thu, 17 Dec 2009 12:13:46 +0000
Subject: Re: README.postfix
Message-Id: <200912171313.46281.mail@cynapses.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart18551288.B1tJJUGY5L"
List-Id: <mlmmj.mlmmj.org>
References: <200912171013.45750.mail@cynapses.org>
In-Reply-To: <200912171013.45750.mail@cynapses.org>
To: mlmmj@mlmmj.org

--nextPart18551288.B1tJJUGY5L
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 17 December 2009 12:53:35 Mads Martin J=C3=B8rgensen wrote:
> On 17/12/2009, at 10.13, Andreas Schneider wrote:
> > I've updated README.postfix as it doesn't work with latest postfix.
>=20
> Thanks a lot. Would the previous Postfix work with the new one? In case it
>  doesn't, it would be great if you would add both things in the file.
>  Something like:
>=20
> For Postfix <=3D 5.2.9
>=20
> For Postfix > 5.2.9

The new postfix is just more strict. You are not allowed to do mlmmj:$1=20
anymore. You have to specify the destination like mlmmj:my-list.

So this will work with old and new versions of postfix.
=20


Cheers,=20


	-- andreas

--nextPart18551288.B1tJJUGY5L
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAksqIHoACgkQf94+j/M+P8YlAACgg5JIuC6Fepiz+dYQeXznh0Eh
eg0AnRA6m2RAKoxTUennd1AtHFuIMhOn
=1ESu
-----END PGP SIGNATURE-----

--nextPart18551288.B1tJJUGY5L--



