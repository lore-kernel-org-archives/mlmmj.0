From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Thu, 10 May 2007 20:06:32 +0000
Subject: RE: Installing mlmmj on a host
Message-Id: <c52072535c979ab27012bde941c9bab0@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070509171725.DBC0174B5C@spunkymail-a17.g.dreamhost.com>
In-Reply-To: <20070509171725.DBC0174B5C@spunkymail-a17.g.dreamhost.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Florent,

"Florent F Rizvanolli" <florent.faik@rizvanolli.com> wrote:
> I am responding directly to you but please let me know if I should have
> sent this to the list...

Sending it to the list is always a good idea. Other subscribers might
have good answers for your questions. Also, other users might find this
answer useful.

> That is one thing that I noticed in the README file: instructions don't
> say what user to install as.  It would help to know that
> anyone can install.

Well,.. That's the UNIX way of doing things, but we could be more
specific about it in the README.

> Also, I contacted my hosting provider and was told that mlmmj would
> need privileges to the mail server that only super-user has in my host.

That may be true. I can't know that for sure.

> I wonder what they meant by that...

Me too.

If only the super-user has the privileges to make a mail alias which
executes a program, then yes. But if you have a shell account on the
host, then it makes little sense to NOT allow you to do that.

> I know, for example, that when creating e-mail aliases I have to use
> their control pannel and can't do it from command line.

If you can create a mail alias that executes a program, then it
doesn't matter if you do that via a control panel. It is a very
standard feature of any mail server software i know of. But it is
possible that you - as a user - is not allowed to create such aliases.

> Could it be that their mail setup prohibits features that are
> necessary for mlmmj?

Yes (executing a program via a mail alias).

> For example, the instructions say that a bunch of files will be
> created in /var/spool dircectory but I don't know if others than
> super-user have permissions to do that.

That is just the sugested place to create those files. They can be
anywhere in the filesystem. Also, mlmmj does not need to be in
/usr/bin - it can be in /usr/local/bin, /usr/local/mlmmj-1.2.14,
/usr/home/joe/bin or anywhere else.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

