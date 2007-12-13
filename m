From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Thu, 13 Dec 2007 12:02:02 +0000
Subject: Re: MIME encodings when dealing with adding the footer
Message-Id: <20071213120202.GL14557@curie-int.orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DgyySQcJ59QCrNUU"
List-Id: <mlmmj.mlmmj.org>
References: <1197540455.6128.23.camel@camobap>
In-Reply-To: <1197540455.6128.23.camel@camobap>
To: mlmmj@mlmmj.org


--DgyySQcJ59QCrNUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2007 at 12:49:14PM +0100, Morten K. Poulsen wrote:
> On Thu, 2007-12-13 at 14:18 +0300, Peter Volkov wrote:
> > ?? ??????, 13/12/2007 ?? 11:31 +0100, Morten K. Poulsen ??????????:
> > > Long answer: MIME parsing has been a source of vulnerabilities in alm=
ost
> > > every single piece of software which attempts to parse MIME encoded
> > > messages. Mlmmj can - in any normal installation - be triggered
> > > remotely. It's a trade-off. I have made the decision to leave out MIME
> > > parsing. I do not plan to add it, nor do I plan to accept patches whi=
ch
> > > add it.
> > Morten, but then footer feature should be dropped from mlmmj as it does
> > not work and breaks mails. Or at least big red notice should be added...
> > What do you think about this?
> Yes, a word of warning in the readme might be a good idea.
Could we have a limited feature then:
- If we think it is NOT safe to add the footer, then do not add it.

Cases where it is not safe:
1. The mail has more than one MIME part (not parse, just read the mail
headers).
2. The mail is not MIME, but is not safe encoding to muck with.

#2 was Peter's original case that he reported to me for the Gentoo lists,
a mail having the following headers:
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=3D"utf-8"
Content-Disposition: inline

Should NOT get a plaintext footer added, because it would cause the
base64 to not decode.

Here's a mail where mlmmj did this and causes gmail to screw up:
http://bugs.gentoo.org/attachment.cgi?id=3D115401

--=20
Robin Hugh Johnson
Gentoo Linux Developer & Infra Guy
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--DgyySQcJ59QCrNUU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iD8DBQFHYR86PpIsIjIzwiwRAhgcAJ9ZhCcBf+atX1j8QwqWuL0HZPfKxACgpR0M
8Fs6jeF4t2OI3ceyRffm+tA=
=cQjd
-----END PGP SIGNATURE-----

--DgyySQcJ59QCrNUU--
