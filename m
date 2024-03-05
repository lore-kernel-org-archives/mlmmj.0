Return-Path: <mlmmj+bounces-3039-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2CAC54798
	for <mlmmj@archiver.kernel.org>; Tue,  5 Mar 2024 11:22:19 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3039-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rhSaC-003J6J-VH
	for mlmmj@archiver.kernel.org; Tue, 05 Mar 2024 11:03:41 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1rhSa6-003J5X-54
	for mlmmj@mlmmj.org; Tue, 05 Mar 2024 11:03:34 +0000
Received: from mail.nours.eu (nours.eu [IPv6:2001:41d0:8:3a4d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aniel.nours.eu (Postfix) with ESMTPSA id 7A0421262B9
	for <mlmmj@mlmmj.org>; Tue,  5 Mar 2024 12:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1709637264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74SzZzRhMPvHFxHBNnntn2KhqsKFx1ZBDcfOOWBB61s=;
	b=jOWDD3ci2W8E/0WtJeDpIdvxHy3QU+st4KMusdslEJaGoqYWoq1e1Y3BDd+9ANsEV/b028
	itLJ72HXeBgZVOA6Q7zqza24l0l25yg0Xaw5CTpIo8n9IE8EOQn4Jkz8ZwaD7Pl4/CvF0m
	cyehjqQmzXXfHSBuGiwSTPaYwiK4hi9icjfvGEfXvkrdq/qUQn76sUKoJEgo71QU7XdHuV
	aUSS/hqCVOAHBUrbYPelXmOplVz6Z3sTNwRTW8RXj3rI2Fc9OSGKKwVPkvYGKkyeckuS7E
	vBHGIBLcPgkrhWBEphnq+K9iydRyZJj/gl8K7gHpJfRHMoWMmS8ARfg+xyamNA==
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Date: Tue, 05 Mar 2024 11:14:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Baptiste Daroussin" <bapt@nours.eu>
Message-ID: <83203f9e60f7e8e214ae14b9eff9a2abec86d954@nours.eu>
TLS-Required: No
Subject: Re: [mlmmj] What do you do with Gmail accounts?
To: mlmmj@mlmmj.org
In-Reply-To: <835f7d93-96e1-4101-839c-6ce02acd0d2b@deganius.de>
References: <835f7d93-96e1-4101-839c-6ce02acd0d2b@deganius.de>

5 mars 2024 =C3=A0 11:35 "Christof Thalhofer" <chrisml@deganius.de> a =C3=
=A9crit:



>=20
>=20Hello,
>=20
>=20I migrated a couple of Mls from Mailman2 to Mlmmj (1.3).
>=20
>=20With MM2 we did Reply-To-Munging (replaced the original Reply-To head=
er with 'Reply-To: list@listserver'.
>=20
>=20Mlmmj does not allow this. I can add 'Reply-To: address@list' but I c=
annot delete 'Reply-To: from@home' with delheaders because then Mlmmj als=
o removes the 'From:' header ... why ???
>=20
>=20So if I set 'Reply-To: list@listserver' in customheaders there are of=
ten two 'Reply-To:' in the headers of an outgoing mail:
>=20
>=20'Reply-To: from@home' (set by the author of the mail)
>=20
>=20'Reply-To: list@listserver' (set by Mlmmj)
>=20
>=20which causes Gmail to bounce that mail.
>=20
>=20Now we have the problem with a mailinglist that Gmail does not have a=
 'reply-to-list'-button.
>=20
>=20It has the options 'reply' and 'reply to all'.
>=20
>=20'reply' answers to the address in 'From:' and the mail doesn't go to =
the list.
>=20
>=20'reply to all' answers to the addresses in 'From:' and 'List-Post:' c=
reating dupes at the person whose mail was answered.
>=20
>=20Reply-To-munging seems to be the only way to give Gmail-users the pos=
sibility to answer direct to the list. But is is impossible to be done in=
 Mlmmj.
>=20
>=20What to do?
>=20
>=20Alles Gute
>=20
>=20Christof Thalhofer
>=20
>=20-- Dies ist keine Signatur


Hello,

Reply to munge is an interesting feature to add, can you create a feature=
 request on codeberg so I don't forget when I will start working on 1.5?=
=20

https://codeberg.org/mlmmj/mlmmj

Best=20regards,
Bapt


