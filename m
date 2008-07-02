From: Christian Laursen <xi@borderworlds.dk>
Date: Wed, 02 Jul 2008 09:07:09 +0000
Subject: Re: Maxmailsize don't work?
Message-Id: <ygfy74k1woy.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <486B3895.3010804@atpss.net>
In-Reply-To: <486B3895.3010804@atpss.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Claudio Prono <claudio.prono@atpss.net> writes:

> I'm sorry to inform you that your message could not be delivered to the
> list. Your mail was rejected due to the size limit of 20000000000 bytes.

<snip>

> What is the problem? The size is not more than 20000000000 bytes, so what's wrong?

You have set the maxmailsize value to 20 gigabytes. If you are on a 32
bit platform this is too big for the integer in which the value is
stored.

Unless this really is the limit you want to enforce (Sounds like
insanely big mails), try removing a 0 or two to get a smaller value.

I don't know if this is the problem but it is the most likely
explanation.

-- 
Christian Laursen
