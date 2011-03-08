From: Moritz Wilhelmy <ml+mmj@wzff.de>
Date: Tue, 08 Mar 2011 16:21:52 +0000
Subject: Re: [mlmmj] Special version of list where post doesn't get sent back
Message-Id: <20110308162152.GC4806@barfooze.de>
List-Id: <mlmmj.mlmmj.org>
References: <20110308154817.GB4806@barfooze.de>
In-Reply-To: <20110308154817.GB4806@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Lukas,

On Tue, Mar 08, 2011 at 05:13:07PM +0100, Lukas Fleischer wrote:
> Why would someone get mails twice? Do you mean having the mail in some
> outgoing mailbox as well as in the mailing list inbox?

Yes.

> I guess this is desired and useful in almost all cases (especially when
> having an MUA that supports threading) and I can't imagine a reason to do it
> differently (except from broken MUAs and hard bandwidth limits).

Yes, but some people have different opinions on this. I don't know why he wants
this, I guess because mailman also does it, or supports it when configured
accordingly.

> Also, wouldn't configuring the end user's MDA to deliver ML mails
> originating from oneself to "/dev/null" be a sane workaround?

I usually append them to /dev/null in the Fcc-hook and keep only the copy
received from the MLM. A workaround is still a workaround. Rather than setting
this in 100 subscriber-MDAs, it might be easier to have support for this in the
MLM.

Well, anyway, thank you. You have some valid points there :)


Best regards,

Moritz

