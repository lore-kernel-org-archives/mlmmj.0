From: Mads Martin Joergensen <mmj@suse.de>
Date: Mon, 03 Apr 2006 23:46:02 +0000
Subject: Re: Mailing list moving messages to queue/discarded
Message-Id: <20060403234602.GJ24165@suse.de>
List-Id: <mlmmj.mlmmj.org>
References: <937117890604031225n6181817bk91c2794d6934f6c0@mail.gmail.com>
In-Reply-To: <937117890604031225n6181817bk91c2794d6934f6c0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* Marcelo E. Magall=F3n <marcelo.magallon@gmail.com> [Apr 04. 2006 01:38]:
> > > I found informative messages in my syslog when I started with mlmmj,
> > > you might want to have a look there. I think the logs of exim would
> > > just tell you that it was passed to mlmmj, right?
>=20
> Ah, thank you, I was looking for messases in the exim message log
> only.  It didn't occur to me that mlmmj was sending messages to syslog
> by itself.  That's something to remember!
>=20
> > Good place to start, paste them here if you need help. Also--does the
> > messages in queue/discarded/ have a Return-Path: header?
>=20
> And this was indeed the problem.  No Return-Path, I had forgotten to
> add it to the transport, just like the README says you have to.
>=20
> Thanks!

Our pleasure, glad you got it working :-)

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
