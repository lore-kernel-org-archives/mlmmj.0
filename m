Return-Path: <mlmmj+bounces-3084-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66634D2ECFD
	for <mlmmj@archiver.kernel.org>; Tue, 20 Jan 2026 02:07:24 +0000 (UTC)
Received: from localhost ([127.0.0.1]:45770 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3084-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1vi0mB-002lCx-0H
	for mlmmj@archiver.kernel.org;
	Tue, 20 Jan 2026 01:43:23 +0000
Received: from mail.vnetworx.net ([86.48.29.242]:55497)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ron@vnetworx.net>)
	id 1vi0m3-002lC8-2x
	for mlmmj@mlmmj.org;
	Tue, 20 Jan 2026 01:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vnetworx.net; s=mail;
	t=1768873704; bh=qVr1yyzCrN1Zwqsh99yyi4j8UoZuKux7P9E46JeSktk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CGQwnEBu94TWjENtVidCUnO7uHSZXvqyJEQwA/CjNaVup181He3Sf77p8vkWxwOzM
	 zOs9mV2cAq7MCDxz4GJzuAj5JmszH8aBc3aivl/G7nNk9JwmXLSjTleTKrn/74Jbqd
	 5Or2MfrqVjoeDEBDgic4a3tws8LPQ65AMugFoLAA=
Received: from [192.168.1.151] (unknown [67.242.155.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	(Authenticated sender: ron@vnetworx.net)
	by mail.vnetworx.net (Postfix) with ESMTPSA id AA356660971
	for <mlmmj@mlmmj.org>; Mon, 19 Jan 2026 20:48:24 -0500 (EST)
Message-ID: <325146bb-5de6-4e8e-b2c3-0520f01071a1@vnetworx.net>
Date: Mon, 19 Jan 2026 20:48:23 -0500
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Storing names with addresses
To: mlmmj@mlmmj.org
References: <aW55ZqOEii3t9WKK@client.eden.one>
From: Ron Guerin <ron@vnetworx.net>
Content-Language: en-US
In-Reply-To: <aW55ZqOEii3t9WKK@client.eden.one>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP by mail.vnetworx.net

On 1/19/26 1:35 PM, Jan Eden wrote:
> Hi,
> 
> I would like to use mlmmj for a couple of smaller, closed lists which are
> managed manually (by me). The email addresses of several subscribers are
> not linked to their name, so I need to store the names with the
> addresses. This is obivously possible, but not the standard scenario.
> 
> Apart from the addresses being stored in the file matching the
> subscribers' first names – are there any downsides to subscribing people
> like this?
> 
> /usr/local/bin/mlmmj-sub -f -L /var/spool/mlmmj/testing/ -a "John Doe <john.doe@government.ie>"
> 
> They won't be unsubscribing themselves, so a mismatch of the name and
> the header they are using when sending messages does not matter.
> 
> But will I cause any trouble for the listmaster (me!)?
> 

I just tried this.  It doesn't work, at least, it doesn't work for me.

/usr/bin/mlmmj-sub -f -L /var/spool/mlmmj/mlmmj-test -a "Ron Guerin 
<ron@example.com>"

Results in an attempt to send a confirmation message to: 
ronguerinron@example.com

- Ron


