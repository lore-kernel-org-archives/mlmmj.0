From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Tue, 07 Sep 2004 09:38:47 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907093847.GE70234@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Tue, Sep 07, 2004 at 11:19:54AM +0200, Mads Martin Joergensen wrote:
> >
> > Would you be interested in a patch for mlmmj-make-ml.sh which requires
> > the user to decide if she wants to make links from
> > /etc/mlmmj/lists/<listname> to /var/spool/mlmmj/control or some such?
>=20
> I think such a patch belongs with the distributions, since FHS is Linux
> specific, and mlmmj is not. It's just like the patch to mlmmj-make-ml.sh
> to make it know where the listtexts are installed.

That's fair enough. I will go ahead and build a set of debian specific patc=
hes.

--=20
S=F8ren O.                                           ,''`.
                                                   : :' :
GPG key id: 0x1EB2DE66                             `. `'
GPG signed mail preferred.                           `-
