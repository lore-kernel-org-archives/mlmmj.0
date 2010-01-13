From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 13 Jan 2010 15:40:49 +0000
Subject: Re: Footer in MIME messages
Message-Id: <4B4DE981.2000608@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <201001131552.44276.lists@egidy.de>
In-Reply-To: <201001131552.44276.lists@egidy.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, Gerd,

>> I can see from the mailing list archives that the subject of mlmmj handling
>> footers correctly for MIME messages was discussed back in 2005/2006. A
>> patch was made, the latest version of which is, I believe, here:
>>
>> http://plonk.de/sw/mlmmj/mlmmj-footer-mime6.patch
>
> as far as I understood the discussions later on, it was preferred not to do
> the MIME-modifications within mlmmj itself.

Yeah, that's perfectly understandable. I can definitely see that this
could be considered the job for a separate content filter.

> I wrote a patch which offloads the mime-modification to another task. I use
> the altermime for that. I sent the patch in this mail:
>
> http://mlmmj.org/archive/mlmmj/2008-12/1444.html

At a quick glance, I like the look of it and I think it will suit my
purposes nicely. I can also easily extend it to do whatever else I like
which has a couple of possible advantages.

> I guess it wasn't included because the release process for 1.2.16 was already
> started and it got forgotten later on. Morten?

Well, it gets a vote from me for inclusion! ^'Cause my opinion counts
for so much since I've been here for about an hour.^ *

Ben.

* End ambiguity in written sarcasm. Use the sarcasm hat ^and be the envy
of all your friends^.




