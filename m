From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Wed, 04 Jun 2008 21:48:22 +0000
Subject: Re: Changing mailing list subscription process
Message-Id: <20080604214822.GB5612@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8GpibOaaTibBMecb"
List-Id: <mlmmj.mlmmj.org>
References: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
In-Reply-To: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
To: mlmmj@mlmmj.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2008 at 08:58:44AM +0200, Morten K. Poulsen wrote:
> On Tue, 2008-06-03 at 22:08 -0700, Robin H. Johnson wrote:
> > Presently, the listtexts (eg sub-confirm) only provide the Subject
> > header. Even if you add 'Precedence: bulk', it gets placed in the body
> > of the mail.
> Yes, the templates are for translatable text.
Is the common name of a mailing list not translatable?

> > or with a customadminheaders control.
> Way better.
The only downside in this is no different custom headers per different
types of admin mails.

At the risk of complexity then:
$LISTDIR/control/customheaders/$MAILTYPE

> > Secondly, we need to change how the reply-to is built for the various
> > emails. Instead of passing -R to mlmmj-send, we must move the build to
> > the templates.  So ALL existing templates would need this addition to
> > maintain the existing behavior:
> > Reply-To: $confaddr$
> Well, Reply-To header is not a translatable text, so it should not be in
> the translation file.
Reply-To: "$REALNAME$" <$listaddr>
REALNAME is translatable.

> Anyway, what would you change the Reply-To header of subscription
> confirmation mails to, in order to let human users choose "Reply" in
> their MUAs to subscribe, but not let robots do the same?
I'm specifically making it so that users have to copy the correct reply
address out of the body of the email.

Just hitting Reply and then Send in their MUA will deliberately no
longer be sufficient. (But I'm sure better idiots will be invented, such
is life).

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkhHDaYACgkQPpIsIjIzwizsYwCeP2a5DDY9fvRF0lisbUxB07e8
JeYAn26+LuvYIF7okYy8jwLosxPRiL1S
=Ezuu
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
