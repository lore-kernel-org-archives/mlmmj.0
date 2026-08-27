Return-Path: <mlmmj+bounces-3119-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2815FC61DB9
	for <mlmmj@archiver.kernel.org>; Thu, 27 Aug 2026 20:20:06 +0000 (UTC)
Received: from localhost ([127.0.0.1]:45004 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3119-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wzfr0-005ofm-2Q
	for mlmmj@archiver.kernel.org;
	Thu, 27 Aug 2026 19:33:38 +0000
Received: from si3t.ch ([109.190.90.35]:46756)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <prx@si3t.ch>)
	id 1wzfqs-005of4-20
	for mlmmj@mlmmj.org;
	Thu, 27 Aug 2026 19:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=pubkey; bh=xL2DOUiX2IpZq
	kNC9fAhZi64VtL2l2hq+l6P9Gb2nFc=; h=subject:to:from:date; d=si3t.ch; b=
	e9d762rLEudL6r+TWYeSDFx8uYXPuzBWoYQi44hf1LRx3ETbxxwUVlUIYVunITrATxsvoZ
	Kw9LpnwR16iGj+tD5GALN/ubiwIXVSW9WOz96pyBjQRFlDQqp5AYeZ8Gj/VPQgM+0+7R2J
	pMSRVt+VEKxQn1nIEcZSrvC9+LXewPI=
Received: from localhost (si3t.ch [109.190.90.35])
	by si3t.ch (OpenSMTPD) with ESMTPSA id a3fd871c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <mlmmj@mlmmj.org>;
	Thu, 27 Aug 2026 21:44:17 +0200 (CEST)
Date: Thu, 27 Aug 2026 21:44:13 +0200
From: prx <prx@si3t.ch>
To: mlmmj@mlmmj.org
Subject: subonly question
Message-ID: <apCTjRPzjZRJ1xLV@ix.my.domain>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-GPG-Key-Server: https://si3t.ch/pub/prx.asc
X-GPG-Key-FingerPrint: 6D04 B642 12D9 643D 10C6  72B5 37DE 4F1C CA05 53C8

Hi,

I created the "control/subonlypost" file and encounter two issue.

After testing with a non-subscribed mail, I get an answer saying : 

```
Cependant, c'est une liste ouverte. Si vous le souhaitez vous pouvez
simultanément vous inscrire et délivrer votre message en envoyant un
message à <$listsubreleaseaddr$> ce qui peut habituellement être fait
simplement en répondant à ce message. Le sujet et le corps du message
peuvent contenir n'importe quoi.
```

* Why the "$listsubreleaseaddr$" isn't filled? How do I set this? Shall
I edit text/* file?
* It is written that answering the message let me subscribe+post.
However, since the Reply-to is set to ower+list@foo.bar, then my message
is nevers releasead and I can't subscribe by replying.

What am I missing here?

Regard

prx


