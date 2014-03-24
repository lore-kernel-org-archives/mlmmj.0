From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Mon, 24 Mar 2014 19:19:21 +0000
Subject: Re: [mlmmj] Encrypted list
Message-Id: <4004025.G86uLotGlz@trelane>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart1798861.kL2oU825ix"
List-Id: <mlmmj.mlmmj.org>
References: <20140320184234.GG23804@szaflik.hasiok.net>
In-Reply-To: <20140320184234.GG23804@szaflik.hasiok.net>
To: mlmmj@mlmmj.org


--nextPart1798861.kL2oU825ix
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On Monday, March 24, 2014 13:25:40 Patrice Levesque wrote:
> > Myself, I know only a handful of poeple that I can trust to hold th=
eir
> > mailbox secure... and even with them I don't use encrypted email ju=
st
> > because I don't have anything so sensitive to say, so it will be ju=
st
> > a hassle or a moslty pointless excercise of GPG skills.
>=20
> If I may add my 2 cents, encrypting regular non-sensitive mail does n=
ot
> appear pointless to me.
>=20
> For one thing it ensures that GPG mail setups are properly configured=

> all the time and ready when needed for critical data.
>=20
> It also gives the intelligence agencies something bogus to chew on; l=
et
> them waste resources deciphering cat pictures.
>=20
> Lastly, the current poor adoption rate of encryption makes every GPG'=
d
> mail stick out.  Encrypting non-sensitive data lessens that effect.

Agree with this.  For people I exchange encrypted email with (of which =
there=20
are very few), we've gone to encrypting 100% of our email exchanges, us=
ing the=20
same line of thinking as the above as to why.

However; none of the (many) email lists I'm on use GPG encryption, a fe=
w of=20
them use TLS for MTA transfers but several others  have purposely are s=
et not=20
to use TLS.  [The mailing lists I'm deploying use TLS transfers if avai=
lable.]



As a thought experiment, let's say that we had an opportunity to "desig=
n the=20
world of all of our friends' email".  What would that look like?

For starters, all email transfers would use TLS, and all of our friends=
 would=20
be using "private" mail servers rather than 3rd party services like Gma=
il. =20
GPG is too complicated for most of them to use, so we know most of them=
 won't. =20
The end result is that mail stored on the private servers and our local=
 hard=20
disks isn't encrypted -- with some difficulty the latter part is fixabl=
e=20
though.

As such, putting some effort wards encrypting our own filesystems seems=
 like a=20
worthwhile effort.

  -- Chris

=2D-
Chris Knadle
Chris.Knadle@coredump.us
--nextPart1798861.kL2oU825ix
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCgAGBQJTMIU/AAoJEEkSKbZEGfmqfV0P+QHmGNxh6/lRuU29WQZiF2RG
WnPRsUGAZ6TKJmok8qP60D0uDCJu67MOxoLlVbwfPmp7SIIcdsbL3nt4xfuiVaUe
pclWTDpYD73BwcW0qYrjZThcnWhe1/d2RBsRHVFFgMR/alog9g5vY+9dDiKSfVXp
f+A/69i02c1zrXRZO810g2P22D/b9u3h79xukBZQqltBplG7YG1grbn7c2OCDuRF
7hTnWKOb5EtYBkRI8KVqc+JzrXiTP3psJRZnCdld0vRFu15EmU/GIbJgeyOAkDnL
aN++QuPZTQF5P8ucqythYnV6v7rOjMoZydCFZPeWJBRBf37ImLW78AX5sID0W/r+
e11MkAdTEAc/+MWJ8Ios5vshts70657W2NNx4QxjwjxuhHXJJnHTQbxJYsQYJIYB
tJJda5l0DBo9W+gzgoSb+EuWptX7NTEQIAmlADZemAcMfpvJqK/ujdGVzUe6g+nv
7ysSRAlSU73joNLSV2oI13GzkjaLt5xzcrhqyTaO6zCVxn2jFaMtKSr/uqTrs7eN
HcZsJ4L8W5wpiwMtb/aE9n6K6EfvH0ilHy1g/vW23LZN/zMEWfsEG4MeUuWDaCbW
VhMTkrkCB5qrj7AKfCUP9aTQ4m/RA/Gq/2Gw/SnaAvibUra97PMfRy+/7ilEsahZ
KSho2YpzwyNEPTtVpr+1
=5HRv
-----END PGP SIGNATURE-----

--nextPart1798861.kL2oU825ix--


