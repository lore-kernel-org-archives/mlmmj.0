From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 21 Sep 2004 14:54:41 +0000
Subject: Re: feature requests
Message-Id: <20040921145441.GK1826@mopo.tv2.local>
List-Id: <mlmmj.mlmmj.org>
References: <20040920191944.GA5112@cirrus.madduck.net>
In-Reply-To: <20040920191944.GA5112@cirrus.madduck.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, Sep 21, 2004 at 04:22:19PM +0200, martin f krafft wrote:
> The mailers can pass arguments to the transporters.

OK, so adding an optional argument to mlmmj-receive with the envelope-to
will solve this issue for all mailers. If your mailer does not support
adding Delivered-To: you can pass it as an argument and have
mlmmj-receive add it. That should work for all cases, right?

> > When you configure your mail server for mlmmj, just make sure to
> > set it up to add a Delivered-To: header. Thats reliable.
> 
> I don't think sendmail/exim/zmailer can do that. But I would be
> happy to be proven wrong.

I know Exim can, but I think sendmail needs to be patched to do it. I
don't know about zmailer.

> In any case, this was just a heads-up. I am never going to use
> anything but postfix anyway.

Some people might be using sendmail, and we want them to be able to use
mlmmj too :-)

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
