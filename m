From: martin f krafft <madduck@madduck.net>
Date: Mon, 20 Sep 2004 21:21:12 +0000
Subject: Re: feature requests
Message-Id: <20040920212112.GA12063@cirrus.madduck.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="YZ5djTAD1cGYuMQK"
List-Id: <mlmmj.mlmmj.org>
References: <20040920191944.GA5112@cirrus.madduck.net>
In-Reply-To: <20040920191944.GA5112@cirrus.madduck.net>
To: mlmmj@mlmmj.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Mads Martin Joergensen <mmj@mmj.dk> [2004.09.20.2317 +0200]:
> > Return-Path, I think.
>=20
> Return-Path is the envelope from. RFC{,2}821.

ah, right. sorry, i mixed that up.

> > Alternatively, you could not go via /etc/aliases and pass
> > recipient as argument to a transport/director script.
>=20
> In that case you might as well set the Delivered-To: in case you
> don't have, because in case you do have it, it's the envelope to.

True. But how will you make it work reliably with exim and sendmail
(and zmailer, I think)?

--=20
martin;              (greetings from the heart of the sun.)
  \____ echo mailto: !#^."<*>"|tr "<*> mailto:" net@madduck
=20
invalid/expired pgp subkeys? use subkeys.pgp.net as keyserver!
spamtraps: madduck.bogus@madduck.net
=20
"sometimes the urge to do bad
 is nearly overpowering"
                                                          -- ben horne

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBT0nIIgvIgzMMSnURAttxAJ9HPgUVyH46pT5c5L7yu5hTO0xXUgCfeG1w
bmYgOMSEVrlgmJIDfNR9+x0=
=ZGZ7
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
