From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 07 Sep 2004 09:45:38 +0000
Subject: Re: splitting configuration from the spool/queue
Message-Id: <20040907094538.GB82386@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040907083520.GA70234@freesbee.wheel.dk>
In-Reply-To: <20040907083520.GA70234@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* S=F8ren Boll Overgaard <boll+mlmmj@fork.dk> [Sep 07. 2004 11:37]:
> > > Well, making the symlinks from /var to /etc would break future
> > > introductions of calls to chroot(), so symlinks, if used, should
> > > probably be from /etc to /var, and not vice-versa.
> >=20
> > If the symlinks go from /etc to /var, how can the config files be on
> > a read-only mounted filesystem?
>=20
> Obviously the system would need to be made read-write during
> configuration changes. To my knowledge that's not unreasonable for
> /etc on a production server.

Yeah, that's pretty normal I think.

Disclaimer: it's entirely possible I've gotten this messed up in my
            head--it's know to happen before :)

What I meant is: if the symlinks are in /etc pointing to the actual
files below /var/.../control holding the data, then the config files are
not on the read-only file system, are they?

But that's only a problem in the case of chroot environments of course.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
