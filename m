From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Tue, 07 Sep 2004 10:14:01 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907101401.GG70234@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Tue, Sep 07, 2004 at 12:00:19PM +0200, Morten K. Poulsen wrote:
>=20
> No, you can not make hard links across partitions, and you can not make
> only some part of a partition read-only.

My bad.

> So:
> - All files in /var, symlinks in /etc, chroot
> - Some files in /var, some in /etc, symlinks in /var, NO chroot

Strictly speaking, you could delay the call to chroot() until after the
configuration had been loaded from /etc/.. That would require verification =
that
the actual loading routine couldn't cause errors, but still.
Anyway, if you are happy with having stuff under /var, I won't argue with y=
ou
:)

--=20
S=F8ren O.                                           ,''`.
                                                   : :' :
GPG key id: 0x1EB2DE66                             `. `'
GPG signed mail preferred.                           `-
