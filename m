From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 15 Feb 2016 22:03:11 +0000
Subject: Re: [mlmmj] bounces-help and exim
Message-Id: <56C24B1F.4020309@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
In-Reply-To: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Strange.

It looks like a regular help email, the type you would expect from
sending an email to surevoip-service-status+help@lists.suretec.net but
it's going to mailer-daemon@... as if mailer-daemon sent an email to
that address.

I'm thinking that perhaps something is messed up with your delimiter,
i.e. +bounces-help is being treated like +help (+bounces-help is the
address used when + commands fail, like subscription, etc.).

Do other + commands work, e.g. subscribing via email?

What happens if you send an email to the help address (above) from an
address at which you can receive replies?

What if you replace the '+' with a '-'?

Is there anything revealing in "mlmmj-operation.log"? There should be an
"XXX requested help" line when help emails are sent out.

Ben



On 13/02/2016 11:44 pm, Gavin Henry wrote:
> Hi,
>
> Our smart host is complaining about bounce help emails getting generated to them.
> We're using the exim4 readme for this. Here's an example below. Any ideas?
>
> Here's one of them:
>
> MIME-Version: 1.0
> Envelope-To: servicedesk@gladserv.com <mailto:servicedesk@gladserv.com>
> X-Delivered-To: mailer-daemon@gladserv.com <mailto:mailer-daemon@gladserv.com>
> X-Delivered-To: postmaster@gladserv.com <mailto:postmaster@gladserv.com>
> Content-Type: text/plain; charset=utf-8
> Message-ID: <1455291628-15131-mlmmj-058e7860@lists.suretec.net
> <mailto:1455291628-15131-mlmmj-058e7860@lists.suretec.net>>
> X-Spam-Score: -1.0 (-)
> Received: from clemens.alpha.gladserv.net <http://clemens.alpha.gladserv.net/>
> ([2001:41c8:123:a206::2]:39321) by livius.septime.gladserv.com
> <http://livius.septime.gladserv.com/> with
> esmtps (TLSv1:AES256-SHA:256) (Exim 4.75) (envelope-from
> <surevoip-service-status+bounces-help@lists.suretec.net
> <mailto:surevoip-service-status%2Bbounces-help@lists.suretec.net>>) id
> 1aUFpd-0002qa-BX for servicedesk@gladserv.com <mailto:servicedesk@gladserv.com>;
> Fri, 12 Feb 2016 15:40:29
> +0000
> Received: from bregans.neuvieme.gladserv.com <http://bregans.neuvieme.gladserv.com/>
> ([2001:41c8:123:328::2]:52285) by clemens.alpha.gladserv.net
> <http://clemens.alpha.gladserv.net/> with esmtps
> (TLSv1:AES256-SHA:256) (Exim 4.80_121-2de1f5c) (envelope-from
> <surevoip-service-status+bounces-help@lists.suretec.net
> <mailto:surevoip-service-status%2Bbounces-help@lists.suretec.net>>) id
> 1aUFpc-00051y-PB for Mailer-Daemon@gladserv.com
> <mailto:Mailer-Daemon@gladserv.com>; Fri, 12 Feb 2016
> 15:40:29 +0000
> Received: from governor.surevoip.co.uk
> <http://governor.surevoip.co.uk/> ([185.8.92.26]:60495) by
> bregans.neuvieme.gladserv.com <http://bregans.neuvieme.gladserv.com/> with esmtpsa
> (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69) (envelope-from
> <surevoip-service-status+bounces-help@lists.suretec.net
> <mailto:surevoip-service-status%2Bbounces-help@lists.suretec.net>>) id
> 1aUFpc-0005vm-Ey for Mailer-Daemon@gladserv.com
> <mailto:Mailer-Daemon@gladserv.com>; Fri, 12 Feb 2016
> 15:40:28 +0000
> Received: from localhost ([127.0.0.1] helo=governor.surevoip.co.uk
> <http://governor.surevoip.co.uk/>) by
> governor.surevoip.co.uk <http://governor.surevoip.co.uk/> with smtp (Exim 4.80)
> (envelope-from
> <surevoip-service-status+bounces-help@lists.suretec.net
> <mailto:surevoip-service-status%2Bbounces-help@lists.suretec.net>>) id
> 1aUFpc-0003w5-4w for Mailer-Daemon@gladserv.com
> <mailto:Mailer-Daemon@gladserv.com>; Fri, 12 Feb 2016
> 15:40:28 +0000
> X-Country: GB
> Subject: Information for surevoip-service-status@lists.suretec.net
> <mailto:surevoip-service-status@lists.suretec.net>
> X-Spam-Nocheck: No
> Return-Path: <surevoip-service-status+bounces-help@lists.suretec.net
> <mailto:surevoip-service-status%2Bbounces-help@lists.suretec.net>>
> X-Spam-Report: Content analysis details:   (-1.0 points, 5.0 required)
> pts rule name              description ---- ----------------------
> -------------------------------------------------- -1.0 ALL_TRUSTED
>         Passed through trusted hosts only via SMTP
> Delivery-Date: Fri, 12 Feb 2016 15:40:29 +0000
> Date: Fri, 12 Feb 2016 15:40:28 +0000
> To: Mailer-Daemon@gladserv.com <mailto:Mailer-Daemon@gladserv.com>
> Content-Transfer-Encoding: 8bit
> From: surevoip-service-status+owner@lists.suretec.net
> <mailto:surevoip-service-status%2Bowner@lists.suretec.net>
> X-RT-Original-Encoding: utf-8
> Content-Length: 1815
>
> Hi, this is the Mlmmj program managing the
> <surevoip-service-status@lists.suretec.net
> <mailto:surevoip-service-status@lists.suretec.net>> mailing list.
>
> Here is some information about the list.
>
> Full public archives are available at:
>
> https://lists.suretec.net/archives/surevoip-service-status
>
> You can subscribe to the following versions:
>
> - The normal version: Every time a post is sent to the list, subscribers
>    receive a copy of it. Subscribe by emailing
>    <surevoip-service-status+subscribe@lists.suretec.net
> <mailto:surevoip-service-status%2Bsubscribe@lists.suretec.net>>.
>
> - The digest version: Subscribers receive multiple posts in a single mail
>    message, at regular intervals, or when a lot of posts have accumulated.
>    Subscribe by emailing
>    <surevoip-service-status+subscribe-digest@lists.suretec.net
> <mailto:surevoip-service-status%2Bsubscribe-digest@lists.suretec.net>>.
>
> - The no-mail version: Subscribers do not receive any posts to the list.
>    This means, though, they are able to post to a list which only
>    subscribers may post to, while they follow the list using a web archive
>    or another subscribed email address. Subscribe by emailing
>    <surevoip-service-status+subscribe-nomail@lists.suretec.net
> <mailto:surevoip-service-status%2Bsubscribe-nomail@lists.suretec.net>>.
>
> The list has gatekeepers who will review subscription requests before
> permitting new members.
>
> Unsubscribe by emailing
> <surevoip-service-status+unsubscribe@lists.suretec.net
> <mailto:surevoip-service-status%2Bunsubscribe@lists.suretec.net>>.
>
> Posts are made by emailing <surevoip-service-status@lists.suretec.net
> <mailto:surevoip-service-status@lists.suretec.net>>.
>
> The list has moderators who will review all posts before releasing them to
> the list.
>
> Subscribers can retrieve message number N from the list's archive by
> sending a message to <surevoip-service-status+get-N@lists.suretec.net
> <mailto:surevoip-service-status%2Bget-N@lists.suretec.net>>
> (change the N to the number of the desired message).
>
> You can retrieve the frequently asked questions document for the list by
> sending a message to <surevoip-service-status+faq@lists.suretec.net
> <mailto:surevoip-service-status%2Bfaq@lists.suretec.net>>.
>
> To contact the list owner, send a message to
> <surevoip-service-status+owner@lists.suretec.net
> <mailto:surevoip-service-status%2Bowner@lists.suretec.net>>.
>
>
> --
> Kind Regards,
>
> Gavin Henry.
>

