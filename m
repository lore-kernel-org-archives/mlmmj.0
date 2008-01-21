From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Mon, 21 Jan 2008 10:38:17 +0000
Subject: Re: feature request: archivedir setting - symlinks do not work
Message-Id: <20080121103817.GH23511@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nqkreNcslJAfgyzk"
List-Id: <mlmmj.mlmmj.org>
References: <20080121014028.GC23511@curie-int.orbis-terrarum.net>
In-Reply-To: <20080121014028.GC23511@curie-int.orbis-terrarum.net>
To: mlmmj@mlmmj.org


--nqkreNcslJAfgyzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2008 at 11:07:12AM +0100, Morten K. Poulsen wrote:
> $ ./mlmmj-recieve -F -L /home/mopo/mlmmj-test/ </tmp/mail.txt
=2E..
> Are you sure the permissions are set correctly? Is there anything in
> your maillog?
Captured it in testing now.

Jan 21 10:37:02 pigeon /usr/bin/mlmmj-send[31612]: mlmmj-send.c:1252: Could=
 not rename(/var/lists/gentoo-test//queue/105c88835cb90bff,/var/lists/gento=
o-test//archive/241);: Invalid cross-device link

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--nqkreNcslJAfgyzk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.8 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkeUdhkACgkQPpIsIjIzwiwBoQCeOJY+J5x2je2D4kIRDMl8RWFq
75wAn3YccAcIRtHwCmueKmBlsa/oTa+a
=XuV5
-----END PGP SIGNATURE-----

--nqkreNcslJAfgyzk--
