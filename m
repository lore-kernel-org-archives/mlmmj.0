From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Mon, 22 Jan 2007 19:27:10 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <45B5100E.1060903@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi there,

today we had a bigger mail to a list which results in many
bounces since most of the subscribers have a lower limit. So
i want to limit per list. I remembered the patch about this and
then saw that its not yet included... ;-)

Christoph Wilke wrote:
> There is one issue I didn't fixed yet (no time):
> If a mail hits the limit, it bounces - no problem here.
> But the temporary mailfile created in the incoming
> directory isn't deleted.
> Maybe someone can have a look on this? :)

Well, i'm not a coder, but isn't this just a missing
unlink(mailfile); after the unlink(donemailname);?

Would be nice if someone can confirm this, i'd like to test
it soon ;-)

Regards,
Darkman
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFFtRAOQoCguWUBzBwRAsyPAKCizZUxdogEnNKIbkbDagRQyNCAnQCeO6WJ
zikqeSnkvbQCVD5gpAiTs1o=Mz6q
-----END PGP SIGNATURE-----
