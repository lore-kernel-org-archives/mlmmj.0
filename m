From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Tue, 07 Sep 2004 09:37:40 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907093740.GD70234@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Tue, Sep 07, 2004 at 11:34:00AM +0200, Mads Martin Joergensen wrote:
> > Well, making the symlinks from /var to /etc would break future
> > introductions of calls to chroot(), so symlinks, if used, should
> > probably be from /etc to /var, and not vice-versa.
>=20
> If the symlinks go from /etc to /var, how can the config files be on a
> read-only mounted filesystem?

Obviously the system would need to be made read-write during configuration
changes. To my knowledge that's not unreasonable for /etc on a production=20
server.

--=20
S=F8ren O.                                           ,''`.
                                                   : :' :
GPG key id: 0x1EB2DE66                             `. `'
GPG signed mail preferred.                           `-
