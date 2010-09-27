From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Mon, 27 Sep 2010 01:36:02 +0000
Subject: Re: [mlmmj] undesired help emails
Message-Id: <robbat2-20100927T012640-443590075Z@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1UWUbFP1cBYEclgG"
List-Id: <mlmmj.mlmmj.org>
References: <4C960847.7000102@yahoo.com.au>
In-Reply-To: <4C960847.7000102@yahoo.com.au>
To: mlmmj@mlmmj.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2010 at 11:19:30AM +1000, Ben Schmidt wrote:
> http://mlmmj.org/hg/mlmmj/file/32d3f7e3b523/README.listtexts
>=20
> Note that $whatever$ substitutions are supported in the headers. I think
> this means you should be able to code pretty much whatever you want in a
> list-independent way and continue to use shared listtexts.
I'm wondering if we added existing customheaders to administrative mails ma=
ybe,
since we can have the other per-listtext headers.

However, it would require an override order of:
mlmmj default
customheader
listtext

Which might introduce other bugs.

> Is there something I'm missing?
Reviewing that README.listtexts, the only header not covered by the above is
List-Id. All the rest are covered nicely by the new header functionality.

Examples from the Gentoo lists:
List-Id: Gentoo development announcement list <gentoo-dev-announce.gentoo.o=
rg>
List-Id: Gentoo Development-related help <gentoo-devhelp.gentoo.org>
List-Id: Gentoo Foundation Official Announcements <gentoo-foundation-announ=
ce.gentoo.org>
List-Id: Gentoo Graphical User Interfaces Project <gentoo-guis.gentoo.org>
List-Id: Gentoo Lisp mail <gentoo-lisp.gentoo.org>
List-Id: Gentoo Package Manager Specification discussions <gentoo-pms.gento=
o.org>
List-Id: Gentoo Project discussion list <gentoo-project.gentoo.org>
List-Id: Gentoo SCM discussions <gentoo-scm.gentoo.org>
List-Id: Gentoo Greek Users <gentoo-user-el.gentoo.org>
List-Id: Gentoo Dutch Users <gentoo-user-nl.gentoo.org>
List-Id: Gentoo Turkish Users <gentoo-user-tr.gentoo.org>
List-Id: Gentoo VDR list <gentoo-vdr.gentoo.org>

> I'll look at your specific examples in more detail later. Thanks for
> forwarding them.
The bulk header should cut a lot of them.

--=20
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks - The text below is a digital signature. If it doesn't make any sense to you, ignore it.

iEYEARECAAYFAkyf9QIACgkQPpIsIjIzwiykCQCgjwcQvoS31E9cvak5VCVb54Rp
rPgAoJns0A7FYsPIfN9w10pW5K+rbMdJ
=jixT
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--

