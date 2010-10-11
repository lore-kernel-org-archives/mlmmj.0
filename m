From: Steve Beattie <steve@nxnw.org>
Date: Mon, 11 Oct 2010 17:20:24 +0000
Subject: Re: [mlmmj] text template bug in Ubuntu package
Message-Id: <20101011172024.GB2272@nxnw.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vN1VrOpIkjMGbM/7"
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTikk5ZKs3C=y2GOabbeRf2=WTApsNdauTaxHPYR-@mail.gmail.com>
In-Reply-To: <AANLkTikk5ZKs3C=y2GOabbeRf2=WTApsNdauTaxHPYR-@mail.gmail.com>
To: mlmmj@mlmmj.org


--vN1VrOpIkjMGbM/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2010 at 09:54:29PM +0800, Thomas Goirand wrote:
> Also, Ubuntu guys seems to be only migrating the package from Debian
> SID, and it doesn't seem that anyone is responsible for the package per
> say. So if we need to have something updated, it will have to be done in
> Debian.

Yes, correct, Ubuntu doesn't carry any local changes to mlmmj; the
package just gets synced from Debian unstable. Once it's fixed in
unstable, it should get pulled into the development version relatively
shortly, at least before the Debian Import Freeze portion of the
release cycle.

> Now, we just missed Maverik, and I have no visibility if there's a way
> to have the already released version of Ubuntu updated... I'll try to
> have this fix included for Squeeze though.

The way to fix things in Maverick (10.10), Lucid (10.04), or
other released version is through a Stable Release Update process,
documented at <https://wiki.ubuntu.com/StableReleaseUpdates>. I can
certainly help out on the Ubuntu side of things, if it's considered
an important enough issue to fix.

--=20
Steve Beattie
<sbeattie@ubuntu.com>
http://NxNW.org/~steve/

--vN1VrOpIkjMGbM/7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBCgAGBQJMs0dYAAoJEC8Jno0AXoH0zsAQAIxLW9e1Ud3KRQxoBxTRp3Pt
TrnC2gG1QJr1z8jx8O600kBIFEhk6F5pAeZI0HiaAa7JslJWcFRw7Jb5yMjf6Mct
4Uu74fNbSW2X/FDD7BJoXhzx6UqJXev6DYlzzgUMWD632KXkxgkI8kkcr5xf+pGd
MFapbJ7Kgyqj265yuQXoS5FWthRjoGXazfTQwALerj1ahZUBqjzuOI8CsuPjfrK5
4mBBR3Aq5ht7MaCI0NY95N6bhl6UvRHiQKEsGXlBzqXkSkW84au/mk2cfwDCI7t/
OedNJNND2WZkMqARUMitarcyAWoI0fSySdmtox4v7AGp5VG/BTfFKxSr1RfPP+kB
0+/nUsFpvgcQrL2eCs6mxFX7pvBf4KZTvt6DuD924i7E3+zl80jX31yVX4bUMUGi
7jgAiLEgiu0MpD58Wca/BgrYjmmH9oos0mGRZlNx5crLNn1sLuK42ARLe8inGSpw
/vd4no0VBlKvGy+OPQZ2gGJhkDM52eH0h7vQNfIimK7Ned0EhLSA3ddlva9W98lH
eYHeOc70VfPkZ2RLEm7CL//wA8v67P1okrQCG2h94wTS9OuJ4DpEaRKpIoMG4x8U
Esobf9If5han33/m435Kg2nJImTo8gauj3wahfCI0FlJaoF2FICAns3tUjgoM/a4
E8848sV+0EQBZWWAL9Wt
=GIHo
-----END PGP SIGNATURE-----

--vN1VrOpIkjMGbM/7--

