From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Wed, 23 Mar 2005 21:28:30 +0000
Subject: memory management in mlmmj
Message-Id: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Memory management makes up quite a large portion of the code, especially
freeing memory at error conditions. How about we sacrifice a tiny bit of memory
and performance and automate it?

The basic idea here is to have scopes of dynamic memory, a lot like local
variables. At the beginning of each function we could begin a scope, and at the
end of a function (and at returns) we could end it. If we need to return a
pointer to some memory, we could move that chunk of memory up to the parent
scope. I think that would work well, and make the code a lot more readable.

It is not new, I think PHP does something like this (where a request is the
scope).

I have made a small proof of concept:
http://www.afdelingp.dk/files/memory.c

MEM_BEGIN opens a new scope.
MEM_END closes the current scope.
MEM_SAVE(ptr) moves a chunk of memory to the parent scope.

mymalloc() and myfree() works as usual.

Is it a bad idea?

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
