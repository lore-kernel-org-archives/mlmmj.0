Return-Path: <mlmmj+bounces-3120-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13588C61DC6
	for <mlmmj@archiver.kernel.org>; Fri, 28 Aug 2026 08:48:32 +0000 (UTC)
Received: from localhost ([127.0.0.1]:46968 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3120-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wzrqg-005rDN-2U
	for mlmmj@archiver.kernel.org;
	Fri, 28 Aug 2026 08:22:06 +0000
Received: from b.nours.eu ([54.38.177.57]:57777)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <bapt@nours.eu>)
	id 1wzrqZ-005rCe-1Q
	for mlmmj@mlmmj.org;
	Fri, 28 Aug 2026 08:21:59 +0000
Received: by b.nours.eu (Postfix, from userid 1001)
	id 221FA176DA2; Fri, 28 Aug 2026 10:32:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1787905958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+kUtIjPEixzwvs7krXfhC9rDH03T6zmfPJZc1yrApY=;
	b=GsV9vHFZHRcGpcpXnpo0miVtJ/x1CQD9PCKcw6f1xdh4D7NpFPZgnXFSigg867PbvphhgJ
	sOA9VEKfwCLG737Vpk3FWj8fiIJr+g1PeJT0QdzWQSXyp9d01dJ1f0/AIjs0n+In8DMD4q
	yy+YR91iI2P27rkSGRsnphp3WxW2Yxol2DHPLR+cqD6rGrhO2XDp9iTeZocBmsqUpsj5iZ
	WXLRsJOSOdNUzrQmG28c+d5u6lVVnp0lZ8uVQ9D7GSXqmajgVk6AuI/MLtRmqcInpxx+Di
	KyJk9mlr9v8pO77Tqcnux36mIrxpnPembXnENT3xt8+KSTlkTDHsx3932ttsRw==
Date: Fri, 28 Aug 2026 10:32:38 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: prx <prx@si3t.ch>
Cc: mlmmj@mlmmj.org
Subject: Re: subonly question
Message-ID: <apFHg17rVjFNy0Ya@b.nours.eu>
References: <apCTjRPzjZRJ1xLV@ix.my.domain>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apCTjRPzjZRJ1xLV@ix.my.domain>

On Thu 27 Aug 21:44, prx wrote:
> Hi,
> 
> I created the "control/subonlypost" file and encounter two issue.
> 
> After testing with a non-subscribed mail, I get an answer saying : 
> 
> ```
> Cependant, c'est une liste ouverte. Si vous le souhaitez vous pouvez
> simultanément vous inscrire et délivrer votre message en envoyant un
> message à <$listsubreleaseaddr$> ce qui peut habituellement être fait
> simplement en répondant à ce message. Le sujet et le corps du message
> peuvent contenir n'importe quoi.
> ```
> 
> * Why the "$listsubreleaseaddr$" isn't filled? How do I set this? Shall
> I edit text/* file?
> * It is written that answering the message let me subscribe+post.
> However, since the Reply-to is set to ower+list@foo.bar, then my message
> is nevers releasead and I can't subscribe by replying.
> 
> What am I missing here?
> 
> Regard
> 
> prx
> 
> 

Hi,

Which version of mlmmj are you running? I can't reproduce in 2.1.0.

Best regards,
Bapt


