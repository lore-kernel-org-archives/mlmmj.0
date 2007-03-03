From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Sat, 03 Mar 2007 17:43:54 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <c4ebda70225776f80fe75df8a77beca0@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi all,

>>>> so i was "right" with removing the two free's?
>>>
>>> You were. But I don't have an idea why.
[snip]
>> The myfree()s should be there.

So... I found the problem: I was wrong, mailfile should not
be myfree()d - it's a pointer to an argument (which is on
the stack, not the heap).

I removed the statctrl() call as ctrlvalue() returns NULL for a non-
exsisting tunable, and rearranged a few of the code lines.

The patch I committed is available here:

http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.13-maxmailsize.diff

Christoph has written an English and a German version of the new
maxmailsize list text. Everybody who maintains a translation,
please translate this new file:

http://mlmmj.mmj.dk/~mortenp/maxmailsize

Have fun,
Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

