From: Niki Guldbrand <niki@guldbrand.net>
Date: Sat, 01 Nov 2008 16:45:24 +0000
Subject: Re: mlmmj-1.2.16-PRE1 released
Message-Id: <1225557924.15673.22.camel@niki-laptop>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-fNJuFGVoLX/M58sciWc/"
List-Id: <mlmmj.mlmmj.org>
References: <1225491347.7486.22.camel@mopo-laptop>
In-Reply-To: <1225491347.7486.22.camel@mopo-laptop>
To: mlmmj@mlmmj.org


--=-fNJuFGVoLX/M58sciWc/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Morten.

On Fri, 2008-10-31 at 23:15 +0100, Morten K. Poulsen wrote:
> The following changes have been made since mlmmj-1.2.15:
>=20
>  o Added support for static bounce addresses (Thomas Jarosch)
>  o Added a sanity check in mlmmj-receive-strip (Chris Webb)
>  o Added miscellaneous sanity checks (Thomas Jarosch)
>  o Disabled digest mails when 'noarchive' is set (Thomas Jarosch)
>  o Added Russian listtexts (Nikolay Derkach)
>  o Fixed mmap()ing of zero-sized files (Robin H. Johnson)
>  o Fixed mlmmj-recieve [sic] for architectures where
>    sizeof(int) and sizeof(char *) differ
>  o Added support for the 'originalmail' keyword (Sascha Sommer)
>  o Merged various changes to the web interface from Franky Van
>    Liedekerke
>=20
> Have I missed any patches?

I send two patches to the list on Oct. 14th, would it be possible to get
these included ?

I already have the patch for mlmmj-recieve in use at two sites, and
haven't had any issues with them.

I'm willing to write some documentation on setting postfix up to use
this in the mlmmj documentation.


Best Regards

Niki Guldbrand

--=-fNJuFGVoLX/M58sciWc/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAABAgAGBQJJDIefAAoJEAPdccyjg/+FNusP/1RIv9yl1nY6um+Xezm7s4wW
mIJVtsGWWWR3Y2O7LTnKxvAHlGtn8hPdm/Br4Gz0YMETjcvxe1o64f6QAjIs4al/
A95vn/vzMvDKuPGL+UXAV8jmhoSyisyif/Zd++IQc6X5blADo869qtHOrDUirL7H
QCihs/MZL+oJwzKY0kAqBE4S0wZa4BT1ncwsCv6MsitvTzGryMaIn9aiThNg0VR3
+PE/ksE3I3BvMvR9NfizyJzFBPAY4zBV+qjtGk+WemRE8mbcNuLGepGztqjaOmNW
0vZLqv+roOXEGT6PLCq762hbWvPwOeWcMuh+CPXvrg51EK9CnUXwbfFKQpYzOUpZ
vtz20lD/c+awOGiEGKJtQ3EsWZHPjC2BMovCBDFPH/VbgvD5Mc7omflS5zRtkuoF
HVe3WRcSPDsok5ZKQlia8UkDsOz00YUMBE3ynEZRvQzjCCwyMI6gG3ffqWfncNhm
h68eZgMDeqckCVa/0SuRX/K0kFxkKSB9zmKAeB8LiJPXtkl4WbJFXlHumHuzXCOf
6G76Yc3dYlOVrfqzNeL1ZuuoBHGuZTyJEBfz1PtTd+eY4a7895lp0A0dFxs+eAtp
e/kvwcmQClqDxGey1oId0ptgmXDIWajEU44DbV48OdOL3eewy7lU34usnKQfzpWJ
EgZrlhQkYIZmrrQ0soAW
=EkTB
-----END PGP SIGNATURE-----

--=-fNJuFGVoLX/M58sciWc/--

