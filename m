From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 26 Jun 2011 12:01:50 +0000
Subject: Re: [mlmmj] Any use case for subscribing to multiple versions
Message-Id: <4E071FAE.3040903@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4D78B56D.1020804@yahoo.com.au>
In-Reply-To: <4D78B56D.1020804@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, everyone, and sorry for the LONG delays. A bunch of things have
unfortunately got in the way of my Mlmmj work. I can't promise that I'll
make good progress now, but I certainly hope to.

So, following up some loose ends before I do a final implementation
sprint and push out a beta or release candidate.

>> I'm thinking of changing unsubscribe so it unsubscribes the user for
>> any/all versions they are subscribed to, and subscribe so that if you
>> are already subscribed to a different version, you 'switch' to the
>> version you request the subscription for, ...

>>>> Is there any use case for being subscribed to multiple versions of
>>>> the same list? I can't think of a useful one.

>>> I subscribe to both normal and digest versions of the lists I
>>> manage. It's the easiest way to see if I'm having digest issues.
>>> The cost is a daily hit of the delete key.

>> I guess this is something only the list owner would ever want. How
>> about we make this available only from the commandline (via a switch
>> to mlmmj-sub), but make the standard behaviour that subs unsub you
>> from other versions of the list?

> +1

OK. I am going to use this approach.

I may implement the ability to do a subscribe-both via email, but this
will not be documented in the default list texts. The default list texts
will use the model described above.

One question for mail experts and sysadmins out there: Should
'switching' (i.e. changing an existing subscription to a different
version) require moderation or confirmation? I think not. Does anyone
disagree?

Cheers,

Ben.




