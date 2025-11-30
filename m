Return-Path: <mlmmj+bounces-3080-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4926CFD376
	for <mlmmj@archiver.kernel.org>; Sun, 30 Nov 2025 05:00:18 +0000 (UTC)
Received: from localhost ([127.0.0.1]:51088 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3080-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1vPZ5f-00DWce-2X
	for mlmmj@archiver.kernel.org;
	Sun, 30 Nov 2025 04:31:15 +0000
Received: from yorick.ofobscurity.com ([69.195.140.133]:48361)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Chris.Knadle@coredump.us>)
	id 1vPZ5Y-00DWbv-30
	for mlmmj@mlmmj.org;
	Sun, 30 Nov 2025 04:31:08 +0000
Received: from pool-100-33-240-150.nycmny.fios.verizon.net ([100.33.240.150] helo=[10.137.0.42])
	by yorick.ofobscurity.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <Chris.Knadle@coredump.us>)
	id 1vPZ9B-003Fi0-2m
	for mlmmj@mlmmj.org; Sat, 29 Nov 2025 23:34:55 -0500
Message-ID: <db1084c0-e20e-4a2f-8877-05e3d27b3e51@coredump.us>
Date: Sat, 29 Nov 2025 23:34:47 -0500
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: control/amime-footer-base64
To: mlmmj@mlmmj.org
References: <5c7451cc-07d2-4d64-a1db-fc998241d282@vnetworx.net>
 <7f82c96e-d58f-49a4-9ee6-32b72f217eb2@coredump.us>
Content-Language: en-US, fo-FO
From: Chris Knadle <Chris.Knadle@coredump.us>
Autocrypt: addr=Chris.Knadle@coredump.us; keydata=
 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
 hhRdBRUgHWUDis6VRoMNZhvr2oo=
In-Reply-To: <7f82c96e-d58f-49a4-9ee6-32b72f217eb2@coredump.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -

Hey, Ron.

Apparently mlmmj-amime-receive has also not been included in the Debian 
package for mlmmj either. The file is from 2008 and was committed to the 
Debian source package in 2012 with mlmmj 1.2.18.0.

Although it's in the Debian source package, it's not being shipped 
inside the Debian mlmmj binary package. It looks straightforward enough 
that it's probably safe to include it, as it's a simple wrapper script 
to pass parameters to altermime and then mlmmj-receive. I'd just like to 
know if it seems reasonable to go ahead and add that. Do you have an 
opinion? ;-)

    -- Chris

Chris Knadle
Chris.Knadle@coredump.us

On 11/29/25 18:24, Chris Knadle wrote:
> Hey, Ron.
>
> I read the comments of contrib/mlmmj-amime-receive, I see it isn't 
> clear there, but I found some hints that I think answer the question.
>
> Looking through the code, as best I can tell mlmmj-amime-receive is a 
> pass-through program to grab parameters and send them to 
> /usr/bin/altermime and /usr/bin/mlmmj-receive.
>
> And the thing is that the Debian package for MLMMJ doesn't depend, 
> recommend, or suggest the altermime package. The MLMMJ 
> README.footers.md states that footer support is rudimentary, and 
> non-text footers are meant to be passed through alterMIME -- meaning 
> MIME-encoded footers require alterMIME.
>
> Looking through the mlmmj-amime-receive code, the execution aborts if 
> the file for the alterMIME binary isn't found. So based on this as 
> best I can tell amime-footer-base64 is meant to contain Base-64, and 
> MLMMJ won't act on it unless altermime is also available.
>
> Now that I know this, I think I'm going to add a "Suggests: altermime" 
> on the Debian package for MLMMJ -- this is to that users/admins of the 
> package get a "hint" for this, and I'm going to add some text to the 
> README.Debian file about it.
>
>    -- Chris
>
> Chris Knadle
> Chris.Knadle@coredump.us
> Debian maintiner for MLMMJ
>
> On 10/12/25 21:07, Ron Guerin wrote:
>>
>> Apologies if this is a stupid question...
>>
>> But what am I supposed to put in
>>
>> control/amime-footer-base64
>>
>> When using the contrib/mlmmj-amime-receive script?  Is it plaintext, 
>> or should I be Base-64 encoding the contents?
>>
>> - Ron
>
>


