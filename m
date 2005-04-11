From: Mike Grice <Mike@MikeGrice.com>
Date: Mon, 11 Apr 2005 20:51:18 +0000
Subject: Re: Feature Request: Subscriber Lists
Message-Id: <1113252678.27154.2.camel@localhost.localdomain>
List-Id: <mlmmj.mlmmj.org>
References: <1113237126.4613.5.camel@localhost.localdomain>
In-Reply-To: <1113237126.4613.5.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, 2005-04-11 at 20:14 +0200, Jakob Hirsch wrote:
> Vegard Svanberg wrote:
> 
> >>It would be really cool if the list owner could send an email to:
> >>listname+list@my.domain.tld
> > I've also had customers asking for that. Another cool thing would be if
> > the list owner could do some sort of simple list management by email,
> 
> should be not too hard to implement, but it has to be password- or
> challange/response-protected.

The thing is, (IIRC) ezmlm lets you do this.  You don't need to password
it because it's only allowed to be requested by the owner, and the reply
goes back to the configured owner address.

> it sounds nice, but are there really so many who want to use this? I
> thought there are mainly the two extremes shell access and web interface.

Nope, there are some people accustomed to the ezmlm
listname-list@my.domain.tld - and it's getting rid of ezmlm that I'm
trying to do.

I could write a wrapper around ezmlm-list, but to be honest, if the
functionality is there why not integrate it?  It's another nail in the
coffin of ezmlm, for a start.

Mike
-- 
'Cause all we got is rhythm and timin' ...

