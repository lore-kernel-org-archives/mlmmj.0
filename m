Return-Path: <mlmmj+bounces-3043-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20B0C54798
	for <mlmmj@archiver.kernel.org>; Tue,  5 Mar 2024 20:05:41 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3043-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rhaRW-003RQG-Ak
	for mlmmj@archiver.kernel.org; Tue, 05 Mar 2024 19:27:14 +0000
Received: from degmail.deganius.de ([162.55.175.133])
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <chrisml@deganius.de>)
	id 1rhaRP-003RPZ-GC
	for mlmmj@mlmmj.org; Tue, 05 Mar 2024 19:27:07 +0000
Received: from mail.wacker.deganius.de (p578c211e.dip0.t-ipconnect.de [87.140.33.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by degmail.deganius.de (Postfix) with ESMTPSA id 939531787CC
	for <mlmmj@mlmmj.org>; Tue,  5 Mar 2024 20:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=deganius.de; s=2021;
	t=1709667479; bh=oOYLJRVqAnxviNPha50qMEibFLTtqcqYZauM6JZ5PRw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=GKPLUbsKj9jVOQTKLcuQ7Q/I3HRizEUAC6gsGNPCDUireTnPC26zQzZSIMgsI3uyr
	 JvZchmUAiYLTsc/wXWAow1CJmb6FXW67HQrdfC2ckzIfODd3s5FD4qqrl1UA1OwcsM
	 UGA7eDr0PRbf3zKLsKGZiZSjcUmZwvbtB79YaZqBipt8KYQCmxLY0j0hi6aDOufYB9
	 /FxCkveB+eIqEI8zC+LXakQsAY9qCNeujAKJ6uePHL48MpTQGfnzjQF84lzOCCp2y/
	 XpFjt3AgD1pb+V0v3D1CALowGn8B1sugghC8HB8uXJn/bhEzKDvWNUIiC4IjY9kdBa
	 NYc5XEJEbs1Sw==
Received: from [172.16.31.6] (unknown [172.16.31.6])
	by mail.wacker.deganius.de (Postfix) with ESMTP id 0C32B6EAF62C
	for <mlmmj@mlmmj.org>; Tue,  5 Mar 2024 20:37:58 +0100 (CET)
Message-ID: <fa7db532-5f55-4468-9970-fd4b618db46d@deganius.de>
Date: Tue, 5 Mar 2024 20:37:58 +0100
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
 <20240305-futuristic-arcane-potoo-f2bb4f@meerkat>
From: Christof Thalhofer <chrisml@deganius.de>
Organization: Deganius
In-Reply-To: <20240305-futuristic-arcane-potoo-f2bb4f@meerkat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Konstantin,

Am 05.03.24 um 17:04 schrieb Konstantin Ryabitsev:

>> Reply-To-munging seems to be the only way to give Gmail-users the
>> possibility to answer direct to the list. But is is impossible to be done in
>> Mlmmj.
>>
>> What to do?
> 
> If you rewrite headers such as Reply-To, this will almost certainly invalidate
> the DKIM signature of the original message if you also keep the original
> "From:" header. If you want to modify any signed headers, you *must* rewrite
> the From: address.
> 
> There are only two possible solutions when it comes to mailing lists these
> days:
> 
> 1. Don't touch any headers, only add List-* headers (e.g. List-ID)
> 2. If you do change any headers, you *must* also rewrite the original From:
>     header (e.g. by moving it to X-Original-From:), because otherwise you will
>     violate DKIM/DMARC policies of the sender's domain

Ok. I will choose (1). The poor guys at Gmail have to live with it that 
they cannot hit 'Reply' to answer to the list. Instead they have to 
choose 'Reply to all' with which Gmail would send:

To: authors_email@domain
CC: list@listserver

Then they have to delete 'authors_email@domain' from 'To:' and move 
'list@listserver' to 'To:'.

Their bad luck to be with this provider.

---

When I add this header:

'Mail-Reply-To:  list@listserver'

Thunderbird and Claws Mail and a lot of other MUAs reply to 
'list@listserver' when the user hits <Ctrl-R>.

And DKIM is not broken.

Thank you all!

Alles Gute

Christof Thalhofer

-- 
Dies ist keine Signatur



