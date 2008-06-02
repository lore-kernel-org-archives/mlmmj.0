From: Chris Webb <chris@arachsys.com>
Date: Mon, 02 Jun 2008 21:33:34 +0000
Subject: Re: Changing mailing list subscription process
Message-Id: <20080602213334.GA4730@arachsys.com>
List-Id: <mlmmj.mlmmj.org>
References: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
In-Reply-To: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

"Robin H. Johnson" <robbat2@gentoo.org> writes:

> I've played with a variety of addresses for routing to /dev/null, when
> we started putting Reply-To on emails that the Gentoo Bugzilla sends
> out. Amongst the bits tried: '/dev/null@localhost',
> 'noreply@localhost'. Having the '.invalid' on the end turned out to be
> important because there are some MTAs that simply reject the mail for
> not having at least one dot in the host side of the email string.

Sure, I can believe that. In fact, I am certain there are also MTAs out
there that will reject if the Reply-To: domain isn't valid with either an MX
record or an A record---I've encountered them.

Our own MTA is configured to do this with From: although it ignores
Reply-To: at present. Users at these sites will be completely unable to
subscribe to or unsubscribe from your lists if you go ahead and start
emitting confirmation emails with invalid Reply-To addresses.

I think the only correct configuration here that won't break things for some
of your users is to use the (genuinely routeable)

  blackhole@gentoo.org

and bin to /dev/null when they're delivered to you.

> The point of using an invalid domain, is to have any response NOT
> traverse the entire internet and cause backscatter.

There's no backscatter in the configuration I described. The autoreplies
would be directed to an (auto-processed) address in your own domain not to
random third parties, unlike what happens with spam backscatter from MTAs
that bounce after accepting a message.

> Using an unsub address in the Reply-To part would also be bad I think,
> as that may allow some attacks to unsubscribe people.

Yes, an unsub address as Reply-To: isn't a good idea but a 'cancel
outstanding confirmation request' address is fine. This just answers 'no' to
the 'do you want to subscribe?' question without changing the membership
list at all.

> In either case, mlmmj doesn't let you set a Reply-To header at the
> moment for the sub/unsub mails.

True.

Cheers,

Chris.
