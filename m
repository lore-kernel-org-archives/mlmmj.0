From: Kurt Lieber <klieber@gentoo.org>
Date: Thu, 04 Nov 2004 14:05:53 +0000
Subject: Re: feature request: mlmmj-list
Message-Id: <20041104140553.GF10927@mail.lieber.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zXfPu6M4uk8xi/G5"
List-Id: <mlmmj.mlmmj.org>
References: <20041104132516.GE10927@mail.lieber.org>
In-Reply-To: <20041104132516.GE10927@mail.lieber.org>
To: mlmmj@mlmmj.org


--zXfPu6M4uk8xi/G5
Content-Type: multipart/mixed; boundary="XIT9+HGZgTFaGwcE"
Content-Disposition: inline


--XIT9+HGZgTFaGwcE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2004 at 02:43:27PM +0100 or thereabouts, Mads Martin Joerge=
nsen wrote:
> The only reason I could think of to do this is the -n switch.
> Fair enough--it'll happen before 1.1.

yeah, we use the -n switch all the time.  I've attached a simple bash
script that does everything I need it to.  It does basic checking, but it's
by no means "robust".  It looks like you'd expect a 10-minute bash script
to look. :)

Anyway, in case it's helpful to anyone else, have a blast.  No warranty,
blah blah blah. =20

--kurt

--XIT9+HGZgTFaGwcE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename=mlmmj-list

#!/bin/bash

ARGS=1
COUNT=0

b_CAT=/bin/cat
b_WC=/bin/wc

if [ $# -lt "${ARGS}" ]
then
  echo "Usage: mlmmj-list [-n] <listname>"
  exit 1
fi

if [ $1 = "-n" ]; then
  COUNT=1
  PATH=${2%/}
else
  PATH=${1%/}
fi

if [ ! -d "${PATH}" ] || [ ! -r "${PATH}" ]; then
  echo "${PATH} is not a directory or is not readable"
  exit 1
fi

if [ ${COUNT} -eq 1 ]; then
  ${b_CAT} ${PATH}/subscribers.d/* | ${b_WC} -l
else
  ${b_CAT} ${PATH}/subscribers.d/*
fi


--XIT9+HGZgTFaGwcE--

--zXfPu6M4uk8xi/G5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBijdAJPpRNiftIEYRAvSUAJsF17XVmFEY2s1+7N8Us73zrBiqcQCeNPY/
pKl66p5wWjjyyjXmzDZZPGg=
=Duy8
-----END PGP SIGNATURE-----

--zXfPu6M4uk8xi/G5--
