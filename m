From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 10 Jul 2014 20:55:39 +0000
Subject: Re: [mlmmj] Allowing empty enevelope senders
Message-Id: <53BEFDCB.30301@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <3154844.GYFGS8R0Q3@storm>
In-Reply-To: <3154844.GYFGS8R0Q3@storm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> the problem here is a bit more complex: The mlmmj managed mailinglist
> gets the replies from a separate newsletter that is not managed by mlmmj.
> So the return path of that newsletter is set to an address
> that is managed by mlmmj :)
>
> Would you be ok with if I develop a patch to make
> the "discard of empty envelope address" configurable?
> Default is to keep the current behavior.

I'm not convinced yet. Why would you want these bounce messages
delivered to the mailing list? It seems to me that such a feature is
just asking for trouble on the whole.

Ben.




