Return-Path: <mlmmj+bounces-3072-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B2FCE835D
	for <mlmmj@archiver.kernel.org>; Mon, 30 Sep 2024 18:00:00 +0000 (UTC)
Received: from localhost ([127.0.0.1]:35142 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3072-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1svKCO-009vqt-04
	for mlmmj@archiver.kernel.org;
	Mon, 30 Sep 2024 17:28:40 +0000
Received: from lax.catastrophe.net ([174.136.105.50]:22209)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <readme@lax.catastrophe.net>)
	id 1svKCG-009vqB-13
	for mlmmj@mlmmj.org;
	Mon, 30 Sep 2024 17:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=20220406; bh=gx12iEmLiBc
	9CaZxbDOO50F/WjjqGVRHBSbsuSdcQK0=; h=subject:to:from:date;
	d=catastrophe.net; b=lVZJaiZOoyeDNwsWG9zsO0Ng8zOpuQdz6ZCtBHxvSW41dNqBe
	BwepOAgKWZDgx8zR2s1sxjMlWhYVmz0uqmOH3sAjvFtVtuZJPn/tkCeBgecpvae0U82r89
	n5v3vK2TrzAXMq796J1QCzdosteA7/EdYcxHs1SeUcgOO1LmNDMdZss8mIKVsgH6InSRmx
	qgnzrkbXUascPd3Uo4v1aL/fDn3nZV1eU2LkwJ8ZV5em7RF1ZtqOzMo9H2rxeGuTXB9vvL
	6fdxnN4XnZ+L8yTDiSi21a9D+L4aROONpNAb9mpxK4HMBMVZdRyhwPoeczsFfws93DbakW
	mDhfd0WWE4tvw==
Received: from localhost (lax.catastrophe.net [local])
	by lax.catastrophe.net (OpenSMTPD) with ESMTPA id 80e5454d
	for <mlmmj@mlmmj.org>;
	Mon, 30 Sep 2024 12:31:23 -0500 (CDT)
Date: Mon, 30 Sep 2024 12:31:23 -0500
From: readme@lax.catastrophe.net
To: mlmmj@mlmmj.org
Subject: Limit messages from sender in closed list
Message-ID: <Zvrga7skbZzK3L4_@catastrophe.net>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Let's say mallory@example.com and alice@example.com are on the closed list
researchers@example.com that does not limit emails, but messages from
bob@example.com should be only approved by a list admin.

Is there any way to moderate messages to a closed mailing list that are
from a specific sender?

Thanks.


