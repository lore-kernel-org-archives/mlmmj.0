Return-Path: <mlmmj+bounces-3029-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3120C35274
	for <mlmmj@archiver.kernel.org>; Mon, 18 Dec 2023 09:56:31 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3029-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rF9kR-00GEXW-Gx
	for mlmmj@archiver.kernel.org; Mon, 18 Dec 2023 09:17:15 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1rF9kK-00GEWr-T5
	for mlmmj@mlmmj.org; Mon, 18 Dec 2023 09:17:08 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 0B3A16911E; Mon, 18 Dec 2023 10:26:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1702891573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=vCHFRM2D3AWWEZe7lBcy3gTB6fqkYwxfR64xA3d/JGs=;
	b=oxFqvRfqKHKWIVMkV9WlYUrggbkhMFkHooyHF1sPoy6k7tLKovR+S3k9tCiErxDhI9r1z+
	+G6V2Ls2MYxieXpH5ubpnbKYanrrHnJsf0RfQIb5EDlzsCoiB6PeUzDYXLTCI6RdG3DCjW
	KvR4gjN59lhCAOiI6GxuodMxG31Io9v1V+g+h8zgESMZT2u+0MEdyz38rCGJ/c0/G/k9Se
	m9xjjd9K00aPyPwQO2P/Vh5S2mDmH8J0gPg8UIpWfsTRwrRJoAn7z5TQoB0zOdDWtP3Ah+
	sjh7hAhE7qN5SRHac7sA6bNDkoM7Knv+Zu2L9+kNt5OGNSKvz4SLz6fLiqhHHQ==
Date: Mon, 18 Dec 2023 10:26:13 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org
Subject: [mlmmj] Release 1.4.2
Message-ID: <25lqa52awkp7tkcdjdzb4cslunuxd6ytoiidj5r6bma2sflogn@drcwbe2c4kwe>
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

A new bug fix release has been launched today:

- 1.4.2, this fixes an issue when parting lastestdigest
  by mlmmj-maintd

Best regards,
Bapt


