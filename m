From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 07 Sep 2004 10:00:19 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907100019.GD1623@mopo.tv2.local>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Tue, Sep 07, 2004 at 11:54:20AM +0200, S=F8ren Boll Overgaard wrote:
> > What I meant is: if the symlinks are in /etc pointing to the actual
> > files below /var/.../control holding the data, then the config files are
> > not on the read-only file system, are they?
> >=20
> > But that's only a problem in the case of chroot environments of course.
>=20
> I think we agree, even if the terminology is a little fuzzy :)
>=20
> If the actual files are in /etc and symlinks are made from /var/.. to /et=
c,
> then problems will arise if chroot'ing is introduced. This is easily fixed
> though, as one can just make the links hard

No, you can not make hard links across partitions, and you can not make
only some part of a partition read-only.

So:
- All files in /var, symlinks in /etc, chroot
- Some files in /var, some in /etc, symlinks in /var, NO chroot

Morten

--=20
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
