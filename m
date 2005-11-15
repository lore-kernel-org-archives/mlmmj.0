From: Neale Pickett <neale@woozle.org>
Date: Tue, 15 Nov 2005 21:22:14 +0000
Subject: Re: case sensitivity of email addresses
Message-Id: <200511151422.15033.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <200511150837.22197.neale@woozle.org>
In-Reply-To: <200511150837.22197.neale@woozle.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Tuesday 15 November 2005 02:00 pm, Enrique Mat=EDas S=E1nchez wrote:
>
> FWIW, this is what RFC2821 says about:
>
>    The local-part of a mailbox MUST BE treated as case sensitive.=20
> Therefore, SMTP implementations MUST take care to preserve the case of
> mailbox local-parts.  Mailbox domains are not case sensitive.  In
> particular, for some
>    hosts the user "smith" is different from the user "Smith".
> However, exploiting
>    the case sensitivity of mailbox local-parts impedes interoperability a=
nd
> is discouraged.

Right, so it's not clear to me what we're supposed to do in the face of som=
e=20
mail clients changing the case of the local-part.  Given that "exploiting t=
he=20
case sensitivity of mailbox local-parts ... is discouraged", I propose the =

RFC is suggesting the check be case-insensitive.

Neale
