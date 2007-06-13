From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 13 Jun 2007 22:46:01 +0000
Subject: mlmmj-1.2.14-cvs20070614 - now with unicode
Message-Id: <4281ad3decdd0624cbd65d631c0a6595@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org


Hi List,

I've just uploaded yet another CVS snapshot:

a44a16243c8d2f64da0a5af92244ac4e
http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.14-cvs20070614.tar.bz2

6e1bd351d635d7933aa87d2e27e685d8
http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.14-cvs20070614.tar.gz

Tonight's feature: unicode support!

I have changed the way listtexts are parsed. From now on, there
will be no non-USASCII characters in the listtext files. If you
need a character you simply put \uXXXX in its place, where XXXX
is the unicode number (hexadecimal) for that glyph.

--- the old way ---
Subject: =3D?iso-8859-1?Q?Tilmeldingsforesp=F8rgsel?=3D for $listaddr$

Der venter en tilmeldingsforesp=C3=B8rgsel fra
--- end ---

--- the new way ---
Subject: Tilmeldingsforesp\u00F8rgsel for $listaddr$

For at godkende denne foresp\u00F8rgsel, send et svar til
--- end ---

The subject is encoded (if needed) after keyword substitution. The
mail body is transferred in 8bit as UTF-8.

Anybody submitting (or committing) a patch with non-USASCII
characters after today will have his most significant bit cleared,
if you know what I mean ;-)

Morten

--=20
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

