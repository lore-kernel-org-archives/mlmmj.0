From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Sun, 17 Sep 2006 20:55:49 +0000
Subject: [Fwd: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]]
Message-Id: <450DB655.50604@darkman.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040502090803020202090907"
List-Id: <mlmmj.mlmmj.org>
References: <450C3D28.8080907@darkman.de>
In-Reply-To: <450C3D28.8080907@darkman.de>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------040502090803020202090907
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

shame on me... maybe we could force reply-to? (i know, bad
thing etc..)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFFDbZUQoCguWUBzBwRAsvoAJsGQ3lBnn63fddlvq/7Uni4T4Yh7wCggnQt
Be50f7nFlcGto6l/BXPWAJA=
=e7Og
-----END PGP SIGNATURE-----

--------------040502090803020202090907
Content-Type: message/rfc822;
 name*0="Re: [Fwd: Re: Mails in incoming cause of \"invalid from\"]"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="Re: [Fwd: Re: Mails in incoming cause of \"invalid from\"]"

Message-ID: <450DB5B3.7050006@darkman.de>
Date: Sun, 17 Sep 2006 22:53:07 +0200
From: Sven 'Darkman' Michels <sven@darkman.de>
User-Agent: Thunderbird 1.5.0.5 (X11/20060725)
MIME-Version: 1.0
To: Mads Martin Joergensen <mmj@mmj.dk>
Subject: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]
References: <450B2711.4030008@darkman.de> <20060916171821.GF14637@mmj.dk> <450C3B42.5060306@darkman.de> <20060916191106.GG14637@mmj.dk> <450C5D1D.2070902@darkman.de> <20060917150743.GA20790@mmj.dk> <450D9562.50700@darkman.de> <20060917200822.GE20790@mmj.dk>
In-Reply-To: <20060917200822.GE20790@mmj.dk>
X-Enigmail-Version: 0.94.0.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mads Martin Joergensen wrote:
> mlmmj should stop parsing headers when two newlines are met like the
> spec claims.

ahem? 2? maybe i'm missunderstand you, but i thought header ends
when one empty line shows up...?


> That's why when I add a From: on the beginning of a line after a
> newline, that From: isn't picked up.
> 
> Could you look in a hex editor or such, to see if there's something
> making mlmmj believe there's more headers? Space or tab is enough to
> make it continue.
> 
>> I also tested this with thunderbird: when i add some
>> "fake headers", it works with the following "code":
>>   bla fasel
> 
> Well, can you trigger it with Thunderbird, by writing From: somewhere
> after a newline?

No, couldn't. But i played around with, the following did trigger
it:

<space><space>text\n
\n
<space><space>text\n
From: test+help@c3f2m.de [mailto:test+help@c3f2m.de]

looks like:
  bla fasel

  bla
From: test+help@c3f2m.de [mailto:test+help@c3f2m.de]

Does that help?

Regards,
Sven

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFFDbWyQoCguWUBzBwRAiBUAJ9X2rrMewvoxmv6DkJmwcB/kdZHqACeL9b0
+O+hYWPYYEkXYEWuKOExPWY=
=atrz
-----END PGP SIGNATURE-----


--------------040502090803020202090907--
