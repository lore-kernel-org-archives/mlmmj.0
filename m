From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Mon, 21 Jan 2008 01:40:28 +0000
Subject: Re: feature request: archivedir setting - symlinks do not work
Message-Id: <20080121014028.GC23511@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="98e8jtXdkpgskNou"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 04, 2008 at 10:10:43AM +0100, Morten K. Poulsen wrote:
> -         ln -s /path/to/newplace/`basename $i`/archive $/archive
> +         ln -s /path/to/newplace/`basename $i`/archive $i/archive
> > Untested, but you get the idea.
> Still untested :)
I did test now, and it does not work.
/var/lists
/var/listarchives/
are on different partitions.

# ls -la /var/lists/gentoo-dev/archive
lrwxrwxrwx 1 root root 36 Jan 10 03:09 /var/lists/gentoo-dev/archive -> /va=
r/listarchives/gentoo-dev/archive

However no mail is being written to the new archive location at all.

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.8 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkeT+AwACgkQPpIsIjIzwiwQ4QCgh5zLHvMdLEhmSnLK1zYfkVUi
8dQAn01HSne80CJt++ET9IyAKMYMMtwt
=9NK0
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
