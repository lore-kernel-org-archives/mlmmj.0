From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 18 Sep 2007 16:53:05 +0000
Subject: Re: Having individual receiver in To: field
Message-Id: <46F00271.8050805@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
In-Reply-To: <1557ec740709171048y2b7c2e08g5c9fbfe40196087a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Raymond den Ouden wrote:
> Christian Laursen wrote:
>> Neale Pickett <neale@woozle.org> writes:
>>> Neale Pickett <neale@woozle.org> writes:
>>>> That's not really how mail lists are supposed to work.  I don't think
>>>> mlmmj has a way to set this up.  Why do you want such a thing?
>>>>       
>>> Holy cow, I stand corrected, the "addtohdr" tunable does this.
>>>
>>> Why would anybody want such a thing?
>>>     
>>
>> It makes sense for newsletters and announce lists and that sort of
>> thing.
>>   
> And not to forget. Hotmail tend to drop mails which does not have the
> receiver in one of the address headers in the spam box.
> The sportclub I manage a few lists for had the problem that specifically
> hotmail users did not receive the mailinglist mails.
> 
> With using the addtohdr I managed to work around  this annoying hotmail
> "bug".
> 
> As a matter of fact, that was the main reason for me to move to mlmmj

We do VPS hosting. We also use this brilliant function to send email to
a list of users when there's a problem on one of our server. We don't
really want people to read "whateverusers@example.com", as it's not
meant to be used as a list. We also set the list as closed, and
moderated, so the people we send mail to can't send to the list.

This makes me think that I would have like a way that only certain
person (like the list owners or the moderators) could send to the
moderated list without the hassle of having to approve the messages. On
a busy mail server it can take some time until we receive the moderation
message. I don't really know how this could be implemented, but what I
thought about would be something like a password in the subject that
would be removed, for example (this is not very nice, but that's the
only thing I can think of). I know that the From: checking is not enough
as this could be faked. Does anybody has a better idea for that one?

Thomas Goirand, GPLHost CEO
