From: Martin Koch Andersen <martin@925.dk>
Date: Tue, 04 Apr 2006 16:31:34 +0000
Subject: Re: Two To: headers added to auto-mails from list
Message-Id: <44329F66.1010908@925.dk>
List-Id: <mlmmj.mlmmj.org>
References: <44312C59.8000100@925.dk>
In-Reply-To: <44312C59.8000100@925.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

Morten K. Poulsen skrev:
> Quoting Martin Koch Andersen <martin@925.dk>:
>> I have noticed that in emails from the list (confirm-sub, sub-ok etc.) 
>> I get two To: headers.
>>
>> In the configuration of my list I have 'Add To: header'. And in 
>> 'Delete headers' 'To:' is listed also.
> 
> That sounds very strange.
> 
> The headers are changed in the incoming mail. Then the mail is checked 
> for list control commands, and a reply is sent if needed. The changed 
> headers should never appear in the reply.
> 
>> Why do I get this extra To: header? Could it be a bug with the 
>> mentioned configuration above?
> 
> I cannot see how the customheaders option could change a confsub or 
> sub-ok mail.

It seems like the 'delete headers' thing is not executed for confsub, 
sub-ok etc. mails? And in my setting I have also 'Add To: header' - so 
that the actual receiver address is added as To: address. Could this not 
be the reason the 'To:' header is set twice?

Here is a sample:

 From - Tue Apr 04 18:22:31 2006
X-Account-Key: account2
X-UIDL: UID3424-1115901712
X-Mozilla-Status: 0001
X-Mozilla-Status2: 00000000
Return-Path: <news-twice-daily+bounces-help@list.xxx.com>
Delivered-To: martin.yyy.dk@pop3.pil.dk
Received: from watt.pil.dk (watt.pil.dk [195.41.47.12])
	by heimdal.pil.dk (Postfix) with ESMTP id 06D40ACF9
	for <martin@yyy.dk>; Tue,  4 Apr 2006 18:22:25 +0200 (CEST)
Received: by watt.pil.dk (Postfix, from userid 106)
	id 770FADFD3; Tue,  4 Apr 2006 18:22:55 +0200 (CEST)
Received: from nibu.pil.dk (nibu.pil.dk [193.162.142.149])
	by watt.pil.dk (Postfix) with ESMTP id 5D1ECDFCD
	for <martin@yyy.dk>; Tue,  4 Apr 2006 18:22:55 +0200 (CEST)
Received: from nibu.pil.dk (nibu.pil.dk [193.162.142.149])
	by nibu.pil.dk (Postfix) with SMTP id A24856C2D7C
	for <martin@yyy.dk>; Tue,  4 Apr 2006 18:22:24 +0200 (CEST)
From: news-twice-daily+help@list.euobserver.com
To: martin@yyy.dk
Message-ID: <1144167744-747cf83f-mlmmj-113b64df@3d09bfb8.plonk>
Date: Tue, 04 Apr 2006 18:22:24 +0200
Subject: Goodbye from news-twice-daily@list.xxx.com
To: martin@yyy.dk
X-Virus-Status: No

Thank you and goodbye!

You have now been removed from the

news-twice-daily@list.xxx.com

mailinglist.

-- 
Martin - http://925.dk
"Shoot for the moon, even if you miss, you'll land among the stars."
