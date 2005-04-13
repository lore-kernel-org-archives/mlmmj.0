From: Mike Grice <incubus@ice-breaker.net>
Date: Wed, 13 Apr 2005 08:01:34 +0000
Subject: Re: Feature Request: Subscriber Lists
Message-Id: <1113379294.4608.16.camel@localhost.localdomain>
List-Id: <mlmmj.mlmmj.org>
References: <1113237126.4613.5.camel@localhost.localdomain>
In-Reply-To: <1113237126.4613.5.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, 2005-04-12 at 20:23 -0700, Christopher Mahmood wrote:
> * Jakob Hirsch (jh@plonk.de) [050412 16:15]:
> > Christian Laursen wrote:
> > 
> > >So the bad guys can send the subscriber list to the owner.
> > 
> > The talk was also about list management.
> > list is harmless, obviously (unless you have a really large list).
> 
> The worst a bad guy can do is generate confirmation requests that
> are sent to the owner (or moderator in the case of ezmlm+idx).
> Unless they can actually read the mail that is sent and get the
> authentication cookie in the reply-to address there's nothing they
> can do.
> 
> This kind of sums it up for ezmlm+idx:
> http://www.dk.ezmlm.org/faq/FAQ-4.html#ss4.17
> http://www.dk.ezmlm.org/faq/FAQ-4.html#ss4.14

In regards to the $listname+list command, this is exactly what I meant.
In summary, the list-owner has control of the destination address for
the list command, so there are no problems.  Even doing it in a
spam-style way is moot as the list owner can always be contacted at the
$listname-owner (in ezmlm) way anyway.

My main reason for requesting this feature is that I'm moving an ISP
over from ezmlm to mlmmj (hopefully!).  This is just pretty much the
remaining feature that if I can get, customers don't get any loss in
functionality.

I was hoping it wouldn't be a 'biggie' to implement as the functionality
is already available via the mlmmj-list command.

It's probably possible to code up some kind of wrapper, but given how
elegant mlmmj is anyway, it would be really nice to have.

Mike

-- 
Sticking feathers up your butt does not make you a chicken.


