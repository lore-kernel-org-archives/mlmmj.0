From: Nate Beaty <natebeaty@gmail.com>
Date: Fri, 15 Sep 2006 17:10:38 +0000
Subject: Re: submod tunable not working for me.. ?
Message-Id: <AF5BFBC5-4AFF-4A94-8724-4ABF388BF6F6@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <D47D1D36-3230-4FA0-B78E-8A7227FFD553@gmail.com>
In-Reply-To: <D47D1D36-3230-4FA0-B78E-8A7227FFD553@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sep 15, 2006, at 2:40 AM, Mads Martin Joergensen wrote:

> * Mads Martin Joergensen <mmj@mmj.dk> [Sep 14. 2006 23:00]:
>> * Nate Beaty <natebeaty@gmail.com> [Sep 14. 2006 20:52]:
>>> On Sep 14, 2006, at 11:18 AM, Mads Martin Joergensen wrote:
>>>
>>>> Hmmm, I wonder why it would return 1 and not report anything in the
>>>> logs... weird indeed.
>>>
>>> The Exim log, correct?
>>
>> Yes, where you get the error messages from mlmmj in general.
>
> I wonder why this works on postfix but not exim...

Have any other Exim users tried the submod functionality? Perhaps  
it's my settings somehow -- I did have trouble with local users when  
I first installed mlmmj. ( http://mlmmj.mmj.dk/archive/0788.html )

It's just strange that when I remove submod from control/ I can  
respond to the confirmation messages without any problems. So it  
seems the problem it must be in the area after the user confirms his/ 
her email and it moves on to send a msg to the owner or email listed  
in submod. I am unfamiliar with C, so I am unable to troubleshoot the  
code at all.

Nate.

--
Clixel Design & Coding ~ http://clixel.com/

