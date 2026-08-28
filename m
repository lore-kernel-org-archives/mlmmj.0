Return-Path: <mlmmj+bounces-3121-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B565C61DBD
	for <mlmmj@archiver.kernel.org>; Fri, 28 Aug 2026 10:23:33 +0000 (UTC)
Received: from localhost ([127.0.0.1]:38522 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3121-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wzt2A-005rxw-1W
	for mlmmj@archiver.kernel.org;
	Fri, 28 Aug 2026 09:38:02 +0000
Received: from si3t.ch ([109.190.90.35]:38838)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <prx@si3t.ch>)
	id 1wzt23-005rxD-0z
	for mlmmj@mlmmj.org;
	Fri, 28 Aug 2026 09:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=pubkey; bh=SmBg2Xse8v1He
	pgQGl4a+ad0ZLaF1a9LTcFBHkw55IU=; h=in-reply-to:references:subject:cc:
	to:from:date; d=si3t.ch; b=ldLKkU3HDCmEkbdMw2XyOkgZO/X/mHNwyd+/H/Uo5rm
	fX7OnGnbvcaogHVs4AiybSgkspYJHtjnrAi5XiezpkPJMM9GyyjGy141LjMaSAsfNrwRAX
	ed8qEvHFbWtaOFQNECfvXtE98Wo9g+Zbf+LnozPCEAD49YtjX3NofEXgM0=
Received: from localhost (si3t.ch [109.190.90.35])
	by si3t.ch (OpenSMTPD) with ESMTPSA id 21ed0af4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 28 Aug 2026 11:48:43 +0200 (CEST)
Date: Fri, 28 Aug 2026 11:48:38 +0200
From: prx <prx@si3t.ch>
To: Baptiste Daroussin <bapt@nours.eu>
Cc: mlmmj@mlmmj.org
Subject: Re: subonly question
Message-ID: <apFZdiIDV4ethLEk@ix.my.domain>
References: <apCTjRPzjZRJ1xLV@ix.my.domain>
 <apFHg17rVjFNy0Ya@b.nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apFHg17rVjFNy0Ya@b.nours.eu>
X-GPG-Key-Server: https://si3t.ch/pub/prx.asc
X-GPG-Key-FingerPrint: 6D04 B642 12D9 643D 10C6  72B5 37DE 4F1C CA05 53C8

* Baptiste Daroussin <bapt@nours.eu> le [28-08-2026 10:32:38 +0200]:
> On Thu 27 Aug 21:44, prx wrote:
> > Hi,
> > 
> > I created the "control/subonlypost" file and encounter two issue.
> > 
> > After testing with a non-subscribed mail, I get an answer saying : 
> > 
> > ```
> > Cependant, c'est une liste ouverte. Si vous le souhaitez vous pouvez
> > simultanément vous inscrire et délivrer votre message en envoyant un
> > message à <$listsubreleaseaddr$> ce qui peut habituellement être fait
> > simplement en répondant à ce message. Le sujet et le corps du message
> > peuvent contenir n'importe quoi.
> > ```
> > 
> > * Why the "$listsubreleaseaddr$" isn't filled? How do I set this? Shall
> > I edit text/* file?
> > * It is written that answering the message let me subscribe+post.
> > However, since the Reply-to is set to ower+list@foo.bar, then my message
> > is nevers releasead and I can't subscribe by replying.
> > 
> > What am I missing here?
> > 
> > Regard
> > 
> > prx
> > 
> > 
> 
> Hi,
> 
> Which version of mlmmj are you running? I can't reproduce in 2.1.0.
> 
> Best regards,
> Bapt

Hi,
All apologies, I should have specified this.
It is mlmmj-1.4.5 under OpenBSD.
I guess it's quite outdated?

Regards


