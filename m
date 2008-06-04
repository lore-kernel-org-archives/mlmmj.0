From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Wed, 04 Jun 2008 05:08:55 +0000
Subject: Re: Changing mailing list subscription process
Message-Id: <20080604050855.GL16364@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6AmSH+YAqnsWd9jO"
List-Id: <mlmmj.mlmmj.org>
References: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
In-Reply-To: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
To: mlmmj@mlmmj.org


--6AmSH+YAqnsWd9jO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 02, 2008 at 11:55:33PM +0200, Mads Martin Joergensen wrote:
> * Robin H. Johnson <robbat2@gentoo.org> [May 30. 2008 01:09]:
> > Here's how they are conducting the attack:
> >=20
> > 1. Spammer forges a mail from $LIST+subscibe@gentoo.org, sending it to
> >    an auto-responder.
> > 2. Lists sends a confirmation mail to the auto-responder.
> > 3. Auto-responder sends mail, with intact confirmation data back to the
> >    confirmation address (in Reply-To).
> > 4. Auto-responder is now subscribed to the mailing list.
> > 5. Spammer forges a mail from the auto-responder, to the normal mailing
> >    list address.
> >=20
> > I tried adding a specific Reply-To address in the header of the list
> > text/ file, but it's made to part of the mail body instead of the
> > header.
>=20
> So what exactly would help you--I would be glad to cook up a patch to
> test some things for you, but I need to know exactly what you want (yes,
> I'm getting old and lazy--too lazy to figure it out myself :)
Presently, the listtexts (eg sub-confirm) only provide the Subject
header. Even if you add 'Precedence: bulk', it gets placed in the body
of the mail. So first step would be supporting mail headers in list
text templates either directly, or with a customadminheaders control.

The normal customheaders is not suitable for admin mails, as it may
contain headers that you only want on real messages.

Secondly, we need to change how the reply-to is built for the various
emails. Instead of passing -R to mlmmj-send, we must move the build to
the templates.  So ALL existing templates would need this addition to
maintain the existing behavior:
Reply-To: $confaddr$

> BTW, wouldn't ezmlm be prone to the same attacks?
Yes it would. Ditto anything else that sets Reply-To.

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--6AmSH+YAqnsWd9jO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkhGI2cACgkQPpIsIjIzwixN/gCgzC5L/OsvpkdPqz6zIjjpJPeI
CHkAoOm6usHEiqPetRCVX+PJOF/OnafK
=L7j6
-----END PGP SIGNATURE-----

--6AmSH+YAqnsWd9jO--
