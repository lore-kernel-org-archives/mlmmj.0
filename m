From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 02 Jan 2006 16:49:47 +0000
Subject: Re: mlmlmj control files
Message-Id: <20060102164947.GB5262@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
In-Reply-To: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* Sven 'Darkman' Michels <sven@darkman.de> [Jan 02. 2006 17:42]:
> >> Quote from TUNABLES:
> >> =B7 relayhost                     (normal)
> >=20
> > i solved it by make an listner for smtpd on 127.0.0.1 in master.cf
> >=20
> > with out any restricktions, now finaly mlmmj works here
>=20
> take care: when i played around with special smtpd ports
> for mlmmj i recognized that the value is ignored for all
> administration mails, means: subscribe, help etc ignores
> the port setting - dunno if it also ignores the relayhost
> for such mails... but mmj is informed and will fix it asap ;)

Relayhost has the same problem, and I really should fix it tomorrow on
my last vacation day--it's a pretty ridiculous and annoying bug.

Problem is that in the case of administrative mails, there was no need
to pass a list directory to mlmmj-send, and thus does there two files
not get read.

--=20
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
