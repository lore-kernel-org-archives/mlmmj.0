Return-Path: <mlmmj+bounces-3065-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B8C10F16
	for <mlmmj@archiver.kernel.org>; Mon,  6 May 2024 14:01:12 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3065-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s3yIS-00GRFl-26
	for mlmmj@archiver.kernel.org; Mon, 06 May 2024 13:22:24 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1s3yIL-00GRDf-9j
	for mlmmj@mlmmj.org; Mon, 06 May 2024 13:22:17 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 3CFD713685; Mon,  6 May 2024 15:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1715002472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=5jWkLcpoGFq8NKjbVmQaljM6R+xb1YOOVz5siaicCQE=;
	b=ILgEIeRcrJFe7m6HJgffTq/KRyUNhcAsGirSqKMs07tZsdhNMUYcf8bXpvLHKK+jKKnkaX
	1yXZJ0k2mRI3AQoFX33CVq7TAQ123aM12MAUUHUcsQy2fhcgL5hql4271AGFfGL6GvbUlF
	V4cmJMkUdpSUUTkMfPCHzgtjteEVryfYvnHRLGvunYS0cRRam8GLzGngmTEx8tAegRhWR5
	gB634BAAkvu4Ra/ZWgp0byDYXFhOzH6We0PuFJ5FoJmJsmYmfPaZs7X59aH1164pajx1Ct
	vPI4RkMPQM9khOdKspZPXcGRfPHwjXaNm2S0k1zKE1B3GKmJzq1MlFWV0gZZgg==
Date: Mon, 6 May 2024 15:34:32 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org
Subject: mlmmj.org website
Message-ID: <mbxz2egpq4fpbu36jgds2rxwyevigebnsnb3hzhkqe2whasjo2@6fftwsjdo24f>
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

Just a few updates on what happened recently. Wolf granted me access to the
mlmmj.org VM which allowed me to upload a new website: (Sorry I am not a web
developer) if you want to improve it, please send a PR here:
https://codeberg.org/mlmmj/mlmmj-website

While at it, I activated https.

Another change you can see in this email is that this mailing list is no longer
altering the prefix of the emails, which should please some antispam.

Best regards,
Bapt


