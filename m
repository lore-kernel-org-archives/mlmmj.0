From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Wed, 10 Jan 2007 20:06:56 +0000
Subject: Re: Round robin relayhost
Message-Id: <45A54760.3020003@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
In-Reply-To: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jesper Lund wrote:
 > Been there, done that. But when I do that, it seems that mlmmj uses
> the same relayhost to deliver all messages pr. posting, via the same
> relayhost. I believe that from posting to posting, it will use
> different relayhosts. 

If the host ttl is low enough, this may be right. I guess that it will
use the "first" reply from dns as long as its valid. Then it *may*
switch...


> My goal is to share the load between relayhosts, as I might have
> about 25k subscribers. With a single relayhost it will take a long
> time to deliver mail to all subscribers.

Okay, but, maybe the better way to do this is with ipvs (linux virtual
server) or a tool like balance which enables you to share the load
between multiple servers.
Its imho better because its more robust and the job of tools like
balance is to balance the traffic, while mlmmjs job is beeing a mailing
list manager ;)

HTH,
Darkman
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFFpUdfQoCguWUBzBwRAmxeAJwMPQP8ljD41OfMDFvVOHTWduss3wCfc9Ig
8TEW5UhjzJW2dkNgkNTSyx4=Hxk4
-----END PGP SIGNATURE-----
