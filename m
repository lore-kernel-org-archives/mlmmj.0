From: Lukas Fleischer <mlmmj@cryptocrack.de>
Date: Mon, 05 Sep 2011 12:30:46 +0000
Subject: Re: [mlmmj] read(2) syscall bloat
Message-Id: <20110905123046.GA2378@blizzard>
List-Id: <mlmmj.mlmmj.org>
References: <20110905115603.GC22957@barfooze.de>
In-Reply-To: <20110905115603.GC22957@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Sep 05, 2011 at 01:56:03PM +0200, Moritz Wilhelmy wrote:
> Hello,
> 
> mlmmj currently does a read(2) system call for every single byte it
> reads from a file descriptor. This is unnecessarily inefficient and
> slow. 
> 
> Strace output is similar to the following:
> open("/var/spool/mlmmj/foo/control/listaddress", O_RDONLY) = 4
> read(4, "f", 1)                         = 1
> read(4, "o", 1)                         = 1
> read(4, "o", 1)                         = 1
> read(4, "@", 1)                         = 1
> read(4, "l", 1)                         = 1
> read(4, "i", 1)                         = 1
> read(4, "s", 1)                         = 1
> read(4, "t", 1)                         = 1
> read(4, "s", 1)                         = 1
> read(4, ".", 1)                         = 1
> read(4, "e", 1)                         = 1
> read(4, "x", 1)                         = 1
> read(4, "a", 1)                         = 1
> read(4, "m", 1)                         = 1
> read(4, "p", 1)                         = 1
> read(4, "l", 1)                         = 1
> read(4, "e", 1)                         = 1
> read(4, ".", 1)                         = 1
> read(4, "c", 1)                         = 1
> read(4, "o", 1)                         = 1
> read(4, "m", 1)                         = 1
> read(4, "\n", 1)                        = 1
> close(4)                                = 0
> 
> Given that there is a getline(3) function in POSIX.1-2008, shouldn't it
> be possible to retire mygetline?
> 
> I've previously posted this issue to the musl mailing list [1], which
> has an "anti-bloat side project", but I've been putting the mail to this
> list off.
> 
> I don't see where any of Rich's arguments from [2] apply. Can anyone
> please explain why it was done this way in the first place?

Not sure why it was done like that. Anyway, this shouldn't be too hard
to fix, given that we already use our own getline() implementation (see
"mygetline.c") and it shouldn't be too hard to add our own buffering
implementation or use some stream implementation here.

I can have a look at that around next week if no one else wants to.

> 
> [1] http://www.openwall.com/lists/musl/2011/08/16/8
> [2] http://www.openwall.com/lists/musl/2011/08/16/11
> 
> 	Moritz

