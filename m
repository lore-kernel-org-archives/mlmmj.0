From: =?ISO-8859-1?Q?Marcelo_E=2E_Magall=F3n?= <marcelo.magallon@gmail.com>
Date: Tue, 11 Oct 2005 13:49:07 +0000
Subject: Re: mlmmj Spanish translation
Message-Id: <937117890510110649t2c55f761gb12b43a1ca59d637@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <8511b92f05090806466e1c973d@mail.gmail.com>
In-Reply-To: <8511b92f05090806466e1c973d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 10/11/05, Enrique Mat=EDas S=E1nchez (Quique) <cronopios@gmail.com> wrot=
e:

> The Danish and German translations don't use UTF-8 encoding for the
> extended ASCII characters, so I didn't either.

That's wrong.

mlmmj won't do anything with the text it reads from the files
coding-wise, so it's certain that using UTF-8 characters without
including *some* header to that effect will break a system somewhere.

Marcelo
