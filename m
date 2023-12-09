Return-Path: <mlmmj+bounces-3025-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A97EC4167B
	for <mlmmj@archiver.kernel.org>; Sat,  9 Dec 2023 17:02:08 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3025-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rC01g-00E4Y8-Db
	for mlmmj@archiver.kernel.org; Sat, 09 Dec 2023 16:18:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1rC01Z-00E4XS-G9
	for mlmmj@mlmmj.org; Sat, 09 Dec 2023 16:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F273FCE2B2D;
	Sat,  9 Dec 2023 16:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B308C433C8;
	Sat,  9 Dec 2023 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702139201;
	bh=57omfg6om2rKHjUEwnh0LyvhmsoQyI4V2+5N7Tcnb18=;
	h=Date:From:To:Subject:From;
	b=lsMAdUePcmejPnF1/SqMQRwj+3vQF9JpFKniRWgS2v8JxGxIqjon/s7QVfSvEsVw3
	 YTUg5TXSoVl1L57zxIVoU2RhITk/99/nObjkdlt+cByj27ZSx2n+fdf/HQkz34qtJa
	 lhHlvAHlJwWcicH3+rMcgPJSAA7uZd5J6ppPdWV0=
Date: Sat, 9 Dec 2023 11:26:39 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: mlmmj@mlmmj.org
Subject: [mlmmj] bug: Index is never incremented
Message-ID: <20231209-watchful-screeching-marmot-a9a19f@meerkat>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I just realized that I have a problem with the lists that are set up to use
1.4.0 -- the index is never incremented. For example, the list that has
received several new messages in the past week still has the same index value
from September:

$ ls -al index
-rw-------. 1 mlmmj mlmmj 4 Sep 28 04:54 index
$ cat index
1173

All the messages since September go out from the list as:
tools+bounces-1174...

Everything still works for regular mail delivery, but this is obviously a
problem.

Happy to help troubleshoot this further.

-K


