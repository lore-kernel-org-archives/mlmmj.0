Return-Path: <mlmmj+bounces-3116-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401B2C43458
	for <mlmmj@archiver.kernel.org>; Tue, 30 Jun 2026 12:34:56 +0000 (UTC)
Received: from localhost ([127.0.0.1]:48538 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3116-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1weWuw-0014k4-14
	for mlmmj@archiver.kernel.org;
	Tue, 30 Jun 2026 11:46:18 +0000
Received: from e1.harlan.de ([91.99.131.231]:50796)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <magnus@harlan.de>)
	id 1weWup-0014jO-09
	for mlmmj@mlmmj.org;
	Tue, 30 Jun 2026 11:46:11 +0000
Received: from imail.harlan.de (imail [192.168.200.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by e1.harlan.de (Postfix) with ESMTPS id EFDA664BF8
	for <mlmmj@mlmmj.org>; Tue, 30 Jun 2026 13:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=harlan.de; s=default;
	t=1782820528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L0hLBjPg1oKbCAUNuQ60sx4TCvjxcuyzcKayzcJUv0U=;
	b=nC+4keJNCe5K2wfXuICYCydjbnZCeZ2swdFfGiBI9lwtCvImQ/20XNsNPi2I69Yrbn76Nn
	0/+GDTsfUPuH3aPFVVhz7rg617PeXS9cR15qmmkZgszykHA7teMoN98R+EKwLyUoCEhQpF
	sbpswF4/SbAqVxgyz47m4CIWoEt9IOc=
ARC-Seal: i=1; a=rsa-sha256; d=harlan.de; s=arc; cv=none; t=1782820528;
	b=f2jG0yN0C8RB/KCUcQ7QCR80bojuw2SW35EFY/hYUJ/K0iUFWD7RDQdKRlAEg1Se13jsDe
	IgF6A8hj+UV5WNB4BUWagJtB6BJYpCvXyfOF9Dw2pPuEaAF9WG/3SO9Nt5sK1Ow7KL01Kl
	y1RmAHF+3r63643TwISk0+tZJ7r3+g8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=harlan.de;
	s=arc; t=1782820528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L0hLBjPg1oKbCAUNuQ60sx4TCvjxcuyzcKayzcJUv0U=;
	b=XnVlZL0iv/O5oLyzBDkxO9X2RCrVFfQbLJaohFtgm0nfBcLPVZbW0nBobSKvBEiAZCC1Hv
	7z1j8QLeV2Z6TFfxGAe502I+Y91YaghHVzRD5ioorvHvEMd1mRTfU7wO8QjB63sjYjEAEo
	N8bOWKdpv5BNx/XBaEIKHSEsqmogjEQ=
ARC-Authentication-Results: i=1;
	e1.harlan.de;
	none
Received: from [192.168.67.23] (garda.harlan.de [192.168.67.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by imail.harlan.de (Postfix) with ESMTPSA id A14AD26C9310
	for <mlmmj@mlmmj.org>; Tue, 30 Jun 2026 13:55:27 +0200 (CEST)
Message-ID: <c11250fc-23b5-4520-bfdd-7f9d2e0d1835@harlan.de>
Date: Tue, 30 Jun 2026 13:55:26 +0200
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
To: mlmmj@mlmmj.org
From: Magnus Harlander <magnus@harlan.de>
Content-Language: de-DE
Subject: Version clash
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I think the 2.1 source tarballs for download from codeberg

https://codeberg.org/mlmmj/mlmmj/releases/download/RELEASE_2_1_0/mlmmj-2.1.0.tar.xz

are containing not the 2.1.0 sources but 2.0.1. (tells me configure.def)

\Magnus

-- 
Dr. Magnus Harlander
Mail: harlan@harlan.de
Web: www.harlan.de
Stiftung: www.harlander-stiftung.de



