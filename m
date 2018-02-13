From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Tue, 13 Feb 2018 21:33:19 +0000
Subject: [mlmmj] Misleading operations log output: moderation & more
Message-Id: <robbat2-20180213T212446-133084908Z@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="x+6KMIRAuhnl3hBn"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Recently saw some behavior that was unclear.

The gentoo-dev-announce list is configured as an announce list.
subonlypost, notoccdenymails, nosubonlydenymails, noaccessdenymails,
moderated.

access:
- (lots of deny lines)
- moderate ^From: .*@gentoo.org
- deny

The user was subscribed as username@gentoo.org, but sent their mail with
a plus-address suffix in From. The plus-address was not subscribed.

Log output: (wrapped for reading)
mlmmj-process:=20
 access - A mail from "username+gentoo-dev@gentoo.org" with=20
 header "From: A User <username+gentoo-dev@gentoo.org>" was=20
 moderated by rule #18 "moderate ^From: .*@gentoo.org"

That was the only log line, and then it seemed to vanish.
What happened is that subonlypost was applied AFTER the access was
processed, and did not log that it decided to drop the mail.
I think that there should be a log message stating it was dropped.

Relatedly, if you try to sub an address that is already on a list, there
should be a log message (and likewise for unsub).

P.S.
'A mail' is also ambiguous on busy lists, since you could have multiple
mails being processed at the same time, need to figure out something to
describe which mail is in logging.

--=20
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iQKTBAEBCgB9FiEEveu2pS8Vb98xaNkRGTlfI8WIJsQFAlqDWZ5fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEJE
RUJCNkE1MkYxNTZGREYzMTY4RDkxMTE5Mzk1RjIzQzU4ODI2QzQACgkQGTlfI8WI
JsTWHBAApx+OMmw2DPKW8dKtnFezt42z15UglFGyTTIfnfPKBA90QtkOysj/dhBD
uV0IczGKrAbsMk2iu+oZtrKOBLTIc7SVv0ZWJET3bCvNE0fcPjHpZjm34tul0jUc
M9fEuIOWlxZZzWyNHGzBW+sO1HimEbfD+xVcE2GOO37khyTMWb3CBTWzKg0y3LwI
Eu8TWP87753DMixlELPDOkukNmJ+K1Qb8JVcCPQ2YzWF1dm9bmHNZMtg4JmbAR8i
3p3HnAZhvFKKjTZqteCpcqSQIyBj925R9kWJBl/QV04fD8y/rJRVSQxZB6cITaKt
j0B93aGWwLPNsX1qQWoVop0uvfZ9Be2TpDh+PiBqSMSJYybx0YIlcNIA+2J6gBYC
5yqfs6oXZUH7/wr2slDny0ztgvX9TRLOVYmuBer+qYR8JlWAHr3d4oYk1ohkNEY4
7bT768l6/J2BbmRMMRe4f5xstKFmPn2PxS2QhNhmsjkg8jw746cLX70vXZD2C3ZA
snojXw1YFzmQFcc9GVgOqSnY7tZoPpDftgl5IIitpxy7NbwYnxcSMoZ1pDUWGtSg
jrxR2ClB0BfriaUqKYzV1F9C6GoU5mWrKL2sNsb0+qefosqA0iwPnPzuPY5BI0Dc
9EWwS9crtKSlFXstw1uFFhdetCLcNP+Vxl5TtDvlI0OWJ9eJk6k=
=/QD+
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--

