Return-Path: <mlmmj+bounces-3024-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26F7C4167B
	for <mlmmj@archiver.kernel.org>; Fri,  8 Dec 2023 08:02:27 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3024-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rBV5d-00DqpA-0J
	for mlmmj@archiver.kernel.org; Fri, 08 Dec 2023 07:16:01 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pcros@protonmail.com>)
	id 1rBV5W-00DqoU-BK
	for mlmmj@mlmmj.org; Fri, 08 Dec 2023 07:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1702020284; x=1702279484;
	bh=FRAsLxuzIgpZUgEOl0PIaLCEG6YIa9A2VHB47jDCHOE=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qomhfrx5WxxfbbGohovgG5WxnfHfI4EiGHYsngYZyP0s+OLN24SfXV65XDEXOxpaK
	 kbeHs/igIxHpkPznce4CiI+mLHpJ7uw8qM1ya6mQjpeAS6LqZrNWfU0rSbl9JoJ110
	 b+Kr+qTRkuwSD/+PnrEJjaizD4EynI0O5TZbQ8awMn6vTCbAetXBUY1/25L99hEnGj
	 zakjpBzkuWon6lrd4Eof36fhiTNWYBzn1rC8UVxalB8ATB9Mz5eviBjzeDivLYdbJt
	 v5U56k3LURh0VOaZXtQoiLe6MC0hPtDs055QWP718MwE6bYtBRCQJFIzMyOztD3Mej
	 DnqPSn/oIYMHQ==
Date: Fri, 08 Dec 2023 07:24:33 +0000
To: "mlmmj@mlmmj.org" <mlmmj@mlmmj.org>
From: Pierre Cros <pcros@protonmail.com>
Subject: Re : Re: Re : Re: [mlmmj] Problem with mail sent by @orange.fr to @protonmail.com
Message-ID: <N8gjductAc3czTwVfr__P4_E24JsxIBvvJo37fXE0f6ACSQ2IT_3YO17Zr3HTHg3elAUywgUUgmg7t5JnP5keMeMIUFWGCKahnfh090Gu3g=@protonmail.com>
In-Reply-To: <ox5gcz6ku3l4i2uyxgdu2oqmgmh6f64cvcinpmvuv4xiguwi3i@liy5chw43gye>
References: <2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com> <cone.1701097787.573100.51016.1001@mailhost.starion.dk> <3E4F30F2-AF6B-4EC6-B896-37383F645518@nours.eu> <-zlv36oUOUAXIF_-dgxjzOYa50nUerscKJGsjdsUbpvu6NZdF7XiYBg6O8FBk1KAuA4u0goocPSCi962Sis71wZ4ZRzkv07DxfkQt7OXGmg=@protonmail.com> <ox5gcz6ku3l4i2uyxgdu2oqmgmh6f64cvcinpmvuv4xiguwi3i@liy5chw43gye>
Feedback-ID: 21719519:user:proton
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le mercredi 29 novembre 2023 =C3=A0 17:59, Baptiste Daroussin <bapt@nours.e=
u> a =C3=A9crit=C2=A0:

> Nothing is needed in headers, just stop altering subject and body of the =
email.
>=20
> Why I said adding custom headers, it means for people willing to filer th=
e
> emails they should use List-Id instead of a prefix on the subject for exa=
mple.

For those who might be interested : my lists used some custom headers.

I created a new list without fiddling with anything and... it just works ou=
t of the box between orange.fr and protonmail.com.

Thank you Baptiste and others, and congrats for the 1.4.0 release !

Pierre


