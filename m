From: =?UTF-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Date: Thu, 13 Oct 2016 13:10:00 +0000
Subject: [mlmmj] Subscription confirmation address length vs RFC 5321
Message-Id: <20161013151000.3b8848ae.mgorny@gentoo.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/4g1HjDOLeb/217OZtHrBzRH"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

--Sig_/4g1HjDOLeb/217OZtHrBzRH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello, everyone.

We've recently had a report that one of our users was unable to confirm
subscription to our mailing lists [1]. It turns out, that in some cases
the length of the local part of the subscription address exceeds
the limit of 64 characters imposed by RFC 5321 (SMTP) [2].

While it didn't cause any major issues so far, it seems that a growing
number of new mail providers are actually enforcing more strict
policies and refusing to send e-mail with the length exceeding limits
imposed by the RFC.

FWICS, the local part of the subscription address is constructed
of the following segments:

  mailing-list-name "+confsub-" 16-random-hex "-" sender-address

Out of this, the middle segments already take 26 of 64 allowed octets.
The longest name in our mailing lists has 26 characters. If we round
that up to 32, we already get 58 of 64 which leaves practically no room
for the sender address. I think the sender address can legally be up
to 64+1+255 =3D 320 characters (unless I'm missing some additional
restriction).

Of course, I'm talking about the limits here. Commonly, the mailing
list names and sender addresses will be shorter but they are still
barely fitting in the 64 octets allowed by the RFC. Therefore, I'd like
to ask about the possibility of shortening the subscription addresses.

My first thought would be to remove the sender address part. I think we
should be able to reasonably assume the 16 random hex digits should be
unique enough to reduce the possibility of collision and the sender
address is stored inside the file anyway.

What do you think?

[1]:https://bugs.gentoo.org/show_bug.cgi?id=3D596794
[2]:https://tools.ietf.org/html/rfc5321

--=20
Best regards,
Micha=C5=82 G=C3=B3rny
<http://dev.gentoo.org/~mgorny/>

--Sig_/4g1HjDOLeb/217OZtHrBzRH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQJ8BAEBCgBmBQJX/4epXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQ2REJCMDdDQzRGMERBRDA2RUEwQUZFNDFC
MDdBMUFFQUVGQjQ0NjRFAAoJELB6GurvtEZOVBkQAJUSsLUDhg8mRqgC7SNu/6EZ
saVb1slspy6QcR8HXzsbtHRYCeUt1CzDnA/x2kYqNaPuUolF7lyjwkHe0uxb2Y20
tyfF98ZZF5CbB/rDVbg8vqQw94Ob8bKzCv3gXNW6iPfIGW2RpgYryVrXyB5sWaym
6LFf0bdZnrWspzBhgez5ENU6Uar+rS+/wSC9S89CyIjjJcrLKzKscirwGckL6lmp
Xr7Ex4xSNiF+HTBE9k72bxCUZyOjcVx+G9dHKhc3HPRTjPrOW3YJoAhbsc0ZC7Yd
hjqud1HJ+xtrmZe0f7JHi83wEN0voeRrh4lEgR9vaxTnqbEArpuxvbnD+xmlgg68
qGySRnapBR6LdXNGEXaoqFF4xNQPJcpj74URo+CXAXQdXlx1rzHvODeamS/01OY0
9W0a2nYB9jic3tpJhH+GdVZwlGNAnKsgQIZoWjql173eAAum+gHCPa+7Ok/jXoFY
QCBzkDMEy8ib+NB510ti8/ry0WA/DXTVdVu/pMIx/VGDA5UmnnbHSLdEONwSxiVA
+xu1Wr5+J9q8v2A72yjFRGI+3yGwP0ugZaVcULLmheeg5GQj6Gq30c8DZN6is4nE
aDKUco1mZT0Nd9YohSTgvx902YLo7L+9CJVHznRcOquw2Z5+8VoWK0ysKd83VpaX
knWb4L/9yBA8u0RT9x6b
=ltry
-----END PGP SIGNATURE-----

--Sig_/4g1HjDOLeb/217OZtHrBzRH--

