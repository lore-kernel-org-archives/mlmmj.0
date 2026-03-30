Return-Path: <mlmmj+bounces-3095-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524B0FF492D
	for <mlmmj@archiver.kernel.org>; Mon, 30 Mar 2026 01:55:17 +0000 (UTC)
Received: from localhost ([127.0.0.1]:35872 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3095-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w71U2-00B0r0-1j
	for mlmmj@archiver.kernel.org;
	Mon, 30 Mar 2026 01:32:02 +0000
Received: from mail.vnetworx.net ([86.48.29.242]:60551)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ron@vnetworx.net>)
	id 1w71Tv-00B0qH-0i
	for mlmmj@mlmmj.org;
	Mon, 30 Mar 2026 01:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vnetworx.net; s=mail;
	t=1774834729; bh=HqNy16zHphQpLm7tk7oOE36ko6zlf7FaZOB6ml+86tU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ke9q7ooj2B4YkQXgodLaDFDh7kyjR7+/8b18YqAzF22HIy7o/gqwcu8S2LqDv6lbk
	 SO2s448NfxlOySFLxbw2TRFz7tY1uRZ52Ra3PnsAbcIVxdvXHITpCTT/71A8jelJo4
	 /a5pPMaYr8qfqcZw80q9qz9ifw5j2IGG948qeNN8=
Received: from [192.168.1.151] (unknown [66.24.89.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	(Authenticated sender: ron@vnetworx.net)
	by mail.vnetworx.net (Postfix) with ESMTPSA id 5B9DF66B0A4
	for <mlmmj@mlmmj.org>; Sun, 29 Mar 2026 21:38:49 -0400 (EDT)
Message-ID: <5c61d6e6-41fb-4e60-917d-1fc50c7d3a2d@vnetworx.net>
Date: Sun, 29 Mar 2026 21:38:46 -0400
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Backporting mlmmj for oldstable Debian 12 bookworm on amd64
To: mlmmj@mlmmj.org
References: <acQHgPUGd6R5cQvH@MacbookPro>
From: Ron Guerin <ron@vnetworx.net>
Content-Language: en-US
In-Reply-To: <acQHgPUGd6R5cQvH@MacbookPro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP by mail.vnetworx.net

On 3/25/26 12:04 PM, Jona Müller wrote:
> Hello everyone,
> 
> I am happy to see that there has been quite a bit of development on mlmmj
> recently after the project was dormant for a couple of years.
> 
> As mlmmj is a mailing list manager it obviously mostly runs on mailservers. Mail
> servers usually have quite a long service life because of the large software
> stack and a lot of people are still running Debian 11 and Debian 12. But the
> mlmmj version in Debian bookworm is about 10 years old at this point, although
> Debian 13 only came out about seven months ago.
> 
> I've talked to the package maintainer - Chris Knadle - and with his instructions
> built a deb package for Debian 12 on amd64 with the newest version packaged for
> Debian (1.6.0).
> 
> If anyone wants to test it, I've made it available on:
> 
> 	https://ind.me/debian/bookworm/mlmmj/mlmmj_1.6.0/
> 
> Known issue when upgrading is that $confaddr$ stops resolving and needs to be
> updated to the new $confirmaddr$ in text/confirm for existing mailing lists.
> 
> Looking into maybe backporting it as I know quite a few people that would
> benefit from this. If anyone needs other architectures, I can probably arrange
> that. Feel free to comment.
> 
> Cheers,
> 
> Jona Müller


Chris has also graciously accepted various patches offered to the PHP 
utilities in the mlmmj contrib directory.

If anyone's interested in those, I can make them available.  They fix 
compatibility issues with contemporary versions of PHP.

- Ron


