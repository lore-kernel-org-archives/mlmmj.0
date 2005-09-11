From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 11 Sep 2005 08:36:55 +0000
Subject: Re: archive directory only has one message in it
Message-Id: <20050911083655.GA32829@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4320A09D.9060608@diamond.name>
In-Reply-To: <4320A09D.9060608@diamond.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* S=F8ren Boll Overgaard <boll+mlmmj@fork.dk> [Sep 10. 2005 21:25]:
> > I only have two log files in my mailing list directory:=20
> > mlmmj-maintd.lastrun.log and mlmmj.operation.log. Neither of them menti=
ons=20
> > not being able to write to index.
>=20
> I would like to second the request for this sort of information to
> appear as a warning in the logs.

It does appear in syslog/mail. I know, I know--logging shouldn't be
happening in 3 different places, patches welcome to fix this.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
