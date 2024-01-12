Return-Path: <mlmmj+bounces-3031-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808F4C4706C
	for <mlmmj@archiver.kernel.org>; Fri, 12 Jan 2024 17:34:48 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3031-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rOL0E-006owi-Mu
	for mlmmj@archiver.kernel.org; Fri, 12 Jan 2024 17:07:30 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1rOL07-006ow2-Tm
	for mlmmj@mlmmj.org; Fri, 12 Jan 2024 17:07:23 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 78C671C4343; Fri, 12 Jan 2024 18:17:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1705079822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=IWHiysPAXyXNChhy3HuQDkqzdBpiCZ5NwLcLPsNo6J8=;
	b=rZCcWUmVrv3ao3rCML4f+WI6/ffmvZ2L5j77kOsnBaO8pK7kOyL8vhREumeRfCz2Odv8Q8
	FjVYrkKr2gwzvwzDh6JcidbEEUZCZ5Vfr0nJkHUgxhU/WaV2vwP/DHPz1rMX7kVKF0A5jB
	hjq1L6rcMlls1ma3HAV2Le7biaDVJUmAmvv8RaNMEwyJOPzCcVdJEoj94B+BikP7NtUS20
	9/PV/spMn+uz2YbaGUktO16TNqYZqd+SeWajssJGE+IJIFv7x2q3Ms9qWDtAIuYlw5O4K2
	xThLRMWKzYMCvAeH8opIEAHusioQBcNzpa0E+A9yRW834lLGv2fjxdYf5M0QGg==
Date: Fri, 12 Jan 2024 18:17:02 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org
Subject: [mlmmj] new release 1.4.4
Message-ID: <jznjdkb42mlvpoxuom5ump7v2rfui5jgmjgwyrt3z4j6em6maw@g2loztdz7rls>
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

I am happy to announce mlmmj 1.4.4 has been released yesterday, this is a simple
bug fix release (fixing an issue with the probes not properly listing the list
of bounced emails).

While I am here, would it be possible to modifiy the mlmmj.org website so it
redirects at the https://codeber.org/mlmmj/mlmmj or something like this?

People are getting confuse because the website is outdated and not under https.

Best regards,
Bapt


