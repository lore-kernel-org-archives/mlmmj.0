From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 25 Sep 2006 21:08:57 +0000
Subject: Re: mlmmj on Solaris
Message-Id: <69db060ae9a401d0db1a8c4b08e2f60f@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <977bf0eb5c4db442b2e7aeeecd3afec8@mail.n0rd.dk>
In-Reply-To: <977bf0eb5c4db442b2e7aeeecd3afec8@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org


Hi Rob,

Rob Shepherd <rob@techniumcast.com> wrote:
> Morten K. Poulsen wrote:
>> Nice. I think you're the first to do that. Do you know if it is possible
>> to get a shell account on a Solaris box anywhere, to test the next mlmmj
>> release?
>=20
> Yes. I'll see what I can do.

Cool, thanks.

>>> 1.
>>> 	CFLAGS=3D"-D_POSIX_PTHREAD_SEMANTICS"
>>>
>>> 	...is required.
>>
>> That is very strange. Mlmmj does not use threads or any kind of pthread
> library feature. What happens if you compile without?
>=20
> It's nothing to do with threads, rather Solaris compatability issues.
>=20
> log_oper.c: In function `log_oper':
> log_oper.c:76: error: too few arguments to function `ctime_r'

Ah, ok. We could change ctime_r to ctime, as we are not using threads. The =
Solaris version of ctime_r requires a buflen paremeter - not POSIX complian=
t.

>>> 2.
>>> 	/bin/sh in Solaris is Posix shell and is much more strict than /bin/sh
>>> on linux (which i think is just bash). mlmmj-make-ml.sh needs..
>>>
>>> 	#!/bin/bash
>>
>> Which features of bash are needed in the script now? Would it be
> possible to change it to not use those features?
>=20
> it fails first with 'let', don't know after that. I switched to bash.

Ok, any shell scripting gurus on the list? :)

>>> 3.
>>> 	If mlmmj-maintd is not in the path, which does something different to
>>> what you might expect.
[snip]
>> Hmmm, I guess the binaries should be found via a autoconf(?) variable
>> like @textlibdir@. Would that work? Henne?
>=20
> I'll let you figure that one out. :)

Ok, any autoconf gurus on the list? :)

>>> 4.
>>> 	Aliases. I use a seperate aliases file /usr/local/mlmmj/etc/aliases.
[snip]
>> That is a nice feature. Perhaps the script could check the mailer, and
>> write a seperate alias file if it is supported. A patch would be
>> appreciated ;)
[snip]
> I dislike user scripts which attempt to guess the environment and do
> what is best for the creator as opposed to the user.
[snip]
> I guess, the compile time options...
>=20
> --with-postfix-alias-file=3D%path/to/alias/file%
>=20
> will set the "lack of" ':' in the alias file, it's location and the fact
> that the user wants the make script to write it for him/her.
>=20
> --with-postfix-alias-user=3D%uid%
>=20
> will set the uid to write and own the files as.

Will that work for the distros? S=C3=B8ren, Andrea, Henne, ...?

[snip]
> Thinks outloud..... what needs to be done as this user... hmmm
>=20
> 1. creating the spool area.
> 2. writing the alias file.
> 3. running the maintd from cron.
>=20
> If we assume all operations are carried by root, then (1) can be done
> with a chown, (2) can be done with an su in the right place and (3) can
> be done with however one switches privs in c-code.

1. mlmmj-make-ml.sh -c will do that chown.
2. could also be a chown in mlmmj-make-ml.sh, I guess.
3. mlmmj-maintd does a setuid() to the owner of the list directory, if run =
as root.

Morten

--=20
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

