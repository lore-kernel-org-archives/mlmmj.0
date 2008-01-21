From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Mon, 21 Jan 2008 09:51:53 +0000
Subject: Re: feature request: archivedir setting - symlinks do not work
Message-Id: <20080121095153.GG23511@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="HCdXmnRlPgeNBad2"
List-Id: <mlmmj.mlmmj.org>
References: <20080121014028.GC23511@curie-int.orbis-terrarum.net>
In-Reply-To: <20080121014028.GC23511@curie-int.orbis-terrarum.net>
To: mlmmj@mlmmj.org


--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2008 at 10:31:27AM +0100, Morten K. Poulsen wrote:
> On Sun, 2008-01-20 at 17:40 -0800, Robin H. Johnson wrote:
> > # ls -la /var/lists/gentoo-dev/archive
> > lrwxrwxrwx 1 root root 36 Jan 10 03:09 /var/lists/gentoo-dev/archive ->=
 /var/listarchives/gentoo-dev/archive
> Does /var/listarchives/gentoo-dev/archive exist?
Yes it does. The layout was creating with using rsync /var/lists/ to the
new location, but use the rsync filters to only select the /archive/
(and leave out all the other directories under each list).

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.8 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkeUazkACgkQPpIsIjIzwixmagCfQcuw9tqJkygXN7s1r/PisCtP
tfsAn2xq/su0IDpLGq0Bp1mVu2OH17IV
=kYLA
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
