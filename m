Return-Path: <mlmmj+bounces-3110-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506D6FF5138
	for <mlmmj@archiver.kernel.org>; Tue,  7 Apr 2026 19:52:16 +0000 (UTC)
Received: from localhost ([127.0.0.1]:44742 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3110-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wABwj-00BbGx-1J
	for mlmmj@archiver.kernel.org;
	Tue, 07 Apr 2026 19:18:45 +0000
Received: from dahlem.somaf.de ([185.183.157.243]:45364)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sca@andreasschulze.de>)
	id 1wABwc-00BbGH-0B
	for mlmmj@mlmmj.org;
	Tue, 07 Apr 2026 19:18:38 +0000
Received: from mta.somaf.de (mta.somaf.de [IPv6:2001:470:77b3:103::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature ECDSA (prime256v1 raw public key) server-digest SHA256)
	(Client did not present a certificate)
	by dahlem.somaf.de (Postfix) with ESMTPS id 4fqx4V49Bzz7Bjy
	for <mlmmj@mlmmj.org>; Tue, 07 Apr 2026 21:25:46 +0200 (CEST)
ARC-Seal: i=2; a=rsa-sha256; d=dahlem.somaf.de; s=arc1; t=1775589946;
	cv=none; b=x6quXgsJlRA04U+2zEOyEgiJh1YGIQ150q6ID8o5H+e7No5CC9vt5o3iViREQ39uUSa8/kdaxkj2DxyBQJCAzW8o+GX8eMoDt0ozVyCQir1dlvypw8MasSEw1kf5/Zr9gC1MdLO+QUXXcC5xz8UlsoJZwNyGe8/k1xcWqK9eYzuwHTE5Xf0mcgswH+bTRpYSd/LO0coCeaRIWQmm65+1g77DzCEyQbbQVkHkcaA7Wxe+MmR//HHKwzlgCCVJOSr5ioYG0zeAv/7J18MOyYEeBTqnZ9JltpHBBDwIosnVip9mnhl0w8zWySA21/BHOwOPkpSGZTb7AOdxsRCrBl7nzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=dahlem.somaf.de; s=arc1;
	t=1775589946; c=relaxed/relaxed;
	bh=PgmoYdYF/nlc47Efd74qLg8Z1Wsg4rrVyu0aq6/YySM=;
	h=Message-ID:ARC-Message-Signature:ARC-Authentication-Results:
	 DKIM-Signature:DKIM-Signature:Date:MIME-Version:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=KyJ8p0Z/ZFnvZCr1aeu7SJY16bdxkMjdaQ+g3kD39MKc7hSFaKDNMZZj9nPtdVb5B4uvEyQ4AJEzqjNZiNFrGw4PjipgKC22eaD94/v2rBRdq59qQg7F80CjjGrs4ogwxv334gmbEmJvKAtQXVSGuJurNtIExtS3rOAHRa0FH9vIWB04JXEvOv2x8rkKr0UA2T10eSI+RFl5Dh/N2rUqSRimsWvzmr6vuaooillwPOqM4aVWBC4qaqtxWytVQFycxAHRTGNAxKrEB/Jweg5g7VP/FRTzdLZr6cCN9hl3NLFFquw03F0C9nGPqVqpl3TJr/VBoGr7zD0lmN1REBN3Ag==
ARC-Authentication-Results: i=2; dahlem.somaf.de
Message-ID: <45b66d34-9e66-45aa-bb02-78b3b56ec1ea@andreasschulze.de>
ARC-Seal: i=1; a=rsa-sha256; d=mta.somaf.de; s=arc1; t=1775589944; cv=none;
	b=r2HltKkxt9NU05QUKWmXf8JbBiaF/Zln2iqatcNpTpLlresEpKTfstVcEqlxJSW8ZWsiB/+B2PA/do+igEeB/I1cwp8eiQilgxjESAoY8UFu985Ze69Dt2MaYyKERzfq0ft5dVS39rf/jzqD6Woj6LCIlje6eIf1QH9yOwXDIPsuzzygYFca7J9tbOSr6IsT8QtVa4BMSinWut6gBAq5sTfU+ilxp5WS7jA0zoQRp6KY61ZDdE0zhkze662MheHew+yPQVEnNf+hFfZ6E3yrYmRdFQSdTritNZr0dn8a8OLgdQWB2ibvhgVfVX+fbRUGHe86suCCstLQtuTlSvnuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=mta.somaf.de; s=arc1;
	t=1775589944; c=relaxed/relaxed;
	bh=PgmoYdYF/nlc47Efd74qLg8Z1Wsg4rrVyu0aq6/YySM=;
	h=Message-ID:DKIM-Signature:DKIM-Signature:Date:MIME-Version:
	 Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=C3y8VVdfJmgFez0Aa+zqpZkFgms7jYfCHuBiAAq+1wSWP9/29LSzxnr2EAeeSZvxJXtRJaNJipLl94cySdX+eikWu2WhYpA77KSXzSXTX7f7TZSYPScqgfseEHj+Dbda8cE0BpYGDLOSACckAMj44PLs7jl3qnbVO5Su9qhQFZbpjZGcgb4IHZQWDJrFcVSxxXOFAqdh2saGA6bVqO6h82qFl4T4JmrRnz1urTTq911zmk/DNWGpRUTBmnQTDkX1T3kXsUNkFfjJxoyUT9oDl3zCn15ffYqW6M4kEOPojwlOtz0Txp3hzYBUSQ5S5qSXeU6XnZRzoszPcwblMIsSDA==
ARC-Authentication-Results: i=1; mta.somaf.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andreasschulze.de;
	s=20260330-BF35CB2D; t=1775589944; x=1780589944;
	bh=PgmoYdYF/nlc47Efd74qLg8Z1Wsg4rrVyu0aq6/YySM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:autocrypt:cc:
	 content-transfer-encoding:content-type:date:from:in-reply-to:
	 message-id:mime-version:openpgp:references:subject:to;
	b=ned2VM27kpdwK1eEEZPcwSfzEcRfOAZg/SImZwawkk5JzkVJ/n1Ml0rmFPn4S6JM4
	 wW5G078kHc+eyds3CmOSZXRrp9hOTEF/xalESfu8+//qgjqvD2qLGLugKg90CIDF+y
	 rjBGkjtOitZqXGW9SzCQ8zGFCXPGeB1P6shdYsxeicAUGCzKg4JaVafhBpqP2RthCc
	 mDblHku0UgdS0a1cMXi0Aef/MaTTFIpIOHddhbBNp8YbtDeE4D3CAJFfSCIGGeHD+z
	 X3esmnhvA0clV0vwC8ryCApiNM2im3NvSAd10EW8oxePGakpM/lO6X9JA0aFWM1cOb
	 1KMpkWDavofaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=andreasschulze.de; s=20260330-E896BFCF; t=1775589944;
	x=1780589944; bh=PgmoYdYF/nlc47Efd74qLg8Z1Wsg4rrVyu0aq6/YySM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:autocrypt:cc:
	 content-transfer-encoding:content-type:date:from:in-reply-to:
	 message-id:mime-version:openpgp:references:subject:to;
	b=Hl+VW0ZEewk/MrROCyRtVrCtMDMaO9m3ZOsVl53UIqVcFS3GFiL2zkKPl7L5xQSt3
	 nGu44FAePZ+AWoGgFeHAg==
Date: Tue, 7 Apr 2026 21:25:44 +0200
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Subject: Re: Call for testing: 2.0.0 is close to the doors
To: mlmmj@mlmmj.org
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
Content-Language: en-US, de-DE
From: "A.Schulze" <sca@andreasschulze.de>
In-Reply-To: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 29.03.26 um 10:26 schrieb Baptiste Daroussin:
> I am close to have delivered all the features I intended to add as such I would like to stamp it with naming the next release: 2.0.0!
> Please test and send feedbacks!

Hello,

in earlier versions, "make install" installed the binaries in /usr/local/bin/
Now, using the latest available commit at codeberg, binaries are installed in /usr/local/sbin/

This break some things here and require path adjustments. Is it intentional?
I would say, mlmmj binaries are not limited to be used by a root, so I favor .../bin over .../sbin

Andreas


