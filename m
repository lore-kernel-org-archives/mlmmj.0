From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 25 Sep 2006 20:07:38 +0000
Subject: Re: mlmmj on Solaris
Message-Id: <977bf0eb5c4db442b2e7aeeecd3afec8@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Rob,

I am sending the reply with CC to the list. I hope that's OK.

Rob Shepherd <rob@techniumcast.com> wrote:
> First, thanks for mlmmj. Neat.

You're welcome :)

> I have some notes regarding my recent experience with building mlmmj on
> Solaris 10.

Nice. I think you're the first to do that. Do you know if it is possible to get a shell account on a Solaris box anywhere, to test the next mlmmj release?

> 1.
> 	CFLAGS="-D_POSIX_PTHREAD_SEMANTICS"
> 
> 	...is required.

That is very strange. Mlmmj does not use threads or any kind of pthread library feature. What happens if you compile without?

> 2.
> 	/bin/sh in Solaris is Posix shell and is much more strict than /bin/sh
> on linux (which i think is just bash). mlmmj-make-ml.sh needs..
> 
> 	#!/bin/bash

Which features of bash are needed in the script now? Would it be possible to change it to not use those features?

> 3.
> 	If mlmmj-maintd is not in the path, which does something different to
> what you might expect.
> 
> [08:58:18][root@zorch-mail:/usr/local/mlmmj/bin]$ which mlmmj-maintd
> no mlmmj-maintd in /usr/sbin /usr/bin /opt/csw/bin /opt/csw/gcc3/bin
> /usr/ccs/bin /opt/SUNWspro/bin
> 
> 	I added the ${prefix}/bin to the PATH at start of mlmmj-make-ml.sh

Hmmm, I guess the binaries should be found via a autoconf(?) variable like @textlibdir@. Would that work? Henne?

> 4.
> 	Aliases. I use a seperate aliases file /usr/local/mlmmj/etc/aliases.
> The form for this alias file, when used with postfix at least, does not
> use a ': ' seperator, rather just white space. I have adjusted my
> make-mlmmj-ml.sh.  Another reason for using a seperate aliases file is
> that postfix (2.2.10 at least) is able to perform the spooling or
> command pipe with the uid of the aliases file.  On solaris the user
> smmsp always exists, even if sendmail is not installed. I may then do...
> 
> chown smmsp:smmsp /usr/local/mlmmj/etc/aliases
> chown -R smmsp:smmsp /var/spool/mlmmj
> 
> ...and it runs as smmsp.

That is a nice feature. Perhaps the script could check the mailer, and write a seperate alias file if it is supported. A patch would be appreciated ;)

> Other than that, It's great. Keep up the good work.

Thanks :)

> Feel free to put my notes in a README.Solaris or whatever.

I will, if we can't find good solutions for the (few) issues. The thing about Postfix and separate alias file - will that work on any operating system?

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

