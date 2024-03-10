Return-Path: <mlmmj+bounces-3044-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D342C54791
	for <mlmmj@archiver.kernel.org>; Sun, 10 Mar 2024 13:20:44 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3044-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rjIUp-004imr-Dz
	for mlmmj@archiver.kernel.org; Sun, 10 Mar 2024 12:41:43 +0000
Received: from degmail.deganius.de ([162.55.175.133])
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <chrisml@deganius.de>)
	id 1rjIUi-004im9-Jl
	for mlmmj@mlmmj.org; Sun, 10 Mar 2024 12:41:36 +0000
Received: from mail.wacker.deganius.de (p578c211e.dip0.t-ipconnect.de [87.140.33.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by degmail.deganius.de (Postfix) with ESMTPSA id 16B851787CC
	for <mlmmj@mlmmj.org>; Sun, 10 Mar 2024 13:52:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=deganius.de; s=2021;
	t=1710075155; bh=9otG2TuOJGIIiInGEPbfc+bdJW8PnuVtpHKYkiAmP3w=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Cid+kRCQbwNpoH5qSAqAmthDs19efWnHmj6sT9iA52u8jyWm959nDgzogjA2eHsvD
	 miGZe4/pJWMO+NVEUT4xu5FObb8nTtbkmdxllXVkIkJaMuIzUwLYDLu3DF1870LeE3
	 FZuUrNSA+lBTdayBk4DEeKzAtHgWABFoUqdTFZ/vrwdee2Ed9jFa5Wq7s4KvRa6UnF
	 OLRElqL/pC6j6MxKbctocWwmI88nGMWRwlfi9JeXD30+T2aaz+Y836A+eiyv9zGmVb
	 y0ls+29OU8B3DE3jVdxfatmwwUpS8nNIb7hkU1IyMBz82sQRaPfq1ATp4cyVKjlxR0
	 Dvh9/qIPIbNNQ==
Received: from [172.16.31.6] (unknown [172.16.31.6])
	by mail.wacker.deganius.de (Postfix) with ESMTP id 72D994049F1C
	for <mlmmj@mlmmj.org>; Sun, 10 Mar 2024 13:52:34 +0100 (CET)
Message-ID: <17adbca1-0c86-48c8-b42d-bdd526a85152@deganius.de>
Date: Sun, 10 Mar 2024 13:52:34 +0100
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mlmmj] What do you do with Gmail accounts?
To: mlmmj@mlmmj.org
References: <835f7d93-96e1-4101-839c-6ce02acd0d2b@deganius.de>
 <83203f9e60f7e8e214ae14b9eff9a2abec86d954@nours.eu>
Content-Language: en-US
From: Christof Thalhofer <chrisml@deganius.de>
Organization: Deganius
In-Reply-To: <83203f9e60f7e8e214ae14b9eff9a2abec86d954@nours.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Baptiste,

Am 05.03.24 um 12:14 schrieb Baptiste Daroussin:

> Reply to munge is an interesting feature to add, can you create a
> feature request on codeberg so I don't forget when I will start
> working on 1.5?
> 
> https://codeberg.org/mlmmj/mlmmj

"Reply-To" munging destroys DKIM signatures and therefor should not be a 
separate tunable. But there are situations where I would like to use it.

Because of that I come to the conclusion: What should be done in a 
future version of Mlmmj is to fix the 'delheaders' tunable.

IMO 'delheaders' in the current state is impossible to use right because 
if set it not only deletes the header I want but also does that:

'"From " and "Return-Path:" are deleted no matter what.'

as it is stated the documentation.

Additionally it rewrites the message body and inserts something like 
that (in the body!???), this is the head of the body of a testmail I 
sent to our mailinglist:

 > MIME-Version: 1.0
 > User-Agent: Mozilla Thunderbird
 > Content-Language: en-US
 > From: Christof Thalhofer <chrisml@deganius.de>
 > To: Gambas Basic Mailing List <user@lists.gambas-basic.org>
 > Subject: [Gambas-user] Next test for Gmail users
 > Content-Type: text/plain; charset=3DUTF-8; format=3Dflowed
 > Content-Transfer-Encoding: 7bit
 >
 > Please hit reply.
 >
 > Alles Gute
 >
 > Christof Thalhofer

This creates a lot of rubbish in the mailinglist, so 'delheaders' is not 
usable!

If I compare Mlmmj to Sympa then Sympa offers the possibility to delete 
any header I want in the incoming mail without rewriting any other part 
of the mail.

This would be the cool way to delete headers!

With that together with the 'customheaders' tunable everybody can do 
'Reply-To:' munging if necessary and a lot of other things.

For instance I wanted to use Mlmmj for a newsletter. Here I would 
replace 'From:' as well as DKIM signatures of the incoming mail.

This is impossible with the current 'delheaders' tunable of Mlmmj.

Alles Gute

Christof Thalhofer

-- 
Dies ist keine Signatur



