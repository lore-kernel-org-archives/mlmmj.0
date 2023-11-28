Return-Path: <mlmmj+bounces-3016-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9D2C4167B
	for <mlmmj@archiver.kernel.org>; Tue, 28 Nov 2023 16:54:11 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3016-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r80sy-00CVl7-7H
	for mlmmj@archiver.kernel.org; Tue, 28 Nov 2023 16:24:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1r80sr-00CVk0-AR
	for mlmmj@mlmmj.org; Tue, 28 Nov 2023 16:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59D98CE1A80;
	Tue, 28 Nov 2023 16:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77007C433C8;
	Tue, 28 Nov 2023 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701189178;
	bh=lDyZSlCz+HVj+bjZpA++3OkuegdMcpOcMhk5mMCOJdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uhn/rvoe9WyXImdgDxOmaEthHatDW7boZSzeoTVTSRyPzHurtM+ghgVWkcWUX1S1k
	 aE4Fs2wX7F/kudS3vbZHRy3Zg3lUe13Sm3Zx6Ai9ZM6FwDnBM/svGTcknxkhsvX/Qz
	 7yFDS6nm66TxvaRkM+LyjEKACc5s8YpjhG1uizKk=
Date: Tue, 28 Nov 2023 11:32:57 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Baptiste Daroussin <bapt@nours.eu>
Cc: mlmmj@mlmmj.org, Uffe Jakobsen <uffe@uffe.org>
Subject: Re: [mlmmj] Problem with mail sent by @orange.fr to @protonmail.com
Message-ID: <20231128-mustard-coua-of-whirlwind-ba498c@meerkat>
References: <2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com>
 <cone.1701097787.573100.51016.1001@mailhost.starion.dk>
 <3E4F30F2-AF6B-4EC6-B896-37383F645518@nours.eu>
 <20231128-warping-aboriginal-ermine-d48cfc@nitro>
 <ctexrm2bjkzeaslilgkvdwc2pwkhy6x6h7aqmgag6gdr5b5o6b@ih4iyoij5uxp>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ctexrm2bjkzeaslilgkvdwc2pwkhy6x6h7aqmgag6gdr5b5o6b@ih4iyoij5uxp>

On Tue, Nov 28, 2023 at 05:06:12PM +0100, Baptiste Daroussin wrote:
> Forwarded to is something that can be easily implemented in mlmmj, I will add it
> to the todo list for 1.5

I would wait a bit -- I think the milter that will do the ARC signing will
also be able to inject Forwarded-To: headers. 

That said, it would be generally nice if control/customheaders supported
using variables.

Regards,
-K


