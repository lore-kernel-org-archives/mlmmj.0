From: =?iso-8859-1?Q?S=F8ren?= Boll Overgaard <boll+mlmmj@fork.dk>
Date: Sat, 10 Sep 2005 17:37:06 +0000
Subject: Re: archive directory only has one message in it
Message-Id: <20050910173706.GA26388@freesbee.wheel.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4320A09D.9060608@diamond.name>
In-Reply-To: <4320A09D.9060608@diamond.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On Fri, Sep 09, 2005 at 07:50:31AM -0700, Jason Diamond wrote:
>=20
> The index file does exist but it's owned by root:root (the user I was whe=
n I=20
> ran mlmmj-make-ml) and not writable by anybody else.
>=20
> I have exim launching the mlmmj-recieve program as nobody:nogroup since=20
> that's what all of the files in my mailing list directory (except index) =

> were owned by. Could this be a bug in mlmmj-make-ml?

Please note that the mlmmj-make-ml script in Debian is heavily patched to
support Debians file hierachy. Ie. bugs should be reported to the Debian bug
tracking system. I will look into your bug report tonight or tomorrow, as t=
ime=20
permits.


--=20
S=F8ren O.                                           ,''`.
                                                  : :' :
GPG key id: 0x1EB2DE66                            `. `'
GPG signed mail preferred.                          `-
