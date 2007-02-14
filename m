From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Wed, 14 Feb 2007 15:15:54 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <45D327AA.5030305@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi me, again ;-)

Sven 'Darkman' Michels wrote:
> 
> Any ideas?

I got another timeslot to get this sorted. It seems now to work and
i fixed the parse of $maxmailsize$, too. So if anyone is interested,
here is a cleaned patch:
http://www.darkman.de/~sven/mlmmj-1.2.13-maxmailsize-darkman.patch

I still get nothing in the logs, but that may some other problem...

What i changed:

- - char *maildata[4] = { "posteraddr", NULL, "maildata", NULL };
+ char *maildata[4] = { "posteraddr", NULL, "maxmailsize", NULL };

and removed two free's:
myfree(donemailname);
myfree(mailfile);
after the unlink and moved the free of maxmailsizestr befor the unlink.

Please, someone with more mlmmj knowhow or even more c code knowhow,
take a look if thats okay.

Thanks and regards,
Sven
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFF0yepQoCguWUBzBwRAh+sAKCYaMdB2ZLZDvhZXQZ/Z91iZOiPWwCgkiLz
wS9z2IxRd9jK6iha9/pAh5wJK
-----END PGP SIGNATURE-----
