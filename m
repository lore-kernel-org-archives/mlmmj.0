From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 05 Sep 2011 12:34:19 +0000
Subject: Re: [mlmmj] read(2) syscall bloat
Message-Id: <4E64C1CB.3010102@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20110905115603.GC22957@barfooze.de>
In-Reply-To: <20110905115603.GC22957@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 5/09/11 9:56 PM, Moritz Wilhelmy wrote:
> mlmmj currently does a read(2) system call for every single byte it
> reads from a file descriptor. This is unnecessarily inefficient and
> slow.

Mmm. There've gotta be a lot of context switches happening there....

> Strace output is similar to the following:
> open("/var/spool/mlmmj/foo/control/listaddress", O_RDONLY) = 4
> read(4, "f", 1)                         = 1
> read(4, "o", 1)                         = 1
> read(4, "o", 1)                         = 1
[...]
> read(4, "\n", 1)                        = 1
> close(4)                                = 0
>
> Given that there is a getline(3) function in POSIX.1-2008, shouldn't it
> be possible to retire mygetline?

Not if getline() is new as of 2008; there are a lot of systems older
than that around, and since Mlmmj is so nice and slim, it is an ideal
candidate for running on older systems. I don't want to compromise that.

> I've previously posted this issue to the musl mailing list [1], which
> has an "anti-bloat side project", but I've been putting the mail to this
> list off.
>
> I don't see where any of Rich's arguments from [2] apply.

He's just pointing out that you can't reimplement mygetline() to read in
larger chunks without some kind of buffering. This is because reading a
larger chunk might read past end-of-line. If it does, then you have to
rewind the stream (not always possible) or buffer the extra output so
that the next call to mygetline() can use it.

> Can anyone please explain why it was done this way in the first place?

Not me.

Maybe we should do some profiling to see if this truly is a bottleneck
or not.

Ben.



> [1] http://www.openwall.com/lists/musl/2011/08/16/8
> [2] http://www.openwall.com/lists/musl/2011/08/16/11

