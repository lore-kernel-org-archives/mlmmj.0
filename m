Return-Path: <mlmmj+bounces-3052-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863E7C4345F
	for <mlmmj@archiver.kernel.org>; Thu,  2 May 2024 12:25:56 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3052-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s2VAO-001f5C-KA
	for mlmmj@archiver.kernel.org; Thu, 02 May 2024 12:04:00 +0000
Received: from lightning-mcqueen.10100.to ([157.90.166.63] helo=10100.to)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <michele@10100.to>)
	id 1s2VAH-001f4R-OK
	for mlmmj@mlmmj.org; Thu, 02 May 2024 12:03:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by lightning-mcqueen.10100.to (Postfix) with ESMTP id 67B9340532
	for <mlmmj@mlmmj.org>; Thu,  2 May 2024 14:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=10100.to; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:references:in-reply-to:message-id:date:date:subject:subject
	:from:from; s=default; t=1714652163; x=1716466564; bh=e75AnAuavN
	NfmjzfGNPSgEZKk7zdsk9kUJtg7DGyS3U=; b=Ehh6J/pi1MOVQYt2Y7o2aYNjys
	0PL4qSnW9h9kq/VMhE4eVHJUE5oDNWJWJHGZ1LLu4obtiSfnLRiRfLq7NivOth//
	OSQpZ3ABiM6k49X4nx8Re2niFZXFgxd1eazYhQOLx2CWUqs1QrxMtftKdwe6VJ2i
	8TlrI2AYN0/KkuuBfDyHFJatpe39snk+3ykk1E6AZHGa16HyHAW7pLVQyuggZ25I
	7heKxZxaidl2Ke9ZPCV2SyVk4KGZHhrySW0VAOJrSHDwBqi5SaQ4s3+eAf3PAng0
	OBwo44X6wnopoUHaGnc49XK8+T8KYdmcxqM+9BJW8adJ0Aa1VZgjPZ5uf7Pg==
X-Virus-Scanned: Debian amavisd-new at lightning-mcqueen.10100.to
Received: from lightning-mcqueen.10100.to ([127.0.0.1])
	by localhost (mail.10100.to [127.0.0.1]) (amavisd-new, port 10026)
	with LMTP id sMJL3pALlJxn for <mlmmj@mlmmj.org>;
	Thu,  2 May 2024 14:16:03 +0200 (CEST)
Received: from yoko.localnet (unknown [87.121.148.191])
	(Authenticated sender: michele@10100.to)
	by lightning-mcqueen.10100.to (Postfix) with ESMTPSA id 813453FC20
	for <mlmmj@mlmmj.org>; Thu,  2 May 2024 14:16:03 +0200 (CEST)
From: Michele <michele@10100.to>
To: mlmmj@mlmmj.org
Subject: Re: [mlmmj] Release 1.4.2
Date: Thu, 02 May 2024 14:16:02 +0200
Message-ID: <3805806.nq5txsKOOX@yoko>
X-Face: *A{%->08frcej]'gm;C(iI>,gA^(wV.7lN.*QR(?p)z[Ea]ay5$%7}^<oy(T\PsC$9Oq5G O_Bcl'pq%J:)5:^FR"*0!{+J5@=tY(V?\C|"F
In-Reply-To: <25lqa52awkp7tkcdjdzb4cslunuxd6ytoiidj5r6bma2sflogn@drcwbe2c4kwe>
References: <25lqa52awkp7tkcdjdzb4cslunuxd6ytoiidj5r6bma2sflogn@drcwbe2c4kwe>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,

sorry for my stupid question: where can I download the package? 

Thank you!
-- 
Michele


> Hello everyone,
> 
> A new bug fix release has been launched today:
> 
> - 1.4.2, this fixes an issue when parting lastestdigest
>   by mlmmj-maintd
> 
> Best regards,
> Bapt
> 
> 
> 






