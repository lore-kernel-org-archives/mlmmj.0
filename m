Return-Path: <mlmmj+bounces-3099-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277D71061B18
	for <mlmmj@archiver.kernel.org>; Mon, 30 Mar 2026 17:28:21 +0000 (UTC)
Received: from localhost ([127.0.0.1]:39056 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3099-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w7G4C-00B6Cv-0I
	for mlmmj@archiver.kernel.org;
	Mon, 30 Mar 2026 17:06:20 +0000
Received: from mail.vnetworx.net ([86.48.29.242]:55635)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ron@vnetworx.net>)
	id 1w7G44-00B6CA-1d
	for mlmmj@mlmmj.org;
	Mon, 30 Mar 2026 17:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vnetworx.net; s=mail;
	t=1774890787; bh=b7uN6em8/lEP45llZMoSzHZjyKL//urXaU/v8qWdlWw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=KSp7O+ui0LEQvBz9uhgZg0nWd++EmPlxz2gz/Qs59stgccHf7UDS1NLFst2o+cYbF
	 l9lfU3oxTxwa4RXP/5X+/NyLdiejpm5dn8DHiEPhIKuQrDHWSIWt5Bw5m6hYUuK44X
	 jwRsBu40SIz0w2UoH8jBA2KBUswB3pbdindSQBEM=
Received: from [192.168.1.151] (unknown [66.24.89.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	(Authenticated sender: ron@vnetworx.net)
	by mail.vnetworx.net (Postfix) with ESMTPSA id 1EBB26605CC;
	Mon, 30 Mar 2026 13:13:06 -0400 (EDT)
Message-ID: <6ea00f65-af9f-4036-9bf0-c793ae9ac478@vnetworx.net>
Date: Mon, 30 Mar 2026 13:13:05 -0400
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Call for testing: 2.0.0 is close to the doors
To: Baptiste Daroussin <bapt@nours.eu>, mlmmj@mlmmj.org
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
 <679f813b-3bfa-4d06-b258-c8bb3c8a2cec@vnetworx.net>
 <5E0F9265-BD0F-4FEF-B854-FA2763F44C92@nours.eu>
From: Ron Guerin <ron@vnetworx.net>
Content-Language: en-US
In-Reply-To: <5E0F9265-BD0F-4FEF-B854-FA2763F44C92@nours.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP by mail.vnetworx.net

On 3/30/26 2:12 AM, Baptiste Daroussin wrote:

> also note that I wrote my own archiver which is is pipermail like and very fast and lightweight it is non portable right now (it uses freebsd's capsicum for sandboxing) but I can make it portable if there is interest.
>
> <https://lists.freebsd.org/archives/dev-commits-src-all/> for example
>
Oh, that's great!  Looks good.  I'm sure it would be welcomed by many if 
yours were portable and in the contrib folder.

- Ron




