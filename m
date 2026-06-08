Return-Path: <mlmmj+bounces-3114-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08CDCD6E79
	for <mlmmj@archiver.kernel.org>; Mon,  8 Jun 2026 16:29:04 +0000 (UTC)
Received: from localhost ([127.0.0.1]:38944 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3114-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wWc9P-00GhKT-0z
	for mlmmj@archiver.kernel.org;
	Mon, 08 Jun 2026 15:44:31 +0000
Received: from lax.catastrophe.net ([174.136.105.50]:36889)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <readme@catastrophe.net>)
	id 1wWc9H-00GhJm-2p
	for mlmmj@mlmmj.org;
	Mon, 08 Jun 2026 15:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catastrophe.net;
	s=default; t=1780933986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=FhpfiucqQh3QyUweCp6v9km4SSI7ifdiP+QK3l+/0ac=;
	b=TMMjAvSg9HoAk74f0suWp+c9x/xzMfuaRrzdWFI4/PfupcbUwbZbH8IqmxQWJVZZUipNfL
	ZV/Xae1kVkGRvjAr6BxpHl/s/+Hy8Mav8sA5coo0mFl6HA9i76Kn6jyIMMM7qejvhF+/Fr
	Xyi5zMtKSoNQH2GQBM/fVDIVi30maVQ4JniFPTx6mwm06nQ3bp3tgx37QoNIkTtIppfUmc
	8TVgICXKRJB8YXx3A8Db2BCzcfCyb1d6MAogW1mrE0LE7LNbmGHFnp9jy1zvm4tnYcYaOW
	r4Qo17CdZGUPHMVKxElqLp1ePum9byZul6VjEGktlaEFEc3XjpHQ4TXrp2Di2Q==
Received: from localhost (lax.catastrophe.net [local])
	by lax.catastrophe.net (OpenSMTPD) with ESMTPA id d728cdd6
	for <mlmmj@mlmmj.org>;
	Mon, 8 Jun 2026 10:53:06 -0500 (CDT)
Date: Mon, 8 Jun 2026 10:53:06 -0500
From: readme@catastrophe.net
To: mlmmj@mlmmj.org
Subject: replyto control
Message-ID: <aiblYlmjSwNrVRpS@catastrophe.net>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm running 1.4.5 on OpenBSD 7.9 and replyto doesn't seem to add a              
header when configured. Has this option been deprecated in lieu of              
using customheaders?                                                            
                                                                                
Thanks in advance.           


