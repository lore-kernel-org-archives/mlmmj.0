From: Andrea Barisani <lcars@gentoo.org>
Date: Sat, 11 Nov 2006 19:55:07 +0000
Subject: Re: mlmmj-process dies with "free(): invalid next size"
Message-Id: <20061111195507.GC28840@fuse.inversepath.com>
List-Id: <mlmmj.mlmmj.org>
References: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
In-Reply-To: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sat, Nov 11, 2006 at 08:18:47PM +0100, Mads Martin Joergensen wrote:
> * Christoph Wilke <chris@filmkreis.tu-darmstadt.de> [Nov 10. 2006 16:25]:
> > ps. The versions I used to test weren't patched.
> 
> Can you please try RC4 with the latest patch from Morten?
> 
> -- 

We get this too: mlmmj-process: *** glibc detected *** free():
invalid next size (fast): 0x116383a8 ***

RC4 doesn't solve the issue (unless there's some patch against it that I'm
missing).

-- 
Andrea Barisani <lcars@gentoo.org>                            .*.
Gentoo Linux Infrastructure Developer                          V
                                                             (   )
PGP-Key 0x864C9B9E http://dev.gentoo.org/~lcars/pubkey.asc   (   )
    0A76 074A 02CD E989 CE7F AC3F DA47 578E 864C 9B9E        ^^_^^
      "Pluralitas non est ponenda sine necessitate"
