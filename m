From: Kurt Lieber <klieber@gentoo.org>
Date: Tue, 16 Nov 2004 14:28:06 +0000
Subject: feature request: DIR/Log
Message-Id: <20041116142806.GC32117@mail.lieber.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="VxBmi9VgMIlnmxn8"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--VxBmi9VgMIlnmxn8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

One feature of ezmlm that i'd really like to see implemented in mlmmj is
the logging feature.  (DIR/Log)

This file simply logs all changes to the subscribers list.  A
semi-sanitized example from our ezmlm installation:

1100089025 -probe luke7jr@domain.com
1100089373 + scristian@domain.com Real Name Here <scristian@domain.com>
1100109364 - ANARCONDA@domain.net
1100121712 + net-burst@domain.com Net-burst <net-burst@domain.com>
1100126359 -manual khai@domain.org
1100133255 + entropydown@domain.com entropydown@domain.com
1100135850 + toojays@domain.net Real Name Here <toojays@domain.net>
1100169266 + dulmandakh@domain.mn dulmandakh@domain.mn
1100169961 + giorgosg@domain.com giorgosg@domain.com
1100183716 - stefan@domain.com


The -probe and -manual lines represent addresses that were unsubscribed
because of a list probe and a manual command by the list admin.  The others
are normal events triggered by user requests.  (listname+sub,
listname+unsub and so on)

This file is very helpful when a user complains of getting bounced off the
list -- we're able to go in and see why it happened.  Also, my own personal
preference would be to ditch the TAI64N timestamps and implement something
that's more human-readable (such as an RFC-2822 date string).

--kurt

--VxBmi9VgMIlnmxn8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBmg52JPpRNiftIEYRAuyXAJ4yCOsmahiglsCl+dGOy9zeD+vAEACgkic0
dFIz6ljoCFuHkY964DXEi28=
=Fa/E
-----END PGP SIGNATURE-----

--VxBmi9VgMIlnmxn8--
