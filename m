Return-Path: <mlmmj+bounces-3098-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6DEFF494D
	for <mlmmj@archiver.kernel.org>; Mon, 30 Mar 2026 06:46:41 +0000 (UTC)
Received: from localhost ([127.0.0.1]:42748 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3098-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w75kZ-00B29j-1O
	for mlmmj@archiver.kernel.org;
	Mon, 30 Mar 2026 06:05:23 +0000
Received: from b.nours.eu ([54.38.177.57]:63170)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <bapt@nours.eu>)
	id 1w75kS-00B28u-1S
	for mlmmj@mlmmj.org;
	Mon, 30 Mar 2026 06:05:16 +0000
Received: from ehlo.thunderbird.net (unknown [IPv6:2a01:e0a:274:cc70:51c:b9c0:5e90:6598])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by b.nours.eu (Postfix) with ESMTPSA id A3C82EFE44;
	Mon, 30 Mar 2026 08:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1774851131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFGw7YGKB2B5V+f3clA4w2v9lNfWlmMmqWDL3WTcHa0=;
	b=IZ4aLRnrYaiT3HWV9tjjkZz2m7QzWQsd6/iMK+wdNCjgv9yOQI4oDz5Ji6T7LdkvJpv+m3
	z8mw+PhDxkGGkhyisuSuuaPIbPp1JBk1QXYnwLgnU//WtMA+g3G4tEj3b5vGp9LKEs4P2E
	mzBRAPKdTcZadxTFy+AtCfYeiJvQYD5G9ifmGiaDdSwrYs3XnoKmvtQgP9+PZn7PLejoMi
	YHd0zeGq4ui0ms3AOIiInXQN+X5G6ycHvTJ9AJ0PQZHplD0qe8iseLwijRxnrERDOoKbEL
	dzhAokurTenPzDPPeu3dSNsNLJ3yofyKgV9JrylOoi6x0hxpYfCVULfKhZXJYw==
Date: Mon, 30 Mar 2026 08:12:10 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org, Ron Guerin <ron@vnetworx.net>
Subject: Re: Call for testing: 2.0.0 is close to the doors
User-Agent: Thunderbird for Android
In-Reply-To: <679f813b-3bfa-4d06-b258-c8bb3c8a2cec@vnetworx.net>
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu> <679f813b-3bfa-4d06-b258-c8bb3c8a2cec@vnetworx.net>
Message-ID: <5E0F9265-BD0F-4FEF-B854-FA2763F44C92@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Le 30 mars 2026 03:51:07 GMT+02:00, Ron Guerin <ron@vnetworx=2Enet> a =C3=
=A9crit=C2=A0:
>On 3/29/26 4:26 AM, Baptiste Daroussin wrote:
>> Hello Everyone
>>=20
>> In 2022, I took over the maintenance of mlmmj which I am using for the =
FreeBSD mailing lists and more=2E
>
>mlmmj seems in a practical sense, to be "the last man standing", when it =
comes to mailing list managers=2E  I've recently come over, as a refugee fr=
om Mailman 2, in despair of Mailman 3=2E  The SDLU successor to the old SPA=
M-L list recently shut down as it was running on Mailman 2, and I suspect t=
here will be more of these this year as continuing to operate Python 2 thin=
gs becomes increasingly problematic=2E
>
>I offer my thanks to you for taking over mlmmj=2E
>
>> I am close to have delivered all the features I intended to add as such=
 I would like to stamp it with naming the next release: 2=2E0=2E0!
>
>Apologies if this is the wrong place to make a request=2E
>
>(And I realize it's too late for 2=2E0=2E0=2E)
>
>I would like to have a hook available, so that when mlmmj places a messag=
e in the archive, it allows me to run some other program, specifically in m=
y case, a web archiver script I've developed to produce web pages substanti=
ally similar to those produced by Pipermail from GNU Mailman 2=2E  I would =
offer a patch if I were capable of producing one=2E Having not written a li=
ne of C in 35 years, I haven't been able to do so=2E
>
>Vive la mlmmj!
>
>- Ron
>
>
thanks, I can have a look after 2=2E0=2E0 to add this the best would proba=
bly to open an issue on codeberg so I do not forget=2E

also note that I wrote my own archiver which is is pipermail like and very=
 fast and lightweight it is non portable right now (it uses freebsd's capsi=
cum for sandboxing) but I can make it portable if there is interest=2E

<https://lists=2Efreebsd=2Eorg/archives/dev-commits-src-all/> for example

bapt


