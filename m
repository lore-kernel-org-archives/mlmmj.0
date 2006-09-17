From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Sun, 17 Sep 2006 17:16:46 +0000
Subject: Re: mlmmj-send processes eating cpu
Message-Id: <450D82FE.6030600@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
In-Reply-To: <4BFA0DC3-3060-4B2B-8FBE-E5F8DD32E84E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nate Beaty wrote:
> lrwx------ 1 Debian-exim root 64 2006-09-17 09:44 7 -> socket:[728893]
> lrwx------ 1 Debian-exim root 64 2006-09-17 09:45 8 -> socket:[728895]
> 
> I'm learning as we go here.. anything else I can do?

so its a socket... lsof -n | grep 728893 i'd check now...

Regards,
Darkman
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFFDYL+QoCguWUBzBwRAgbNAJ9k/6DbGABsvBFFkzSDXFiCsva8nACgpgM5
m7T8MUblblKoJw2KIqgo4N0=yfjp
-----END PGP SIGNATURE-----
