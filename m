From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Thu, 11 Nov 2010 05:12:00 +0000
Subject: Re: [mlmmj] Potential mail loss in postfix?
Message-Id: <robbat2-20101111T050600-166504403Z@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20100928T230341-934503680Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20100928T230341-934503680Z@orbis-terrarum.net>
To: mlmmj@mlmmj.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

(No need to CC me, just send to the list)

On Thu, Nov 11, 2010 at 03:55:06PM +1100, Ben Schmidt wrote:
> On 11/11/10 2:58 PM, Ben Schmidt wrote:
> > I might have found this bug.
> >
> > If init_sockfd() fails (e.g. because Postfix has shut down so there is =
no smtpd
> > listening) it calls exit(). Mail would then fail to be archived or requ=
eued. It
> > will be in a queue file only until mlmmj-maintd cleans it up (which it =
will do as
> > soon as it finds it, as it won't have accompanying .mailfrom etc. files=
).
> >
> > Do you have logs from when this happened? Do you see "Could not get soc=
ket" or
> > "Could not connect to %s, exiting..." (%s probably is 127.0.0.1) in the=
m?
>=20
> "Could not connect to %s, exiting ..."
>=20
> Omitted a space before. Correcting myself, just in case you search for
> that part of the string and don't find it because of my error. :-)
I don't find it in the last month of syslog or mlmmj logfiles
(incidently, would be really nice to have them go to syslog...).

I've left a much larger trawl of syslog data for that box running, I'll
check for any hits in the morning (~120GiB worth of logs takes a
while...).

--=20
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkzbeyAACgkQPpIsIjIzwixlmACeN9hVgrWqrLyxpGhxckNYtJd0
hmIAoMf4r28Kt4SrQhLF5bCCzUxFbmIH
=6j0E
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

