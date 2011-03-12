From: Mark Alan <varia@e-healthexpert.org>
Date: Sat, 12 Mar 2011 18:21:11 +0000
Subject: Re: [mlmmj] Any use case for subscribing to multiple versions
Message-Id: <20110312182111.409392e5@e-healthexpert.org>
List-Id: <mlmmj.mlmmj.org>
References: <4D78B56D.1020804@yahoo.com.au>
In-Reply-To: <4D78B56D.1020804@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sat, 12 Mar 2011 18:23:56 +0100, Moritz Wilhelmy <ml+mmj@wzff.de>
wrote:
> > How about a single +unsubscribe to get you off the list (any and all
> > delivery modes/versions), and +subscribe-nomail,
> > +subscribe(-normal), +subscribe-digest and +subscribe-both (normal
> > and digest), which switch you to that delivery mode if already
> > subscribed (removing you from other versions)?
> 
> This sounds confusing and overcomplicated, to be honest.

At least I would not call it a priority.

Another completely different and really powerful (and
administrator friendly) move would be to have the possibility to
subscribe and unsubscribe users from the email interface,
i.e., any email sent from an address listed in control/submod
(and possibly control/owner) with the following syntax
listname+subscribe-some.user=example.com@domain.tld
would start the chain of events as if it were the email
listname+subscribe@domain.tld sent by the user (envelope)
some.user@example.com

This option, when applied to the usual subscribe, unsubscribe,
subscribe-nomail, subscribe-digest, etc., would greatly reduce the need
to keep logging to the server and go to the command line just to manage
a busy mailing list of not very IT savvy users (and users are most of
the time not very IT savvy).

r.

M.

