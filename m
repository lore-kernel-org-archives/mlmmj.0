From: Moritz Wilhelmy <ml+mmj@wzff.de>
Date: Mon, 05 Sep 2011 12:57:02 +0000
Subject: Re: [mlmmj] read(2) syscall bloat
Message-Id: <20110905125702.GD22957@barfooze.de>
List-Id: <mlmmj.mlmmj.org>
References: <20110905115603.GC22957@barfooze.de>
In-Reply-To: <20110905115603.GC22957@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Sep 05, 2011 at 22:34:19 +1000, Ben Schmidt wrote:
> On 5/09/11 9:56 PM, Moritz Wilhelmy wrote:
> >mlmmj currently does a read(2) system call for every single byte it
> >reads from a file descriptor. This is unnecessarily inefficient and
> >slow.
> 
> Mmm. There've gotta be a lot of context switches happening there....

That's the point :-)

> >Strace output is similar to the following:
> >open("/var/spool/mlmmj/foo/control/listaddress", O_RDONLY) = 4
> >read(4, "f", 1)                         = 1
> >read(4, "o", 1)                         = 1
> >read(4, "o", 1)                         = 1
> [...]
> >read(4, "\n", 1)                        = 1
> >close(4)                                = 0
> >
> >Given that there is a getline(3) function in POSIX.1-2008, shouldn't it
> >be possible to retire mygetline?
> 
> Not if getline() is new as of 2008; there are a lot of systems older
> than that around, and since Mlmmj is so nice and slim, it is an ideal
> candidate for running on older systems. I don't want to compromise that.

It has been in glibc long before and can be implemented in about 50
lines. You could detect if the libc has a getline function, and use your
own otherwise (you do have autotools after all!)

You could copy the FreeBSD implementation of getline/getdelim with small
changes, which is (obviously) BSD licensed. It doesn't look too specific
to BSD stdio. I've seen some kind of getline.c floating around in many
projects since many years, before it was finally put into the standard.

http://www.freebsd.org/cgi/cvsweb.cgi/src/lib/libc/stdio/getline.c?rev=1.1.2.1.6.1;content-type=text%2Fplain
http://www.freebsd.org/cgi/cvsweb.cgi/src/lib/libc/stdio/getdelim.c?rev=1.2.2.2.4.1;content-type=text%2Fplain

It would require switching to FILE*s though, but I see very little
reason not to do just that for local files.

> He's just pointing out that you can't reimplement mygetline() to read in
> larger chunks without some kind of buffering. This is because reading a
> larger chunk might read past end-of-line. If it does, then you have to
> rewind the stream (not always possible) or buffer the extra output so
> that the next call to mygetline() can use it.

Alright, that's actually obvious.

	Moritz

