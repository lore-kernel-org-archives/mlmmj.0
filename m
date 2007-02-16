From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Fri, 16 Feb 2007 02:45:45 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <45D51AD9.90307@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hey,

Christoph Wilke wrote:
>> - - char *maildata[4] =3D { "posteraddr", NULL, "maildata", NULL };
>> + char *maildata[4] =3D { "posteraddr", NULL, "maxmailsize", NULL };
>=20
> *doi*
> Sorry for this inconvenience.

No Problem, for me as a no-coder it just takes a little longer
to understand such patches, but at least i got this fixed ;)


>> and removed two free's:
>> myfree(donemailname);
>> myfree(mailfile);
>> after the unlink and moved the free of maxmailsizestr befor the
>> unlink.
>=20
> Why do you free maxmailsizestr but mailfile and donemailname
> not?
> Did I miss something?

well, simple: if i free them, it doesn't work anymore. When i
leave them as you posted them, the reject mail isn't send to the
user anymore. I get a file in queue which *should* go to the user,
but they never get sent out. After removing the two frees, it
works. Thats why i asked for a review ;)

Regards,
Sven

PS: your mailaddress was bouncing, got this fixed? ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFF1RrZQoCguWUBzBwRAjGVAJ9NbP4s+s2bixPesBcNVYEAVj9NiACfdvfP
YskITftEQwlX+pg1XE3NEbE=92cT
-----END PGP SIGNATURE-----
