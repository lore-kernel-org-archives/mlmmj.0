Return-Path: <mlmmj+bounces-3087-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91881109C036
	for <mlmmj@archiver.kernel.org>; Wed, 25 Mar 2026 16:18:30 +0000 (UTC)
Received: from localhost ([127.0.0.1]:46946 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3087-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w5Qbv-00AaSN-23
	for mlmmj@archiver.kernel.org;
	Wed, 25 Mar 2026 15:57:35 +0000
Received: from mail.independend.ch ([88.99.26.173]:58594)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Jona.Mueller@independend.ch>)
	id 1w5Qbo-00AaRa-2F
	for mlmmj@mlmmj.org;
	Wed, 25 Mar 2026 15:57:28 +0000
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: mail.independend.ch;
	dkim=pass (2048-bit key; secure) header.d=independend.ch header.i=@independend.ch header.a=rsa-sha256 header.s=dkim header.b=B69YwzMa;
	dkim-atps=neutral
Received: from mail.independend.ch (mail.independend.ch [127.0.0.1])
	by mail.independend.ch (Postfix) with ESMTP id 4fgsD146cZz1c1xP
	for <mlmmj@mlmmj.org>; Wed, 25 Mar 2026 17:04:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=independend.ch;
	 h=content-disposition:content-type:mime-version:message-id
	:subject:to:from:date; s=dkim; t=1774454656; x=1777046657; bh=HN
	to4RqBYJZae6kRJVuPeCiuSOaZKF++16BENC6kEfQ=; b=B69YwzMaxoB2rQDl05
	dUdI7fu2InAPXkVIqVv2WwAqUC9u3xzktBWUNdTJFUtCEk4TC/o2lpwnC7WiQ1zQ
	KysRym5RxVvceNVCOzgNDcN2kBTBZWPNFq9uT0gwEu8fXgsGCyQEO067F4IfooAC
	0OebSqAbj8bDRkjcLdUbcsuSr1bHjdbSGkrjGufMARFvbPQAPf3KS7Tg5ZkXBtrt
	sK0q6Xpc5wgsP9eMcQkvtbOoAOilu2AK70Oun9vkgTAEmy5cwkLwr4dFG2z3t1BL
	TX0VhPixKZ3weHzFPaTL1olLruJmU8zEpVGIwBbNInPs8aJh/hm01ZwbFHw5+ko2
	PIWQ==
X-Virus-Scanned: Debian amavis at mail.independend.ch
Received: from mail.independend.ch ([127.0.0.1])
 by mail.independend.ch (mail.independend.ch [127.0.0.1]) (amavis, port 10026)
 with ESMTP id QSaL45gei5Wr for <mlmmj@mlmmj.org>;
 Wed, 25 Mar 2026 17:04:16 +0100 (CET)
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=217.250.0.25
Received: from MacbookPro (pd9fa0019.dip0.t-ipconnect.de [217.250.0.25])
	by mail.independend.ch (Postfix) with ESMTPSA id 4fgsD03lbyz1c20J
	for <mlmmj@mlmmj.org>; Wed, 25 Mar 2026 17:04:16 +0100 (CET)
Date: Wed, 25 Mar 2026 17:04:16 +0100
From: Jona =?iso-8859-1?Q?M=FCller?= <Jona.Mueller@independend.ch>
To: mlmmj@mlmmj.org
Subject: Backporting mlmmj for oldstable Debian 12 bookworm on amd64
Message-ID: <acQHgPUGd6R5cQvH@MacbookPro>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/SYjAkb3XvKH9sin"
Content-Disposition: inline


--/SYjAkb3XvKH9sin
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello everyone,=20

I am happy to see that there has been quite a bit of development on mlmmj
recently after the project was dormant for a couple of years.

As mlmmj is a mailing list manager it obviously mostly runs on mailservers.=
 Mail
servers usually have quite a long service life because of the large software
stack and a lot of people are still running Debian 11 and Debian 12. But the
mlmmj version in Debian bookworm is about 10 years old at this point, altho=
ugh
Debian 13 only came out about seven months ago.

I've talked to the package maintainer - Chris Knadle - and with his instruc=
tions
built a deb package for Debian 12 on amd64 with the newest version packaged=
 for
Debian (1.6.0).=20

If anyone wants to test it, I've made it available on:

	https://ind.me/debian/bookworm/mlmmj/mlmmj_1.6.0/

Known issue when upgrading is that $confaddr$ stops resolving and needs to =
be
updated to the new $confirmaddr$ in text/confirm for existing mailing lists=
=2E=20

Looking into maybe backporting it as I know quite a few people that would
benefit from this. If anyone needs other architectures, I can probably arra=
nge
that. Feel free to comment.

Cheers,=20

Jona M=FCller
--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Independend GmbH

Jona.Mueller@independend.ch
+49 6832 265556

http://ind.me


--/SYjAkb3XvKH9sin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEM0qOw5hydnArKgH2jALoLo7pDpwFAmnEB3wACgkQjALoLo7p
Dpx7jBAApHoK/eYxFvX5XxYb3K8isb2PwE5bXEUcd67GCpypzucvKm/1cvr79SrB
3/olpZbSR6pBED5TYjNxa1KmUQ0e2agEsmdYj4Z3PfAs3+WoRGIBckBv5PW+H2Q6
EALq/FApE1QVWO/Gr4tgYqFhMNAdnRbbQ+BVeYpxRoOAP/ZobCoGjZqZnc+HdOEz
XLK9RgHoB5vXGb3K/gPoJ7dNkQbLQ5tMOcQ6p9U/yLbav4XWzjiVn0duI8a0ho+y
26TPVGq39Gln4e1rkiFFJjjN9A6/rBGyLSgZPR5uPBOHFUqaVtZtrB3iOByfq5v5
0PTTEP67QNyrgO23Qlcd0JkMmJDDslM0j/aobCGDr/Km+bDEFGRZ4CsE6oDOZbxg
RiXTobPX7BP5pbuDY84pOiQu/dmAXWNd6WQSU19Fsaoyy/xi2VbNo0AGgBuAu4Sz
uycbDA3oQtAow5r8/73UWD4G8bh1IOD/QJR7cn+ErPoAH4DOjoMJJuWFM1nKTWCN
LNiKoWrlKpfv99QBlx2fALgyhO7TVLbHMh9ocGcP0t/fFrz2+1ceVIxf9/xjJDC/
YHaDJ2+5NuCwKh28xbz0Vil6Sz4+P1F2bBtRRNXUZybKGEFJaWXRH2fWpsILqkUK
qGuRPe9UIuvRq1y+THgEhzJu8pwD8suYsisJImi5oIfkdwHSodQ=
=T36J
-----END PGP SIGNATURE-----

--/SYjAkb3XvKH9sin--


