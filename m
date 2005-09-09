From: 
Date: Fri, 09 Sep 2005 06:30:24 +0000
Subject: Listtexts encoding [was: Re: mlmmj Spanish translation]
Message-Id: <8511b92f05090823302debfb83@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

2005/9/8, Mads Martin Joergensen:
=20
> > Enrique please spell and grammar check this, and then give it a go for
> > inclusion.
>=20
> Yeah, as soon as I get the go, it's going to be in CVS.
=20
The files that Marcelo sent have the extended ASCII characters encoded
as UTF-8:
=20
    Subject: =3D?UTF-8?Q?Moderaci=3DC3=3DB3n?=3D requerida para $listaddr$
    Content-Type: text/plain; charset=3DUTF-8
    Content-Transfer-Encoding: quoted-printable
    Content-Disposition: inline
   =20
    Hola,
   =20

However, the Danish and German translations don't:

    Subject: Moderering n=F8dvendig for $listaddr$
   =20
    Hej,

=20
    Subject: Moderation f=FCr $listaddr$ gebraucht
   =20
    Hallo,



So, is UTF-8 encoding really needed?
=20
Thanks,
 Quique
=20
=20
--=20
It is impossible to make anything foolproof, because fools are so ingenious.
- Roger Berg
