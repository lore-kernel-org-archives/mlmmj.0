From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Tue, 07 Sep 2004 09:54:20 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907095420.GF70234@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Tue, Sep 07, 2004 at 11:45:38AM +0200, Mads Martin Joergensen wrote:
> > > > Well, making the symlinks from /var to /etc would break future
> > > > introductions of calls to chroot(), so symlinks, if used, should
> > > > probably be from /etc to /var, and not vice-versa.
> > >=20
> > > If the symlinks go from /etc to /var, how can the config files be on
> > > a read-only mounted filesystem?
> >=20
> > Obviously the system would need to be made read-write during
> > configuration changes. To my knowledge that's not unreasonable for
> > /etc on a production server.
>=20
> Yeah, that's pretty normal I think.
>=20
> Disclaimer: it's entirely possible I've gotten this messed up in my
>             head--it's know to happen before :)
>=20
> What I meant is: if the symlinks are in /etc pointing to the actual
> files below /var/.../control holding the data, then the config files are
> not on the read-only file system, are they?
>=20
> But that's only a problem in the case of chroot environments of course.

I think we agree, even if the terminology is a little fuzzy :)

If the actual files are in /etc and symlinks are made from /var/.. to /etc,
then problems will arise if chroot'ing is introduced. This is easily fixed
though, as one can just make the links hard, and thus accessible from with a
chroot. I find this option the most appealing, and according to the FHS it
appears to be the most correct one.

If the situation was reversed, it's as you describe it.
What's your opionion on this?

Either way, sorry for the confusion.


--=20
S=F8ren O.                                           ,''`.
                                                   : :' :
GPG key id: 0x1EB2DE66                             `. `'
GPG signed mail preferred.                           `-
