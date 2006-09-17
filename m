From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Sun, 17 Sep 2006 18:35:14 +0000
Subject: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]
Message-Id: <450D9562.50700@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <450B2711.4030008@darkman.de>
In-Reply-To: <450B2711.4030008@darkman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mads Martin Joergensen wrote:
> Can you try it without this patch?

doesn't work. It looks like the problem existed before
because i run 1.2.11 since beginning of the year and
haven't changed anything. The user with the problem
did subscribe before moving to mlmmj, so we maybe
never triggered that one. We played around with it
now. It looks like the "From: " in the body is the
normal behavior of outlook when replying to a mail.
Now we add a "space" in front of the "From:" in the
body and voila, it worked. So it seems the headerparser
or whatever is broken. It doesn't stop parsing the
mailheader after the "^$" line. May this from the new
email address parsing?

I also tested this with thunderbird: when i add some
"fake headers", it works with the following "code":
  bla fasel

  -----Original Message-----
From: test+help@c3f2m.de [mailto:test+help@c3f2m.de]
Sent: Saturday, September 16, 2006 9:40 PM
To: my@email.address
Subject: Confirm unsubscribe from test@c3f2m.de



(maybe you need to change the listname to match yours, didn't
test that)

can't check all versions back now because i'm a little bit
limited in time ;)

Regards,
Sven
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFFDZViQoCguWUBzBwRAqcOAKCdIXAbVcjghGzOZMCpCMy1ABvXmwCfcSgg
mdRvH8MsVecnsYf0BGC5tZs=qfcc
-----END PGP SIGNATURE-----
