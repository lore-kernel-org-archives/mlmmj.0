From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Sat, 16 Sep 2006 18:06:32 +0000
Subject: [Fwd: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]]
Message-Id: <450C3D28.8080907@darkman.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

oops, i did it again.. sorry ;) Post to the list..

- -------- Original Message --------
Subject: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]
Date: Sat, 16 Sep 2006 19:58:26 +0200
From: Sven 'Darkman' Michels <sven@darkman.de>
To: Mads Martin Joergensen <mmj@mmj.dk>
References: <450B2711.4030008@darkman.de> <20060916171821.GF14637@mmj.dk>

Hi,

Mads Martin Joergensen wrote:
> Just tried to reproduce, and cannot. Can you reproduce with 1.2.12-RC2?

Yep. I updated to rc2 and did:
cat incoming/5dc2658876e70a91 | /usr/bin/mlmmj-recieve -L
/var/spool/mlmmj/test/

With 1.2.11 i saw output on the shell, now i don't. But: i see
logs from mlmmj-process.c which told me that the mail was
discarded, and with RC2 the mail now is put into the discard
dir, not left in incoming anymore.
Log:
Sep 16 19:55:58 pamphlet /usr/bin/mlmmj-process[7818]:
mlmmj-process.c:641: Discarding
/var/spool/mlmmj/test//incoming/2d1420e3163f055e due to invalid From::
Bad file descriptor
Sep 16 19:55:58 pamphlet /usr/bin/mlmmj-process[7818]:
mlmmj-process.c:644: fromemails.emaillist[0] = my@benjamin-oette.de :
Bad file descriptor
Sep 16 19:55:58 pamphlet /usr/bin/mlmmj-process[7818]:
mlmmj-process.c:644: fromemails.emaillist[1] = Adnan Vatandas
[mailto:vatandas@rz.uni-frankfurt.de]  : Bad file descriptor

Regards,
Sven
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD4DBQFFDD0oQoCguWUBzBwRAjDrAKCvkPCME2HiHVTs4n54XihrPvkucgCWKd8c
SHITieuop8pw2OM2yPDPsQ=
=jrMG
-----END PGP SIGNATURE-----
