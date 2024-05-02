Return-Path: <mlmmj+bounces-3055-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B39C4345F
	for <mlmmj@archiver.kernel.org>; Thu,  2 May 2024 18:22:50 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3055-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s2ao6-001ihz-PN
	for mlmmj@archiver.kernel.org; Thu, 02 May 2024 18:05:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1s2anz-001ihF-Pl
	for mlmmj@mlmmj.org; Thu, 02 May 2024 18:05:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A1AF7CE16DB;
	Thu,  2 May 2024 18:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90522C116B1;
	Thu,  2 May 2024 18:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714673837;
	bh=jtKICH7o4jYtqUGkey3PJ/p9XlTGYUorevXhGINGnDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShMufvgSTZTGRCNTOXtN6meR/jGALYkAvLXn52z0aM7oRLdEh97SS2qw4v3spXo5A
	 jWh1ud8PUeOm8zWUckCFVhrA9/lms9d/l2o1IEnj+u7WvUsE2irXLwm0zpotSbj/l1
	 Pba8L3m5RUpImqeC3SVDGPMt4a7ACWd6r3dlltbI=
Date: Thu, 2 May 2024 14:17:12 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Baptiste Daroussin <bapt@nours.eu>
Cc: Michele <michele@10100.to>, mlmmj@mlmmj.org
Subject: Re: [mlmmj] Release 1.4.2
Message-ID: <20240502-piquant-newt-of-fantasy-71c5df@lemur>
References: <25lqa52awkp7tkcdjdzb4cslunuxd6ytoiidj5r6bma2sflogn@drcwbe2c4kwe>
 <3805806.nq5txsKOOX@yoko>
 <hwb55oub6un6rzeimyehdvczaaoof7qi65gye3ospjntcxlsol@7ylu5gpaoab3>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <hwb55oub6un6rzeimyehdvczaaoof7qi65gye3ospjntcxlsol@7ylu5gpaoab3>

On Thu, May 02, 2024 at 02:36:49PM GMT, Baptiste Daroussin wrote:
> You can find it here:
> https://codeberg.org/mlmmj/mlmmj/releases
> 
> For OS specific:
> - FreeBSD package are up to date
> - Alpine linux edge is up to date
> - No news from debian
> - Epel9 and fedora 40 have 1.4.5 (fedora 39 has 1.4.4)
> 
> No news from other OSes.

There's also a package I build for CentOS 7 available here:
https://copr.fedorainfracloud.org/coprs/icon/lfit/package/mlmmj/

Since CentOS 7 is EOL in 2 more months, I won't be maintaining it for 
much longer either.

-K


