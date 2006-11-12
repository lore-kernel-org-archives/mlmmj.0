From: Andrea Barisani <lcars@gentoo.org>
Date: Sun, 12 Nov 2006 15:14:18 +0000
Subject: Re: mlmmj-process dies with "free(): invalid next size"
Message-Id: <20061112151418.GG28840@fuse.inversepath.com>
List-Id: <mlmmj.mlmmj.org>
References: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
In-Reply-To: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, Nov 12, 2006 at 12:26:08PM +0100, Mads Martin Joergensen wrote:
> * Andrea Barisani <lcars@gentoo.org> [Nov 11. 2006 20:54]:
> > > > ps. The versions I used to test weren't patched.
> > > 
> > > Can you please try RC4 with the latest patch from Morten?
> > 
> > We get this too: mlmmj-process: *** glibc detected *** free():
> > invalid next size (fast): 0x116383a8 ***
> > 
> > RC4 doesn't solve the issue (unless there's some patch against it that I'm
> > missing).
> 
> There was this patch from Morten:
> 
> http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.12_RC4-gethdrline.diff
>

Applied, let's see what happens. Also today I found to mlmmj-process at 100%
CPU battling with each other. I'll try to debug it if it happens again.

Cheers

> -- 
> Mads Martin Joergensen, http://mmj.dk
> "Why make things difficult, when it is possible to make them cryptic
>  and totally illogical, with just a little bit more effort?"
>                                  -- A. P. J.

-- 
Andrea Barisani <lcars@gentoo.org>                            .*.
Gentoo Linux Infrastructure Developer                          V
                                                             (   )
PGP-Key 0x864C9B9E http://dev.gentoo.org/~lcars/pubkey.asc   (   )
    0A76 074A 02CD E989 CE7F AC3F DA47 578E 864C 9B9E        ^^_^^
      "Pluralitas non est ponenda sine necessitate"
