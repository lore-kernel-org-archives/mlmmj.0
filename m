Return-Path: <mlmmj+bounces-3122-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE9CC61DBD
	for <mlmmj@archiver.kernel.org>; Fri, 28 Aug 2026 10:21:11 +0000 (UTC)
Received: from localhost ([127.0.0.1]:41734 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3122-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wzt4z-005s2Q-06
	for mlmmj@archiver.kernel.org;
	Fri, 28 Aug 2026 09:40:57 +0000
Received: from b.nours.eu ([54.38.177.57]:48012)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <bapt@nours.eu>)
	id 1wzt4r-005s1h-33
	for mlmmj@mlmmj.org;
	Fri, 28 Aug 2026 09:40:49 +0000
Received: by b.nours.eu (Postfix, from userid 1001)
	id 2B23A176F06; Fri, 28 Aug 2026 11:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1787910689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJFnZQWQ9C2/3ptLiGj49DZlWD483RqAQom8QP1OSOw=;
	b=W0CUUqC7G4ThE/++VHPK/xmeVOnq0z8DxsT0SefVHHBDd8AcwK+MCI4uop1vqcgtsUEvKc
	tNfeKh1a2SaqUSgGVmB/YHlrOkCoAH2A/5b7VecQ3u9rYkilqaxKvUSrDOTn7HXXibg59n
	KlY108OBX7MbuP5jv3Caczi84kQ50FMQW1hM6I27kCDw9UKJCZWGBc7KBvL28JIK7PQt2v
	ciCZEjmdLZ4OZOr7Yjy5zaM5P+eh6c7hWvpdEBukUZhYATdASsW2ZXaZsAmj7CVeuZtpzv
	JHNUWaMyyPWc3xHuoZSkiTaZ/31tGecbnVHtuYJ87zeGhrCVZV71yomI6GIidQ==
Date: Fri, 28 Aug 2026 11:51:29 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: prx <prx@si3t.ch>
Cc: mlmmj@mlmmj.org
Subject: Re: subonly question
Message-ID: <apFaCn292dMU8PW8@b.nours.eu>
References: <apCTjRPzjZRJ1xLV@ix.my.domain>
 <apFHg17rVjFNy0Ya@b.nours.eu>
 <apFZdiIDV4ethLEk@ix.my.domain>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apFZdiIDV4ethLEk@ix.my.domain>

On Fri 28 Aug 11:48, prx wrote:
> * Baptiste Daroussin <bapt@nours.eu> le [28-08-2026 10:32:38 +0200]:
> > On Thu 27 Aug 21:44, prx wrote:
> > > Hi,
> > > 
> > > I created the "control/subonlypost" file and encounter two issue.
> > > 
> > > After testing with a non-subscribed mail, I get an answer saying : 
> > > 
> > > ```
> > > Cependant, c'est une liste ouverte. Si vous le souhaitez vous pouvez
> > > simultanément vous inscrire et délivrer votre message en envoyant un
> > > message à <$listsubreleaseaddr$> ce qui peut habituellement être fait
> > > simplement en répondant à ce message. Le sujet et le corps du message
> > > peuvent contenir n'importe quoi.
> > > ```
> > > 
> > > * Why the "$listsubreleaseaddr$" isn't filled? How do I set this? Shall
> > > I edit text/* file?
> > > * It is written that answering the message let me subscribe+post.
> > > However, since the Reply-to is set to ower+list@foo.bar, then my message
> > > is nevers releasead and I can't subscribe by replying.
> > > 
> > > What am I missing here?
> > > 
> > > Regard
> > > 
> > > prx
> > > 
> > > 
> > 
> > Hi,
> > 
> > Which version of mlmmj are you running? I can't reproduce in 2.1.0.
> > 
> > Best regards,
> > Bapt
> 
> Hi,
> All apologies, I should have specified this.
> It is mlmmj-1.4.5 under OpenBSD.
> I guess it's quite outdated?
> 
> Regards

This is bug has been fixed since, iirc fixed since 2.0.0

Best regards,
Bapt


