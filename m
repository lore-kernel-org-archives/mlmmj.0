From: "Jakob Hirsch" <jh@plonk.de>
Date: Tue, 11 Oct 2005 07:52:14 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II:
Message-Id: <31400.193.99.214.134.1129017134.squirrel@ymmv.de>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Neale Pickett wrote:

>> > If it's already MIME, we only meet the standards.
>> So how about meeting the standars when and only when it's already MIME?

Content-Type and Content-Transfer-Encoding _are_ MIME headers, so messages
containing these headers are MIME messages and should be treated as such.

> +1 for this.  There's no need to make a message multipart if there's only
> one part in the first place (unless that one part isn't text/plain, I
> guess).

This is only valid if this one part's transfer-encoding is 7/8bit or QP.
Even then it's closer to the "MIME spirit" to make it multipart and add
things in it's own part. This also gives you the possibility to use your
own charset etc. (though this is not supported ATM).

If somebody cares about message modification (and does MTA debugging, like
I also do) he shouldn't use a footer in the first place, so there is no
modification at all.
But if you have to, MIME gives you the opportunity to reconstruct a
message as it was, since the original body is preserved in a MIME
envelope. Simply appending a footer is more tampering.

But ok, I yield to the overwhelming majority. :)
I'll add a switch so people can disable MIME handling. Or should the
default be "off"?


