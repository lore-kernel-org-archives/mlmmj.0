From: =?UTF-8?B?RGFuaWVsIEvDvGhuaQ==?= <daniel.kuehni@indato.ch>
Date: Wed, 05 Mar 2008 13:50:51 +0000
Subject: Re: Problems with modnonsubposts
Message-Id: <47CEA53B.7070904@indato.ch>
List-Id: <mlmmj.mlmmj.org>
References: <47CC730A.7070407@indato.ch>
In-Reply-To: <47CC730A.7070407@indato.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Morten

Thanks for your quick response.
>> Apparently I have a strange wish for some special list I want to create.
>>
>> I want:
>> - no option for subscription or unsubscription to the list - a closed list
>> - a message from a subscriber should be delivered to the list 
>> subscribers without any intervention
>> - a message from a non-subscriber should be moderated by a moderator
>>     
>
> That is not too strange.
>   
Ok, sounds good.

>> -rw-r--r-- 1 nobody mlmmj   0 Feb 22 16:55 modnonsubposts
>>     
> ...
>   
>> -rw-r--r-- 1 nobody mlmmj   0 Mar  3 22:29 subonlypost
>>     
>
> That should be fine.
>
> In pseudocode, that part of mlmmj looks like this:
>
> if (subonlypost && !user_is_subscribed) {
>   if (modnonsubposts) {
>     MODERATE;
>   } else if (!nosubonlydenymails) {
>     DENY;
>   } else {
>     IGNORE;
> } else {
>   ALLOW;
> }
>
> So with subonlypost and modnonsubposts set, this should be what you
> want, right?
>   
Exactly. The pseudocode is absolutely what I want to achieve.
>> But this does not work as I wanted to. Now non-subscribers get a message 
>> back telling them that they are not subscribed and its a closed list.
>>     
>
> Is that the subonlypost message?
>   
Yes.
> As far as I can see, your configuration is correct. Which version of
> mlmmj are you running? Not that I can remember any bugs in this part of
> the code.
I'm running version 1.2.12 on Gentoo which seems to be the lastest 
stable version available for Gentoo:

*  net-mail/mlmmj
      Latest version available: 1.2.12
      Latest version installed: 1.2.12
      Size of files: 146 kB
      Homepage:      http://mlmmj.mmj.dk/
      Description:   Mailing list managing made joyful
      License:       MIT


What would you suggest?

Thanks an regards,
Daniel
