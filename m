Return-Path: <mlmmj+bounces-3078-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB4CCCD187
	for <mlmmj@archiver.kernel.org>; Mon, 13 Oct 2025 01:30:27 +0000 (UTC)
Received: from localhost ([127.0.0.1]:52114 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3078-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1v86zT-00A3SY-0k
	for mlmmj@archiver.kernel.org;
	Mon, 13 Oct 2025 01:04:43 +0000
Received: from mail.vnetworx.net ([86.48.29.242]:46175)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ron@vnetworx.net>)
	id 1v86zM-00A3Rs-0N
	for mlmmj@mlmmj.org;
	Mon, 13 Oct 2025 01:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vnetworx.net; s=mail;
	t=1760317632; bh=T9NdQNLdL4QPxlcMTW6ri9hh9K/fCYSOGFO9U/9QYmY=;
	h=Date:To:From:Subject:From;
	b=lqHrxTj/WG+i7FliMxwoUMszeXbXnzHizLsBx8J+LxJIrWPEYKa5IMxFTN0L4Pqw1
	 SiYwqBViVKekM00Htodj5AgANNUpq1Kgso7c9bagitfRRZkc6ZTSDnAdEycpc3ylty
	 e/lYifYBFNeyrYTMNppXInjjpnxjbTYGM5M+VkwQ=
Received: from [192.168.1.151] (syn-067-242-155-037.res.spectrum.com [67.242.155.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	(Authenticated sender: ron@vnetworx.net)
	by mail.vnetworx.net (Postfix) with ESMTPSA id 8E2AB663CD6
	for <mlmmj@mlmmj.org>; Sun, 12 Oct 2025 21:07:12 -0400 (EDT)
Content-Type: multipart/alternative;
 boundary="------------V4OwmSEkG7537plJ8W3SZ06a"
Message-ID: <5c7451cc-07d2-4d64-a1db-fc998241d282@vnetworx.net>
Date: Sun, 12 Oct 2025 21:07:11 -0400
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mlmmj@mlmmj.org
From: Ron Guerin <ron@vnetworx.net>
Content-Language: en-US
Subject: control/amime-footer-base64
X-AV-Checked: ClamAV using ClamSMTP by mail.vnetworx.net

This is a multi-part message in MIME format.
--------------V4OwmSEkG7537plJ8W3SZ06a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Apologies if this is a stupid question...

But what am I supposed to put in

control/amime-footer-base64

When using the contrib/mlmmj-amime-receive script?  Is it plaintext, or should I be Base-64 encoding the contents?

- Ron

--------------V4OwmSEkG7537plJ8W3SZ06a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Apologies if this is a stupid question...</p>
    <p>But what am I supposed to put in <br>
    </p>
    <pre>control/amime-footer-base64

When using the contrib/mlmmj-amime-receive script?  Is it plaintext, or should I be Base-64 encoding the contents?

- Ron
</pre>
  </body>
</html>

--------------V4OwmSEkG7537plJ8W3SZ06a--


