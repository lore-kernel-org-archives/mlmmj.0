From: Raymond den Ouden <raymond@den-ouden.info>
Date: Tue, 18 Sep 2007 13:01:45 +0000
Subject: Re: Having individual receiver in To: field
Message-Id: <46EFCC39.3060706@den-ouden.info>
List-Id: <mlmmj.mlmmj.org>
References: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
In-Reply-To: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Christian Laursen wrote:
> Neale Pickett <neale@woozle.org> writes:
>
>   
>> Neale Pickett <neale@woozle.org> writes:
>>
>>     
>>> That's not really how mail lists are supposed to work.  I don't think
>>> mlmmj has a way to set this up.  Why do you want such a thing?
>>>       
>> Holy cow, I stand corrected, the "addtohdr" tunable does this.
>>
>> Why would anybody want such a thing?
>>     
>
> It makes sense for newsletters and announce lists and that sort of
> thing.
>   
And not to forget. Hotmail tend to drop mails which does not have the 
receiver in one of the address headers in the spam box.
The sportclub I manage a few lists for had the problem that specifically 
hotmail users did not receive the mailinglist mails.

With using the addtohdr I managed to work around  this annoying hotmail 
"bug".

As a matter of fact, that was the main reason for me to move to mlmmj
