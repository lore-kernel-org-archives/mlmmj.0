From: Sebastian Harl <sh@tokkee.org>
Date: Mon, 16 Mar 2009 09:21:53 +0000
Subject: mlmmj: sends welcome E-mail when 'submod' is enabled
Message-Id: <20090316092139.GA17355@albany.tokkee.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Package: mlmmj
Version: 1.2.15-1.1
Severity: normal

Hi,

(Cc'ing the mlmmj mailinglist - a comment would be appreciated.)

When using mlmmj-sub without -c (i.e. subscription is supposed to happen
silently), mlmmj sends a welcome E-mail to the newly added user after
approving her when 'submod' is enabled. The user also gets a
notification that her subscription is waiting for approval by the
moderator.

Imho, it's not even desired that moderation should take place when
adding a user from the command line.

In any case, it would be nice if the user does not get any E-mails
unless -c is used.

TIA,
Sebastian

--=20
Sebastian "tokkee" Harl +++ GnuPG-ID: 0x8501C7FC +++ http://tokkee.org/

Those who would give up Essential Liberty to purchase a little Temporary
Safety, deserve neither Liberty nor Safety.         -- Benjamin Franklin


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFJvhojEFEKc4UBx/wRAgRGAJ4xePkwlcgDYeNEtdTTH85mMJciPgCghb0y
9CwU3IXDXakbEM6R4jYdcQU=
=g3/d
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
