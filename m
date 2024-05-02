Return-Path: <mlmmj+bounces-3054-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFC6C4345F
	for <mlmmj@archiver.kernel.org>; Thu,  2 May 2024 13:28:39 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3054-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s2VrA-001ftL-4C
	for mlmmj@archiver.kernel.org; Thu, 02 May 2024 12:48:12 +0000
Received: from lightning-mcqueen.10100.to ([157.90.166.63] helo=10100.to)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <michele@10100.to>)
	id 1s2Vr3-001fsf-Cu
	for mlmmj@mlmmj.org; Thu, 02 May 2024 12:48:05 +0000
Received: from localhost (localhost [127.0.0.1])
	by lightning-mcqueen.10100.to (Postfix) with ESMTP id DB75440532
	for <mlmmj@mlmmj.org>; Thu,  2 May 2024 15:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=10100.to; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:references:in-reply-to:message-id:date:date:subject:subject
	:from:from; s=default; t=1714654815; x=1716469216; bh=S5wgUAklUB
	rvuVqGXn9Fx/ijHxUXa3FmkaoTGjG0rc0=; b=ZJ6Sl05UcNdCrJWLqZ3DktCTkH
	52UNnw1PtzTOOOhk+/ZiwBVBJ7Y3wzRSXqFtryBXALUo3+8oXGOGgFc58W6CsifK
	pfjYvnBiOTBS8LJyZxNyvGBoNEy6rP1mLix6J81eZ3oneLytl6p3qHB9KryICuG0
	ap0sl46a3DgcLggYgVOXGwIEBJx9e5puP8CRR7Wy+NX2bgi4ppdBUEPS2HEIt4JZ
	kYBvP6E/4c6bx46ZrEqvDnPivlHAU6VOr6uB0z+Hx72IlvWO/ipbVyW/bQQFR43j
	Rg4UxdkiY6vO+kqUK/LhZL20H4ggcsu7sJEts7I4YhTSOAnEmtSE99xPaUFw==
X-Virus-Scanned: Debian amavisd-new at lightning-mcqueen.10100.to
Received: from lightning-mcqueen.10100.to ([127.0.0.1])
	by localhost (mail.10100.to [127.0.0.1]) (amavisd-new, port 10026)
	with LMTP id eUqubhd_66jZ for <mlmmj@mlmmj.org>;
	Thu,  2 May 2024 15:00:15 +0200 (CEST)
Received: from yoko.localnet (unknown [87.121.148.191])
	(Authenticated sender: michele@10100.to)
	by lightning-mcqueen.10100.to (Postfix) with ESMTPSA id 4063C3FC20
	for <mlmmj@mlmmj.org>; Thu,  2 May 2024 15:00:15 +0200 (CEST)
From: Michele <michele@10100.to>
To: mlmmj@mlmmj.org
Subject: Re: [mlmmj] Release 1.4.2
Date: Thu, 02 May 2024 15:00:14 +0200
Message-ID: <2882828.rsuX62QnU8@yoko>
X-Face: *A{%->08frcej]'gm;C(iI>,gA^(wV.7lN.*QR(?p)z[Ea]ay5$%7}^<oy(T\PsC$9Oq5G O_Bcl'pq%J:)5:^FR"*0!{+J5@=tY(V?\C|"F
In-Reply-To: <hwb55oub6un6rzeimyehdvczaaoof7qi65gye3ospjntcxlsol@7ylu5gpaoab3>
References: <25lqa52awkp7tkcdjdzb4cslunuxd6ytoiidj5r6bma2sflogn@drcwbe2c4kwe> <3805806.nq5txsKOOX@yoko> <hwb55oub6un6rzeimyehdvczaaoof7qi65gye3ospjntcxlsol@7ylu5gpaoab3>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart3384077.34HuxqNTev"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart3384077.34HuxqNTev
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Thank you!

I'm thinking about creating a deb package. In that case I'll inform you.

-- 
Michele


> On Thu 02 May 14:36:49 CEST, Baptiste Daroussin wrote:
> > Hello,
> > 
> > sorry for my stupid question: where can I download the package? 
> > 
> > Thank you!
> Not a stupid question, given I don't have access to mlmmj.org infrastructure
> beside my request it is not easy for people to find out.
> 
> You can find it here:
> https://codeberg.org/mlmmj/mlmmj/releases
> 
> For OS specific:
> - FreeBSD package are up to date
> - Alpine linux edge is up to date
> - No news from debian
> - Epel9 and fedora 40 have 1.4.5 (fedora 39 has 1.4.4)
> 
> No news from other OSes.
> 
> Best regards,
> Bapt
> 



--nextPart3384077.34HuxqNTev
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Thank you!</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">I'm thinking about creating a deb package. In that case I'll inform you.</p>
<br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">-- </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Michele</p>
<br /><br /><p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; On Thu 02 May 14:36:49 CEST, Baptiste Daroussin wrote:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; Hello,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; sorry for my stupid question: where can I download the package? </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; &gt; Thank you!</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Not a stupid question, given I don't have access to mlmmj.org infrastructure</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; beside my request it is not easy for people to find out.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; You can find it here:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; https://codeberg.org/mlmmj/mlmmj/releases</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; For OS specific:</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; - FreeBSD package are up to date</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; - Alpine linux edge is up to date</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; - No news from debian</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; - Epel9 and fedora 40 have 1.4.5 (fedora 39 has 1.4.4)</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; No news from other OSes.</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Best regards,</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; Bapt</p>
<p style="margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt; </p>
<br /><br /></body>
</html>
--nextPart3384077.34HuxqNTev--





