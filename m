From: Yarema <yds@CoolRat.org>
Date: Fri, 20 Feb 2009 14:01:21 +0000
Subject: Re: Autoresponders/autoreply replies are marked as bounces
Message-Id: <499EB7B1.1010500@CoolRat.org>
List-Id: <mlmmj.mlmmj.org>
References: <BAY104-W266C7128CDB3A9284333E8F3B30@phx.gbl>
In-Reply-To: <BAY104-W266C7128CDB3A9284333E8F3B30@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Dan Andersen wrote:
> Hi there,
>
> Hope someone can help me out here.
>
> When Im sending mails to the maillist by mlmmj and the subscriber
> got a autoreply/out of office agent running, the mail is returned
> as a bounce.
> I guess that the problem is that the responder is using the
> envelope-from address.
>
> Is it posible to force the autoresponder to reply to etc. the From:
> address ?
>
> There is no Return-Path header on the mail, is that a problem ?  If
> so...I have tried adding the header when Im sending the mail to the
> mlmmj list (by php), but It looks like it has been removed, either by
> mlmmj or postfix?!?! or am I missing another header?
>
> Im using mlmmj 1.2.16 and postfix 2.3.3

In my experience the Return-Path header is set by the receiving MTA
based on the envelope sender.  So manually setting the Return-Path
header will get you nowhere.  Seems to me that it's a problem with the
auto-responder over which you have no control.

-- 
Yarema
