From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 24 Mar 2005 00:38:44 +0000
Subject: Re: memory management in mlmmj
Message-Id: <20050324003844.GC67964@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
In-Reply-To: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Morten K. Poulsen <morten@afdelingp.dk> [Mar 23. 2005 22:29]:
> Memory management makes up quite a large portion of the code, especially
> freeing memory at error conditions. How about we sacrifice a tiny bit of memory
> and performance and automate it?
> 
> The basic idea here is to have scopes of dynamic memory, a lot like local
> variables. At the beginning of each function we could begin a scope, and at the
> end of a function (and at returns) we could end it. If we need to return a
> pointer to some memory, we could move that chunk of memory up to the parent
> scope. I think that would work well, and make the code a lot more readable.
> 
> It is not new, I think PHP does something like this (where a request is the
> scope).
> 
> I have made a small proof of concept:
> http://www.afdelingp.dk/files/memory.c
> 
> MEM_BEGIN opens a new scope.
> MEM_END closes the current scope.
> MEM_SAVE(ptr) moves a chunk of memory to the parent scope.
> 
> mymalloc() and myfree() works as usual.
> 
> Is it a bad idea?

The idea is nice, but why start changing all this code that works
already with something that had no serious testing yet? There's so many
other places that could need some work before this.

Also we should have a look at:

 http://irccrew.org/~cras/security/c-guide.html and

and (from the dovecot imap server source):

 dovecot-0.99.14/src/lib/mempool*

before deciding on how to approach this. There's some really nice ideas
here as well.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
