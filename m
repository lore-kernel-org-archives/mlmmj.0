From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 15 Dec 2004 20:25:25 +0000
Subject: Re: bug: blank subjects do not get list subject prepended
Message-Id: <20041215202525.GB27262@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20041215192938.GN32117@mail.lieber.org>
In-Reply-To: <20041215192938.GN32117@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* Kurt Lieber <klieber@gentoo.org> [Dec 15. 2004 20:29]:
> Not sure how to explain this except with an example.
>=20
> With our list, gentoo-core, all subjects get [gentoo-core] prepended.  So:
>=20
> Subject: test message
>=20
> shows up on the list as:
>=20
> Subject: [gentoo-core] test message
>=20
> If a user leaves the subject line blank, the list subject thingy doesn't
> get prepended:
>=20
> Subject:
>=20
> should show up as:
>=20
> Subject: [gentoo-core]
>=20
> but it doesn't.
>=20
> This makes users who rely on these keywords for procmail filtering unhapp=
y.

Are you sure there's a Subject: line in the raw mail, and it's not only
your mailclient suggesting there is one?

If I send a mail with mutt with empty subject, there is no Subject:
header at all.

mlmmj only adds subject prefix to a Subject: header.

--=20
Mads Martin Joergensen, http://mmj.dk                           B=C5K!
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
