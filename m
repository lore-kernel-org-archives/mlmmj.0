Return-Path: <mlmmj+bounces-3086-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F43109C02F
	for <mlmmj@archiver.kernel.org>; Wed, 25 Mar 2026 16:03:14 +0000 (UTC)
Received: from localhost ([127.0.0.1]:44956 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3086-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w5Q8Z-00AaFf-0k
	for mlmmj@archiver.kernel.org;
	Wed, 25 Mar 2026 15:27:15 +0000
Received: from mail.independend.ch ([88.99.26.173]:46196)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Jona.Mueller@independend.ch>)
	id 1w5Q8S-00AaEw-0P
	for mlmmj@mlmmj.org;
	Wed, 25 Mar 2026 15:27:08 +0000
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: mail.independend.ch;
	dkim=pass (2048-bit key; secure) header.d=independend.ch header.i=@independend.ch header.a=rsa-sha256 header.s=dkim header.b=Kqdvvjo6;
	dkim-atps=neutral
Received: from mail.independend.ch (mail.independend.ch [127.0.0.1])
	by mail.independend.ch (Postfix) with ESMTP id 4fgrY06nqNz1c1wC
	for <mlmmj@mlmmj.org>; Wed, 25 Mar 2026 16:33:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=independend.ch;
	 h=in-reply-to:content-disposition:content-type:mime-version
	:references:message-id:subject:to:from:date; s=dkim; t=
	1774452836; x=1777044837; bh=6cVJsSvGvd9US1kegOtudsJzUFKaO71SZHl
	i9Q5mw6c=; b=Kqdvvjo6lTh0gUe8kvgvFGRCY69gnlZzpokPjnNLw7nJTK38TQd
	XkE80qmq0nb0Zq7aSvHCRuDuvEwIbECRd6rIRolJOG//D5dIUVsWL0+pZxjGam6q
	HlCIGv6PH/FHKIycVArbgrM1oZhopPmjGBtMVlCw17rAgtMDm3jdh9A6o5y12nkN
	MIiRQ3hvumUcH3Rqhz6DFJn0s+JRFb5xgbngN0ZC5wZdHbGWoGOBBLXB0LbTPS+/
	qj/KsbMBE+QdQw016+fYAP/y91Vaw6RrGaBZ9qMRv2BUWF0NC61bHzcDgzw6LBFj
	lP3GIQyM+hrq9Lhju6CQqeEF2z5rqFJA0+Q==
X-Virus-Scanned: Debian amavis at mail.independend.ch
Received: from mail.independend.ch ([127.0.0.1])
 by mail.independend.ch (mail.independend.ch [127.0.0.1]) (amavis, port 10026)
 with ESMTP id UOvYh_YJ7Az3 for <mlmmj@mlmmj.org>;
 Wed, 25 Mar 2026 16:33:56 +0100 (CET)
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=217.250.0.25
Received: from MacbookPro (pd9fa0019.dip0.t-ipconnect.de [217.250.0.25])
	by mail.independend.ch (Postfix) with ESMTPSA id 4fgrY025X6z1c1xK
	for <mlmmj@mlmmj.org>; Wed, 25 Mar 2026 16:33:56 +0100 (CET)
Date: Wed, 25 Mar 2026 16:33:55 +0100
From: Jona =?iso-8859-1?Q?M=FCller?= <Jona.Mueller@independend.ch>
To: mlmmj@mlmmj.org
Subject: Website version still shows 1.7.1
Message-ID: <acQAY8yieItFwOzH@MacbookPro>
References: <1774451441-2522344-mlmmj-6d0b5389@mlmmj.org>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sDa4GKc29jtmCeFL"
Content-Disposition: inline
In-Reply-To: <1774451441-2522344-mlmmj-6d0b5389@mlmmj.org>


--sDa4GKc29jtmCeFL
Content-Type: multipart/mixed; boundary="MvV0/lnSgd0zqY89"
Content-Disposition: inline


--MvV0/lnSgd0zqY89
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I've noticed the website is not yet updated and still shows version 1.7.1, =
can
someone update this to 1.8.0? Thank you.=20

Cheers,

Jona M=FCller
--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Independend GmbH

Jona.Mueller@independend.ch
+49 6832 265556

http://ind.me


--MvV0/lnSgd0zqY89
Content-Type: application/pgp-keys
Content-Description: PGP Key 0x8C02E82E8EE90E9C.
Content-Disposition: attachment

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
P/wIeZ7HS2Ly+vBW
=wwUG
-----END PGP PUBLIC KEY BLOCK-----

--MvV0/lnSgd0zqY89--

--sDa4GKc29jtmCeFL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEM0qOw5hydnArKgH2jALoLo7pDpwFAmnEAGAACgkQjALoLo7p
DpxREBAAi0wgy2hT1LriGo5Q1d/8srjH9UyVta9o38/XIerN2lqVS9uDzF6OOlH/
bGQ6oGaN1jNBV41OUHrry0Z5DUxODRGfJl2zoTw7lwfCLEAM/fW1+x25VGcraCJ7
jZvUU1rPuLJ+BBVkzDEvqFt716tgF1xm/TlBafX1MYk4DmWbLEXyW13fx1/t7fB4
pJsGYND6QmB4FPf6Kh5FjS34NSaLU4La88D/aW70EW7qrCF7/AB0yi1f8ZJoEH/9
UJFvVRqjJ2FvNdEbEYhr3YIUlKuFnNjAnOWC6L2LuCdSpbpU7PJ+68mYMCOBoWUM
VEJrpd9X84SMF1VL35tYhvHWCXUdpzenUsX1r6n6JojgwcERG4E2MEWwRSC9YH/U
1ZuRZeSG+4kbZMos+zpbJWIlKaLYgs7BHvpp4nh8Qbj4eYzuEV1hqApx9/xJisgk
QJhLpktWW73RUqy+GpdxvwVGlMTfulADqFJBefcd2OKIsMHUol5ojNVgjh8KKFXO
ld+H3YB9AE2a13FqEXQjVynUrZVoiS8ywFzLx3VfAyA6ndp8grvg3fndji+df/lL
+he1vOebMgbjBw8wVGP4O2jjlnWy0zpWD+rfrBp9ocjO0XrfxBlPjJrzw5fCzjMu
hQLK6CA8YP6IptMcDGaydVd9cXHKATAoKWOiD/IXo8dX7kwowU8=
=TtIx
-----END PGP SIGNATURE-----

--sDa4GKc29jtmCeFL--


