From: Geert Stappers <stappers@stappers.nl>
Date: Sat, 22 Apr 2017 18:54:46 +0000
Subject: [mlmmj] Postfix README  transport example & mlmmj-make-ml command
Message-Id: <20170422185446.GY1384@gpm.stappers.nl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="kigERAySUJmIn/9g"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--kigERAySUJmIn/9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello,


In README.postfix is this


    /var/spool/mlmmj/transport:
        # for a flat structure
        domain.tld--list-name@localhost.mlmmj   mlmmj:list-dir
        # for a hierarchical structure
        domain.tld--list-name@localhost.mlmmj   mlmmj:domain.tld/list-name


Thing I didn't find is the corresponding mlmmj-make-ml command.

I think for the top one it would be

  mlmmj-make-ml -L list-dir


and the bottom one

  mlmmj-make-ml -L listname -s /var/spool/mlmmj/domain.tld
or
  mlmmj-make-ml -L listname -s /srv/mailinglists/domain.tld



I haven't tried one, I'm looking the "missing link".


Groeten
Geert Stappers
New to MLMMJ
--=20
Leven en laten leven

--kigERAySUJmIn/9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJY+6b1AAoJECE10SPYwZvseSsP/17NdXb/e8wvH5Cms6MN7Lw9
4zrqTWFl8vxeL8d5idRXSWPEY1wHnbwPLKbYtriQaqUH3FC6BUv6fpzocGTdg1uA
RKqFYXVQGabus4UWGzshz3/H9xWcgQEomzVLPk8CGEuKUNOCWXXkDXQziokznamh
/JqKfDWn0ADEwDYAS+6fKNJt98rL0647CX15ga3FDVtADOCAsNcvGqc8YqzxGr5H
jQ3SxuPfvPSq9oOallw7R2Is75irpoqVzcpocuyEXR20oNE32v5ewMW/WoFyDfze
DRdvVKYCD87+kdDyQhEN1a54NNTUbZ4HY9tmMSk6eIgt/SkKsTgilz4SY56VqQkh
0yvs2g5x8gEOT8KHk4ae2D1XQTnFlkxxMCvE0Z/w092U+2rT1R5TNpoMcEm2f4f/
vOJOcEz+GFIriUEafzB6rRxcicRXokEklyHa4DK9qms9oSZV79LX+fbYedWXF4LU
UYPlemHYSI9dMKcRkxiAQCdKA94aaxI8h/YldcMf23292Ilb2sKFV63jPX7zFb4y
v6NGFsVaoLpP5lGAUdLHOvYSuqfasfzEy2aEt5X1TOEk3dL3IK5XYL/UY+oDxuob
umANAPua4SYI7sFjT0g2hpExH0/H6zhNa83SZRTCwH1XDI7CaDcLgyRi0LS9OJf/
JQ48XgyZBFAQ5/wnLLK3
=8dPt
-----END PGP SIGNATURE-----

--kigERAySUJmIn/9g--

