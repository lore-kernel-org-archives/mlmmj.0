From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Sat, 17 Jun 2006 12:21:01 +0000
Subject: Re: mlmmj code refactoring, for ease of reuse
Message-Id: <20060617122101.GE23694@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060528184943.GB60895@freesbee.wheel.dk>
In-Reply-To: <20060528184943.GB60895@freesbee.wheel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Sun, Jun 11, 2006 at 11:11:07PM +0200, S=F8ren Boll Overgaard wrote:
> >=20
> > Generally though, I think it would be nice if mlmmj exported a more dev=
eloper
> > friendly C api, with functions like subscribe(), unsubscribe(), create_=
list(),
> > etc.  Perhaps even by means of a shared library?=20
> >=20
> > Anyway, I will look into the approach you are suggesting, probably base=
d on
> > python.
>=20
> I have all but completed writing a server for remotely managing an mlmmj
> installation. The server is written in python and uses the mlmmj-* binari=
es for
> functionality whereever possible.
>=20
> Additionally, I've written a fairly basic php client.
>=20

I've made the code available at
http://soren.overgaard.org/cgi-bin/index?t=3Dmlmmjadmd if anyone is interes=
ted.
It appears to be working as intended, though I can't be completely sure, si=
nce
my test script doesn't yet test all available functionality.

--=20
S=F8ren O.

"Oh, bother" said the Borg, "we've assimilated Pooh".
