From: fifadd@tin.it
Date: Mon, 30 May 2005 17:34:02 +0000
Subject: Re: qmail and the default delimeter
Message-Id: <428B2A8900017CD6@ims3a.cp.tin.it>
List-Id: <mlmmj.mlmmj.org>
References: <428B2A8900017B47@ims3a.cp.tin.it>
In-Reply-To: <428B2A8900017B47@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I don't know, is possible to do something "after", just before /usr/bin/mlmmj-receive
command, maybe with maildrop or procmail, but it doesn't solve the problem.
Do you think that you can patch this in a few time? It's seems not so difficult
looking your code.

-Filippo Fadda


>-- Messaggio originale --
>Date: Mon, 30 May 2005 18:53:55 +0200
>From: Mads Martin Joergensen <mmj@suse.de>
>To: mlmmj@mmj.dk
>Subject: Re: qmail and the default delimeter
>
>
>* fifadd@tin.it <fifadd@tin.it> [May 30. 2005 18:51]:
>> I have got another problem with qmail. The mailing list works fine, but
>> if you try to subscribe it, or unsubscribe, you got an error because
qmail
>> default delimeter is '-' not '+'. Also vpopmail use '-' for the aliases.
>> Is there some way to recompile qmail forcing to use another delimeter,
>but
>> is not so easy. I think that you have to modify the way to work of
>> mlmmj to manage '-' and '+' delimeter _together_. Actually mlmmj
>> manages the delimeter with the following constant. What happens if I
>> change it and recompile mlmmj?
>> 
>> #define RECIPDELIM '+'  /* XXX Warning: not changable at the moment */
>
>Well, it's not possible at the moment to use other delimiters than '+'.
>Is there a way to rewrite the addresses like they do on gentoo.org
>before qmail pass them on?
>
>> At the end I will write a README as you have asked me.
>
>Sounds great.
>
>-- 
>Mads Martin Joergensen, http://mmj.dk
>"Why make things difficult, when it is possible to make them cryptic
> and totally illogical, with just a little bit more effort?"
>                                -- A. P. J.
>


