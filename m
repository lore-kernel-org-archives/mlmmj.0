From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 13 Jun 2005 06:26:35 +0000
Subject: Re: Return-Path
Message-Id: <20050613062635.GK8301@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <03b501c56d73$fe8394f0$6400a8c0@garrincha>
In-Reply-To: <03b501c56d73$fe8394f0$6400a8c0@garrincha>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Gustavo A. Baratto <gbaratto@superb.net> [Jun 10. 2005 06:22]:
> I think I'm having a similar problem  as 
> http://mlmmj.mmj.dk/archive/0328.html, but with postfix when I force a 
> bounce.
> 
> I have a list with 3 addresses (two working and one non-working). When I 
> send a mesg to the list, the working addresses get it just fine, and the 
> bounced e-mail is sent by postfix without Return-Path and end up in 
> /var/spool/mlmmj/mlmmj-test/queue/discarded.
> 
> Check out a sample of the mesgs in discarded directory just below:
> 
> ----------------
> # more 51b6a0a96e1d1379
> >From MAILER-DAEMON  Thu Jun  9 20:13:35 2005
> Return-Path: <>
> X-Original-To: 
> mlmmj-test+bounces-10-gbarattoasdasdasdadadasda=gmail.com@demo.luoqing.com
> Delivered-To: mlmmj-test@freebsd-dev.dca2.superb.net
> Received: by freebsd-dev.dca2.superb.net (Postfix)
>        id 6A83978CD0; Thu,  9 Jun 2005 20:13:35 +0000 (UTC)
> Date: Thu,  9 Jun 2005 20:13:35 +0000 (UTC)
> From: MAILER-DAEMON@freebsd-dev.dca2.superb.net (Mail Delivery System)
> Subject: Undelivered Mail Returned to Sender
> To: 
> mlmmj-test+bounces-10-gbarattoasdasdasdadadasda=gmail.com@demo.luoqing.com

Why is Delivered-To: not the bounce address?


When there's a Delivered-To: mlmmj will use that one, and since it's the
listaddr it's discarded due to empty Return-Path:.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
