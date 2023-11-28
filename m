Return-Path: <mlmmj+bounces-3015-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598C5C07CA9
	for <mlmmj@archiver.kernel.org>; Tue, 28 Nov 2023 16:19:40 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3015-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r80T0-00CVVi-5j
	for mlmmj@archiver.kernel.org; Tue, 28 Nov 2023 15:57:42 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1r80St-00CVUu-Jn
	for mlmmj@mlmmj.org; Tue, 28 Nov 2023 15:57:35 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 735571C017; Tue, 28 Nov 2023 17:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1701187572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wPdq3bsM6aHxOJQ112YbJpTDL4It28x2nbnTRfQzAh4=;
	b=b+x2YXNZkdX2a5k2YEXxHXlSRjhdG24mfFI2rWLZM7p/qiCvq8nk/cbkWzRSLLLotdNOCo
	nGxqLKQDOzfPBC4XVPWux8iMWviO6joeEzUk+bHs4JIwnVmADPkpRgXufh6r6xDjDMySyL
	6vc3ht1CgECpexI9czTnHM7cLFKXe/hIdX1wLaDreDSwbCAjLf1eD/5u1GZ+f3K3bDT1FO
	jHq87w0CoNMcwFmSF6OzlTvD3wGEvQDm6cS+2f4NSZMui9gjv2ZZHxE/I0dEtAnogCzrO0
	DblbB7qgEqI359iyQBAAK+4NGS17z6RgiQUCGuSSWMnPdnGFqXx60ZRXe4F8UA==
Date: Tue, 28 Nov 2023 17:06:12 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: mlmmj@mlmmj.org, Uffe Jakobsen <uffe@uffe.org>
Subject: Re: [mlmmj] Problem with mail sent by @orange.fr to @protonmail.com
Message-ID: <ctexrm2bjkzeaslilgkvdwc2pwkhy6x6h7aqmgag6gdr5b5o6b@ih4iyoij5uxp>
References: <2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com>
 <cone.1701097787.573100.51016.1001@mailhost.starion.dk>
 <3E4F30F2-AF6B-4EC6-B896-37383F645518@nours.eu>
 <20231128-warping-aboriginal-ermine-d48cfc@nitro>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128-warping-aboriginal-ermine-d48cfc@nitro>

On Tue, Nov 28, 2023 at 10:58:13AM -0500, Konstantin Ryabitsev wrote:
> On Mon, Nov 27, 2023 at 10:55:22PM +0100, Baptiste Daroussin wrote:
> > Well if you don t alter the email (no subject modifications for example)
> 
> So, can we stop the mlmmj list from doing this? :)

I would love to and this will simplify a lot some part of the code ;)
> 
> > I first went down the "munging from" path using rspamd in front of mlmmj
> > (hence the new feature of suporting X_ORIGINAL_FROM in mlmmj 1.4.0). But
> > then realised that if I stop altering the emails (just play with custom
> > headers) then the dkim signatures remains valid and all mail providers do
> > accept the emails as only being relayed.
> 
> This should continue to work for a while, but soon we'll need to work on being
> conformant with DARA [1], which will require adding Forwarded-To: headers and
> ARC-signing every outgoing message. Yes, this means that if your mailing list
> has 5,000 subscribers, you'll need to cryptographically sign 5,000 individual
> messages.
> 
> We probably have a couple of years before that starts being relevant, though.

Forwarded to is something that can be easily implemented in mlmmj, I will add it
to the todo list for 1.5

As for the signature, it will be up to the smtp setup to to it, meaning mlmmj
should be easily compliant to this rule.
> 
> -K
> 
> [1] https://datatracker.ietf.org/doc/draft-chuang-replay-resistant-arc/


