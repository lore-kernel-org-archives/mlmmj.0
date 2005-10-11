From: =?ISO-8859-1?Q?Marcelo_E=2E_Magall=F3n?= <marcelo.magallon@gmail.com>
Date: Tue, 11 Oct 2005 14:37:19 +0000
Subject: Re: mlmmj Spanish translation
Message-Id: <937117890510110737o3f5aad28h87729aca96ead3b6@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <8511b92f05090806466e1c973d@mail.gmail.com>
In-Reply-To: <8511b92f05090806466e1c973d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 10/11/05, Mads Martin Joergensen <mmj@mmj.dk> wrote:
> * Marcelo E. Magall=F3n <marcelo.magallon@gmail.com> [Oct 11. 2005 15:49]:
> > > The Danish and German translations don't use UTF-8 encoding for the
> > > extended ASCII characters, so I didn't either.
> >
> > That's wrong.
> >
> > mlmmj won't do anything with the text it reads from the files
> > coding-wise, so it's certain that using UTF-8 characters without
> > including *some* header to that effect will break a system somewhere.
>
> That's why they're not UTF-8?

I meant any non-ASCII characters.  Enrique's files are ISO-8859-1 (or
-15, whatever) and they will lead to the same kind of trouble.  You
need a header that states that the body of the email is binary-encoded
and that the charset is ISO-8859-1.  The files I sent initially did
exactly this because you can't rely on the MTA to add such headers.

More problematic is this:

    Subject: =D3rdenes disponibles para $listaddr$

because the encoding of the subject has to be embedded in the subject
line itself ... which is exactly what the files I sent did and Enrique
dutyfully broke.

Marcelo

PS: I do have objections to the "improved" translation, but the crux
of the them lies in the differences between Spanish as spoken in Spain
and Spanish as spoken in the rest of the world, so I'll just let that
one slip by.  Just as an example, the proper English translation for
the subject line I'm quoting is "Available orders for $listaddr$"
instead of "Available commands for $listaddr$".
