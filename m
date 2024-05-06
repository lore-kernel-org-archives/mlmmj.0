Return-Path: <mlmmj+bounces-3066-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25842C10F16
	for <mlmmj@archiver.kernel.org>; Mon,  6 May 2024 14:24:07 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3066-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s3ymK-00GZYe-AF
	for mlmmj@archiver.kernel.org; Mon, 06 May 2024 13:53:16 +0000
Received: from lightning-mcqueen.10100.to ([157.90.166.63] helo=10100.to)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <michele@10100.to>)
	id 1s3ymD-00GZWe-Jt
	for mlmmj@mlmmj.org; Mon, 06 May 2024 13:53:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by lightning-mcqueen.10100.to (Postfix) with ESMTP id 0CC2B40492
	for <mlmmj@mlmmj.org>; Mon,  6 May 2024 16:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=10100.to; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:references:in-reply-to:message-id:date:date:subject:subject
	:from:from; s=default; t=1715004325; x=1716818726; bh=zDygFVeCED
	WixfwR6/QMY/Y5xnaULAAQynkr9a39hSQ=; b=U+O0unexrtCODliqhNhpzXMTQp
	BM3xP1Ah95DJLy+xHN6GFMdXnxaItPhVYCs0O8Frwf3pqI+5eFKehh+aEPNraFhu
	XcVSPT6nJ+lkgpdLZ+9aN/KtxFiqx3k+2FLgaYKmu8E7/cMTouqg79BUa9dUB2rb
	OaxjtOLi/WpnsOm7SdtrwJ73Th+NwFFsTpXnbVkWOgX0RCqpjIXwF6OBxfzSZyvh
	imqzyS6QirHKMXRmJPc8/VB249BtJkz6jlTufdqugZHOKNsVkw40JE28FxDcFfO9
	b8BHrEIic9dj/H6xVSQiWJhMinjXaveeIeN2+dqSVqH4Ci6oqudHrMiosLlQ==
X-Virus-Scanned: Debian amavisd-new at lightning-mcqueen.10100.to
Received: from lightning-mcqueen.10100.to ([127.0.0.1])
	by localhost (mail.10100.to [127.0.0.1]) (amavisd-new, port 10026)
	with LMTP id VC1CgW5kFxqB for <mlmmj@mlmmj.org>;
	Mon,  6 May 2024 16:05:25 +0200 (CEST)
Received: from yoko.localnet (unknown [87.121.148.191])
	(Authenticated sender: michele@10100.to)
	by lightning-mcqueen.10100.to (Postfix) with ESMTPSA id 7AB624042E
	for <mlmmj@mlmmj.org>; Mon,  6 May 2024 16:05:25 +0200 (CEST)
From: Michele <michele@10100.to>
To: mlmmj@mlmmj.org
Subject: Re: mlmmj.org website
Date: Mon, 06 May 2024 16:05:24 +0200
Message-ID: <3572455.G6LDNde9mc@yoko>
X-Face: *A{%->08frcej]'gm;C(iI>,gA^(wV.7lN.*QR(?p)z[Ea]ay5$%7}^<oy(T\PsC$9Oq5G O_Bcl'pq%J:)5:^FR"*0!{+J5@=tY(V?\C|"F
In-Reply-To: <mbxz2egpq4fpbu36jgds2rxwyevigebnsnb3hzhkqe2whasjo2@6fftwsjdo24f>
References: <mbxz2egpq4fpbu36jgds2rxwyevigebnsnb3hzhkqe2whasjo2@6fftwsjdo24f>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

If it's interesting, my job is also the development of websites...so I would like to make my skills available to the community

-- 
Michele


On 6 May 2024, at 15:34:32 CEST, Baptiste Daroussin <bapt@nours.eu> wrote:
> Hello everyone,
> 
> Just a few updates on what happened recently. Wolf granted me access to the
> mlmmj.org VM which allowed me to upload a new website: (Sorry I am not a web
> developer) if you want to improve it, please send a PR here:
> https://codeberg.org/mlmmj/mlmmj-website
> 
> While at it, I activated https.
> 
> Another change you can see in this email is that this mailing list is no longer
> altering the prefix of the emails, which should please some antispam.
> 
> Best regards,
> Bapt
> 
> 
> 






