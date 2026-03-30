Return-Path: <mlmmj+bounces-3101-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336C01061B20
	for <mlmmj@archiver.kernel.org>; Mon, 30 Mar 2026 20:55:17 +0000 (UTC)
Received: from localhost ([127.0.0.1]:51638 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3101-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w7JGW-00B70z-1r
	for mlmmj@archiver.kernel.org;
	Mon, 30 Mar 2026 20:31:16 +0000
Received: from dahlem.somaf.de ([185.183.157.243]:35196)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sca@andreasschulze.de>)
	id 1w7JGP-00B70C-1r
	for mlmmj@mlmmj.org;
	Mon, 30 Mar 2026 20:31:09 +0000
Received: from mta.somaf.de (mta.somaf.de [IPv6:2001:470:77b3:103::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature ECDSA (prime256v1 raw public key) server-digest SHA256)
	(Client did not present a certificate)
	by dahlem.somaf.de (Postfix) with ESMTPS id 4fl33d6KYPz6tqH
	for <mlmmj@mlmmj.org>; Mon, 30 Mar 2026 22:38:05 +0200 (CEST)
ARC-Seal: i=2; a=rsa-sha256; d=dahlem.somaf.de; s=arc1; t=1774903085;
	cv=none; b=EpVv1BxbJ74/8lc4PUbKKcRoWkDNSViRrYeihZtG85XekTDpTLvKOb9fZYNN7QOfr0l5pV804ZRuvZiME013Pj7y9ssgXmg9DFDRDwrKsanl4gTf9aQdIJOXE1aSVRSrTWZqhFOfM0UebUa68utrm9MnoUEf+QSGOafJYHQkXDhqfXCvNvldCMQ/LyyGOxZC78NabntE3KeqIxCfRIScmVsprT3c6gUU6QmY5W9bcS2st7DRZSh+rYX4i2iOcFdp4t+zZvNNpdn8Tm5Y2sfB4DzKrcd46VUSUTZtF0WpffPIxHT4nyYNGrY6g4EuIyMerkG2gQjdORhw3lUomxD86g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=dahlem.somaf.de; s=arc1;
	t=1774903085; c=relaxed/relaxed;
	bh=9nBaTXbI9SNhqgMTgLhqVh6Zuvm48WvXUhKEUGrfvLU=;
	h=Message-ID:ARC-Message-Signature:ARC-Authentication-Results:
	 DKIM-Signature:DKIM-Signature:Date:MIME-Version:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=SvEfXziIBVIfTjcCY0CMJ7TCEjLTx9mY1ONL1UtSBTLqNy4BLj0y8EIH0ennC2nv7fZwlTojSQflljQRgD076jajnWVZRKXFvdvBZhzLad1GxftWdgptYkWSp6nn6wIPrnBR+sENIJ+TjBI/XwteAKdKD5PT8BjN4bRMZ5LnG3Mvxj5dtA90Chq9kl2SzWFAzigvAH8egaWuDItvcdrVAMMy2ravSPlg6kFma2pK1FRp0qlCEe58zaxnbC4AmTU/aE3JKM+yyVzK77Ci63+tYeSmNIQ3Ns2GHBXLL2Ko5PSMAUaRVcWzpohGiAcQm51QNKoLGJm30xoJXdNnGkylvg==
ARC-Authentication-Results: i=2; dahlem.somaf.de
Message-ID: <9dd6fe87-3e6c-4e11-b646-6f725bac4e84@andreasschulze.de>
ARC-Seal: i=1; a=rsa-sha256; d=mta.somaf.de; s=arc1; t=1774903084; cv=none;
	b=K4CgtiOJLnKWxCum+sGVTSZiFQXS107h4Gyr1SbA6kgb6/7gLdsQYxt+b9lXxqDePpLeGaO/H8IlRyMr7ohh9AfG0uV0ssFQKQa2a12GHxvbrD6dsGbL/JylboNaWfA5pH20y2u81KMuzCJ5a19pCnnSQA4tx6AKgcXX4jWBXju070PzPJMUlJh8sfn5RH9pev2TWlivXE0+Xl1vUy7iJYfgFVzrC1FVcC7CO8AuR+ZyL8OupE76ODpIPw99+NgVldka3v0IxdwjFmS4uKHtAihf9ZQh5xIFki4EkXTgZRQlywALmr9XqCejW5OAzcfwP54qqsrkJPnTBI4VA/vtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=mta.somaf.de; s=arc1;
	t=1774903084; c=relaxed/relaxed;
	bh=9nBaTXbI9SNhqgMTgLhqVh6Zuvm48WvXUhKEUGrfvLU=;
	h=Message-ID:DKIM-Signature:DKIM-Signature:Date:MIME-Version:
	 Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=EdItoUrBr04Wl4Xbsz/mRKanVlXy2Dquj1bbl8D+aS63NWEGFnA5rUekHMo0hlZD0HaUIBxDB+Ynib69Su3FwO5zWrDeb4CQCr357zyvgLStVzPN3foVEOfX66A33q4Hh4xgTVziXZuSOqnJk4AzVktLhWYvjUzrvsGIXfOftKTU4grT9LJl4cmt2nXYrHdY0yLqaEFSfPLieOmFvg2Mk2ldnUH7KBqQs4mqWuiNyFWPmeffffbGXVXNDvAKr3dJSQnA7LykiGRHQIPiJIfVH9vA13/JMaUQ9OuT6MzcQjjh+gNe9ys6Ii3d2wJguhTRkf4l5rfDKvKeMWic+FhdXA==
ARC-Authentication-Results: i=1; mta.somaf.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andreasschulze.de;
	s=20260330-BF35CB2D; t=1774903084; x=1779903084;
	bh=9nBaTXbI9SNhqgMTgLhqVh6Zuvm48WvXUhKEUGrfvLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:autocrypt:cc:
	 content-transfer-encoding:content-type:date:from:in-reply-to:
	 message-id:mime-version:openpgp:references:subject:to;
	b=ktCtkycdPrYoxOabUp71ipiKfgZzRZPl+O1kvsoX6UfLJcmLEwRe/gZN9770e8zkD
	 6uk5rvI5J1qyLN20Vzz+C09wM7QvfcnEjoHQb/x23Jl9WHw/WqHUI+60POHaLUZDeV
	 IWpr2grLhtLQiAaaob+uaX20B9PfripC3b6noWXZS/yLAnQqE0AysYvR7HGmMp12Nc
	 qywaOjiEMSsGEsHLIPEVTOHB6Mecsrvht2Vc5Vst7SULralxgkTNhnWQut9aIStySC
	 KcLQCPO4M1gNYrIozIxcoROpgU6xWsDQyukb/1cri1cQMQRZu0bSFjLtvhu6iWI1+t
	 7HUlZ7GvMX7bw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=andreasschulze.de; s=20260316-74BFB72E; t=1774903084;
	x=1779903084; bh=9nBaTXbI9SNhqgMTgLhqVh6Zuvm48WvXUhKEUGrfvLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:autocrypt:cc:
	 content-transfer-encoding:content-type:date:from:in-reply-to:
	 message-id:mime-version:openpgp:references:subject:to;
	b=0jqx7BY+JRrZSR5EsE9lzfElDcqQjjYNJI5jPDIYHaxBz/W1b2jvOWwEc/g7a5yzO
	 dz21AJsMVTF/geVaHRLDw==
Date: Mon, 30 Mar 2026 22:38:03 +0200
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Subject: Re: Call for testing: 2.0.0 is close to the doors
To: mlmmj@mlmmj.org
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
 <3abe4042-99df-4461-ac15-28fed4b021ab@andreasschulze.de>
Content-Language: en-US, de-DE
From: "A.Schulze" <sca@andreasschulze.de>
In-Reply-To: <3abe4042-99df-4461-ac15-28fed4b021ab@andreasschulze.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 30.03.26 um 21:23 schrieb A.Schulze:
> 1.6.0 is running in prod
> 1.7.0 compile
> 1.7.1 compile & I enabled 'make check' -> all tests pass
> 1.8.0 compile but 'make check' fail
...
and with master (commit 2931a1b744), all test pass again

the "updated" build system now no longer provide a target "install-strip"
after "make install", the binaries still contain debug information.
(calling 'strip bin/*' corrects that)

Andreas


