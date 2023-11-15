Return-Path: <mlmmj+bounces-3008-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4AAC2BB3F
	for <mlmmj@archiver.kernel.org>; Wed, 15 Nov 2023 20:54:16 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3008-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r3MP6-00AgMf-Gx
	for mlmmj@archiver.kernel.org; Wed, 15 Nov 2023 20:22:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1r3MOz-00AgLr-NB
	for mlmmj@mlmmj.org; Wed, 15 Nov 2023 20:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5BE73CE1EEE;
	Wed, 15 Nov 2023 20:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FF1C433C8;
	Wed, 15 Nov 2023 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700080237;
	bh=flRX3GqswmNYPHJPi1MwEhLeiO+V2dQXrDf9n3LfnFQ=;
	h=Date:From:To:Subject:From;
	b=G/5kb2GlWUsawPFD1wbltLcDc5y86yyyGm3Z1xHd0Jy2pzPAM674wxeNz+25swvZb
	 g2HrOjkZuuSFDc+YhetkVvQjYnikaGbjoQuzznh2vNZCSyVhNBcd4dsgH6/iFcbNKO
	 nXyxzlui3kyoN/hu+nu2PyV09PpLdNgYmu/A7RJE=
Date: Wed, 15 Nov 2023 15:30:35 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: mlmmj@mlmmj.org
Subject: [mlmmj] The mlmmj list now archived on lore.kernel.org
Message-ID: <20231115-quartz-bug-of-unity-abbfab@nitro>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

Since kernel.org is now heavily reliant on mlmmj, I've decided it would be
good to carry the archives on our main list archival system. So, you should
now be able to find full mlmmj list archives here:

https://lore.kernel.org/mlmmj/

Best wishes,
-K


