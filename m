From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Sat, 02 Oct 2010 08:27:56 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <AANLkTinhxmQQNuPsTAX3b1XFwytoi=2h1ap=ebq6ARkJ@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Sat, Oct 2, 2010 at 10:14 AM, Christian Gleerup
<christian.gleerup@swn.nu> wrote:
> I just checked the file, and it indeed contained a whitespace character
> (\r)
>
> this must have been an error when I made the mass subscribe system, I
> will look out for this, but it would be nice if the system was a bit
> more robust, and automatically removed trailing whitespaces :)

I believe it does remove trailing whitespaces, but that's not a
whitespace, that's a carriage return. We agree that it should be able
to handle it, and be more robust, since \r is not a valid emailaddress
character.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
=A0and totally illogical, with just a little bit more effort?"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 -- A. P.=
 J.


