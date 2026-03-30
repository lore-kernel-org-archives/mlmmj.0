Return-Path: <mlmmj+bounces-3102-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D738B1061B2A
	for <mlmmj@archiver.kernel.org>; Tue, 31 Mar 2026 00:22:47 +0000 (UTC)
Received: from localhost ([127.0.0.1]:35058 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3102-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w7MGP-00B7Zh-2L
	for mlmmj@archiver.kernel.org;
	Mon, 30 Mar 2026 23:43:21 +0000
Received: from mail.independend.ch ([88.99.26.173]:57606)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Jona.Mueller@independend.ch>)
	id 1w7MGI-00B7Z0-2G
	for mlmmj@mlmmj.org;
	Mon, 30 Mar 2026 23:43:14 +0000
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: mail.independend.ch;
	dkim=pass (2048-bit key; secure) header.d=independend.ch header.i=@independend.ch header.a=rsa-sha256 header.s=dkim header.b=KGHMY7Ir;
	dkim-atps=neutral
Received: from mail.independend.ch (mail.independend.ch [127.0.0.1])
	by mail.independend.ch (Postfix) with ESMTP id 4fl7KH2jFrz1c7D0
	for <mlmmj@mlmmj.org>; Tue, 31 Mar 2026 01:50:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=independend.ch;
	 h=x-mailer:to:in-reply-to:references:message-id:date:subject
	:mime-version:from:content-transfer-encoding:content-type; s=
	dkim; t=1774914610; x=1777506611; bh=2PiOzr6hlPHv3WIxEzsamxtlKeQ
	p2GtzRrVRmGgSSak=; b=KGHMY7IrT9aT1UvSsD5PBl5glxUpc8nol1PVdyq0u/1
	PiNHh4sSZSZUFd+PxmpTAR/+elLOngVRbeIZJl+8Xrou1h8tHmgBlHM6txk/4gpe
	o7ne4edlzqezX0uwoJmWMwlnsyg5BgB+PWZbO52O4VnNoU1TKLdirQajxWRj9hgj
	kzFWPY/eWI3nLPPYs3vbpHSJCwCAYnkUHVcEZJxSD8vkye8Sie7RCujH+8DOLl/0
	lT1TF6AG6hz6EbvhtXcmMCTpk1W5reulB7tJW7uwErFFxVaCbBo/dWorLoBB970n
	EfX7V9t5Twn4n5uaf5XLm4HO5q7WS2uNcmaKCUMJy3w==
X-Virus-Scanned: Debian amavis at mail.independend.ch
Received: from mail.independend.ch ([127.0.0.1])
 by mail.independend.ch (mail.independend.ch [127.0.0.1]) (amavis, port 10026)
 with ESMTP id jRRAZTWSqMim for <mlmmj@mlmmj.org>;
 Tue, 31 Mar 2026 01:50:10 +0200 (CEST)
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=217.250.0.25
Received: from smtpclient.apple (pd9fa0019.dip0.t-ipconnect.de [217.250.0.25])
	by mail.independend.ch (Postfix) with ESMTPSA id 4fl7KG5WShz1c7Cy;
	Tue, 31 Mar 2026 01:50:10 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?Q?Jona_M=C3=BCller?= <Jona.Mueller@independend.ch>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Call for testing: 2.0.0 is close to the doors
Date: Tue, 31 Mar 2026 01:50:00 +0200
Message-Id: <70C9A0F4-9F4E-4FD1-B3B6-F69248B3DE30@independend.ch>
References: <20260330-spiritual-evasive-hyrax-84cca9@lemur>
Cc: Ron Guerin <ron@vnetworx.net>, mlmmj@mlmmj.org
In-Reply-To: <20260330-spiritual-evasive-hyrax-84cca9@lemur>
To: Konstantin Ryabitsev <mricon@kernel.org>
X-Mailer: iPhone Mail (20G81)

I find public-inbox a bit overkill for smaller mailing lists. And I dont lik=
e how it does threading. It also looks a bit weird to =E2=80=9Cnon-technical=
=E2=80=9D people. We host quite a few of those for non-profits.=20
- jm

> On 30. Mar 2026, at 20:35, Konstantin Ryabitsev <mricon@kernel.org> wrote:=

>=20
> =EF=BB=BFOn Mon, Mar 30, 2026 at 04:14:05AM +0200, Jona M=C3=BCller wrote:=

>> Hello Ron,
>>=20
>> Chris recommendend your archiver to me and I really like the idea. The
>> pipermail-style output is a lot less clunky and much faster than the mode=
rn
>> replacements. Especially for threads.=20
>=20
> As another data point, public-inbox works well with mlmmj. E.g. see:
> https://lore.kernel.org/mlmmj/ :)
>=20
> Cheers,
> -K



