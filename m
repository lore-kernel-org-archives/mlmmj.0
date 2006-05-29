From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Mon, 29 May 2006 09:08:56 +0000
Subject: Re: mlmmj code refactoring, for ease of reuse
Message-Id: <20060529090856.GD60895@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060528184943.GB60895@freesbee.wheel.dk>
In-Reply-To: <20060528184943.GB60895@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Mon, May 29, 2006 at 10:19:35AM +0200, Jakob Hirsch wrote:
> S=F8ren Boll Overgaard wrote:
>=20
> > I would like to create a convenient system for provisioning mlmmj
> > mailinglists across a network. That is, I would like to be able to conn=
ect
> > to a daemon on a given host, and tell it to create a list, subscribe a
> > user, unsubscribe a user, etc. This would also make it easier to create
> > user interfaces for manipulating mlmmj.
> >
> > In order to minimize the work involved, I intend to write the thing in =
C,
>=20
> I think coding in C does usually not minimize the work. Instead of reusing
> the mlmmj code (and therefore having to keep pace with new versions), I'd
> rather do it The Unix Way: Write a simple wrapper script/programm (Perl,
> Python, Ruby, $whatever, even in C that's no big deal) which reads
> commands from a tcp socket or, even easier, reads from STDIN (so you can
> use it with inetd), and invokes the corresponding mlmmj binary.
> The only reason to do this in a single C programm would be performance,
> but I guess you are not going to create thousands of lists per second.

You are right of course, as using execlp() is excactly how (sub, unsub, etc=
.)=20
commands are executed inside mlmmj.=20

Generally though, I think it would be nice if mlmmj exported a more develop=
er
friendly C api, with functions like subscribe(), unsubscribe(), create_list=
(),
etc.  Perhaps even by means of a shared library?=20

Anyway, I will look into the approach you are suggesting, probably based on
python.

Thanks for the input.

--=20
S=F8ren O.

"Oh, bother" said the Borg, "we've assimilated Pooh".
