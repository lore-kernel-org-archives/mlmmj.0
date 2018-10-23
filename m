From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Tue, 23 Oct 2018 21:27:24 +0000
Subject: Re: [mlmmj] Patches wanted for hashing/nesting archive directory (1M+ mails in list)
Message-Id: <robbat2-20181023T212239-981036633Z@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="e9fMjeYs+GPci+mg"
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20180807T030939-826380737Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20180807T030939-826380737Z@orbis-terrarum.net>
To: mlmmj@mlmmj.org


--e9fMjeYs+GPci+mg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(Sorry for the lag, busy month so far)

On Mon, Oct 01, 2018 at 02:45:00AM +0000, Chris Knadle wrote:
> Robin H. Johnson:
> > One of the larger gentoo.org lists recently passed 1M mails, and while
> > performance hasn't taken a noticeable hit, doing admin ops in such large
> > directories is painful.
> Mmm. Yeah that's a lot for one directory.
>=20
> > Has anybody started on patches to use a nested directory structure for
> > archive? Ideally something that supports cleanly migrating from the old
> > flat layout.
> Not that I know of, but I think there's a reason.
>=20
> Mlmmj doesn't include a "web archiver", so I think the only reason to kee=
p old
> archives in the same directory is for getting previous messages from the =
list
> via email by sending mail to <listname>-get-N@<list-domain-name> where N =
is the
> number of the desired message.  It's very unlikely that a user would want=
 to use
> this to retrieve very many messages.
Isn't the archive directory also used in the delayed/retry delivery
cases? (I need to check the moderation cases as well).

The get-N functionality does get usage in Gentoo, as we document it in
counterpart to the 'you missed some mail because your address was
bouncing'

For web-archiving, we do it entirely outside of mlmmj (subscribe the
archiver to the list, use get-N for missing mail, profit).

--=20
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

--e9fMjeYs+GPci+mg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iQKTBAEBCgB9FiEEveu2pS8Vb98xaNkRGTlfI8WIJsQFAlvPkjtfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEJE
RUJCNkE1MkYxNTZGREYzMTY4RDkxMTE5Mzk1RjIzQzU4ODI2QzQACgkQGTlfI8WI
JsTuXA//aD/DOarQrlKd1iMeaiZ9H58Q1NnKPslmIcmkBPuvWYeHvt083JjHs/H4
hbzZze8K8JCBwHwO5uIhxUdzfA1J74wJbmaH6W/JzDB1I7bsTrHK9A7ikNtm1ulC
dmR8BVR/K2vEpCzonKqatSBbhjWqFf6+U6bdgSjMliE293VuVzeCdAjMNjjpMS1w
6Fdzgr1KbW3M6vAyhtrJtk0+dR5hthR9Sj839dUKPyPcTzoA+jF3aHFDkZVejeVl
Y49tEFPCZJYUyPVVLp6kGRcdhQRdSSYFfeyspV45DJZGhcliYAX2qM6NEL7P1i5n
3kQnGCi5tKpgVrckcTpAen36jO0ocpCORJEWM8Ty9eD71V7UYIH9sRxX0waXcKy+
CjBykglwKE4CQim/8xdkms9jdkFiZ0jj8MaApAE/FCNro7Pe5fiLcA6cZpTW+1gs
vNIOLmvxo0VE+AFD0ZXvoVPJHunfvgzS7z07bgRgIxXwQtIKTRA4epVDdQCw4kEu
S5nbzljivXvSccXxczwsRx1BM8tyyzDwOgrnJBFA7kXM0EpFB74uAc7XiF/EEX59
9x0Pov7VZKPq6H+hc6C47CIWCOZf9thSR1Tmrj/ZBKYgcjfa6/h4L9QojEzK0kf6
6Aa9OG8KzAgvdPg9oElFrjCO2qFv1Ghr89TYN4D3gftHMP7o1n0=
=9rvM
-----END PGP SIGNATURE-----

--e9fMjeYs+GPci+mg--

