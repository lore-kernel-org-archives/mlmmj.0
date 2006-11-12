From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 12 Nov 2006 11:26:08 +0000
Subject: Re: mlmmj-process dies with "free(): invalid next size"
Message-Id: <20061112112608.GI885@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
In-Reply-To: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Andrea Barisani <lcars@gentoo.org> [Nov 11. 2006 20:54]:
> > > ps. The versions I used to test weren't patched.
> > 
> > Can you please try RC4 with the latest patch from Morten?
> 
> We get this too: mlmmj-process: *** glibc detected *** free():
> invalid next size (fast): 0x116383a8 ***
> 
> RC4 doesn't solve the issue (unless there's some patch against it that I'm
> missing).

There was this patch from Morten:

http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.12_RC4-gethdrline.diff

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
