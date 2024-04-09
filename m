Return-Path: <mlmmj+bounces-3050-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1189CD1284
	for <mlmmj@archiver.kernel.org>; Tue,  9 Apr 2024 08:02:31 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3050-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1ru5v5-00DYH7-1d
	for mlmmj@archiver.kernel.org; Tue, 09 Apr 2024 07:29:27 +0000
Received: from degmail.deganius.de ([162.55.175.133])
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <chrisml@deganius.de>)
	id 1ru5uy-00DYGR-6g
	for mlmmj@mlmmj.org; Tue, 09 Apr 2024 07:29:20 +0000
Received: from mail.wacker.deganius.de (p578c211e.dip0.t-ipconnect.de [87.140.33.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by degmail.deganius.de (Postfix) with ESMTPSA id 89A22177BA0
	for <mlmmj@mlmmj.org>; Tue,  9 Apr 2024 09:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=deganius.de; s=2021;
	t=1712648459; bh=dCPLwVVhM4lOHSq1EVQ/enUHz6bm0B24TSfgt2W3lQo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=zUzBnuvyDa0m2IfU21BCkno1xkpwIeeVIjXSaJg5G/fJiyu/fyI09uVYJ7YZDGx7Q
	 CHnE19dVCR3H2zxaSvBrzAFuzqaH4XYS+IJIgWM+R7b0tS8eONcR7B0UB6eSNfOR6L
	 Yg9cQkWkjfnZ0BkDOxhdkBRqZy56lWIEe8R6zgL5pZj3dAj8DydoTpOwdtxv4FyXi2
	 ph180gO4amQWGShVDdKc4KnQ2vk37Y4MxXargD04XVHiyG+p35/7dFo34XrqWBaApx
	 OLq3ikDN4h31SRn5NvjXw9j8pFkkwmvjmg4k+/i6VEA+hqmpmdf0wJpqk7mfN8tlWL
	 6qG7NbejtNZBQ==
Received: from [172.16.31.6] (unknown [172.16.31.6])
	by mail.wacker.deganius.de (Postfix) with ESMTP id F34AC714A234
	for <mlmmj@mlmmj.org>; Tue,  9 Apr 2024 09:40:58 +0200 (CEST)
Message-ID: <dcdcd149-e5f8-4094-bf3e-c5c1b91b52f3@deganius.de>
Date: Tue, 9 Apr 2024 09:40:58 +0200
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
 <ab501d33-6446-40dc-bf91-e6d3c3a3b00e@deganius.de>
 <7055F300-DB55-48CC-BDFD-A54D456559AA@kamar.nz>
From: Christof Thalhofer <chrisml@deganius.de>
Autocrypt: addr=chrisml@deganius.de; keydata=
 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
Organization: Deganius
In-Reply-To: <7055F300-DB55-48CC-BDFD-A54D456559AA@kamar.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 09.04.24 um 00:23 schrieb Kent:

> I note this mailing list:
> 
> 1) Modifies the 'Subject' by inserting [mlmmj] at the start - this
> will invalidate the original senders dkim.
> 
> 2) Sets the 'Sender:' header, however this didn't make any difference
> when I used 'Reply'  It wasn't until I clicked 'Reply All' that the
> list was added as a recipient (and the Cc recipient) and hence why I
> was originally setting the 'Reply-To:' header.

I'm not the maintainer of this ML. Seems that it's a long time ago since 
it was configured and so it 'naturally' filters out every Gmail account 
that bounces.

> What's the process to request a flag to make this option available ?
> 
> As much as I avoid Google myself, the enforcing by Google and Yahoo
> of SPF, DKIM and DMARC means you are needing to do what they do like
> it or not, and their own mailing lists are From-munging !

If you want to do From-munging then Mlmmj is the wrong software for you. 
Sympa can do that but that's another beast.

I configured my mailinglists so that the original DKIM signatures are 
kept (no prefix, no footer, no extra Reply-To) and wrote in 
'control/customheaders':

> Precedence: list 
> List-Id: User Mailing List <user.example.com> 
> List-Unsubscribe: <https://example.com/>, 
>  <mailto:user+unsubscribe@example.com?subject=unsubscribe> 
> List-Post: <mailto:user@example.com> 
> List-Help: <mailto:user+help@example.com?subject=help> 
> List-Subscribe: <http://example.com/>, 
>  <mailto:user+subscribe@example.com?subject=subscribe> 
> Sender: <user@example.com> 
> Mail-Followup-To: <user@example.com>

The 'Mail-Followup-To:'-header makes it possible that Gmail-Users can 
hit Reply-to-all to answer to the list.

And then I said to the users they should answer to the list or to all 
and filter their mail for 'To: user@example.com' and that works now.

Alles Gute

Christof Thalhofer

-- 
Dies ist keine Signatur



