Return-Path: <mlmmj+bounces-3018-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE78BC4167B
	for <mlmmj@archiver.kernel.org>; Thu, 30 Nov 2023 06:18:56 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3018-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r8aD8-00ClTm-Gq
	for mlmmj@archiver.kernel.org; Thu, 30 Nov 2023 06:07:42 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1r8aD1-00ClT0-RW
	for mlmmj@mlmmj.org; Thu, 30 Nov 2023 06:07:35 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 06F251D959; Thu, 30 Nov 2023 07:16:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1701324975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=QmU6Ul2tGI8g/xfKAbreVtX02sF10Mqpli3nHY88HBE=;
	b=kAxD3pQ6Uak5fUl/NGityxZ0zdkBoCOMFjKjdoN0O6MM+C20I0yw/HAqY3dxkU7gU+mTiJ
	7+5ctp+WNRA3dnHr/QFQCTZRR3jjDd1iteQkcKf5sAN39+zkdiLiT8uQjwBv+m3XqVlyV6
	tl9Kn8G0IxlYNlSU24h2aKix3O2FHG+ywY5kbFgQFigrYrzqPNK0AMbHCKqPdvZwWisCu1
	wblqVd+kVs41PwKJqRo+vdYkkJtVsu+QSrgs11GEzLDNYS1+DQfnZfGx39jP/o/DQn2vEY
	vaJlmRj2xBrgpVJTE8E31o+U3H7bUsdNihyKLQb0QT+hnhe5GSdztvnTceQfuw==
Date: Thu, 30 Nov 2023 07:16:14 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org
Subject: [mlmmj] Release 1.4.0-rc3
Message-ID: <5l6uvtgdjzqvxinnonvhxdid2hhlii7dwjuwrtvjvirk3ytmwn@fkuhyudb6zaw>
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
I have just released a new version of mlmmj: 1.4.0-rc3.
This release includes 3 fixes:

 o fix unattended usage of mlmmj-makeml
 o fix regression regarding RFC 5321
 o fix subscription validation

It has been running well for a while on the infrastructures I can test on.
I hope this will be the last run of RC before the final release.

Best regards,
Bapt


