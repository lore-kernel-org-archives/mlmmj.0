From: Jakob Hirsch <jh@plonk.de>
Date: Thu, 12 Apr 2007 08:34:49 +0000
Subject: Re: multiple bounces being delivered?
Message-Id: <461DEF29.3080802@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <ddf499d00704111459m62f4e46cu4f36fcd287c8bdf2@mail.gmail.com>
In-Reply-To: <ddf499d00704111459m62f4e46cu4f36fcd287c8bdf2@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Nate Beaty:

> Hi. This is the qmail-send program at 66.33.34.80.

This is the remote mta yours sent the list message to?

> <xxx@xxx.com>:
> AUTORESPOND: Junk mail received.
...
> any suggestions? somehow mlmmj thinks a message is not delivered when
> it is (people are telling me they get all 10+ of these msgs) -- how
> could this be possible?

Looks to me like some broken spam filter setup. For some reason it
thinks the list message is spam, and sends back a bounce message (which
is, in general, very bad, because it would produce collateral spam on
real spam), but still delivers the message to the user's mailbox.




