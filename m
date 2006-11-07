From: Jakob Hirsch <jh@plonk.de>
Date: Tue, 07 Nov 2006 09:36:48 +0000
Subject: Re: mlmmj-1.2.12-RC4 released
Message-Id: <455053B0.1020004@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <07000545535fd7f3f6fd56f93e19379f@mail.n0rd.dk>
In-Reply-To: <07000545535fd7f3f6fd56f93e19379f@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Mads Martin Joergensen:

>>> Has anyone tested on exim, qmail or sendmail?
>> I wanted to test on Exim, but for some reason I could not figure out it
>> dumps core when I run
>> /usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/test -F <
>> mlmmj-coredump.msg
>> (message availabe at http://ymmv.de/sw/mlmmj/mlmmj-coredump.msg)
> And this is RC4 I assume?

Sure. RC1 runs fine, the RCs in-between I didn't test (but could if it
helps). Segfault is in mlmmj-process. I tried to debug it with gdb, but
it didn't like the core file (something like "unrecognized file
format"), and running it in gdb it says

(gdb) run -P -L /var/spool/mlmmj/test -m msg
Starting program: /usr/local/bin/mlmmj-process -P -L
/var/spool/mlmmj/test -m msg
Reading symbols from shared object read from target memory...done.
Loaded system supplied DSO at 0xc22000

Program received signal SIGSEGV, Segmentation fault.
0x0804cbf0 in myexcllock (fd=6) at mylocking.c:36
36              locktype.l_whence = SEEK_SET;

, which doesn't make sense to me (and is not correct, I think).
