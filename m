From: Sebastian Harl <sh@tokkee.org>
Date: Mon, 16 Mar 2009 16:46:11 +0000
Subject: Re: mlmmj: sends welcome E-mail when 'submod' is enabled
Message-Id: <20090316164610.GG17745@albany.tokkee.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="SWTRyWv/ijrBap1m"
List-Id: <mlmmj.mlmmj.org>
References: <20090316092139.GA17355@albany.tokkee.org>
In-Reply-To: <20090316092139.GA17355@albany.tokkee.org>
To: mlmmj@mlmmj.org


--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Morten,

On Mon, Mar 16, 2009 at 04:55:53PM +0100, Morten K. Poulsen wrote:
> On Mon, 2009-03-16 at 10:21 +0100, Sebastian Harl wrote:
> > Imho, it's not even desired that moderation should take place when
> > adding a user from the command line.
>=20
> I agree, but there should be a flag to enable moderation even if the
> command line tool is used.

Yep - fully agreed. To not break backward-compatibility (if that's
desired), a flag could be added to _disable_ moderation while the
default behavior would still be to have moderation enabled.

> > In any case, it would be nice if the user does not get any E-mails
> > unless -c is used.
>=20
> Yes, although this is difficult (with the current design) if
> subscription moderation is in use.

I have to admit that I did not yet look at the mlmmj internals at all,
but, I suppose, the current state of a subscription (before it has been
approved by the moderator) needs to be stored somewhere. So, possibly,
that place could be used to store additional flags as well.

> It would be great if you (or someone else) would write the code, and
> send us a patch :)

Sure. I might get to that later this week.

Thanks for the fast reply!

Cheers,
Sebastian

--=20
Sebastian "tokkee" Harl +++ GnuPG-ID: 0x8501C7FC +++ http://tokkee.org/

Those who would give up Essential Liberty to purchase a little Temporary
Safety, deserve neither Liberty nor Safety.         -- Benjamin Franklin


--SWTRyWv/ijrBap1m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFJvoJSEFEKc4UBx/wRAjZcAKCCUanuyUEquDGA+llDur56CwdSlQCfT+Sr
s3mneItaSM6tKxoubpR75zY=
=YtcT
-----END PGP SIGNATURE-----

--SWTRyWv/ijrBap1m--
