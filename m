From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Fri, 12 Feb 2021 10:53:07 +0000
Subject: Re: [mlmmj] Selective 'notmetoo' - how to do in mlmmj or outside?
Message-Id: <20210212105307.GC20431@bonclok.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <20210210151528.GA5946@bonclok.hasiok.net>
In-Reply-To: <20210210151528.GA5946@bonclok.hasiok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Feb 11, 2021 at 08:38:52PM +0000, Chris Knadle wrote:
> That subscriber could do these rejections but create an exception for the
> mailing list. That's what I would suggest.

That would be the most logical way, but he isn't in control of the receiving
end (company email). I would guess a before-queue spam filter is configured
to deny messages that have the From: header (the RFC 822 one) with their
domain, but do not originate from their servers. My sending MTA (relayhost
from the mlmmj point of view) gets 554 5.7.1 response after DATA saying
it's a forgery. Seems quite logical, but does not take traditional mailing
lists into account.

Problem was solved today by the subscriber providing a different address and
asking me to change the subscription, which i did manually.

> A tunable list of which subscribers don't want copies would be interesting.
> IIRC I think Mailman2 might have that feature tunable on a per-user basis,
> so there is some precedent for it.

I looked at the mlmmj code yesterday and made a first attempt at it. I need
to test it somehow though. Since the problem just went away, I would need to
setup some artificial environment...

> > If I cannot stop it inside mlmmj maybe some clever trick in relaying
> > MTA (postfix)? Just an idea...
> 
> I'm not sure what this 'relaying MTA' refers to; meaning the MTA that is
> running the MLMMJ mailing list? On this it depends; the outbound MTA could
> alter the From: header, for instance, using pattern matching, at least on
> some MTAs.

Yes, I referred to my own MTA which mlmmj is talking to as the relayhost.
I run postfix. I realize it's a dirty trick to alter the headers in the MTA,
I just tried to solicit some ideas how to do it on outgoing mails. I would
probably need to create some very specific milter app. I already add DKIM
headers via a milter, so it is definitely possible; I was looking for some
ready-to-use generic solution to rewrite headers. But let's forget it as
the problem is gone and I have a patch for mlmmj.

I will try testing my patch somehow, at least at the basic level - to see
if mlmmj omits sending a copy to the listed subscriber. I would like to
publish it once it's ready, but I am not aware what's the current policy
of supplying patches to be incorporated in future versions of mlmmj.

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

