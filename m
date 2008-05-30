From: Thomas Goirand <thomas@goirand.fr>
Date: Fri, 30 May 2008 18:29:42 +0000
Subject: Re: Changing mailing list subscription process
Message-Id: <48404796.8090706@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
In-Reply-To: <20080529230903.GJ16364@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Robin H. Johnson wrote:
> Presently, we have been suffering some spam attacks against some of the
> Gentoo mailing lists, because of spammers using auto-responders.
> 
> Here's how they are conducting the attack:
> 
> 1. Spammer forges a mail from $LIST+subscibe@gentoo.org, sending it to
>    an auto-responder.
> 2. Lists sends a confirmation mail to the auto-responder.
> 3. Auto-responder sends mail, with intact confirmation data back to the
>    confirmation address (in Reply-To).

IMHO, your auto-responder is broken. Any good auto-responder should
detect a mailing list and should ignore every message from it. With
courier-maildrop, it's done like this:

if ( ! /^Precedence: (bulk|list|junk)/ && \
     ! /^List-Id:/ && \
     ! /^List-Unsubscribe:/ && \
     ! /^Return-Path:.*<#@\[\]>/ && \
     ! /^Return-Path:.*<>/ && \
     ! /^From:.*MAILER-DAEMON/ && \
     ! /^X-ClamAV-Notice-Flag: *YES/ && \
     ! /^Content-Type:.*message\/delivery-status/ && \
     ! /^Subject:.*Delivery Status Notification/ && \
     ! /^Subject:.*Undelivered Mail Returned to Sender/ && \
     ! /^Subject:.*Delivery failure/ && \
     ! /^Subject:.*Message delay/ && \
     ! /^Subject:.*Mail Delivery Subsystem/ && \
     ! /^Subject:.*Mail System Error.*Returned Mail/ && \
     ! /^X-Spam-Flag: YES/ )
{
   [... autoresponder code ...]

> I tried adding a specific Reply-To address in the header of the list
> text/ file, but it's made to part of the mail body instead of the
> header.

You should have tuned "customheaders", is it what you did? Because this
always worked for me, when dealing with the Reply-To: header...

Thomas
