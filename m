Return-Path: <mlmmj+bounces-3038-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F6BC54E41
	for <mlmmj@archiver.kernel.org>; Tue,  5 Mar 2024 10:54:37 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3038-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rhRyb-003IGs-IN
	for mlmmj@archiver.kernel.org; Tue, 05 Mar 2024 10:24:49 +0000
Received: from degmail.deganius.de ([162.55.175.133])
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <chrisml@deganius.de>)
	id 1rhRyU-003IGD-Mf
	for mlmmj@mlmmj.org; Tue, 05 Mar 2024 10:24:42 +0000
Received: from mail.wacker.deganius.de (p578c211e.dip0.t-ipconnect.de [87.140.33.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by degmail.deganius.de (Postfix) with ESMTPSA id 36E8F1787E6
	for <mlmmj@mlmmj.org>; Tue,  5 Mar 2024 11:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=deganius.de; s=2021;
	t=1709634934; bh=E4cM21jMdEAWTwSZh3X5k9sXSV5jwNxaD7osLRSQGUo=;
	h=Date:To:From:Subject:From;
	b=O6sy/W9BGMS6/IZs0h++YexD0PYqLCcxtp9rqybgGE9bkNI75xgBDtmlwqEwnWMrz
	 6ohOZ0uIlTUyekyc/bpGPMzXDgz52AAbHWqz2gRtl57SBb6ome4Nxkv7//54rW7spU
	 lc2Kk1YPPIiVht1yqOjE4beXFw1kXEP/tLYfMl5OLZvOVlYE+6NE/mQ1+JT0txILge
	 8gn6dAws5wYTCgGAyFczpwry5h0GZs8YTyGfpiKW1VAgLr4mGuJA2C0rpJYrTA0vCU
	 AYyYbGLtqLWChXWQqK6B3CjsJeVGDRFCk6nusEJ12dmPqVJZjM0feD0XQ55eAb8tlW
	 NaH1FqK7j77Tw==
Received: from [172.16.31.6] (unknown [172.16.31.6])
	by mail.wacker.deganius.de (Postfix) with ESMTP id 96932707DF18
	for <mlmmj@mlmmj.org>; Tue,  5 Mar 2024 11:35:33 +0100 (CET)
Message-ID: <835f7d93-96e1-4101-839c-6ce02acd0d2b@deganius.de>
Date: Tue, 5 Mar 2024 11:35:33 +0100
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "mlmmj@mlmmj.org" <mlmmj@mlmmj.org>
Content-Language: en-US
From: Christof Thalhofer <chrisml@deganius.de>
Subject: [mlmmj] What do you do with Gmail accounts?
Organization: Deganius
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I migrated a couple of Mls from Mailman2 to Mlmmj (1.3).

With MM2 we did Reply-To-Munging (replaced the original Reply-To header 
with 'Reply-To: list@listserver'.

Mlmmj does not allow this. I can add 'Reply-To: address@list' but I 
cannot delete 'Reply-To: from@home' with delheaders because then Mlmmj 
also removes  the 'From:' header ... why ???

So if I set 'Reply-To:  list@listserver' in customheaders there are 
often two 'Reply-To:' in the headers of an outgoing mail:

'Reply-To: from@home' (set by the author of the mail)
'Reply-To:  list@listserver' (set by Mlmmj)

which causes Gmail to bounce that mail.

Now we have the problem with a mailinglist that Gmail does not have a 
'reply-to-list'-button.

It has the options 'reply' and 'reply to all'.

'reply' answers to the address in 'From:' and the mail doesn't go to the 
list.

'reply to all' answers to the addresses in 'From:' and 'List-Post:' 
creating dupes at the person whose mail was answered.

Reply-To-munging seems to be the only way to give Gmail-users the 
possibility to answer direct to the list. But is is impossible to be 
done in Mlmmj.

What to do?

Alles Gute

Christof Thalhofer

-- 
Dies ist keine Signatur


