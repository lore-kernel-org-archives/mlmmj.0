Return-Path: <mlmmj+bounces-3091-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B203F3D5FC
	for <mlmmj@archiver.kernel.org>; Sun, 29 Mar 2026 09:11:10 +0000 (UTC)
Received: from localhost ([127.0.0.1]:38686 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3091-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w6lMd-00Awst-2h
	for mlmmj@archiver.kernel.org;
	Sun, 29 Mar 2026 08:19:19 +0000
Received: from b.nours.eu ([54.38.177.57]:40959)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <bapt@nours.eu>)
	id 1w6lMW-00AwsA-2t
	for mlmmj@mlmmj.org;
	Sun, 29 Mar 2026 08:19:12 +0000
Received: from mail.nours.eu (b.nours.eu [54.38.177.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by b.nours.eu (Postfix) with ESMTPSA id AD9A4EF14D
	for <mlmmj@mlmmj.org>; Sun, 29 Mar 2026 10:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1774772766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8AXlW+evRwoOMPATaumWH06EUNWaKODzagXLngBJdK8=;
	b=PkdHnksWRxADvCDNVliVb/faWTxLIQ+sZtaxlhNhkqq406CYy7EYLbRwG0kxq2szHfJKor
	XLH/9eLokAf0IagaW92uYvhLUTxycJkKh+V7n9/4AHPTZnqVzBZbbvWkp2Ou0HNujHLNPI
	7xkco08u2czdcIXvh0pjV6RjQV4q4a/Xdeps78plRMd5UgBAvDkPvh6s4k1M/+W4q41aBg
	SMtRLAmSON9toyihU4vjIG7ZTypTgOGo3omgycjirr0zrUTvL+yjvyf4aK2eRE9I5lbP+N
	VwIC8+wvfEr8/w9UuqOtmoL5sGKlBrj+Pcj+TIPPX2WF68XHSauoW4hrGznAhw==
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Date: Sun, 29 Mar 2026 08:26:06 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Baptiste Daroussin" <bapt@nours.eu>
Message-ID: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
TLS-Required: No
Subject: Call for testing: 2.0.0 is close to the doors
To: mlmmj@mlmmj.org

Hello Everyone

In 2022, I took over the maintenance of mlmmj which I am using for the Fr=
eeBSD mailing lists and more.

I am close to have delivered all the features I intended to add as such I=
 would like to stamp it with naming the next release: 2.0.0!

Here is what happened since 1.3.0

- Code cleanup and modernization
- Addition of a test suite which lead to plenty of fixes
- Fix many of RFC compliances issues
- Improved bounce email by adding the messageid to it
- Finish the old non finished "subrelease" feature
- Add autoscribe feature

The new things from 1.8.0 to 2.0.0 are:
- new build system
- by default respect RFC 2919/2369 List-* and Precedence headers generate=
d by default (can be disabled via nolistheaders)
- Subscription follow reply-to for confirmations
- X-Forwarded-To (Gmail forwarding) (xforwardedto tunables) (incompatible=
 with VERP)
- X-Signed-Recipient (DARA/ARC) (data tunable). (Incompatible with VERP)
- A bit of hardening
- some portability fixes
- archive partionning option (archive/YYYY/MM) with automatic migration (=
that's per request of Gentoo people)

Please test and send feedbacks!

note: autotools are not needed anymore but the build workflow remain the =
same:

./configure
make
make check

Best regards,
Bapt


