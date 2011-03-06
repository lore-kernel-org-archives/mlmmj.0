From: Moritz Wilhelmy <ml+mmj@wzff.de>
Date: Sun, 06 Mar 2011 16:31:50 +0000
Subject: Re: [mlmmj] Google Summer of Code
Message-Id: <20110306163150.GF10635@barfooze.de>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
In-Reply-To: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

On Sun, Mar 06, 2011 at 11:32:09PM +0800, Thomas Goirand wrote:
> IMHO, using C for writing web interfaces is both counter-productive and
> a security risk. 

Not really any more than writing an MLM in C...
IMHO, C is perfectly fine, as long as the programmers know what they're doing.
A not-insignificant part of your operating system is written in C, and you
don't consider that a security risk, do you?

> BTW, what is the problem with things like mhonarc? I think that generating
> static content is always better than (uselessly) generating on-the-fly
> dynamic content.

Just a thought, maybe search-queries against the list? (Although this can also
be done by external search engines if your list is in the index, but maybe you
don't want this, for instance for private lists? Sure, you could just download
the archive as mbox file, and use grep or mairix or mutt -f listarchive...)

> If we need a db, *please* make it possible to choose the back-end (like
> for example: sqlite, postgres or MySQL).

Maybe externalise this, so mlmmj uses a separate mlmmj-user program to check
against a db, filesystem or other ways of data storage?
I'd still prefer not to use a DB at all. The idea that everything needs to be 
backed by a full-fledged database with access control and whatever is a common
mistake in computing. For something as simple as mlmmj, UNIX permissions should
suffice. I agree that some people might want to integrate mlmmj into their
existing, db-backed projects, though.

Best regards,

Moritz

