From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Tue, 05 Jul 2005 22:09:08 +0000
Subject: Re: footer isn't appended to multipart messages
Message-Id: <42CB0504.1070403@darkman.de>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Casey Allen Shobe wrote:
| There is only one thing more annoying on mailing lists than
| appending stupid user text to every single message, and that is the
| monthly password reminders that mailman sends out.  I get spammed
| with about 50 of them at about the same time every month, so I
| wrote a filter to automatically delete them to retain sanity.

Full ACK. I got flooded by them, too. Never mind, everything can
be filtered ;)


| That being said, List-Subscribe, List-Unsubcribe, etc. headers
| should be present, and they don't appear to be on this list.  Does
| mlmmj support them yet?

Well, yes and no. Yes: you can add them to Custom headers file,
No: they're not added automaticly (maybe this could be implemented
but i think it's ok if you run a lot of lists to generate the
customheaders file by a script or so ;)


| (this is not to say that your feature request/bug report is invalid
| - it is in fact useful in some cases and should work as you expect,
| but the example you provided should be discouraged and it's also
| not the easiest thing to implement due to the varying nature of
| what the multipart messages might contain, how the HTML is
| structured, etc.)

correctly. I think the 'append a footer' feature is ok, too. Just
disable html mail and stuff and it's nearly fine. The List- Headers
should be always present (not hard to implement ;)
Implementing appending of stuff for multipartmessages just suck
cause you have so many ways clients do 'their' encoding and
maybe some gateways who add shitty 'this is confidential mail'
footers, too, so you may end up in a 4 or more part mail which
only contains a one liner...

Regards,
Sven
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFCywUDQoCguWUBzBwRAtdcAJ9o5ozqcY/H69Sn0kJhvDekr/TcEwCeJESi
bM+5Uw0+deHZHAnN30gddRw=EHej
-----END PGP SIGNATURE-----
