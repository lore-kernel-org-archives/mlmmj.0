From: Kurt Lieber <klieber@gentoo.org>
Date: Wed, 15 Dec 2004 19:29:38 +0000
Subject: bug: blank subjects do not get list subject prepended
Message-Id: <20041215192938.GN32117@mail.lieber.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BfiOpY9z1HJf3NMZ"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--BfiOpY9z1HJf3NMZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Not sure how to explain this except with an example.

With our list, gentoo-core, all subjects get [gentoo-core] prepended.  So:

Subject: test message

shows up on the list as:

Subject: [gentoo-core] test message

If a user leaves the subject line blank, the list subject thingy doesn't
get prepended:

Subject:

should show up as:

Subject: [gentoo-core]

but it doesn't.

This makes users who rely on these keywords for procmail filtering unhappy.

--kurt

--BfiOpY9z1HJf3NMZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBwJCiJPpRNiftIEYRAkcrAKCExDPdPtcgGfWQ7U/CiazNs/uq7ACggdBp
HYbGt52VxJZJqS7tess85t0=
=ztkf
-----END PGP SIGNATURE-----

--BfiOpY9z1HJf3NMZ--
