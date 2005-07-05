From: "Patrick Bennett" <patrick@pebcomputing.com>
Date: Tue, 05 Jul 2005 23:32:54 +0000
Subject: Re: footer isn't appended to multipart messages (part II: reality check!)
Message-Id: <008c01c581b9$df072f10$6564a8c0@stnick>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


----- Original Message ----- 
From: "Sven 'Darkman' Michels" <sven@darkman.de>
To: <mlmmj@mmj.dk>
Sent: Tuesday, July 05, 2005 3:09 PM
Subject: Re: footer isn't appended to multipart messages


> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Casey Allen Shobe wrote:
> | There is only one thing more annoying on mailing lists than
> | appending stupid user text to every single message, and that is the
> | monthly password reminders that mailman sends out.  I get spammed
> | with about 50 of them at about the same time every month, so I
> | wrote a filter to automatically delete them to retain sanity.
>
> Full ACK. I got flooded by them, too. Never mind, everything can
> be filtered ;)

This is absolutely true- you (that is to say, *we*, that is to say 
techie/programmer types) find this stuff very annoying.  However, mailing 
lists are used by knitting clubs too, and I, for one, DO NOT want the 
nightmare of administrating a knitting club mailing list that has absolutely 
no dependable notification of "how to do it yourself".


>
>
> | That being said, List-Subscribe, List-Unsubcribe, etc. headers
> | should be present, and they don't appear to be on this list.  Does
> | mlmmj support them yet?
>
> Well, yes and no. Yes: you can add them to Custom headers file,
> No: they're not added automaticly (maybe this could be implemented
> but i think it's ok if you run a lot of lists to generate the
> customheaders file by a script or so ;)
>
>
> | (this is not to say that your feature request/bug report is invalid
> | - it is in fact useful in some cases and should work as you expect,
> | but the example you provided should be discouraged and it's also
> | not the easiest thing to implement due to the varying nature of
> | what the multipart messages might contain, how the HTML is
> | structured, etc.)
>

not sure which "example" you mean, but if it's monthly nags (a.k.a. mailing 
list subscribe/unsubscribe howto's), then, yes, it should be discouraged 
*for appropriate lists and when there is no reliable way to append footer 
text*.  For other lists, on the contrary, it should be *encouraged* (see 
above)!


> correctly. I think the 'append a footer' feature is ok, too. Just
> disable html mail and stuff and it's nearly fine. The List- Headers
> should be always present (not hard to implement ;)
> Implementing appending of stuff for multipartmessages just suck
> cause you have so many ways clients do 'their' encoding and
> maybe some gateways who add shitty 'this is confidential mail'
> footers, too, so you may end up in a 4 or more part mail which
> only contains a one liner...
>

1)  I haven't found the documentation on how to enforce text-only mailing 
lists (it's one of the first bits of info i looked for when i figured out 
what the problem was; 2) not sure what happens on a text-only mlmmj list 
when a multi-part msg is sent, but whatever it is, for the "knitting club", 
it *can't* be a reject msg- a mailing list that fits the "knitting club's" 
needs (and I realize this may never be what mlmmj is, though I wish it could 
be, because I've very much liked the software otherwise) has to handle the 
default settings of widespread (though not necessarily popular with us 
programmer/techies) email clients (eg. outlook express).

Regards,
> Sven
>

    -Patrick 

