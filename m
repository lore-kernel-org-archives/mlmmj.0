Return-Path: <mlmmj+bounces-3070-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A88C04FFE
	for <mlmmj@archiver.kernel.org>; Tue, 14 May 2024 18:55:43 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3070-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s6x2s-00D4Nw-71
	for mlmmj@archiver.kernel.org; Tue, 14 May 2024 18:38:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1s6x2l-00D4Ll-Gs
	for mlmmj@mlmmj.org; Tue, 14 May 2024 18:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83DD76130B;
	Tue, 14 May 2024 18:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1465EC2BD10;
	Tue, 14 May 2024 18:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715712657;
	bh=jJiuAyaEHePMiip8K9u9S/mK4hxjijGB9WnatVlaUjU=;
	h=Date:From:To:Subject:From;
	b=s6IJ90KuRQm0AHfb/c/UoxPALKn6kHSRC+p8fEV7M7/oZJ5q3tDd4KklMBckeSBmb
	 rAFXUm+qgwUnPGofj+4j6kNdkkMe+jg71ZjyxyY5vnUWY7YhrOguRpqcwOcyRYj+4o
	 1FjviVZD1ipHS/HJo6EAwXcXeZpLm90T88TrNKac=
Date: Tue, 14 May 2024 14:50:55 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: mlmmj@mlmmj.org
Subject: mlmmj-maintd sending empty digests for high-volume lists
Message-ID: <20240514-satisfied-grasshopper-of-abracadabra-615acb@lemur>
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

I'm trying to troubleshoot the problem I'm seeing with digest 
subscriptions to very high-volume lists (linux-kernel). When I run 
mlmmj-maintd, even manually, I get empty digests sent out. It just has 
this in the body of the message:

    Topics (messages 91201 through 91250):

I expect this is due to some kind of size limit?

-K


