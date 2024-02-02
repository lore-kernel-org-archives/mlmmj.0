Return-Path: <mlmmj+bounces-3033-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15A6C4828E
	for <mlmmj@archiver.kernel.org>; Fri,  2 Feb 2024 08:03:41 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3033-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rVnkr-00C76Z-72
	for mlmmj@archiver.kernel.org; Fri, 02 Feb 2024 07:14:29 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dsimic@manjaro.org>)
	id 1rVnkk-00C75s-Dq
	for mlmmj@mlmmj.org; Fri, 02 Feb 2024 07:14:22 +0000
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1706858669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L2o3gafhDcJYbymrxrnESH/lX/bM6JfIODINw1Cfh64=;
	b=i2uI040u3rgfRLVGYZNomEYv/A1f0efudBaviemRrCAa7DyuduDD7kvwXlKecbEHvkLzrN
	+310WjKkxu2hNv3Ir2pLwbXo4VgWFlHYDDX2XfKiRqUKcN1sYQXTQAD5/LMPx5cECvPfsJ
	jLB5VCP+Gr8imN8zGEyEwhksSiLCCgo2M7dZ/VnFgCSIFwYfD2uqiTwQs6T6w92FxJ/8i0
	rBcrSCC/PuVwgIt976UGxttLp1lPgOYmq3W2B4O7hLWunXRwP7VedlVTez8fbqJsOshCZh
	z2M4O38D/9GS5uGBFHzeBZbwS5fAON6XtplIOLrqjmusXLaYirTrIJFHQnkXQA==
Date: Fri, 02 Feb 2024 08:24:29 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: mlmmj@mlmmj.org
Subject: [mlmmj] [RFC] Muting and unmuting threads
Message-ID: <44c21d525dc7844d5bd1695da6f43436@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello,

It's well known that people often complain about subscribing
to high-traffic mailing lists, which results in receiving a lot
of unwanted messages, etc.  A recent example of such complaints
came from the git mailing list. [1]

People often want to receive messages that belong to specific
threads only, e.g. to those resulting from patches they send to
the mailing list.  Thus, I was thinking about extending mlmmj
to support such features, e.g. by implementing new features and
commands that configure a subscription to receive only replies
to their own messages sent to the mailing list.

Has something like this ever already appeared as a suggestion
or a though?  Any feedback would be much appreciated.

[1] 
https://lore.kernel.org/git/6174fbd7-5eee-450b-a38b-1d1b695f6d14@app.fastmail.com/T/#m24a25bfc7b9dbe3a7136f5fc2d8a472e0f5f20ce


