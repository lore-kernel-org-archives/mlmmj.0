Return-Path: <mlmmj+bounces-3017-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E619AC4167B
	for <mlmmj@archiver.kernel.org>; Tue, 28 Nov 2023 16:55:23 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3017-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r80x7-00CVrq-4Z
	for mlmmj@archiver.kernel.org; Tue, 28 Nov 2023 16:28:49 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1r80x0-00CVql-FF
	for mlmmj@mlmmj.org; Tue, 28 Nov 2023 16:28:42 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 074601BDD8; Tue, 28 Nov 2023 17:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1701189440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CIwtqku6hfsU1NBGM+qWvB88mJ/V5q6ue07ozoNwU+8=;
	b=kXwjvXi1AtpLcXGV2mkeNmSP746D9QOzLcgWfyZHpZg1mscrhaOS5Dx22rMxUFWZTIttia
	w/h48Ai0XghKlh3WuLQcp3CQ7/WpBFEAioeSGLcIR6fvx7Srw0KbgZ6YYoXe5WNJDELEuJ
	j3KL4bnM/Q4ArR/YxmFiN8uKVDbSTcaaEPV/OKgE/Ckzdr9B4XvjBnDbMw9rW42sAj/fqk
	ViihU3q57eAC5GhLDjnN+yoAdQp9U6P81X8KThvyor0Dv/bfbwOeOv0cLDMRFMEmc3+eqa
	CSjIgtzlG7f+6AtfyvNq0L0M9gi8u28dW8QR+hmsh6KgpcNSQuR8tI193Qicnw==
Date: Tue, 28 Nov 2023 17:37:19 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: mlmmj@mlmmj.org, Uffe Jakobsen <uffe@uffe.org>
Subject: Re: [mlmmj] Problem with mail sent by @orange.fr to @protonmail.com
Message-ID: <qcsguaz5ivm2kqc5lxdq4cajehhsxsggwkbpmhdhv7qy6gqdw7@uzpsif5smaus>
References: <2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com>
 <cone.1701097787.573100.51016.1001@mailhost.starion.dk>
 <3E4F30F2-AF6B-4EC6-B896-37383F645518@nours.eu>
 <20231128-warping-aboriginal-ermine-d48cfc@nitro>
 <ctexrm2bjkzeaslilgkvdwc2pwkhy6x6h7aqmgag6gdr5b5o6b@ih4iyoij5uxp>
 <20231128-mustard-coua-of-whirlwind-ba498c@meerkat>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-mustard-coua-of-whirlwind-ba498c@meerkat>

On Tue, Nov 28, 2023 at 11:32:57AM -0500, Konstantin Ryabitsev wrote:
> On Tue, Nov 28, 2023 at 05:06:12PM +0100, Baptiste Daroussin wrote:
> > Forwarded to is something that can be easily implemented in mlmmj, I will add it
> > to the todo list for 1.5
> 
> I would wait a bit -- I think the milter that will do the ARC signing will
> also be able to inject Forwarded-To: headers. 
> 
> That said, it would be generally nice if control/customheaders supported
> using variables.

This is what I had in mind adding variable to support Forwarded-To

Best regards,
Bapt


