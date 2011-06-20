From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 20 Jun 2011 02:20:57 +0000
Subject: Re: [mlmmj] make mlmmj silent about delivery problems
Message-Id: <4DFEAE89.4050901@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <1307092172.2639.5.camel@cg-desktop>
In-Reply-To: <1307092172.2639.5.camel@cg-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Sorry for the slow response. This isn't my area of expertise, but I'll
have a go, since nobody else seems to have.

I don't think there's any way to turn these off, though it's possible
that deleting the listtext for probes would cause Mlmmj to stop sending
them. It would also, though, probably stop Mlmmj's ability to probe
bouncing users and unsubscribe them (which could lead to Mlmmj/your
domain being considered a spammer, too).

It seems to me, too, that these are symptomatic of a deeper problem.
Bounce probes should only be sent if mail does, in fact, bounce, i.e.
messages get returned to Mlmmj. If the bounce probes are being sent, it
means that messages are not reaching recipients. Turning off the probes
wouldn't solve that problem; it would just hide it. It would be better
to find out why so many mail messages are bouncing. Does your outgoing
mail server have sensible error behaviour and retry schedule, or is it
just bouncing too quickly on retryable errors when it shouldn't?

Cheers,

Ben.



On 3/06/11 7:09 PM, Christian Gleerup wrote:
> Hi list.
>
> I have some customers complaining that  they get a lot of mails 40+ pr
> day, the reason for this is that there has ben some kind of delivery
> problem, the message saying something like: "some messaged could not be
> delivered. If you see this things are back to normal."
>
> how can i make mlmmj be silent about these delivery problems?
>
> /Christian




