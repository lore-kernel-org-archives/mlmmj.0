From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 31 Aug 2004 16:58:11 +0000
Subject: Re: trouble configuration
Message-Id: <20040831165810.GA45017@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4134A2AB.2050202@gentoo.org>
In-Reply-To: <4134A2AB.2050202@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Luca Mercuri <siggy@gentoo.org> [Aug 31. 2004 18:09]:
> I have tried to install mlmmj 1.0.0-RC2 on my box.
> 
> I have followed all the steps indicates on README file but, at the
> end, when i try to send message on test list the message comes saved
> in 'incoming' and 'queue' directory.  The message doesn't sended to
> user of list.
> 
> I think that for these exist mlmmj-maintd but these don't work.  I try
> on daemon mode and with crontab.
> 
> Someone can help me?

No, mlmmj-maintd is only needed for maintenance, not for sending mails.

You say the mail gets stuck in the queue/ directory? Is there a copy both
in the incoming/ and in the queue/ directory.

Could you try and download mlmmj-1.0.0-RC1 and compile it and try and
use the mlmmj-process of that one? Copying it over the other
mlmmj-process is ok since they're compatible.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
