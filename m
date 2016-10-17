From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 17 Oct 2016 05:10:35 +0000
Subject: Re: [mlmmj] Subscription confirmation address length vs RFC 5321
Message-Id: <3bdb3b6d-9b71-ab56-6287-514bb7dcd88b@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20161013151000.3b8848ae.mgorny@gentoo.org>
In-Reply-To: <20161013151000.3b8848ae.mgorny@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

This seems fairly sensible to me. So I don't lose track of it, could you please 
submit a feature request on our bug tracker?

Ben



On 14/10/2016 12:10 am, Michał Górny wrote:
> Hello, everyone.
>
> We've recently had a report that one of our users was unable to confirm
> subscription to our mailing lists [1]. It turns out, that in some cases
> the length of the local part of the subscription address exceeds
> the limit of 64 characters imposed by RFC 5321 (SMTP) [2].
>
> While it didn't cause any major issues so far, it seems that a growing
> number of new mail providers are actually enforcing more strict
> policies and refusing to send e-mail with the length exceeding limits
> imposed by the RFC.
>
> FWICS, the local part of the subscription address is constructed
> of the following segments:
>
>   mailing-list-name "+confsub-" 16-random-hex "-" sender-address
>
> Out of this, the middle segments already take 26 of 64 allowed octets.
> The longest name in our mailing lists has 26 characters. If we round
> that up to 32, we already get 58 of 64 which leaves practically no room
> for the sender address. I think the sender address can legally be up
> to 64+1+255 = 320 characters (unless I'm missing some additional
> restriction).
>
> Of course, I'm talking about the limits here. Commonly, the mailing
> list names and sender addresses will be shorter but they are still
> barely fitting in the 64 octets allowed by the RFC. Therefore, I'd like
> to ask about the possibility of shortening the subscription addresses.
>
> My first thought would be to remove the sender address part. I think we
> should be able to reasonably assume the 16 random hex digits should be
> unique enough to reduce the possibility of collision and the sender
> address is stored inside the file anyway.
>
> What do you think?
>
> [1]:https://bugs.gentoo.org/show_bug.cgi?idY6794
> [2]:https://tools.ietf.org/html/rfc5321
>

