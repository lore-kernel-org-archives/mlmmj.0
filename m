From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Fri, 30 May 2008 16:02:08 +0000
Subject: Re: Changing mailing list subscription process
Message-Id: <20080530160208.GL16364@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="/9ZOS6odDaRI+0hI"
List-Id: <mlmmj.mlmmj.org>
References: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
In-Reply-To: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
To: mlmmj@mlmmj.org


--/9ZOS6odDaRI+0hI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2008 at 01:23:59PM +0100, Chris Webb wrote:
> "Robin H. Johnson" <robbat2@gentoo.org> writes:
> >  Subject: Confirm subscription to $listaddr$
> > +Reply-To: DO NOT REPLY <devnull@localhost.invalid>
> This probably ought to be a 'cancel subscription' address rather than an
> invalid address. Mail with invalid addresses in the headers is quite like=
ly
> to get rejected or scored very poorly by spam filters. (I think we outrig=
ht
> reject on invalid envelope sender or invalid domain in From: but ignore
> Reply-To: unless there's a syntax error. However, other ISPs may be
> stricter.)
I've played with a variety of addresses for routing to /dev/null, when
we started putting Reply-To on emails that the Gentoo Bugzilla sends
out. Amongst the bits tried: '/dev/null@localhost',
'noreply@localhost'. Having the '.invalid' on the end turned out to be
important because there are some MTAs that simply reject the mail for
not having at least one dot in the host side of the email string.

The point of using an invalid domain, is to have any response NOT
traverse the entire internet and cause backscatter.

Using an unsub address in the Reply-To part would also be bad I think,
as that may allow some attacks to unsubscribe people.

In either case, mlmmj doesn't let you set a Reply-To header at the
moment for the sub/unsub mails.

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--/9ZOS6odDaRI+0hI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkhAJQAACgkQPpIsIjIzwiyfnQCgxa19ISdt/bfVjHFgBLZF9BmY
vHEAoIGUI1M58x5xcdWNP4rbA8owHxK9
=f3RR
-----END PGP SIGNATURE-----

--/9ZOS6odDaRI+0hI--
