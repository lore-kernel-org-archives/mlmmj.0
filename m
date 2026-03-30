Return-Path: <mlmmj+bounces-3097-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C740BFF492D
	for <mlmmj@archiver.kernel.org>; Mon, 30 Mar 2026 02:21:53 +0000 (UTC)
Received: from localhost ([127.0.0.1]:58164 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3097-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w722K-00B18Y-0G
	for mlmmj@archiver.kernel.org;
	Mon, 30 Mar 2026 02:07:28 +0000
Received: from mail.independend.ch ([88.99.26.173]:47434)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Jona.Mueller@independend.ch>)
	id 1w722D-00B17l-0U
	for mlmmj@mlmmj.org;
	Mon, 30 Mar 2026 02:07:21 +0000
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: mail.independend.ch;
	dkim=pass (2048-bit key; secure) header.d=independend.ch header.i=@independend.ch header.a=rsa-sha256 header.s=dkim header.b=KKvKyJmM;
	dkim-atps=neutral
Received: from mail.independend.ch (mail.independend.ch [127.0.0.1])
	by mail.independend.ch (Postfix) with ESMTP id 4fkZZ057Ktz1c6Gm
	for <mlmmj@mlmmj.org>; Mon, 30 Mar 2026 04:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=independend.ch;
	 h=x-mailer:to:references:message-id:date:in-reply-to:from
	:subject:mime-version:content-transfer-encoding:content-type; s=
	dkim; t=1774836856; x=1777428857; bh=kLNbFDJ/GVGCfdGogJWwcGM2tUL
	c2gjOURzGdU42ZCY=; b=KKvKyJmMwwtGI5bUGqq4BJXrQpo7BnVMnK3FyM3xfLe
	+umNTRyk1vA5Ny7+ueLiEgKQkGO33oZ6hofx+Zk1e88qUkPHw1YMJXbYuPZjpTbO
	DhN1m3nA4kpuxeMV7So92VbZb2Q+zCWxHRyH0RNrejuw7fooLJ9XK6Dtp6wTANHA
	nGZ+9YGtbZ/gqescVscdUu+JgNqwi96g0iJqpZQEyy9UvrVirUrwAt8RcWE3R09Q
	9ikwtWEfFZON9BFVT6kY+rUod2AqhXVtF9FXYYqoXNJ3XygC34HTBi6oQhMCVhja
	MuhiG4UekoLmKqyJWtjGkDWQYokSvhxeYUnzURZnpYQ==
X-Virus-Scanned: Debian amavis at mail.independend.ch
Received: from mail.independend.ch ([127.0.0.1])
 by mail.independend.ch (mail.independend.ch [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3lEOQmN_3kU4 for <mlmmj@mlmmj.org>;
 Mon, 30 Mar 2026 04:14:16 +0200 (CEST)
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=217.250.0.25
Received: from smtpclient.apple (pd9fa0019.dip0.t-ipconnect.de [217.250.0.25])
	by mail.independend.ch (Postfix) with ESMTPSA id 4fkZZ01zmWz1c6Gf;
	Mon, 30 Mar 2026 04:14:16 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Call for testing: 2.0.0 is close to the doors
From: =?utf-8?Q?Jona_M=C3=BCller?= <Jona.Mueller@independend.ch>
In-Reply-To: <679f813b-3bfa-4d06-b258-c8bb3c8a2cec@vnetworx.net>
Cc: mlmmj@mlmmj.org
Date: Mon, 30 Mar 2026 04:14:05 +0200
Message-Id: <4FF403A2-19DE-43E8-8114-F1A976442CC0@independend.ch>
References: <679f813b-3bfa-4d06-b258-c8bb3c8a2cec@vnetworx.net>
To: Ron Guerin <ron@vnetworx.net>
X-Mailer: iPhone Mail (20G81)

Hello Ron,

Chris recommendend your archiver to me and I really like the idea. The piper=
mail-style output is a lot less clunky and much faster than the modern repla=
cements. Especially for threads.=20

This should=E2=80=99t be too hard to implement, maybe you=E2=80=99ll have to=
 answer some questions when I try to set up the archiver first.=20

Maybe I cook something up on my fork in the near future.=20

Cheers,

Jona M=C3=BCller

> On 30. Mar 2026, at 03:51, Ron Guerin <ron@vnetworx.net> wrote:
> =EF=BB=BFOn 3/29/26 4:26 AM, Baptiste Daroussin wrote:
>> Hello Everyone
>> In 2022, I took over the maintenance of mlmmj which I am using for the Fre=
eBSD mailing lists and more.
>=20
> mlmmj seems in a practical sense, to be "the last man standing", when it c=
omes to mailing list managers.  I've recently come over, as a refugee from M=
ailman 2, in despair of Mailman 3.  The SDLU successor to the old SPAM-L lis=
t recently shut down as it was running on Mailman 2, and I suspect there wil=
l be more of these this year as continuing to operate Python 2 things become=
s increasingly problematic.
>=20
> I offer my thanks to you for taking over mlmmj.
>=20
>> I am close to have delivered all the features I intended to add as such I=
 would like to stamp it with naming the next release: 2.0.0!
>=20
> Apologies if this is the wrong place to make a request.
>=20
> (And I realize it's too late for 2.0.0.)
>=20
> I would like to have a hook available, so that when mlmmj places a message=
 in the archive, it allows me to run some other program, specifically in my c=
ase, a web archiver script I've developed to produce web pages substantially=
 similar to those produced by Pipermail from GNU Mailman 2.  I would offer a=
 patch if I were capable of producing one. Having not written a line of C in=
 35 years, I haven't been able to do so.
>=20
> Vive la mlmmj!
>=20
> - Ron



