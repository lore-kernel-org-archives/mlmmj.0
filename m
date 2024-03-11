Return-Path: <mlmmj+bounces-3045-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCD7C5475B
	for <mlmmj@archiver.kernel.org>; Mon, 11 Mar 2024 14:02:12 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3045-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rjfZ1-004z2w-9s
	for mlmmj@archiver.kernel.org; Mon, 11 Mar 2024 13:19:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1rjfYu-004z26-Eo
	for mlmmj@mlmmj.org; Mon, 11 Mar 2024 13:19:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4A7F60C6C;
	Mon, 11 Mar 2024 13:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B8BC433F1;
	Mon, 11 Mar 2024 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1710163826;
	bh=93SK6CegPx/yP3jeJyL1VXkYvUp5G4biUpvv4g4OhY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/4OTFfrfkPDzyLwPUi1VL8Dd70c3SKv5+W/gMLdHppVFz0vg3ro14ABGU6n42pck
	 I4NJtbf6Pu/PUZMyFJ4SPWciCpYpQEAzctKlyLG6+U4dOi9e21MBaiVCkFBFFJPD/U
	 AaqMnpd6MNuZfnkDuw95MzcERTsJjVJyWB7BKk78=
Date: Mon, 11 Mar 2024 09:30:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christof Thalhofer <chrisml@deganius.de>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] What do you do with Gmail accounts?
Message-ID: <20240311-benign-snobbish-ibex-829c20@lemur>
References: <835f7d93-96e1-4101-839c-6ce02acd0d2b@deganius.de>
 <83203f9e60f7e8e214ae14b9eff9a2abec86d954@nours.eu>
 <17adbca1-0c86-48c8-b42d-bdd526a85152@deganius.de>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17adbca1-0c86-48c8-b42d-bdd526a85152@deganius.de>

On Sun, Mar 10, 2024 at 01:52:34PM +0100, Christof Thalhofer wrote:
> "Reply-To" munging destroys DKIM signatures and therefor should not be a
> separate tunable. But there are situations where I would like to use it.
> 
> Because of that I come to the conclusion: What should be done in a future
> version of Mlmmj is to fix the 'delheaders' tunable.
> 
> IMO 'delheaders' in the current state is impossible to use right

We're using it across hundreds of mailing lists, delivering millions of
messages daily, so this statement is incorrect.

> because if
> set it not only deletes the header I want but also does that:
> 
> '"From " and "Return-Path:" are deleted no matter what.'

I have previously explained why this is the correct course of action:
https://lore.kernel.org/mlmmj/20240305-tricky-crouching-shellfish-eb7c96@meerkat/

You may be confusing "From " (envelope-from) and "From:" (the cosmetic
header). They are not the same thing and the distinction is crucial to
understanding why mlmmj does the right thing.

> as it is stated the documentation.
> 
> Additionally it rewrites the message body and inserts something like that
> (in the body!???), this is the head of the body of a testmail I sent to our
> mailinglist:

I think you may have an extra blank line in your customheaders tunable.

-K


