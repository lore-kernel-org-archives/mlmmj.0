From: Claudio Prono <claudio.prono@atpss.net>
Date: Wed, 02 Jul 2008 09:12:21 +0000
Subject: Re: Maxmailsize don't work?
Message-Id: <486B4675.2010006@atpss.net>
List-Id: <mlmmj.mlmmj.org>
References: <486B3895.3010804@atpss.net>
In-Reply-To: <486B3895.3010804@atpss.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

The value of 20000000000 bytes is just an example, i have tried to set 
it to a smaller value, but the problem persist. Seems like the control 
of  the maxmailsize have something wrong. If i remove the maxmailsize, 
it's all ok, but is just  a work-around. Can be a bug of mlmmj ?

Thank u,

Claudio.

Christian Laursen ha scritto:
> Claudio Prono <claudio.prono@atpss.net> writes:
>
>   
>> I'm sorry to inform you that your message could not be delivered to the
>> list. Your mail was rejected due to the size limit of 20000000000 bytes.
>>     
>
> <snip>
>
>   
>> What is the problem? The size is not more than 20000000000 bytes, so what's wrong?
>>     
>
> You have set the maxmailsize value to 20 gigabytes. If you are on a 32
> bit platform this is too big for the integer in which the value is
> stored.
>
> Unless this really is the limit you want to enforce (Sounds like
> insanely big mails), try removing a 0 or two to get a smaller value.
>
> I don't know if this is the problem but it is the most likely
> explanation.
>
>   

-- 
------------
Claudio Prono
Systems Development @ Atpss.net Srl, Divisione Implementazione Sistemi
Via San Bernardino, 17 - 10137 Torino (TO) - IT
Tel +39-011.32.72.100  Fax +39-011.32.46.497
PGP Fingerprint: 75C2 4049 E23D 2FBF A65F  40DB EA5C 11AC C2B0 3647
Disclaimer: http://atpss.net/disclaimer
------------ 

