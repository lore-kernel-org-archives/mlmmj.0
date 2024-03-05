Return-Path: <mlmmj+bounces-3041-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A090C54E41
	for <mlmmj@archiver.kernel.org>; Tue,  5 Mar 2024 16:31:17 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3041-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rhX0J-003O64-UF
	for mlmmj@archiver.kernel.org; Tue, 05 Mar 2024 15:46:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1rhX0D-003O5H-1d
	for mlmmj@mlmmj.org; Tue, 05 Mar 2024 15:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 313046156A;
	Tue,  5 Mar 2024 15:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBA3C433C7;
	Tue,  5 Mar 2024 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709654258;
	bh=vRGwiQOQIhbHfmHYgz/NO/YSWGEGDrkd4dr4J3lrobA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hL8cPCZ5mg/ibNt2oTN2hFTrG+zVv7i8MzqtxEV7fD45j9YkWTk/U2AmJBkO63ERQ
	 133ATXaHKpxgwU6tvzF8GSl1BzU94BG1dDS/7JudFVZY/PmabLtWfd0huhvU9ylUet
	 PjiQvd4mnf5Fk3UXYdEQVgFr3TjzUvOrU4LEog7g=
Date: Tue, 5 Mar 2024 10:57:34 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christof Thalhofer <chrisml@deganius.de>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] What do you do with Gmail accounts?
Message-ID: <20240305-tricky-crouching-shellfish-eb7c96@meerkat>
References: <835f7d93-96e1-4101-839c-6ce02acd0d2b@deganius.de>
 <83203f9e60f7e8e214ae14b9eff9a2abec86d954@nours.eu>
 <a3721c3e-b6df-4ba9-abfc-b45cbbf193e6@deganius.de>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a3721c3e-b6df-4ba9-abfc-b45cbbf193e6@deganius.de>

On Tue, Mar 05, 2024 at 01:00:45PM +0100, Christof Thalhofer wrote:
> Am 05.03.24 um 12:14 schrieb Baptiste Daroussin:
> 
> 
> > Reply to munge is an interesting feature to add, can you create a feature request on codeberg so I don't forget when I will start working on 1.5?
> > 
> > https://codeberg.org/mlmmj/mlmmj
> 
> Yes I can do that, thanks for the hint.
> 
> Just one question: What is the reason that 'delheaders' deletes not only the
> headers in the file but also '"From " and "Return-Path:" are deleted no
> matter what.'?

This is done for bounce processing purposes. The "envelope-from" is the
address where the receiving system will bounce the message if it is unable to
deliver it. If mlmmj kept the original envelope-from, then:

1. this would violate SPF records
2. this would send the bounces to the original sender instead of to the
   mailing list host

-K


