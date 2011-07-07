From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 07 Jul 2011 23:30:04 +0000
Subject: Re: [mlmmj] make mlmmj silent about delivery problems
Message-Id: <4E16417C.1060604@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <1307092172.2639.5.camel@cg-desktop>
In-Reply-To: <1307092172.2639.5.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hmmm. Seems OK to me. If you haven't messed with it, it is probably OK.

So maybe something specific about those addresses is causing problems.

Maybe look in the bounce subdirectory of your listdir. If probes are being sent 
there should be a 'last bounce message received' stored in there, I think, for the 
relevant addresses. That might shed some light on what's happening.

Ben.



On 3/07/11 1:59 AM, Christian Gleerup wrote:
> thanks for the response, it seems like I am quite slow to.
>
> the problem is, I don't really know much about mailserver and
> configuration.
>
> I have looked in /etc/postfix/main.cf
>
> and I guess that these values are interesting, perhaps some of you can
> recomends some better values.
>
> bounce_queue_lifetime = 2d
> minimal_backoff_time = 1800s
>
> would it be better to increase this minimal backoff_time to.. say 1hour,
> and maximum to 4 hours?
>
> also, transport_retry_time is not specified, I am running postfix
> version 2.5.5 so this seems like it will be 60s
>
> there are no /etc/postfix/bounce.cf, I am not sure if this is important.
>
> Furthermore, this doesn't happen for a lot of customers, we have arround
> 10k subscribers for a (almost) daily mail. We do get few complaints
> about this (1 every 1 or 2 week) the last one complaining actually
> contacted the police :(... now unsubscribed.
>
> /Christian
>
>
> man, 20 06 2011 kl. 12:20 +1000, skrev Ben Schmidt:
>> Sorry for the slow response. This isn't my area of expertise, but I'll
>> have a go, since nobody else seems to have.
>>
>> I don't think there's any way to turn these off, though it's possible
>> that deleting the listtext for probes would cause Mlmmj to stop sending
>> them. It would also, though, probably stop Mlmmj's ability to probe
>> bouncing users and unsubscribe them (which could lead to Mlmmj/your
>> domain being considered a spammer, too).
>>
>> It seems to me, too, that these are symptomatic of a deeper problem.
>> Bounce probes should only be sent if mail does, in fact, bounce, i.e.
>> messages get returned to Mlmmj. If the bounce probes are being sent, it
>> means that messages are not reaching recipients. Turning off the probes
>> wouldn't solve that problem; it would just hide it. It would be better
>> to find out why so many mail messages are bouncing. Does your outgoing
>> mail server have sensible error behaviour and retry schedule, or is it
>> just bouncing too quickly on retryable errors when it shouldn't?
>>
>> Cheers,
>>
>> Ben.
>>
>>
>>
>> On 3/06/11 7:09 PM, Christian Gleerup wrote:
>>> Hi list.
>>>
>>> I have some customers complaining that  they get a lot of mails 40+ pr
>>> day, the reason for this is that there has ben some kind of delivery
>>> problem, the message saying something like: "some messaged could not be
>>> delivered. If you see this things are back to normal."
>>>
>>> how can i make mlmmj be silent about these delivery problems?
>>>
>>> /Christian
>>
>>
>>
>>
>
>
>
>
>

