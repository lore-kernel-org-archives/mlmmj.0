From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 18 Oct 2004 14:00:11 +0000
Subject: Re: mail accepted but not retransmitted?
Message-Id: <20041018140011.GC7292@mopo.i.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
In-Reply-To: <200410151214.34989.akohlsmith-mlmmj@benshaw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Mon, Oct 18, 2004 at 09:26:56AM -0400, Andrew Kohlsmith wrote:
> Oct 18 09:27:34 gromit postfix/local[2267]: 1DEBB414CE0:=20
> to=3D<mlmmj-test@gromit.mixdown.ca>, relay=3Dlocal, delay", status=DEferr=
ed=20
> (Command died with signal 11: "/usr/local/bin/mlmmj-recieve -F=20
> -L /var/spool/mlmmj/mlmmj-test/")
>=20
> Well there we go.  Now to figure out why the damn thing is sig11'ing.

Ouch! Not good.

Are you familiar with gdb?

Morten

--=20
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
