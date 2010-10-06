From: =?ISO-8859-1?Q?Mads_Martin_J=F8rgensen?= <mmj@mmj.dk>
Date: Wed, 06 Oct 2010 10:50:09 +0000
Subject: Re: [mlmmj] Cannot remove mail adress
Message-Id: <AANLkTi=+209Ow91UYUcAtJi4cdd+0us69=uH9=hojNPy@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <1285524372.2905.16.camel@cg-desktop>
In-Reply-To: <1285524372.2905.16.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Wed, Oct 6, 2010 at 9:55 AM, Ben Schmidt
<mail_ben_schmidt@yahoo.com.au> wrote:
>> I believe it does remove trailing whitespaces, but that's not a
>> whitespace, that's a carriage return.
>
> I think that's a whitespace. Non-linear, but still whitespace.

According to the ASCII definition:

13	0D	CR	Carriage return

:-) It's from the old days of typewriters, where to start a new line
in your text, you first have to do a newline, and then send the
carriage back to the beginning of that line.

$ cat carret.c && gcc -o carret carret.c && ./carret
#include <stdio.h>

int main(int ac, char **av) {
        printf("ASCII Val: [%d]\n", (int)'\r');

        return 0;
}
ASCII Val: [13]

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
=A0and totally illogical, with just a little bit more effort?"
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 -- A. P.=
 J.


