From: fifadd@tin.it
Date: Mon, 18 Jul 2005 21:32:21 +0000
Subject: Re: mlmmj 1.2.9 UNOFFICIAL release, with qmail support
Message-Id: <42D3CDD00000B17A@ims3a.cp.tin.it>
List-Id: <mlmmj.mlmmj.org>
References: <42D3CDD00000AB73@ims3a.cp.tin.it>
In-Reply-To: <42D3CDD00000AB73@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Memory leaks? This is very strange because I don't make any malloc that I
remember. Where did you find them?
I have inserted only some comments FFF, that you can easily catch (then remove)
using a grep 'FFF' *. But there are changes in a lof of files and only three
or four of them are signed by FFF characters sequence, If you need it I can
make a patch, but you can make it by yourself. Simply remove the few FFF
comments from listcontrol.c, mlmmj-process.c and mlmmj-send.c. Also remove
the commented code that follows the FFF comment only.
I have used the existence code style, and the existence functions, like your
contactstr.
I'm waiting your response.

Kind regards.

-Filippo Fadda

>-- Messaggio originale --
>Date: Mon, 18 Jul 2005 22:29:33 +0200
>From: Mads Martin Joergensen <mmj@mmj.dk>
>To: mlmmj@mmj.dk
>Subject: Re: mlmmj 1.2.9 UNOFFICIAL release, with qmail support

>There's a few memory leaks, and it's also changing the coding style of
>the existing code.
>
>What if you try removing all the stuff you commented out, and then
>instead of sending a whole tar-ball, create a patch with:
>
>$ diff -urpN mlmmj-1.2.8 mlmmj-1.2.9 > recipdelim.patch
>
>and then gzip the patch?
>
>-- 
>Mads Martin Joergensen, http://mmj.dk
>"Why make things difficult, when it is possible to make them cryptic
> and totally illogical, with just a little bit more effort?"
>                                -- A. P. J.


