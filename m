From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 07 Jul 2009 10:17:52 +0000
Subject: Re: moderation only by sender
Message-Id: <4A5320D0.4040603@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
In-Reply-To: <5e77c93d0907031333q4cba6335ib8f8622a40518edf@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Sebastian Harl wrote:
> Hi,
> 
> On Fri, Jul 03, 2009 at 10:33:51PM +0200, Henk Cortier wrote:
>> One mailing list has 14 moderators who all wish to be able to send and
>> moderate the mails they send out.
>>
>> What we would like to avoid is that moderation mails are sent to all
>> moderators, ideally only the sender of the message should receive the
>> moderate mail and be able to reply to it.
> 
> Hrm ... what about introducing some tunable to define a list of E-mail
> addresses which are not moderated instead (or additionally)? Imho, it
> does not make a lot of sense to moderate yourself - especially, if
> you're the only one to even "know" about that.
> 
> Cheers,
> Sebastian

But if you "know" about it, and especially if OTHER THAT ARE NOT
MODERATOR know about it, you want a protection so nobody else but you
can send to the list. The bounce message does the perfect captcha work...

I don't like the:
allow X-MySecret: a6e043b3786d6d19bc141e7d194b6517

It's not always easy to add such headers. Like explain to me how I can
do this with the standard mail client of my Nokia phone...

Thomas


