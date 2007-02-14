From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Wed, 14 Feb 2007 23:09:20 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <45D396A0.6020005@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hej,

Morten K. Poulsen wrote:
> +           if((st.st_size > maxmailsize)) {
> +#if 0
> +               log_error(LOG_ARGS, "%s is %d bytes too big.\n",
> +                       donemailname,
> +                       (st.st_size - maxmailsize));
> +#endif
>=20
> The missing log entry might be because of the "#if 0" ;-)

DAMN! ;-) I can't belive i overlooked this for hours... ;)

Thanks for the light...


> Otherwise, it looks ok. I will review it in depth and commit it "soon."

Thanks again :)

Regards,
Sven
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFF05agQoCguWUBzBwRAnoQAJ4g+V5VpIQPL8zeDxfHcwUDbkOc2QCfWu8V
A12kjqCNsphwpu4eqYZVPXs=B63I
-----END PGP SIGNATURE-----
