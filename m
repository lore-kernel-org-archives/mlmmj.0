From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Sat, 10 Sep 2005 19:25:01 +0000
Subject: Re: archive directory only has one message in it
Message-Id: <20050910192501.GK26388@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4320A09D.9060608@diamond.name>
In-Reply-To: <4320A09D.9060608@diamond.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hello,

On Fri, Sep 09, 2005 at 07:50:31AM -0700, Jason Diamond wrote:
> > However, there is one thing you should
> > probably check, given the description of the problem: make sure the=20
> > 'index'
> > file exists, and is writeable, since that appears to be what mlmmj uses=
 to
> > keep track of the archive's last posting number (and thus, if it doesn't
> > exist, it probably thinks that it should write out '0', and does so... =
and=20
> > if
> > it can't create the index file, well... lather, rinse, repeat). Did you=
=20
> > check
> > your logfile to see if it reported anything?
> >=20
>=20
> I think this is the problem.
>=20
> The index file does exist but it's owned by root:root (the user I was whe=
n I=20
> ran mlmmj-make-ml) and not writable by anybody else.
>=20
> I have exim launching the mlmmj-recieve program as nobody:nogroup since=20
> that's what all of the files in my mailing list directory (except index) =

> were owned by. Could this be a bug in mlmmj-make-ml?

This indeed turned out to be the problem. The patched version of mlmmj-make=
-ml
in 1.2.5 failed to set proper permissions in $LISTDIR/index. I've fixed thi=
s in
version 1.2.8-3 which I have just uploaded to the Debian unstable archive. =
If
you would like a copy of the package before it hits the mirrors, please let=
 me=20
know in private mail.

Also, to avoid Debian specific bugs related to mlmmj-make-ml making it past=
 the
Debian Bug Tracking System, the Debian version of mlmmj-make-ml now tells u=
sers
where to report bugs.

> I only have two log files in my mailing list directory:=20
> mlmmj-maintd.lastrun.log and mlmmj.operation.log. Neither of them mention=
s=20
> not being able to write to index.

I would like to second the request for this sort of information to appear a=
s a
warning in the logs.

--=20
S=F8ren O.                                           ,''`.
                                                  : :' :
GPG key id: 0x1EB2DE66                            `. `'
GPG signed mail preferred.                          `-
