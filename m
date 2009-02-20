From: Thomas Goirand <thomas@goirand.fr>
Date: Fri, 20 Feb 2009 17:32:49 +0000
Subject: Re: Autoresponders/autoreply replies are marked as bounces
Message-Id: <499EE941.7010203@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <BAY104-W266C7128CDB3A9284333E8F3B30@phx.gbl>
In-Reply-To: <BAY104-W266C7128CDB3A9284333E8F3B30@phx.gbl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Yarema wrote:
> Dan Andersen wrote:
>> Hi there,
>>
>> Hope someone can help me out here.
>>
>> When Im sending mails to the maillist by mlmmj and the subscriber
>> got a autoreply/out of office agent running, the mail is returned
>> as a bounce.
>> I guess that the problem is that the responder is using the
>> envelope-from address.
>>
>> Is it posible to force the autoresponder to reply to etc. the From:
>> address ?
>>
>> There is no Return-Path header on the mail, is that a problem ?  If
>> so...I have tried adding the header when Im sending the mail to the
>> mlmmj list (by php), but It looks like it has been removed, either by
>> mlmmj or postfix?!?! or am I missing another header?
>>
>> Im using mlmmj 1.2.16 and postfix 2.3.3
> 
> In my experience the Return-Path header is set by the receiving MTA
> based on the envelope sender.  So manually setting the Return-Path
> header will get you nowhere.  Seems to me that it's a problem with the
> auto-responder over which you have no control.

I agree. A good auto-responder should detect messages from a list. Our
autoresponders are using .mailfilter. In it I have this:

RECIPIENT=$LOGNAME
RESPOND="~/.vacation.msg"
RESPONDDB="~/.vacation.db"
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
        cc "| mailbot -t $RESPOND -d $RESPONDDB -D 1 -A 'From:
$RECIPIENT' -s 'Auto Response: from $RECIP
IENT' /usr/sbin/sendmail -t"

}

which I believe is enough to NOT send bounce messages. In the case of
MLMMJ, it will match the List-Id: header.

Has any of you other header types that my autoresponder should match?
Did we miss some?

Thomas
