From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Fri, 12 Nov 2004 11:26:31 +0000
Subject: Re: feature request: mlmmj-list
Message-Id: <20041112112631.GA6796@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20041104132516.GE10927@mail.lieber.org>
In-Reply-To: <20041104132516.GE10927@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Kurt Lieber <klieber@gentoo.org> [Nov 04. 2004 15:05]:
> > The only reason I could think of to do this is the -n switch.
> > Fair enough--it'll happen before 1.1.
>
> yeah, we use the -n switch all the time.  I've attached a simple bash
> script that does everything I need it to.  It does basic checking, but it's
> by no means "robust".  It looks like you'd expect a 10-minute bash script
> to look. :)
>
> Anyway, in case it's helpful to anyone else, have a blast.  No warranty,
> blah blah blah.

$ ./mlmmj-list -V -h
mlmmj-list version 1.1.0-RC2

$ ./mlmmj-list -h
Usage: ./mlmmj-list -L /path/to/listdir [-d] [-h] [-n] [-N]
 -h: This help
 -L: Full path to list directory
 -d: Print for digesters list
 -N: Print for nomail version of list
 -n: Print subscriber count
 -V: Print version

$ file ./mlmmj-list
./mlmmj-list: ELF 64-bit LSB executable, AMD x86-64, version 1 (SYSV),
for GNU/Linux 2.4.1, dynamically linked (uses shared libs), not stripped

:-)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
