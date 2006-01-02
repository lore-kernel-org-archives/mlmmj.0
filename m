From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Mon, 02 Jan 2006 16:44:36 +0000
Subject: Re: mlmlmj control files
Message-Id: <43B95874.9040809@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
In-Reply-To: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Benny Pedersen wrote:
>> Quote from TUNABLES:
>> =B7 relayhost                     (normal)
>=20
> i solved it by make an listner for smtpd on 127.0.0.1 in master.cf
>=20
> with out any restricktions, now finaly mlmmj works here

take care: when i played around with special smtpd ports
for mlmmj i recognized that the value is ignored for all
administration mails, means: subscribe, help etc ignores
the port setting - dunno if it also ignores the relayhost
for such mails... but mmj is informed and will fix it asap ;)

Regards,
Darkman
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFDuVhzQoCguWUBzBwRAhnfAJ4uXRO+6JO3SEyAnWxne69k1cI4xgCfQYkv
iiEgqRUzmTSIwLfPbrvtFd0=3DR4Y1
-----END PGP SIGNATURE-----
