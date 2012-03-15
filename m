From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 15 Mar 2012 21:47:02 +0000
Subject: Re: [mlmmj] How to disable bounce probes
Message-Id: <4F626356.5080001@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F625B33.4000802@pub.positon.org>
In-Reply-To: <4F625B33.4000802@pub.positon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

One way to do it is to set 'staticbounceaddr' (see TUNABLES) to send the
bounces to a black-hole, rather than having Mlmmj process them. Mlmmj
will then think nothing is bouncing, so will not try to probe.

I think removing the text/probe or text/bounce-probe list text would
also turn off the messages, but log an error to syslog when Mlmmj tries
to send one. You'd have a record of which address are bouncing that way,
though, which may or may not be a benefit.

Beware, though, that if a lot of spam emails are being sent from your
mail server, you may end up with your IP blacklisted or something like
that. It's probably more worth your while to try to filter out the spam
and avoid it going out at all. Ignoring the problem by turning the
bounces off will just let the problem grow, unnoticed and unrestrained.

That's my opinion, anyway.

Cheers,

Ben.



On 16/03/12 8:12 AM, Marc MAURICE wrote:
> Hello,
>
> Is it possible to disable mlmmj bounce probe feature ?
>
> I have an open mailing list (anybody can post), receiving lot of spam.
> This list is more like an alias (as in /etc/aliases), with multiple destinations,
> but it's convenient for me to have it managed by mlmmj.
>
> Those spams are deleted by the subscribers antispams, however, mlmmj receives
> bounces, and send bounce probes to check, I guess, that the subscriber is active.
>
> So my users are receiving the following.
> Question : is it possible to disable bounce probes ?
>
> "
> Some messages to you could not be delivered. If you're seeing this
> message it means things are back to normal, and it's merely for your
> information.
>
> Here is the list of the bounced messages:
> "
>
> Thanks in advance,
> Marc

