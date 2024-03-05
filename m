Return-Path: <mlmmj+bounces-3040-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CDDC54798
	for <mlmmj@archiver.kernel.org>; Tue,  5 Mar 2024 12:20:41 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3040-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rhTJ3-003K1T-0p
	for mlmmj@archiver.kernel.org; Tue, 05 Mar 2024 11:50:01 +0000
Received: from degmail.deganius.de ([162.55.175.133])
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <chrisml@deganius.de>)
	id 1rhTIw-003K0j-7m
	for mlmmj@mlmmj.org; Tue, 05 Mar 2024 11:49:54 +0000
Received: from mail.wacker.deganius.de (p578c211e.dip0.t-ipconnect.de [87.140.33.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by degmail.deganius.de (Postfix) with ESMTPSA id 02C6A1787E6
	for <mlmmj@mlmmj.org>; Tue,  5 Mar 2024 13:00:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=deganius.de; s=2021;
	t=1709640046; bh=QWysYzK63FoMeWs1NvGnDy2IIabSpGSMuQd4zTtR+30=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JJKwgHHtBGKcQOYwDSefUDNbxFAQSKOhrodYRyKynADVl1GmXQSvU+DwNegmbcqRv
	 B8bh8jhqBh9TNYZlHXsY1ZHhoqdeBgwo02XnNYut53w6ANMUUAykaRzshbJC5MO2KI
	 Fi9wJkvKJk+fjXAwtKwNF/8Iiq+QOrGGffBjGg4qbv3M5NXXm1d7ssp185/kn2m28U
	 auqR8ZRwsTLfrCt+glsC2XLchYxycdA8x9Sgsbw6tXTDdW8XGdALhC5ZlV8LirVdi5
	 3CNyyKymezR4Pls1T3TajgwIQAmfxlOdm4kViPD+raD4efAKlSWEsh2OKqTfimQr8s
	 fBOcWXal/GiJQ==
Received: from [172.16.31.6] (unknown [172.16.31.6])
	by mail.wacker.deganius.de (Postfix) with ESMTP id 6FA156EAF62A
	for <mlmmj@mlmmj.org>; Tue,  5 Mar 2024 13:00:45 +0100 (CET)
Message-ID: <a3721c3e-b6df-4ba9-abfc-b45cbbf193e6@deganius.de>
Date: Tue, 5 Mar 2024 13:00:45 +0100
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
From: Christof Thalhofer <chrisml@deganius.de>
Organization: Deganius
In-Reply-To: <83203f9e60f7e8e214ae14b9eff9a2abec86d954@nours.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 05.03.24 um 12:14 schrieb Baptiste Daroussin:


> Reply to munge is an interesting feature to add, can you create a feature request on codeberg so I don't forget when I will start working on 1.5?
> 
> https://codeberg.org/mlmmj/mlmmj

Yes I can do that, thanks for the hint.

Just one question: What is the reason that 'delheaders' deletes not only 
the headers in the file but also '"From " and "Return-Path:" are deleted 
no matter what.'?

http://mlmmj.org/docs/tunables/

In my opinion that's a severe bug.

Alles Gute

Christof Thalhofer

-- 
Dies ist keine Signatur



