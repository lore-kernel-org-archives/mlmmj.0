Return-Path: <mlmmj+bounces-3053-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94AAC4345F
	for <mlmmj@archiver.kernel.org>; Thu,  2 May 2024 12:58:04 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3053-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s2VUU-001fVg-1C
	for mlmmj@archiver.kernel.org; Thu, 02 May 2024 12:24:46 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1s2VUN-001fUy-7n
	for mlmmj@mlmmj.org; Thu, 02 May 2024 12:24:39 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 3003AA680B; Thu,  2 May 2024 14:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1714653409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pDZFbI+kfYgDpx6x9b/7FrqStrJVsOY4XucsxzNmiG4=;
	b=DXn3iTOCAvislWQLbr4p2+A00QXHqY+roiie0f1+IwOB18xEQ9yQ3KmaHH2D2DBvD/dIqT
	Bf8D0PapghW1oT78ZYLLKbOdX3QjKFVB7dxpmKwokKX9GOE1guQvlRmbv9HT8NeN20sRA+
	zFHK7/8try6Fix1oOobl/2q1Zjggbi1Jmtur2jSYcKFxcEEFLekmhbYO1Fe4MPOvMFMRfL
	01SkwlgtrTQT3x4BA+pwU6GIwe3g5ABhGgLJjAInQY/fg9guUJqNDtXOxEwZovVclMazFK
	TnmtCros3D5epJgb/Z7znVZ4g8Sbb66Vdr1mEtSTAjJpPsWQa9+m/569fOH4Iw==
Date: Thu, 2 May 2024 14:36:49 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: Michele <michele@10100.to>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] Release 1.4.2
Message-ID: <hwb55oub6un6rzeimyehdvczaaoof7qi65gye3ospjntcxlsol@7ylu5gpaoab3>
References: <25lqa52awkp7tkcdjdzb4cslunuxd6ytoiidj5r6bma2sflogn@drcwbe2c4kwe>
 <3805806.nq5txsKOOX@yoko>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3805806.nq5txsKOOX@yoko>

On Thu 02 May 14:16, Michele wrote:
> Hello,
> 
> sorry for my stupid question: where can I download the package? 
> 
> Thank you!
> -- 
> Michele
> 
> 
Not a stupid question, given I don't have access to mlmmj.org infrastructure
beside my request it is not easy for people to find out.

You can find it here:
https://codeberg.org/mlmmj/mlmmj/releases

For OS specific:
- FreeBSD package are up to date
- Alpine linux edge is up to date
- No news from debian
- Epel9 and fedora 40 have 1.4.5 (fedora 39 has 1.4.4)

No news from other OSes.

Best regards,
Bapt


