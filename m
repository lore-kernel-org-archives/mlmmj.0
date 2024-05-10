Return-Path: <mlmmj+bounces-3069-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B027EC25B10
	for <mlmmj@archiver.kernel.org>; Fri, 10 May 2024 13:08:18 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3069-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s5P6M-0050wb-18
	for mlmmj@archiver.kernel.org; Fri, 10 May 2024 12:11:50 +0000
Received: from si3t.ch ([82.65.187.107])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <prx@si3t.ch>)
	id 1s5P6F-0050ub-B5
	for mlmmj@mlmmj.org; Fri, 10 May 2024 12:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=pubkey; bh=b9N1VsBD4NJef
	d4EcrydB/SaI88x+oKlU4sAZ7SviR8=; h=subject:to:from:date; d=si3t.ch; b=
	FzWp2wEnOSOR4++588tKuGzw48sbOw4bqtMpoFveOKqEmJ7o6cKAhEYpAwyyM1kGR1IqLq
	Bhxq+dToAZP8vJUOpKcCojC9GMzEoAKBIhX0E53Oy1jrAWQHfIbuFq3ng5akvCuAystLdH
	orpDafi2WgRUgo2jATBE7mnuJrRgr/o=
Received: from localhost (<unknown> [192.168.1.254])
	by si3t.ch (OpenSMTPD) with ESMTPSA id 8ae55b77 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <mlmmj@mlmmj.org>;
	Fri, 10 May 2024 14:24:04 +0200 (CEST)
Date: Fri, 10 May 2024 14:24:00 +0200
From: prx <prx@si3t.ch>
To: mlmmj@mlmmj.org
Subject: how to know the last message number?
Message-ID: <Zj4R4IDMYvIhbTT0@terminus.my.domain>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-GPG-Key-Server: https://si3t.ch/pub/prx.asc.txt
X-GPG-Key-FingerPrint: 6D04 B642 12D9 643D 10C6  72B5 37DE 4F1C CA05 53C8

Hello,

Do you know if there is a way to know how many messages a list has?
My intention is to white a script then to retriev all previous messages, from latest to 0.

Regards.

prx


