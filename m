Return-Path: <mlmmj+bounces-3068-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F911C10F16
	for <mlmmj@archiver.kernel.org>; Mon,  6 May 2024 15:34:49 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3068-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s3zqs-00GrZI-Vg
	for mlmmj@archiver.kernel.org; Mon, 06 May 2024 15:02:03 +0000
Received: from lightning-mcqueen.10100.to ([157.90.166.63] helo=10100.to)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <michele@10100.to>)
	id 1s3zqm-00GrXM-80
	for mlmmj@mlmmj.org; Mon, 06 May 2024 15:01:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by lightning-mcqueen.10100.to (Postfix) with ESMTP id C438040492
	for <mlmmj@mlmmj.org>; Mon,  6 May 2024 17:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=10100.to; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:references:in-reply-to:message-id:date:date:subject:subject
	:from:from; s=default; t=1715008452; x=1716822853; bh=WGW8kBbMU0
	pPsSABxe6jaQsn3VdF6FqZTmyhlq0vnQk=; b=hyigogW/EBnrlqq+eWcdAfc7KZ
	gDWgqWmIvOISaukzOcZftbHtesBhzn4R294Ag1L9sJfO/tHBpbKvlAIGcEVX0i+F
	QTT6CVyGMoch3pRGsGdlXEHO1wl+U89BsMAiP40R+qS3Em9jOuf7DAt6IVAmnH4Z
	GX2bmgaGsQExfBEIqr77HxiaM3U+sSQ1TsBg2gw4rfeH8jysGaGUbK3dTM/lATeG
	JcW32HJUE3OBWQCbPLDc97nQTT7jChPtAKR9Pt8oGX+CZoF6EaoAwQIUnKjCJ61D
	nqnssC4oZVZqVIaa8vECUnFR7wX4qea4FkWDFMepgBSaKU3OWLPBXLZ/zGjg==
X-Virus-Scanned: Debian amavisd-new at lightning-mcqueen.10100.to
Received: from lightning-mcqueen.10100.to ([127.0.0.1])
	by localhost (mail.10100.to [127.0.0.1]) (amavisd-new, port 10026)
	with LMTP id fGLbBh5AMGLj for <mlmmj@mlmmj.org>;
	Mon,  6 May 2024 17:14:12 +0200 (CEST)
Received: from yoko.localnet (unknown [87.121.148.191])
	(Authenticated sender: michele@10100.to)
	by lightning-mcqueen.10100.to (Postfix) with ESMTPSA id 45D6E4000F
	for <mlmmj@mlmmj.org>; Mon,  6 May 2024 17:14:12 +0200 (CEST)
From: Michele <michele@10100.to>
To: mlmmj@mlmmj.org
Subject: Re: mlmmj.org website
Date: Mon, 06 May 2024 17:14:11 +0200
Message-ID: <13727025.QQfNmSGCeO@yoko>
X-Face: *A{%->08frcej]'gm;C(iI>,gA^(wV.7lN.*QR(?p)z[Ea]ay5$%7}^<oy(T\PsC$9Oq5G O_Bcl'pq%J:)5:^FR"*0!{+J5@=tY(V?\C|"F
In-Reply-To: <f4455949b8f0cf2052734966ccdecdcfa90475a0@nours.eu>
References: <mbxz2egpq4fpbu36jgds2rxwyevigebnsnb3hzhkqe2whasjo2@6fftwsjdo24f> <3572455.G6LDNde9mc@yoko> <f4455949b8f0cf2052734966ccdecdcfa90475a0@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Even if I use modern CMS to develop websites, I'm available to learn tools =
like lowdown and others, if these are the team preference.
Anyway, if a deep investigation seems useful, I'm available too.

=2D-=20
Michele


On 6 May 2024, at 17:04:30 CEST, Baptiste Daroussin <bapt@nours.eu> wrote:
> I surely am interested, thanks for your offer! note that I am a bit old s=
chool (you will notice from the tools I use to generate the new website).
>=20
> The main things I care about:
> - the website should remain static
> - the website should remain lightweight and simple to deploy anywhere
> - most information which are "duplicated" info from the code or files whi=
ch come along with the code, should generated from the actual source code s=
o we know we keep the website up to date.
>=20
> I play when generating the website a bit with gohugo & other "modern" web=
site generator but found them too complicated to do what in the end I can d=
o with simple unix tools like make, soelim, lowdown and mandoc.
>=20
> I can be convinced to switch to other tools (including the "modern" websi=
te generator) :)
>=20
> I have added a README in the website repository explaining how to generat=
e the website.
>=20
> Best regards,
> Bapt
>=20
> 6 mai 2024 =C3=A0 16:05 "Michele" <michele@10100.to> a =C3=A9crit:
>=20
>=20
>=20
> >=20
> > If it's interesting, my job is also the development of websites...so I =
would like to make my skills available to the community
> >=20
> > >=20
> > > Hello everyone,
> > >=20
> > > =20
> > >=20
> > >  Just a few updates on what happened recently. Wolf granted me access=
 to the
> > >=20
> > >  mlmmj.org VM which allowed me to upload a new website: (Sorry I am n=
ot a web
> > >=20
> > >  developer) if you want to improve it, please send a PR here:
> > >=20
> > >  https://codeberg.org/mlmmj/mlmmj-website
> > >=20
> > > =20
> > >=20
> > >  While at it, I activated https.
> > >=20
> > > =20
> > >=20
> > >  Another change you can see in this email is that this mailing list i=
s no longer
> > >=20
> > >  altering the prefix of the emails, which should please some antispam.
> > >=20
> > > =20
> > >=20
> > >  Best regards,
> > >=20
> > >  Bapt
> > >
> >
>=20






