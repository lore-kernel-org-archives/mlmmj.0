Return-Path: <mlmmj+bounces-3021-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EBEC4167B
	for <mlmmj@archiver.kernel.org>; Wed,  6 Dec 2023 20:25:22 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3021-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rAxlr-00Ddjx-Gr
	for mlmmj@archiver.kernel.org; Wed, 06 Dec 2023 19:41:23 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <mmj@mmj.dk>)
	id 1rAxlk-00DdjB-T2
	for mlmmj@mlmmj.org; Wed, 06 Dec 2023 19:41:16 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50bf82f6accso40760e87.1
        for <mlmmj@mlmmj.org>; Wed, 06 Dec 2023 11:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mmj.dk; s=google; t=1701892205; x=1702497005; darn=mlmmj.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xglkJjFQXCJIYqJ6gFO07Z0Z94t53OqEkwbavQG1ch4=;
        b=BMLmO815DLhbVnGJEUE5x1f1pHNHjBEXjHyGXDxqHrvPHviDBEzEkB7QJfGOA43aZd
         0VGtN4kcfwFVIhGLV12jToKq8yszr6EriGKVr4/MDjut6+OqP5EG6aiwHezj8cr8XwZZ
         Vgbech5MesmoaFFdCidsMqMIEculX4KqDNpc66hxsep5wP/+2cpsngsRe1PdvIOYTe5s
         Wt+RqzQg5cCgGBN0fLqfpJ59HGepDRARr0XjdBj+HZkB2BcdKqWuoTg1glrpZ3C73WTB
         S+8QRfWz4k1W+MlZrl0vsQevJ1PApZPjrgYiXFSmb7/jZUZs4E2bg2PnZ3blu51ycXbI
         zXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701892205; x=1702497005;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xglkJjFQXCJIYqJ6gFO07Z0Z94t53OqEkwbavQG1ch4=;
        b=vLVyHVKFwIvx1QZaIU1KVymq4NJyjclgDy9tuZ1cs50+5jAlQABOttohUDdTr9QaaS
         MoU8J6ex5wbxPoItIlm+4JIBVqD+CWmiFhWNuogOwnQ5PUb34lcf7YoqvGIvneeqDpoy
         eEz1qx9BzHn4XLC8q7W1A1KUFLY8o6EfnVUG6yCu54mn5YCkjNU3BziaBSelDoAXdeKP
         Tfwll2knHYML0lM1nYQ2OV6nvch7tRuVh8FyNZjqCH+FvSd1UMxQ4AMF0jJwtcXPjeVX
         Jhf1lHI99c90rqxA1/S60gbltEKLJlfUcEiQu1/rtNKxl7yla3fzpuIlk8O2VhX7jLYA
         EB3w==
X-Gm-Message-State: AOJu0YydBACnY9OcBp0Y6pnqIsPehxA5rnPiPohzMHC2mn35YMQsFui+
	vYXPf9rRE9mwGiHVImPgDvGXfzO/mOhLIeLVE1A=
X-Google-Smtp-Source: AGHT+IH/ld8tWL/Beo4Jju9R0Ctr6c7DJ8RQr78YEN99JkIl2ktI5QPBpF++hwPN5vwFu3hninUBng==
X-Received: by 2002:a05:6512:3b8b:b0:50b:dd81:1b60 with SMTP id g11-20020a0565123b8b00b0050bdd811b60mr2066842lfv.4.1701892204730;
        Wed, 06 Dec 2023 11:50:04 -0800 (PST)
Received: from smtpclient.apple ([2a05:f6c7:9606:0:a1cc:c403:657f:5adc])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b0050bc303f3cbsm1725619lfr.173.2023.12.06.11.50.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Dec 2023 11:50:04 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [mlmmj] mlmmj 1.4.0 is now out!
From: =?utf-8?Q?Mads_Martin_J=C3=B8rgensen?= <mmj@mmj.dk>
In-Reply-To: <kpsdycifpeeuhzo3qjkxv4h7hxo7exrwfxrnjvpfqfzmem4sw2@i34opbf4lduv>
Date: Wed, 6 Dec 2023 20:49:53 +0100
Cc: mlmmj@mlmmj.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CDFC1958-685D-45C1-8D93-38971A70FB91@mmj.dk>
References: <kpsdycifpeeuhzo3qjkxv4h7hxo7exrwfxrnjvpfqfzmem4sw2@i34opbf4lduv>
To: Baptiste Daroussin <bapt@nours.eu>
X-Mailer: Apple Mail (2.3774.200.91.1.1)

Hello Baptiste,

> On 6 Dec 2023, at 17.21, Baptiste Daroussin <bapt@nours.eu> wrote:
>=20
> I am proud to announce the final release of the 1.4.0 version of =
mlmmj.
> It is a major milestone, because this is the first version with me as =
a
> maintainer (I hope I won't disappoint you!) and there has been a huge
> refactoring of the mlmmj code itself.
>=20
> As end user the Changelog is not that big:
>=20
> - Add a test suite

[ snip lots of good stuff ]

> - php8 support!
>=20
> Thank you to everyone who has been involved by tested, sharing ideas, =
sending patches!
>=20
> Please report bugs, I will try to fix them quickly and cut bug fixes =
release as often as needed.

Thank you very much for giving this old piece of software the TLC it =
needs. I'm very happy that you're the maintainer.

--=20
"Why make things difficult, when it is possible to make them cryptic and =
totally illogical, with just a little bit more effort?" - A. P. J






