From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Thu, 03 Jan 2008 02:13:41 +0000
Subject: feature request: archivedir setting
Message-Id: <20080103021341.GC17327@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="4vu0d+lqoSa2/ZEk"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--4vu0d+lqoSa2/ZEk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm writing this email, in the hope that somebody else has already
implemented what I'm interested in.

I'd like a tunable to specify what directory to use for the archive.

If nobody else has done it, I think it should be trivial to implement,
generally following this pseudo-code:

Existing:
archivename =3D concatstr(3, listdir, "/archive/", buf);

New:
char* archivedir =3D get_archivedir(listdir);
archivename =3D concatstr(3, archivedir, buf);
char* get_archivedir(listdir) {
	archivedir =3D <$listdir/control/archivedir>;
	return archivedir if archivedir;
	return "$listdir/archive/";
}

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--4vu0d+lqoSa2/ZEk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.8 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkd8RNUACgkQPpIsIjIzwixSWACfZIU5iK3DMPRk2EZNK8T6bGjN
9bUAn1Wg79Os/jfUbVdLfCQLmFNfjmAl
=3hDv
-----END PGP SIGNATURE-----

--4vu0d+lqoSa2/ZEk--
