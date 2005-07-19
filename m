From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 19 Jul 2005 07:25:23 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality check!)
Message-Id: <20050719072523.GO83227@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Jul 19. 2005 01:27]:
> > Is it just me, or is the second patch much better than the first one?
> 
> Of course it's better, else I wouldn't have posted it. :)
> But the difference is not that big. I took out one forgotten debug
> message and made it a little more reliable. (Seems that the local Samba
> Festival and the Tour de France passing through was a little too much
> distraction :)

Hehe :)

> > How much testing have this seen?
> 
> I tested the most common cases: no content-type, text/plain,
> multipart/mixed (i.e. attachment) and multipart/alternative (i.e. html
> and text, with or without attachment). Everybody feel free to send
> something else to test@list.ymmv.de.

People, please send all kinds of potential mails breaking this to this
list. I would really like to have this tested.

> Possible problems I see:
> 
> - as I did no full parsing of the Content-Type header, the recognition
> of the boundary is not 100% reliable, but it's very unlikely that
> ;boundary=" is something else.

How hard would it be to parse it completely?

> - I only handle multipart/mixed and multipart/alternative, everything
> else is assumed to be plain text, which is probably not true but it's
> also the former behaviour. Maybe it's better to re-encapsulate
> everything that is not already multipart/mixed. What do you think?

But if it's assumed to be text/plain, then the behaviour is as before,
no more, no less?

> - Finding the close delimiter of multipart/mixed messages will not work
> if there is (too much) text after the closing delimiter. This should
> normally not happen, as this text will not be displayed by mail clients
> (which was the why this came up at all). I think this is a minor issue.

What does "too much text" mean in this case?

> - memory leaks if something goes wrong (i.e., at every return -1). Also
> not important IMHO, as the mlmmj-process will immediatly exit then, but
> I can fix this if you want.

Don't.

> - "voodo" is spelled "voodoo", btw. :)

Yeah--mlmmj have a history of misspelled words. Look at mlmmj-recieve
:-)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
