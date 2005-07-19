From: Jakob Hirsch <jh@plonk.de>
Date: Tue, 19 Jul 2005 18:44:20 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality
Message-Id: <42DD4A04.6030807@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>>Depends on what can possibly appear in the Content-Type line. Until now,
>>all I ever saw there was 'multipart/something; boundary="...."' at most.
>>I have to investigate.
> It doesn't really matter what one have ever seen, it only matters what
> is possible according to standards.

That's what I meant. According to RFC1341, multipart/mixed has only the
boundary parameter. But this is not an issue anymore (see below).

>>The code goes back 2*strlen(boundary)-1, so the garbage has to be less
>>than strlen(boundary), which is about 10..30 chars. I could read a
>>bigger buffer or even consecutively read back overlapping blocks. Hmm,
>>not too hard to do, so maybe I should stick to reliability.
> mlmmj is all about reliability :-)

Sure, that's one the reasons we use it. :)

To make it really reliable, I will take the easy way: Create a new MIME
envelope with multipart/mixed for every Content-Type (not only for
multipart/alternative, as now). It's not even the easiest way to do it,
it may also be the best one. Should have done it this way right from the
start.
We can even think about doing this with all messages, so the behaviour
and appearance is consistent. But that should probably be controlled by
a switch in the control directory (like "footer_always_mime").


btw, what happens with log_error messages? I thought they appear in
mlmmj.operation.log...

