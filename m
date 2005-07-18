From: Jakob Hirsch <jh@plonk.de>
Date: Mon, 18 Jul 2005 23:26:56 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality
Message-Id: <42DC3AC0.1060109@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

> Is it just me, or is the second patch much better than the first one?

Of course it's better, else I wouldn't have posted it. :)
But the difference is not that big. I took out one forgotten debug
message and made it a little more reliable. (Seems that the local Samba
Festival and the Tour de France passing through was a little too much
distraction :)

> How much testing have this seen?

I tested the most common cases: no content-type, text/plain,
multipart/mixed (i.e. attachment) and multipart/alternative (i.e. html
and text, with or without attachment). Everybody feel free to send
something else to test@list.ymmv.de.

Possible problems I see:

- as I did no full parsing of the Content-Type header, the recognition
of the boundary is not 100% reliable, but it's very unlikely that
;boundary=" is something else.

- I only handle multipart/mixed and multipart/alternative, everything
else is assumed to be plain text, which is probably not true but it's
also the former behaviour. Maybe it's better to re-encapsulate
everything that is not already multipart/mixed. What do you think?

- Finding the close delimiter of multipart/mixed messages will not work
if there is (too much) text after the closing delimiter. This should
normally not happen, as this text will not be displayed by mail clients
(which was the why this came up at all). I think this is a minor issue.

- memory leaks if something goes wrong (i.e., at every return -1). Also
not important IMHO, as the mlmmj-process will immediatly exit then, but
I can fix this if you want.

- "voodo" is spelled "voodoo", btw. :)

