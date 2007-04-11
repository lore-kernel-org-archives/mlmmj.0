From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Wed, 11 Apr 2007 09:53:39 +0000
Subject: lists.gentoo.org powered by mlmmj - bugs and a feature request
Message-Id: <20070411095339.GE4502@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="IvGM3kKqwtniy32b"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've taken over maintenance of lists.gentoo.org (all powered by mlmmj
:-), some 32k unique recipients!) from the previous maintainer, and
there's a few things we're working at. First of all, two bug reports,
then a feature request.

1.
There is occasionally some mail loss that we haven't gotten to
the bottom of. I can confirm 100% that Sendmail (not my choice, trust
me) definitely piped the email to mlmmj-recieve. There should have been
some 1900 emails that went out from the input, but a lot less than that
did go out.

The splitting in the sendmail logs appear that it only got some 800
recipients from mlmmj-send, but I cannot confirm that.

All suggestions on tracing this are welcome, losing mail sucks.

2.
This was reported by one of our users:
https://bugs.gentoo.org/show_bug.cgi?id=3D173159

mlmmj appends the footer, without being aware of the encoding of the
email. It is not safe to just directly append the footer if the mail has
Content-Transfer-Encoding: base64!

3.
Now the feature request.

Without going into all of the details, I need a sane way to have
mlmmj-process to call a different application (procmail for the moment)
where it would call mlmmj-send to send out the mass email to all list
recipients (so mlmmj-process has already completed all of it's
processing at this point).
Then I also need a way to call mlmmj-send in the same way later on.=20

We're working on some asynchronous processing stuff, so breaking the
chain between mlmmj-process and mlmmj-send is the only sane way of
handling large quantities of messages.

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Council Member
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.2 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iD8DBQFGHLAjPpIsIjIzwiwRAqYpAKDbEATxAdoWINL3+gNs73BtzMiPwACg6klh
cM1oWR5GR+Ucb85Tk/gpdmg=
=HsKS
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--
