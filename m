From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 11 Oct 2005 14:42:46 +0000
Subject: Re: mlmmj Spanish translation
Message-Id: <20051011144246.GQ17022@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <8511b92f05090806466e1c973d@mail.gmail.com>
In-Reply-To: <8511b92f05090806466e1c973d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* Marcelo E. Magall=F3n <marcelo.magallon@gmail.com> [Oct 11. 2005 16:37]:
> > That's why they're not UTF-8?
>=20
> I meant any non-ASCII characters.  Enrique's files are ISO-8859-1 (or
> -15, whatever) and they will lead to the same kind of trouble.  You
> need a header that states that the body of the email is binary-encoded
> and that the charset is ISO-8859-1.  The files I sent initially did
> exactly this because you can't rely on the MTA to add such headers.
>=20
> More problematic is this:
>=20
>     Subject: =D3rdenes disponibles para $listaddr$
>=20
> because the encoding of the subject has to be embedded in the subject
> line itself ... which is exactly what the files I sent did and Enrique
> dutyfully broke.

I think Morten has a gigantic encoding patch coming up, to fix these
things. Morten?

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
