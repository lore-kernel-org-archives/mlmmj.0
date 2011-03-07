From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 07 Mar 2011 10:07:17 +0000
Subject: Re: [mlmmj] Google Summer of Code
Message-Id: <4D74AE55.9090900@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
In-Reply-To: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> IMHO, using C for writing web interfaces is both counter-productive and
>> a security risk.
>
> Not really any more than writing an MLM in C...
> IMHO, C is perfectly fine, as long as the programmers know what they're doing.

Exactly. It can be done well, just as web interfaces written in more
common web scripting languages can be done badly.

I think there are a number of advantages having something written in the
same language as the MLM, too--it can easily hook into all the stuff the
MLM does when it needs to without duplicating code or developing data
sharing strategies.

>> BTW, what is the problem with things like mhonarc?

No particular problem with it, though I think something dynamic and more
closely integrated with the MLM could make the experience better,
particularly for small sites.

It's not like Mhonarc will ever cease to be an option, though.

>> I think that generating static content is always better than
>> (uselessly) generating on-the-fly dynamic content.
>
> Just a thought, maybe search-queries against the list?

Yeah, dynamic generation is good for that sort of thing. Also it makes
things easy like:

- Integration with a frequently changing website (e.g. within a theme
   that includes something like recent news in a sidebar).

- Organisation of the archives, e.g. allowing an admin to promote a
   message to its own thread, like in forums.

- Private archives with authentication integrated with the rest of the
   Mlmmj system.

>> If we need a db, *please* make it possible to choose the back-end (like
>> for example: sqlite, postgres or MySQL).

I can't promise what selection there will be, but the reason to refactor
the code into a clear module is so that you can drop in a module of your
choice (whether flat files or a database backend of your choice).

> Maybe externalise this, so mlmmj uses a separate mlmmj-user program to
> check against a db, filesystem or other ways of data storage?

I suspect the checks are a bit more frequent, varied and closely
integrated with other code to warrant a separate binary. However, once
modularised, it would be easy to try this by writing a module that works
by calling one or more external programs.

> I'd still prefer not to use a DB at all.

I have no intention of removing support for flat files, though perhaps
some more advanced features will not work with them down the track.

> The idea that everything needs to be backed by a full-fledged database
> with access control and whatever is a common mistake in computing. For
> something as simple as mlmmj, UNIX permissions should suffice. I agree
> that some people might want to integrate mlmmj into their existing,
> db-backed projects, though.

Absolutely. It's not about permissions, or replication, or massive
scalability, but about easier integration with other software, more
structured data representation (e.g. so the number of attributes stored
for users can increase sensibly and simply), and efficient lookup and
manipulation.

Cheers,

Ben.




