Return-Path: <mlmmj+bounces-3115-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CBFCD8C9D
	for <mlmmj@archiver.kernel.org>; Mon,  8 Jun 2026 16:34:11 +0000 (UTC)
Received: from localhost ([127.0.0.1]:37590 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3115-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wWcGR-00GhNw-2t
	for mlmmj@archiver.kernel.org;
	Mon, 08 Jun 2026 15:51:47 +0000
Received: from lax.catastrophe.net ([174.136.105.50]:39515)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.96)
	(envelope-from <readme@catastrophe.net>)
	id 1wWcGK-00GhMn-14
	for mlmmj@mlmmj.org;
	Mon, 08 Jun 2026 15:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catastrophe.net;
	s=default; t=1780934422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFwJtDxsZKlq+8+a7db+U/QXg7Ta8iZJgBKGAaVAFos=;
	b=A0/ZZvRqTegVL5osSAo+gigz1MGFbJ18lDSXmZTGsNLw5QuJWiU0+ntljtGlywKdFtc0Q8
	/EGkTT+0ZrJfvgTX8lX4hcevMjslLICSG0EmISYgzvmxd1J98sQj94OBIjHZ+pMdP1Vmzk
	k9zr4tIcUsbajmjKqQfMvNV+wrfM93eYORoPVXDYX6i9QUiy9jhQ4dlG9XlPXpeuPLoEl5
	iUt39Ii7kZCQdK/UdvEpyZUVLtNqHP0cktlT9yHwP42hjHIhe/15zHxMq/FfRJIYKySPcD
	eMfdtZRaB0WrP0KY+fXvd/OLLhKLkPmD9KONb55V9DCKSmQrzOkL7OqSKQreTw==
Received: from localhost (lax.catastrophe.net [local])
	by lax.catastrophe.net (OpenSMTPD) with ESMTPA id baf96fbe
	for <mlmmj@mlmmj.org>;
	Mon, 8 Jun 2026 11:00:22 -0500 (CDT)
Date: Mon, 8 Jun 2026 11:00:22 -0500
From: readme@catastrophe.net
To: mlmmj@mlmmj.org
Subject: Re: replyto control
Message-ID: <aibnFssEccv55C1N@catastrophe.net>
References: <aiblYlmjSwNrVRpS@catastrophe.net>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiblYlmjSwNrVRpS@catastrophe.net>

On Mon, Jun 08, 2026 at 10:53:06AM -0500, readme@catastrophe.net wrote:
>I'm running 1.4.5 on OpenBSD 7.9 and replyto doesn't seem to add a              
>header when configured. Has this option been deprecated in lieu of              
>using customheaders?                                                            

Oops, replyto does something totally different than adding a custom
header. My fault; apologies for the noise.


