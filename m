From: martin f krafft <madduck@madduck.net>
Date: Tue, 21 Sep 2004 14:22:19 +0000
Subject: Re: feature requests
Message-Id: <20040921142219.GA14334@cirrus.madduck.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
List-Id: <mlmmj.mlmmj.org>
References: <20040920191944.GA5112@cirrus.madduck.net>
In-Reply-To: <20040920191944.GA5112@cirrus.madduck.net>
To: mlmmj@mlmmj.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

also sprach Morten K. Poulsen <morten@afdelingp.dk> [2004.09.21.1242 +0200]:
> On Mon, Sep 20, 2004 at 11:21:12PM +0200, martin f krafft wrote:
> > > > Alternatively, you could not go via /etc/aliases and pass
> > > > recipient as argument to a transport/director script.
>=20
> How do you do that? Remember, we need the extended part (+stuff)
> as well.

The mailers can pass arguments to the transporters. For an example
of how I do it with postfix/mailman right now:

  http://mail.python.org/pipermail/mailman-users/2004-January/033730.html

> When you configure your mail server for mlmmj, just make sure to
> set it up to add a Delivered-To: header. Thats reliable.

I don't think sendmail/exim/zmailer can do that. But I would be
happy to be proven wrong.

In any case, this was just a heads-up. I am never going to use
anything but postfix anyway.

--=20
martin;              (greetings from the heart of the sun.)
  \____ echo mailto: !#^."<*>"|tr "<*> mailto:" net@madduck
=20
invalid/expired pgp subkeys? use subkeys.pgp.net as keyserver!
spamtraps: madduck.bogus@madduck.net
=20
it is better to have loft and lost
than to never have loft at all.
                                                       -- groucho marx

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBUDkbIgvIgzMMSnURAh/9AJ0bKUScdNM4MeEW/Gigj/pUBXSs5ACfQT05
vLOEAdaxTNE+zQwh9M+hk3o=
=vay5
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
