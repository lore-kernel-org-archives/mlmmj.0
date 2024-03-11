Return-Path: <mlmmj+bounces-3046-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1774C54E58
	for <mlmmj@archiver.kernel.org>; Mon, 11 Mar 2024 14:59:14 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3046-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rjgg9-00506Y-Pz
	for mlmmj@archiver.kernel.org; Mon, 11 Mar 2024 14:31:01 +0000
Received: from degmail.deganius.de ([162.55.175.133])
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <chrisml@deganius.de>)
	id 1rjgg2-00505l-W2
	for mlmmj@mlmmj.org; Mon, 11 Mar 2024 14:30:55 +0000
Received: from mail.wacker.deganius.de (p578c211e.dip0.t-ipconnect.de [87.140.33.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by degmail.deganius.de (Postfix) with ESMTPSA id C1B4D1787E6
	for <mlmmj@mlmmj.org>; Mon, 11 Mar 2024 15:41:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=deganius.de; s=2021;
	t=1710168114; bh=M+mns5dUCqCxsitG06mXEyI9GcVTyyq6A+D75FbRnK0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aVtiQaSYbb5D1yroNdId9sjIUM7PIqSDDUbZT/snLm4IkkcxBP0W5kexk/cnMY0R/
	 dYq204/Nqf8j6bC9+uvcSu97diAPchOqVlOkuHX/Qea/sv8FKrMEr+p0KPuVWprUHH
	 ghhkXs3wXIjwRrE99mpmS0ZC6by0cJOy5Ox6uEKr/xLXRIMkmmBe7iPEQoVX8YP/eH
	 IcOTvMbn6U4AGu9np6/mRoNTlXjq5ulAOlgFIgeef6qOoGe0p2ONT+MaNFAGnoDnk/
	 kjAUIyEWI/HuMLFYFy0ZMExIrLUu/I/R2BvjD9iSTeLzcf21JuS6nV26llCN3qEHZN
	 mkzllB3MaoM7A==
Received: from [172.16.31.6] (unknown [172.16.31.6])
	by mail.wacker.deganius.de (Postfix) with ESMTP id 35A60538D694
	for <mlmmj@mlmmj.org>; Mon, 11 Mar 2024 15:41:54 +0100 (CET)
Message-ID: <dd673391-c17a-4e77-8f46-1bbd01c4bd16@deganius.de>
Date: Mon, 11 Mar 2024 15:41:53 +0100
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mlmmj] What do you do with Gmail accounts?
Content-Language: en-US
To: mlmmj@mlmmj.org
References: <835f7d93-96e1-4101-839c-6ce02acd0d2b@deganius.de>
 <83203f9e60f7e8e214ae14b9eff9a2abec86d954@nours.eu>
 <17adbca1-0c86-48c8-b42d-bdd526a85152@deganius.de>
 <20240311-benign-snobbish-ibex-829c20@lemur>
From: Christof Thalhofer <chrisml@deganius.de>
Organization: Deganius
In-Reply-To: <20240311-benign-snobbish-ibex-829c20@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 11.03.24 um 14:30 schrieb Konstantin Ryabitsev:

> On Sun, Mar 10, 2024 at 01:52:34PM +0100, Christof Thalhofer wrote:

>> IMO 'delheaders' in the current state is impossible to use right
> 
> We're using it across hundreds of mailing lists, delivering millions of
> messages daily, so this statement is incorrect.

Yes, I think you are right. See above:

>> because if
>> set it not only deletes the header I want but also does that:
>>
>> '"From " and "Return-Path:" are deleted no matter what.'
> 
> I have previously explained why this is the correct course of action:
> https://lore.kernel.org/mlmmj/20240305-tricky-crouching-shellfish-eb7c96@meerkat/
> 
> You may be confusing "From " (envelope-from) and "From:" (the cosmetic
> header). They are not the same thing and the distinction is crucial to
> understanding why mlmmj does the right thing.

Ok, thank you!

>> Additionally it rewrites the message body and inserts something like that
>> (in the body!???), this is the head of the body of a testmail I sent to our
>> mailinglist:
> 
> I think you may have an extra blank line in your customheaders tunable.

Ok, I can't reproduce it now, but that was obviously the case. I tested 
again. Now 'delheaders' and 'customheaders' work as expected.

Sorry for the wind. I'm quite new to mlmmj.

Alles Gute

Christof Thalhofer

-- 
Dies ist keine Signatur



