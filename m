From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Sat, 16 Sep 2006 20:22:53 +0000
Subject: Re: [Fwd: Re: Mails in incoming cause of "invalid from"]
Message-Id: <450C5D1D.2070902@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <450B2711.4030008@darkman.de>
In-Reply-To: <450B2711.4030008@darkman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Mads Martin Joergensen wrote:
> What I meant by reproducing is creating a mail in an editor doing this?
> I cannot do that. So there must be something seriously fishy with this
> one. Haven't had a chance to examine it yet.

it has become even more serious now: with 1.2.12-RC2 the same user
even can't subscribe to a new list... seems to be the same problem:
Sep 16 22:19:18 pamphlet /usr/bin/mlmmj-process[8010]:
listcontrol.c:180: Ignoring mail with invalid From: which was not a
bounce: Success

this was the reply to the confsub message... and the message has:
  -----Original Message-----
From: test+help@c3f2m.de [mailto:test+help@c3f2m.de]
Sent: Saturday, September 16, 2006 9:40 PM
To: my@benjamin-oette.de
Subject: [test] Confirm subscription to test@c3f2m.de

in it (notice the missing spaces for from etc!). Mailer is Outlook 11.
Is it possible that something "removes" leading spaces?

*help?* ;)

Sven
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFDF0dQoCguWUBzBwRAiyIAJ9uz46VyhBxUI/BHYI51m36H6IZLgCgo24S
B8BSByI+JkgOGKemb8dyg3s=r6re
-----END PGP SIGNATURE-----
