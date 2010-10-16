From: Florian Effenberger <floeff@gmail.com>
Date: Sat, 16 Oct 2010 12:44:24 +0000
Subject: Re: [mlmmj] special characters in footer
Message-Id: <AANLkTi==j-scr8dQyT7EFEBx=9YkUYfurUjYPwcSif+X@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTin_rSVkHWKOL1MmEWtBL_WixeY2e1tar3=mbSZR@mail.gmail.com>
In-Reply-To: <AANLkTin_rSVkHWKOL1MmEWtBL_WixeY2e1tar3=mbSZR@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Ben,

2010/10/11 Ben Schmidt <mail_ben_schmidt@yahoo.com.au>:

>> is there an easy fix to add special characters to the footer? When the
>> footer is UTF-8 and has things like Umlauts, and is added to an
>> ISO-8859-15 mail, it's screwed up :-(
>
> I'm pretty sure there isn't!

:-)

> I think the way this is usually solved is by adding a new MIME part.
>
> Eventually I plan to move all content filtering/modification stuff like
> this out of Mlmmj into external programs, called through appropriate
> hooks. When this happens, the encoding will probably be made available
> as an environment var or something, and you could then do an appropriate
> conversion. But that's probably not going to happen any time in the near
> future, and will also probably need a bunch of discussion.
>
> At the moment, this is still done by piping the message through
> something prior to mlmmj-recieve, so Mlmmj sees every message it
> receives with the footer.
>
> I wrote a little C program that can do this, which I have attached. Feel
> free to use it. I use a slightly modified version of
> contrib/amime-receive to wrap it.
>
> There are other MIME-altering apps and scripts around on the web, too.

Thanks a lot, that is much appreciated! I gave it a try, and ideed, it
seems to work - but looks rather ugly in the mail client. ;) My idea
was to do something like:

* if charset of mail header and charset of footer file (usually UTF8)
differ, then
* recode UTF-8...headercharset footer
* add footer

By that, the original charset is preserved, and the footer is
converted into that. Should at least work for most European languages,
I hope. I will ask Alex, who wrote PyMIME, to include such a feature,
and we than can happily commit it to mlmmj. :)

Florian

