Return-Path: <mlmmj+bounces-3058-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD84C10F1A
	for <mlmmj@archiver.kernel.org>; Sat,  4 May 2024 06:22:41 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3058-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s38QQ-0027fH-CK
	for mlmmj@archiver.kernel.org; Sat, 04 May 2024 05:59:10 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1s38QJ-0027eY-Kg
	for mlmmj@mlmmj.org; Sat, 04 May 2024 05:59:03 +0000
Received: from [IPv6:::1] (2a02-8428-078f-2200-a269-fc96-bdb2-d227.rev.sfr.net [IPv6:2a02:8428:78f:2200:a269:fc96:bdb2:d227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aniel.nours.eu (Postfix) with ESMTPSA id D6F5311DA9F
	for <mlmmj@mlmmj.org>; Sat,  4 May 2024 08:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1714803075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NkX1QdG+Sm9ctPUgwfXEGluFn4UHTrcicDmRF9mmGio=;
	b=FPO5Ke5+6mMJW5QmZetfA6+WnOjRFnuyEK3/arfWPOXibPeeMbSsIxKq4/J8hCWNej1/aw
	yoqjmDSprvZFl7Lh91cptqBzfmPQOuXPEbV2YQYQkwEtKO3jDJQcCFRbnSfjdwcYcaHbLk
	ypq+oLrPmnLSDM87iilzSou+pirRhXTKjpEwuOVuAPvbrF7XXzYI1wjXnEYkswEjxaJtGY
	rU9PatQstMIdeaIsdET4P7DPKP55rfO5zfvgtJ39v6FDTlhxgc3rHjlW5Hfm5asZ7go/Zw
	2zLZt8y4E7xvXGE+M5ekyUg5mzM5TXRRiLpqU96v+XJI88RPTo6ryJKj8WKzHA==
Date: Sat, 04 May 2024 08:11:18 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org
Subject: Re: [mlmmj] Roadmap for 1.5
User-Agent: K-9 Mail for Android
In-Reply-To: <836c9c87-7d0e-41b9-b33f-c4887d2ae34e@deganius.de>
References: <8e40c6fe4b3550052e405e068ecd13619602c4c7@nours.eu> <836c9c87-7d0e-41b9-b33f-c4887d2ae34e@deganius.de>
Message-ID: <13C5A781-18E5-423C-9599-575EB1DF63A5@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 4 mai 2024 06:54:46 GMT+02:00, Christof Thalhofer <chrisml@deganius=2Ede=
> a =C3=A9crit=C2=A0:
>Hello Baptiste,
>
>Am 03=2E05=2E24 um 16:39 schrieb Baptiste Daroussin:
>
>> Hello everyone,
>>=20
>> Now that mlmmj 1=2E4 seems to have properly settle, I would like to
>> propose a roadmap for mlmmj 1=2E5, please find here:
>>=20
>> https://codeberg=2Eorg/mlmmj/mlmmj/issues?type=3Dall&sort=3D&state=3Dop=
en&labels=3D&milestone=3D4774&project=3D0&assignee=3D0&poster=3D0
>>=20
>>  The list of tasks I plan to do before releasing mlmmj 1=2E5=2E0
>>=20
>> Do not hesitate to comment, discuss and propose other tasks=2E
>
>Thank you for your efforts!
>
>I have a comment to the topic here, and I will comment the same on codebe=
rg:
>
>"remove control/footer: break dkim"
>
>This is IMO a very bad idea because Mlmmj can be used for a newsletter wi=
thout any problems, which is what I do also=2E When I create a newsletter w=
ith Mlmmj I delete these headers:
>
>X-Original-To:
>Delivered-To:
>Received:
>DKIM-Signature:
>From:
>Autocrypt:
>User-Agent:
>To:
>
>And then I add these customheaders:
>
>From: news@example=2Ecom
>To: news@example=2Ecom
>Reply-To: news@example=2Ecom
>
>And then I can add a footer which gives the people advice how to sign off=
 (necessary for GDPR!)=2E
>
>I also add a prefix=2E
>
>When a newsletter is sent, my server creates and adds DKIM signatures to =
the mail=2E
>
>Mlmmj gives me enough rope to shoot me in the foot=2E And I need that! Pl=
ease don't cripple Mlmmj=2E
>
>Alles Gute
>
>Christof Thalhofer
>

I love this kind of "abuse" of a software! I need to get this documented, =
this is a clever usage of mlmmj=2E

Thanks for the feedback
Bapt


