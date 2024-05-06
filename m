Return-Path: <mlmmj+bounces-3067-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F61C25B4F
	for <mlmmj@archiver.kernel.org>; Mon,  6 May 2024 15:34:15 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3067-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s3zhW-00Gp3g-LE
	for mlmmj@archiver.kernel.org; Mon, 06 May 2024 14:52:22 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1s3zhP-00Gp1Y-TB
	for mlmmj@mlmmj.org; Mon, 06 May 2024 14:52:15 +0000
Received: from mail.nours.eu (nours.eu [IPv6:2001:41d0:8:3a4d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aniel.nours.eu (Postfix) with ESMTPSA id 9041F13CA9;
	Mon,  6 May 2024 17:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1715007870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjzaPemABtjX5p9xoIKWjbcEOIsbXZVSm6B8x1BrLIc=;
	b=t3CqjXVZhhl7G02TjR9Jtj3yGYTvmKLrjShgVPCA8CvUjqyH7veaXfySxQYbYIWKM51xKB
	5gpBR4WtCFMdpcz25l5RSHZhYEUjB41N6Za+wmAoBb1nJ6pdRVjvNEKVtDxqGEPdA4a0VD
	8zbEaZnP0AlhcDR5d/MjEzPHYjmmYJ0c1hYG18/3gCxSljOohcRCue4qg1TZ9d0Sjv2LHX
	7IvufP3VpgU0a2Ymk1FzIKAE2uJgFn7OeAMl9p9MI0s1gWS5EcGZCiWDoPkPsgHFuYdNxf
	pSoCuku6rZJ1fA65rKWAC9gDv7NEjEyh7p2pLQvyn/SO5eFN+WFjv/QrNN07Cw==
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Date: Mon, 06 May 2024 15:04:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Baptiste Daroussin" <bapt@nours.eu>
Message-ID: <f4455949b8f0cf2052734966ccdecdcfa90475a0@nours.eu>
TLS-Required: No
Subject: Re: mlmmj.org website
To: "Michele" <michele@10100.to>, mlmmj@mlmmj.org
In-Reply-To: <3572455.G6LDNde9mc@yoko>
References: <mbxz2egpq4fpbu36jgds2rxwyevigebnsnb3hzhkqe2whasjo2@6fftwsjdo24f>
 <3572455.G6LDNde9mc@yoko>

I surely am interested, thanks for your offer! note that I am a bit old s=
chool (you will notice from the tools I use to generate the new website).

The main things I care about:
- the website should remain static
- the website should remain lightweight and simple to deploy anywhere
- most information which are "duplicated" info from the code or files whi=
ch come along with the code, should generated from the actual source code=
 so we know we keep the website up to date.

I play when generating the website a bit with gohugo & other "modern" web=
site generator but found them too complicated to do what in the end I can=
 do with simple unix tools like make, soelim, lowdown and mandoc.

I can be convinced to switch to other tools (including the "modern" websi=
te generator) :)

I have added a README in the website repository explaining how to generat=
e the website.

Best regards,
Bapt

6 mai 2024 =C3=A0 16:05 "Michele" <michele@10100.to> a =C3=A9crit:



>=20
>=20If it's interesting, my job is also the development of websites...so =
I would like to make my skills available to the community
>=20
>=20--=20
>=20
> Michele
>=20
>=20On 6 May 2024, at 15:34:32 CEST, Baptiste Daroussin <bapt@nours.eu> w=
rote:
>=20
>=20>=20
>=20> Hello everyone,
> >=20
>=20>=20=20
>=20>=20
>=20>  Just a few updates on what happened recently. Wolf granted me acce=
ss to the
> >=20
>=20>  mlmmj.org VM which allowed me to upload a new website: (Sorry I am=
 not a web
> >=20
>=20>  developer) if you want to improve it, please send a PR here:
> >=20
>=20>  https://codeberg.org/mlmmj/mlmmj-website
> >=20
>=20>=20=20
>=20>=20
>=20>  While at it, I activated https.
> >=20
>=20>=20=20
>=20>=20
>=20>  Another change you can see in this email is that this mailing list=
 is no longer
> >=20
>=20>  altering the prefix of the emails, which should please some antisp=
am.
> >=20
>=20>=20=20
>=20>=20
>=20>  Best regards,
> >=20
>=20>  Bapt
> >
>


