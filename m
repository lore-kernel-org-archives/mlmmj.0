From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Tue, 07 Sep 2004 09:09:58 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907090958.GB70234@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hey,

On Tue, Sep 07, 2004 at 10:45:03AM +0200, Morten K. Poulsen wrote:
> > Is there any particular reason why the list configuration is situated
> > in the same directory structure as the list queue and archive?
>=20
> I think there where two reasons for this decision: The first is that
> having the configuration in /etc would make a chroot'ed environment
> impossible, and the second is to have each list in a single directory.

Would you be interested in a patch for mlmmj-make-ml.sh which requires the =
user
to decide if she wants to make links from /etc/mlmmj/lists/<listname> to
/var/spool/mlmmj/control or some such?=20

> If you want to store it in /etc you can do so, and just make symlinks in
> /var/spool/mlmmj.

Well, making the symlinks from /var to /etc would break future introduction=
s of
calls to chroot(), so symlinks, if used, should probably be from /etc to /v=
ar,
and not vice-versa.

--=20
S=F8ren O.                                           ,''`.
                                                   : :' :
GPG key id: 0x1EB2DE66                             `. `'
GPG signed mail preferred.                           `-
