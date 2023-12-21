Return-Path: <mlmmj+bounces-3030-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45746C35274
	for <mlmmj@archiver.kernel.org>; Thu, 21 Dec 2023 08:27:31 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3030-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rGDib-00HGPG-EP
	for mlmmj@archiver.kernel.org; Thu, 21 Dec 2023 07:43:45 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1rGDiT-00HGOb-BH
	for mlmmj@mlmmj.org; Thu, 21 Dec 2023 07:43:37 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 39C1AE0EFE; Thu, 21 Dec 2023 08:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1703145165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=varddHoVPcK2lPn2r0Sn9YUKR6wYDVlmpbNo4fap5I8=;
	b=c4aWg07NhvUQOc2jhwzuUBYJaC3YL9SZzi/520ynmRqt481Fifu+ta45q/YKdNQZ6Hr8Uw
	CLiERXsfm74dlH6sqIJNRIKwByU0eK4SGIaUxLXa7W3tbU4MIsAS2U9PAW6CuRpXGnKWcs
	KmT/tPphCGTFEoj4765+3ry0gN/ySF8kokIZ1mWRFdkaa/yn9zMXYiknmm0x5BiHoEULYY
	zpzytgpC0VArhwyMkmXmQK0XbQ8eJq1ujbXDftKt9fZTcmgAMcrVT80/UsujWH0HIuVfTk
	R5x4nUt6vOSrVydjtIahJd0b0e7QtXWiRmmwM26ft5eVFjzm4CsqmRcqY9AF9w==
Date: Thu, 21 Dec 2023 08:52:45 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org
Subject: [mlmmj] Release 1.4.3
Message-ID: <qhu2rhur3lwzw5hxmbuposd7n2q2jv36hnvxyjuk7h4yifuexy@7au7bcnrhrgl>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello everyone,

I have spotted and fxed yet another bug:
- mlmmj losing track of bounce probes.

As such I have issued a new release 1.4.3

Best regards,
Bapt


