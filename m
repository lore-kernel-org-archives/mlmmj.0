From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Thu, 11 Feb 2021 20:38:52 +0000
Subject: Re: [mlmmj] Selective 'notmetoo' - how to do in mlmmj or outside?
Message-Id: <87f0e2d9-0a8c-b5a1-da76-4930ed273ec2@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <20210210151528.GA5946@bonclok.hasiok.net>
In-Reply-To: <20210210151528.GA5946@bonclok.hasiok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Piotr Auksztulewicz:
> Hi all,
> 
> Just a poll for ideas for solving a little bugger.
> 
> I have UNSET notmetoo on all lists as I (and probably most listmembers)
> think it is useful to get a copy of own posts. However, one subscriber's
> mail server is rejecting these copies as forgeries based on From: header
> (not the envelope from).

I've read the description of the entire issue, but the above portion *is* the 
actual problem, I think. i.e. the actual problem is that the subscriber's MTA is 
set to reject "metoo" copies from the mailing mist as forgeries.

That subscriber could do these rejections but create an exception for the 
mailing list. That's what I would suggest.

I have such exceptions built for Exim4, so I know at least with that MTA it 
could be done. I'm not sure but hope it could also be done with Postfix.

And ... _which_ "From:" header are we talking about, BTW? If we're talking about 
the "apparent From:" which is in the BODY of the message rather than it being in 
the actual "headers" that the MTA would deal with, then that's not something the 
MTA should do anything to.

 > The result is as follows:
> 
> 1. A message number N arrives from subscriber A and is processed by mlmmj
> 2. mlmmj sends a copy also to subscriber A which gets rejected by his MTA
> 3. mlmmj records a bounce for subscriber A as it could not know better
> 4. A message N+1 arrives for the list from some other subscriber B
> 5. Message N+1 gets delivered to subscriber A successfully
> 6. mlmmj concludes that subscriber A's address is no longer bouncing,
>     removes the record from the 'bounce' subdirectory and send the 'probe'
>     listtext to subscriber A saying it's ok now, but he missed message N
>     (from himself)
> 7. Subscriber A gets somewhat annoyed :-(
> 
> I know I could just set notmetoo and forget about it, but other people
> may be unhappy not getting copies.

AFAIK this type of rejection requires one to be running their own MTA which is 
rather rare these days. The type of rejection they're doing is a logical choice 
to try to reject spam, but there are often exceptions to blanket rules where 
there are issues to work around.

> I am contemplating a patch to make notmetoo a tunable of type list, which
> would tell what subscribers do not want copies. But before I get to it
> (if ever) maybe there's some workaround possible in mlmmj itself or
> outside of it.

A tunable list of which subscribers don't want copies would be interesting. IIRC 
I think Mailman2 might have that feature tunable on a per-user basis, so there 
is some precedent for it.

The 'workarounds' available really depend on how the particular subscriber is 
doing the rejection rules; for instance there might be a way for the subscriber 
to add a rule to accept mail from the mailing list that would have precedence 
over the reject rule for detecting From: forgeries. If the only "workarounds" 
considered are solely in the mailing list itself, that's likely to be very limiting.

> I already use some trickery in the 'access' tunable to get rid of some
> problems with strange subscribers' MTAs (like autoresponse for EVERY
> message!), but I guess it is consulted only on inbound messages and not
> on outbound - am I right?
> 
> If I cannot stop it inside mlmmj maybe some clever trick in relaying
> MTA (postfix)? Just an idea...

I'm not sure what this 'relaying MTA' refers to; meaning the MTA that is running 
the MLMMJ mailing list? On this it depends; the outbound MTA could alter the 
From: header, for instance, using pattern matching, at least on some MTAs. Exim 
for instance could theoretically do this using "if" and "match" rules in the 
received_header_text variable, but doing so is quite messy and wouldn't 
typically be used for this type of issue.

See the "received_header_text" string setting:

https://www.exim.org/exim-html-current/doc/html/spec_html/ch-main_configuration.html

    -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

