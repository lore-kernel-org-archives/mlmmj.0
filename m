From: fifadd@tin.it
Date: Fri, 27 May 2005 13:00:01 +0000
Subject: Re: qmail mlmmj Return-Path issue (SOLVED)
Message-Id: <428B2A8900013632@ims3a.cp.tin.it>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

It's my mistake. 

qmail-inject remove Return-Path but you can add it using preline. So into
your .qmail-myest write:

|preline -f /usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/mytest/

preline add Return-Path and Delivery-To and From by default, so -f remove
From and -r remove Return-Path (this was my previuos mistake).

If you are using vpopmail set:

chwon -R vpopmail /var/spool/mlmmj
chgrp -R vchkpw /var/spool/mlmmj

and create the alias under /home/vpopmail/domains/mydomain/.qmail-mytest

If you want you can write a README.qmail with this hint, it will be appreciate.

Bye

-Filippo Fadda

>-- Messaggio originale --
>Date: Fri, 27 May 2005 11:32:53 +0200
>From: Mads Martin Joergensen <mmj@mmj.dk>
>To: mlmmj@mmj.dk
>Subject: Re: qmail mlmmj Return-Path issue
>
>
>* Filippo Fadda <fifadd@tin.it> [May 27. 2005 03:10]:
>> I have a problem with qmail + mlmmj that seems like that verified with
>
>> postfix. Look here:
>> 
>> http://mlmmj.mmj.dk/archive/0154.html
>> 
>> qmail-local delete the Return-Path header before calling qmail-command,
>so 
>> into the mail passed to mlmmj-recieve (the english word is "receive"
not
>
>> "recieve", I think that it can create a bit of confusion) the header
does
>
>> not appear.
>
>It's called recieve for historical reasons :)
>
>> I don't know how to change this qmail default behaviour and all the emails
>
>> that I'm sending to my test list are discarded.
>> Have you tried mlmmj with qmail? Is there some solution to this issue?
>I 
>> have searched with Google, but I have not found anything about this 
>> problem. Maybe I'm wrong something.
>
>By reading the qmail-command manual page I see the following:
>
> DTLINE and RPLINE are the usual Delivered-To and Return-Path lines,
> including newlines.
>
>Why on earth djb is mangling it like that is beyond me, but you need
>both headers back in the mail.
>
>-- 
>Mads Martin Joergensen, http://mmj.dk
>"Why make things difficult, when it is possible to make them cryptic
> and totally illogical, with just a little bit more effort?"
>                                -- A. P. J.
>


