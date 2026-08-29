Return-Path: <mlmmj+bounces-3123-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80C2C61DD7
	for <mlmmj@archiver.kernel.org>; Sat, 29 Aug 2026 07:15:15 +0000 (UTC)
Received: from localhost ([127.0.0.1]:57816 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3123-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1x0D0P-005y3g-0p
	for mlmmj@archiver.kernel.org;
	Sat, 29 Aug 2026 06:57:33 +0000
Received: from si3t.ch ([109.190.90.35]:20980)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <prx@si3t.ch>)
	id 1x0D0H-005y2z-2L
	for mlmmj@mlmmj.org;
	Sat, 29 Aug 2026 06:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=pubkey; bh=VzzN8TwVfKZ8i
	jYxSE9LnHml30InNQeQ236vpW+KH3M=; h=in-reply-to:references:subject:cc:
	to:from:date; d=si3t.ch; b=DgAHKCT9eNc2pjXZ+pfQev48/p0o3pu6gDhSPePiIVy
	bcQLNaZpww19hNuWtKhFaUvvhNwjVcYEU7rpJTWi+aytipJABDcDIchx7cxrzkQX1QV5oT
	TYVFDxcVG1cHjrJTj6PoOo/YczF348ugvuV8WiCyRUuV9m1K+mOdoAeO3g=
Received: from localhost (si3t.ch [109.190.90.35])
	by si3t.ch (OpenSMTPD) with ESMTPSA id abdf2025 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 29 Aug 2026 09:08:14 +0200 (CEST)
Date: Sat, 29 Aug 2026 09:08:10 +0200
From: prx <prx@si3t.ch>
To: Baptiste Daroussin <bapt@nours.eu>
Cc: mlmmj@mlmmj.org
Subject: Re: subonly question
Message-ID: <apKFWrMf0YvGVD_V@ix.my.domain>
References: <apCTjRPzjZRJ1xLV@ix.my.domain>
 <apFHg17rVjFNy0Ya@b.nours.eu>
 <apFZdiIDV4ethLEk@ix.my.domain>
 <apFaCn292dMU8PW8@b.nours.eu>
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
In-Reply-To: <apFaCn292dMU8PW8@b.nours.eu>
X-GPG-Key-Server: https://si3t.ch/pub/prx.asc
X-GPG-Key-FingerPrint: 6D04 B642 12D9 643D 10C6  72B5 37DE 4F1C CA05 53C8

* Baptiste Daroussin <bapt@nours.eu> le [28-08-2026 11:51:29 +0200]:
> On Fri 28 Aug 11:48, prx wrote:
> > * Baptiste Daroussin <bapt@nours.eu> le [28-08-2026 10:32:38 +0200]:
> > > On Thu 27 Aug 21:44, prx wrote:
> > > > Hi,
> > > > 
> > > > I created the "control/subonlypost" file and encounter two issue.
> > > > 
> > > > After testing with a non-subscribed mail, I get an answer saying : 
> > > > 
> > > > ```
> > > > Cependant, c'est une liste ouverte. Si vous le souhaitez vous pouvez
> > > > simultanément vous inscrire et délivrer votre message en envoyant un
> > > > message à <$listsubreleaseaddr$> ce qui peut habituellement être fait
> > > > simplement en répondant à ce message. Le sujet et le corps du message
> > > > peuvent contenir n'importe quoi.
> > > > ```
> > > > 
> > > > * Why the "$listsubreleaseaddr$" isn't filled? How do I set this? Shall
> > > > I edit text/* file?
> > > > * It is written that answering the message let me subscribe+post.
> > > > However, since the Reply-to is set to ower+list@foo.bar, then my message
> > > > is nevers releasead and I can't subscribe by replying.
> > > > 
> > > > What am I missing here?
> > > > 
> > > > Regard
> > > > 
> > > > prx
> > > > 
> > > > 
> > > 
> > > Hi,
> > > 
> > > Which version of mlmmj are you running? I can't reproduce in 2.1.0.
> > > 
> > > Best regards,
> > > Bapt
> > 
> > Hi,
> > All apologies, I should have specified this.
> > It is mlmmj-1.4.5 under OpenBSD.
> > I guess it's quite outdated?
> > 
> > Regards
> 
> This is bug has been fixed since, iirc fixed since 2.0.0
> 
> Best regards,
> Bapt
> 
> 
Indeed, after upgrading, the mlmmj reply is correct : it suggest to
reply to list+subrelease-....

However, from a non subscribed addres, when doing so, the message is
correctly published to the list, but the sender isn't automatically
subscribed.

Here is my control/ : 

```
> ls control/
access        delheaders    listaddress   owner         replyto       subonlypost
customheaders footer        notifysub     prefix        subonlyget
```

What am I missing?

Regards


