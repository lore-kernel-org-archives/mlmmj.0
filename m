From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 20 Sep 2004 20:04:31 +0000
Subject: Re: feature requests
Message-Id: <20040920200431.GS76919@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040920191944.GA5112@cirrus.madduck.net>
In-Reply-To: <20040920191944.GA5112@cirrus.madduck.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* martin f krafft <madduck@madduck.net> [Sep 20. 2004 21:56]:
> > High on the TODO is the ability when posting to a subscribers only
> > posting list to get a reply whether one wants to be able to post from
> > this address in the future. A simple reply to that mail will subscribe
> > the address to the nomail list which is already implemented, just not
> > released yet.
> 
> Yeah, that would be nice.
> 
> However, please take care with automatic replies and the like.
> Challenge Response systems (of which this is one) are very painful
> if not done right; and I know not aof a single one done right.
> 
> http://kmself.home.netcom.com/Rants/challenge-response.html

We send mails to the envelope from (Return-Path:) for confirmation of
subscription. I'm sure you want that?

> > This way one can have one address subscribed getting the mail, and
> > a bunch of addresses subscribed without getting any mail.
> 
> Please allow for manual setting of such aliases as well. The nice
> thing about majordomo2's approach is that the addresses lose their
> right to post when someone unsubscribes. I don't think you can do
> that with the challenge system.

With mlmmj there's a seperate 'version' of the list, just like the
way digests are done in ezmlm.

If you send a mail to listname+subscribe-nomail@domain.tld you subscribe
to the list without getting any email from it ever. Handy if you read
your lists via the web, or through a news gateway.

So what could be done simply treat postings to a subscribers only
list from emails not subscribed, as if they were trying to subscribe to
the nomail version of it.

This way they only need one reply, and they are allowed to post from
this address.

To do it right, the mail that was originally sent, will of course be
posted to the list, if the person subscribes to the nomail version--a
little bit like moderation.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
