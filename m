From: Chris Webb <chris@arachsys.com>
Date: Wed, 30 May 2012 14:17:15 +0000
Subject: Re: [mlmmj] Mlmmj 1.2.18.0 released
Message-Id: <20120530141714.GC2278@arachsys.com>
List-Id: <mlmmj.mlmmj.org>
References: <4FC4D9CE.3010906@yahoo.com.au>
In-Reply-To: <4FC4D9CE.3010906@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Ben Schmidt <mail_ben_schmidt@yahoo.com.au> writes:

> One day we might even fix things so you don't need to use the full path
> to invoke the binaries. I certainly find it really annoying, and I don't
> know any other application that requires it. You'd think we could figure
> out what's going on from argv[0] or something.

I always just patch away this code completely when I build mlmmj. Like
almost everyone else, I don't build systems with multiple versions of mlmmj
on my path, and have always found the UI breakage of requiring absolute
paths on the command line because someone might do something that weird
completely bonkers.

Cheers,

Chris.

