Return-Path: <mlmmj+bounces-3056-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA88C4345F
	for <mlmmj@archiver.kernel.org>; Fri,  3 May 2024 14:53:35 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3056-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s2tsh-001xFY-0o
	for mlmmj@archiver.kernel.org; Fri, 03 May 2024 14:27:23 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1s2tsa-001xEn-72
	for mlmmj@mlmmj.org; Fri, 03 May 2024 14:27:16 +0000
Received: from mail.nours.eu (nours.eu [IPv6:2001:41d0:8:3a4d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aniel.nours.eu (Postfix) with ESMTPSA id A19B9ADCA4
	for <mlmmj@mlmmj.org>; Fri,  3 May 2024 16:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1714747166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e10fgdyN7VWGzgsOExqz/u1dDDy4YXywKTmWkVGQsAc=;
	b=F83+GZNdzzUOLOV0bqMg5hFXDWBnAS/gZR9R6B6FepTTpCTzxOIocJdJtGRzamzcpxRS9B
	HXwSCr3pMqICYLgkozliVK6k2F26F6rHjo+pBvVeRG3Mc9Tz1PdZm/8dyxcmVtNn2OzZJ8
	Qfuu+bFLZZBwXgYcbWvptueLxTimAu+VDqK0v8G9XY2WKEEX0AfEr5c3sP9FpFWImn4p7H
	+3KXhD6dc93KKZX2m3+ipw/GU6eyhW55hnJ9C7NDWlj+FDgyDsNTc+Y9OoZp62RWOSXubF
	hyaiswCnRRc8gFrtPlS7XS7S1XVIHrFtU2+SglH8fGCGAZV7ntWfQWGkjJvCdw==
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Date: Fri, 03 May 2024 14:39:26 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Baptiste Daroussin" <bapt@nours.eu>
Message-ID: <8e40c6fe4b3550052e405e068ecd13619602c4c7@nours.eu>
TLS-Required: No
Subject: [mlmmj] Roadmap for 1.5
To: mlmmj@mlmmj.org

Hello everyone,

Now that mlmmj 1.4 seems to have properly settle, I would like to propose=
 a roadmap for mlmmj 1.5,
please find here:

https://codeberg.org/mlmmj/mlmmj/issues?type=3Dall&sort=3D&state=3Dopen&l=
abels=3D&milestone=3D4774&project=3D0&assignee=3D0&poster=3D0=20

The=20list of tasks I plan to do before releasing mlmmj 1.5.0

Do not hesitate to comment, discuss and propose other tasks.

Basically 1.4 was mostly: modernize the code base (this is not finished, =
but advanced enough) and provide a test suite. for 1.5 I plan to cleanup =
features which in my opinion do not make sense anymore because they break=
 fields used for DKIM signatures and implement the feature that has been =
requested by people here over the last year.

I have no ETA for 1.5.0 it will be released when it will be released.

Extra note, I would really love to get access to mlmmj.org to fix the mai=
ling list with dkim and to be able to update the website or point it to c=
odeberg.

Best regards,
Bapt


