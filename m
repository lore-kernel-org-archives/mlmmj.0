From: =?ISO-8859-1?Q?Marcelo_E=2E_Magall=F3n?= <marcelo.magallon@gmail.com>
Date: Wed, 22 Jun 2005 20:50:15 +0000
Subject: RFC 2047 encoding of mlmmj mails
Message-Id: <937117890506221350629a2636@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi,

first and foremost, thank you! mlmmj is really a joy!

I just finished translating my list/text/ files to Spanish (I can
contribute the translations if someone else is interested), and I ran
into a little problem.  The subject lines contain non-ASCII
characters, like this:

    Subject: Moderaci=F3n requerida para $listaddr$

According to RFC 2047 that should read something like:

    Subject: =3D?UTF-8?Q?Moderaci=3DC3=3DB3n=3D20requerida=3D20para=3D20$li=
staddr?=3D

The problem is that after expanding $listaddr, the string will contain
full stop and at characters ("." and "@"), which is not allowed by
said RFC.

The second problem is with the body, since it needs to be encoded,
too.  My guess, after reading the source, is that writing:

    Subject: some subject
    Content-Type: text/plain; charset=3DUTF-8
    Content-Transfer-Encoding: quoted-printable
    Content-Disposition: inline

    Some text...

takes cares of the problem, but I haven't tested this yet.

Thanks again,

Marcelo
