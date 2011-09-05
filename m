From: Moritz Wilhelmy <ml+mmj@wzff.de>
Date: Mon, 05 Sep 2011 11:56:03 +0000
Subject: [mlmmj] read(2) syscall bloat
Message-Id: <20110905115603.GC22957@barfooze.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello,

mlmmj currently does a read(2) system call for every single byte it
reads from a file descriptor. This is unnecessarily inefficient and
slow. 

Strace output is similar to the following:
open("/var/spool/mlmmj/foo/control/listaddress", O_RDONLY) = 4
read(4, "f", 1)                         = 1
read(4, "o", 1)                         = 1
read(4, "o", 1)                         = 1
read(4, "@", 1)                         = 1
read(4, "l", 1)                         = 1
read(4, "i", 1)                         = 1
read(4, "s", 1)                         = 1
read(4, "t", 1)                         = 1
read(4, "s", 1)                         = 1
read(4, ".", 1)                         = 1
read(4, "e", 1)                         = 1
read(4, "x", 1)                         = 1
read(4, "a", 1)                         = 1
read(4, "m", 1)                         = 1
read(4, "p", 1)                         = 1
read(4, "l", 1)                         = 1
read(4, "e", 1)                         = 1
read(4, ".", 1)                         = 1
read(4, "c", 1)                         = 1
read(4, "o", 1)                         = 1
read(4, "m", 1)                         = 1
read(4, "\n", 1)                        = 1
close(4)                                = 0

Given that there is a getline(3) function in POSIX.1-2008, shouldn't it
be possible to retire mygetline?

I've previously posted this issue to the musl mailing list [1], which
has an "anti-bloat side project", but I've been putting the mail to this
list off.

I don't see where any of Rich's arguments from [2] apply. Can anyone
please explain why it was done this way in the first place?

[1] http://www.openwall.com/lists/musl/2011/08/16/8
[2] http://www.openwall.com/lists/musl/2011/08/16/11

	Moritz

