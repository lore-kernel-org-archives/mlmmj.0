From: Christian Laursen <xi@borderworlds.dk>
Date: Wed, 23 Mar 2005 22:44:36 +0000
Subject: Re: memory management in mlmmj
Message-Id: <86vf7it223.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
In-Reply-To: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

"Morten K. Poulsen" <morten@afdelingp.dk> writes:

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

Apache has also done something similar for years. It is probably available in
APR, but it's probably not feasible to link against that monstrosity.

> Is it a bad idea?

Personally I like it, but since I'm not touching much of the code in question
my opinion doesn't count that much.

-- 
Christian Laursen
