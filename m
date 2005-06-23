From: Csillag =?iso-8859-2?Q?Tam=E1s?= <cstamas@digitus.itk.ppke.hu>
Date: Thu, 23 Jun 2005 16:27:57 +0000
Subject: Re: RFC 2047 encoding of mlmmj mails
Message-Id: <20050623162757.GA1843@digitus>
List-Id: <mlmmj.mlmmj.org>
References: <937117890506221350629a2636@mail.gmail.com>
In-Reply-To: <937117890506221350629a2636@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi,

On 06/22, Marcelo E. Magall=F3n wrote:
> Hi,
>=20
> first and foremost, thank you! mlmmj is really a joy!
>=20
> I just finished translating my list/text/ files to Spanish (I can
> contribute the translations if someone else is interested), and I ran
> into a little problem.  The subject lines contain non-ASCII
> characters, like this:
>=20
>     Subject: Moderaci=F3n requerida para $listaddr$
>=20
> According to RFC 2047 that should read something like:
>=20
>     Subject: =3D?UTF-8?Q?Moderaci=3DC3=3DB3n=3D20requerida=3D20para=3D20$=
listaddr?=3D

You can solve this problem this way:
=3D?utf8?Q?Moderaci=3DC3=3DB3?=3D??=3D?utf8?Q?n?=3D requerida para $listadd=
r$
(this the way my mailer does)

AFAIK you do not need to encode the entire line.

--=20
Boy, backups sure are a lot faster since I linked /dev/st0 to /dev/null...

cstamas
