From: Jakob Hirsch <jh@plonk.de>
Date: Thu, 07 Jul 2005 15:31:15 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality
Message-Id: <42CD4AC3.5060104@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Patrick Bennett wrote:

> oops, forgot to cc the list. apologies.

you could have sent the same mail again to the list, so threading and
quoting wouldn't have been broken.

>> If I understand correctly, and I may well be mistaken, other mailing
>> list softwares out there in the open source world (gnu mailman comes
>> to mind as an example), are able to handle appending footer messages
>> to a wide variety of incoming email formats.  No suggestion that,
>> coding wise, this is accomplished *easily*, but just that it would be
>> cool (and, in particular, useful to *me*) if mlmmj could do it as

After playing around a little with mailman, I think it's not too hard to
do it, you just have to handle the possible cases correctly.

Mads, would you accept a patch?
