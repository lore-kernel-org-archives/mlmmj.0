Return-Path: <mlmmj+bounces-3048-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A677C67861
	for <mlmmj@archiver.kernel.org>; Mon,  8 Apr 2024 06:53:49 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3048-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rtiER-00DIv2-SY
	for mlmmj@archiver.kernel.org; Mon, 08 Apr 2024 06:11:51 +0000
Received: from degmail.deganius.de ([162.55.175.133])
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <chrisml@deganius.de>)
	id 1rtiEL-00DIuN-2J
	for mlmmj@mlmmj.org; Mon, 08 Apr 2024 06:11:45 +0000
Received: from mail.wacker.deganius.de (p578c211e.dip0.t-ipconnect.de [87.140.33.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by degmail.deganius.de (Postfix) with ESMTPSA id D5F9C177BC5
	for <mlmmj@mlmmj.org>; Mon,  8 Apr 2024 08:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=deganius.de; s=2021;
	t=1712557402; bh=wq3pSxZRa3GKu23gDpPwM+PrX8L25unhKwshbFa8PhM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Q/NVUwgrOgbPdX6Nwhiwef+tkgWgTsIlXd1ydXPLLu4oXTXaqCx/o4JF2Ca5Q+jMK
	 FhsPkLGYG99aKz7cfyAwkBY6ahuRg34F8KCFXMros3+uXipTRI5SGRCqe85HxNwxJ0
	 noWX4FQU0sU9LTgA0fp2ug8vu/JxUG4GOh2MfTXMs7dmfOqeR0hpxC3WTntSmidBT+
	 RzODJBz6YhJr1ylClZPS4JgRqnyxetjhgcY2A9N13MqNCiJo72473jM1ZAwdQwjUyo
	 EmZ9euyo91xU0g6cR65tJZYw96byxbJD3gZkxhjDnWj+6xoTX8jwwMncPOOxPfx9wJ
	 xLRM68QTSLunQ==
Received: from [172.16.31.6] (unknown [172.16.31.6])
	by mail.wacker.deganius.de (Postfix) with ESMTP id 410DA714A231
	for <mlmmj@mlmmj.org>; Mon,  8 Apr 2024 08:23:22 +0200 (CEST)
Message-ID: <ab501d33-6446-40dc-bf91-e6d3c3a3b00e@deganius.de>
Date: Mon, 8 Apr 2024 08:23:21 +0200
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mlmmj] Mailing Lists and DKIM signing breaking when sender DKIM
 policy is REJECT
To: mlmmj@mlmmj.org
References: <81DB5D4E-7D63-4B97-8DCB-320872DDB801@kamar.nz>
Content-Language: en-US
From: Christof Thalhofer <chrisml@deganius.de>
Autocrypt: addr=chrisml@deganius.de; keydata=
 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
Organization: Deganius
In-Reply-To: <81DB5D4E-7D63-4B97-8DCB-320872DDB801@kamar.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 08.04.24 um 07:32 schrieb Kent:

> The only thing I haven't worked out is how to insert the original
> senders name into the 'From' so each message at least looks like it
> came from someone different.
> 
> 
> Anyone have any ideas on how I can achieve this last bit in the
> puzzle ?

Mlmmj cannot do From-munging. But if you don't break DKIM-Signatures by 
altering headers like From, Subject, Body and Reply-To the mails from 
your mailinglist will be accepted.

https://begriffs.com/posts/2018-09-18-dmarc-mailing-list.html

Alles Gute

Christof Thalhofer

-- 
Dies ist keine Signatur



