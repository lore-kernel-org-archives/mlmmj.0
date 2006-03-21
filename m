From: "Andreas V. Meier" <andreas@anvame.net>
Date: Tue, 21 Mar 2006 07:13:51 +0000
Subject: Re: testing mlmmj
Message-Id: <20060321071351.GA7514@waterworld.anvame.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="RnlQjJ0d97Da+TV1"
List-Id: <mlmmj.mlmmj.org>
References: <20060319162716.GU31545@waterworld.anvame.net>
In-Reply-To: <20060319162716.GU31545@waterworld.anvame.net>
To: mlmmj@mlmmj.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 21, 2006 at 12:08:56AM +0100, Jakob Hirsch wrote:
> Morten K. Poulsen wrote:
> >>>>> invalid envelope from email count (was 0, must be 1): No such file =
or
> > *But* if your mail server is not configured to add the envelope from ad=
dress as
> > a Return-Path: header, mlmmj can not see it. Is your server configured =
to add
>=20
> oops, you are right, envelope from is Return-Path, of course.
>=20
> Exim does not add a Return-Path header by default, this is done by
> return_path_add in the transport.

Maybe this command should be stated explicitly in the README at the place w=
here
it says "Also make sure ...". I read that part, but due to lack of knowledg=
e how
to just discarded it :)

Anyway, I have it working now, thx!

Ciao

Andreas

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFEH6ev2A9/vRi9PS4RArNDAKCIYjYP01giSYfFouEp5/nzcN+knwCfZ7w1
nr6abmj+HSs7m0rk/8TEWs0=
=khEb
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
