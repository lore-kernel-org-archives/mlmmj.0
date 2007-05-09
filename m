From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 09 May 2007 17:11:08 +0000
Subject: Re: multiple bounces being =?UTF-8?Q?delivered=3F?=
Message-Id: <12576995b3652bc2280eb4a06d4872c1@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi,

Jakob Hirsch <jh@plonk.de> wrote:
> Quoting Nate Beaty:
...
>> <xxx@xxx.com>:
>> AUTORESPOND: Junk mail received.
> ...
>> any suggestions? somehow mlmmj thinks a message is not delivered when
>> it is (people are telling me they get all 10+ of these msgs) -- how
>> could this be possible?
> 
> Looks to me like some broken spam filter setup. For some reason it
> thinks the list message is spam, and sends back a bounce message

I think you are right. One of the subscribers has a broken spam filter.
When a mail is flagged by this subscribers filter, it sends back a
(broken) bounce mail. Bounce mails must be delivered to the envelope
from adress. If it does, mlmmj gets the bounce. I see two possible error
scenarios:

1) The broken spam filter sends its "bounce" to the address in the mail's
From: header. In that way, the original sender receives the "bounce"
message - and mlmmj doesn't know about it.

2) The broken spam filter sends its "bounce" to the address in the mail's
envelope from, but without the extra part - i.e. list@domain instead of
list+bounce-11223344@domain - making it impossible for mlmmj to tell
that it is a bounce.

Could you send the headers?

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

