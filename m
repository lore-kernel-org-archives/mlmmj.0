From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Thu, 11 Nov 2010 21:13:41 +0000
Subject: Re: [mlmmj] Potential mail loss in postfix?
Message-Id: <20101111211341.GA14847@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2/5bycvrmDh4d1IB"
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20100928T230341-934503680Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20100928T230341-934503680Z@orbis-terrarum.net>
To: mlmmj@mlmmj.org


--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2010 at 11:15:06PM +1100, Ben Schmidt wrote:
> On 11/11/10 4:12 PM, Robin H. Johnson wrote:
> > (No need to CC me, just send to the list)
>=20
> I'll try to remember that.
>=20
> > I don't find it in the last month of syslog or mlmmj logfiles
> > (incidently, would be really nice to have them go to syslog...).
>=20
> Yes. That'll be one of my highest priorities after getting 1.2.18 out.
>=20
> > I've left a much larger trawl of syslog data for that box running, I'll
> > check for any hits in the morning (~120GiB worth of logs takes a
> > while...).
Confirmed, here's a line from around when I sent the first email in this
thread:

Sep 28 21:35:38 pigeon /usr/bin/mlmmj-send[6681]: init_sockfd.c:55: Could n=
ot connect to 127.0.0.1, exiting ... : Connection refused

It happened 1333 times, in the span of 21:35:31 to 21:35:38 (all UTC)
that day.

--=20
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkzcXIUACgkQPpIsIjIzwixSRgCguq4JFIzwZQpgMYWJu3XcHMMv
CH0AnRihU22ekuUEaR5h6W9/UZ8z9tbR
=gbCr
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--

