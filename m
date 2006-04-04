From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 04 Apr 2006 22:37:23 +0000
Subject: Re: Two To: headers added to auto-mails from list
Message-Id: <20060405003723.z92rwljk2sc4w0wc@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <44312C59.8000100@925.dk>
In-Reply-To: <44312C59.8000100@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Martin Koch Andersen <martin@925.dk>:
> Morten K. Poulsen skrev:
>>> Why do I get this extra To: header? Could it be a bug with the 
>>> mentioned configuration above?
>>
>> I cannot see how the customheaders option could change a confsub or 
>> sub-ok mail.
>
> It seems like the 'delete headers' thing is not executed for confsub, 
> sub-ok etc. mails? And in my setting I have also 'Add To: header' - 
> so that the actual receiver address is added as To: address. Could 
> this not be the reason the 'To:' header is set twice?

Ah, you are using the addtohdr option, not customheaders. I should read 
a mail before replying to it :-)

Have you tried Christian Laursen's patch? I think it is the right way 
to fix this issue.

Morten
