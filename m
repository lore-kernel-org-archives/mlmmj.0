Return-Path: <mlmmj+bounces-3014-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2D1C4167B
	for <mlmmj@archiver.kernel.org>; Tue, 28 Nov 2023 16:20:27 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3014-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r80LJ-00CVQp-Vf
	for mlmmj@archiver.kernel.org; Tue, 28 Nov 2023 15:49:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1r80LD-00CVQB-7Q
	for mlmmj@mlmmj.org; Tue, 28 Nov 2023 15:49:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3982E61579;
	Tue, 28 Nov 2023 15:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC997C433C8;
	Tue, 28 Nov 2023 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701187094;
	bh=GAqbTR3xVOYsGRhVDsP0KPMGi0/ysvHSGScQYtVELmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJHfv2ZOU4BPVMyrok8/5g8shC61pXBEG0j4NrVmoEsabv+yNUwwqkZ7Z8Goslr11
	 /06J9CA53I+nnqatyTOMF50nJcfzayxSg+nYuf5MsVgbgezIS3DnTWyPGv4v3G6tvd
	 spRH1k681RBIKlQxC6z7cV+AFKN3eFMSCZo6+Dwg=
Date: Tue, 28 Nov 2023 10:58:13 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Baptiste Daroussin <bapt@nours.eu>
Cc: mlmmj@mlmmj.org, Uffe Jakobsen <uffe@uffe.org>
Subject: Re: [mlmmj] Problem with mail sent by @orange.fr to @protonmail.com
Message-ID: <20231128-warping-aboriginal-ermine-d48cfc@nitro>
References: <2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com>
 <cone.1701097787.573100.51016.1001@mailhost.starion.dk>
 <3E4F30F2-AF6B-4EC6-B896-37383F645518@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3E4F30F2-AF6B-4EC6-B896-37383F645518@nours.eu>

On Mon, Nov 27, 2023 at 10:55:22PM +0100, Baptiste Daroussin wrote:
> Well if you don t alter the email (no subject modifications for example)

So, can we stop the mlmmj list from doing this? :)

> I first went down the "munging from" path using rspamd in front of mlmmj
> (hence the new feature of suporting X_ORIGINAL_FROM in mlmmj 1.4.0). But
> then realised that if I stop altering the emails (just play with custom
> headers) then the dkim signatures remains valid and all mail providers do
> accept the emails as only being relayed.

This should continue to work for a while, but soon we'll need to work on being
conformant with DARA [1], which will require adding Forwarded-To: headers and
ARC-signing every outgoing message. Yes, this means that if your mailing list
has 5,000 subscribers, you'll need to cryptographically sign 5,000 individual
messages.

We probably have a couple of years before that starts being relevant, though.

-K

[1] https://datatracker.ietf.org/doc/draft-chuang-replay-resistant-arc/


