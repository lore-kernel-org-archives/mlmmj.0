Return-Path: <mlmmj+bounces-3118-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89D7C43458
	for <mlmmj@archiver.kernel.org>; Fri, 10 Jul 2026 13:34:36 +0000 (UTC)
Received: from localhost ([127.0.0.1]:48426 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3118-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wiAfT-001qJw-05
	for mlmmj@archiver.kernel.org;
	Fri, 10 Jul 2026 12:49:23 +0000
Received: from mail.independend.ch ([88.99.26.173]:53054)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Jona.Mueller@independend.ch>)
	id 1wiAfL-001qJ7-3C
	for mlmmj@mlmmj.org;
	Fri, 10 Jul 2026 12:49:16 +0000
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: mail.independend.ch;
	dkim=pass (2048-bit key; secure) header.d=independend.ch header.i=@independend.ch header.a=rsa-sha256 header.s=dkim header.b=pAmnduyW;
	dkim-atps=neutral
Received: from mail.independend.ch (mail.independend.ch [127.0.0.1])
	by mail.independend.ch (Postfix) with ESMTP id 4gxX2d1Jzsz1gwnY
	for <mlmmj@mlmmj.org>; Fri, 10 Jul 2026 14:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=independend.ch;
	 h=in-reply-to:content-disposition:content-type:mime-version
	:references:message-id:subject:to:from:date; s=dkim; t=
	1783688328; x=1786280329; bh=wkPtt4hKxOjnrSWJwRaWZZpBD/f1Qpjpkcu
	dBmyrZrI=; b=pAmnduyWbR0Jzm15RynKdYz/H0syfjQoyWlswcBeHaTPE0i1lQa
	XQcwwp43rPEMEJyqWNXBWJsr7NWpReb3vsPVitRUHn0tZulo/eDiSm+WKLQbGbcF
	e0jOeWpnNwtQIAmlWOyHRT5CmH5P+YAhz8jopA6kd5gukv4zZtbmUFtaK4i3Z6KB
	oaCHDtjmYGkIGMNzdHKFM8AOg3shm34Z9eEbgUCfsAI3q00fGgmVcV56lcR4S7gw
	OEWfhxTG9HHtzJOVh4rqRFMaPGmyGSYD/+pMzPSI6VZlISExCSgs69BFAMLX68QY
	gm2s5RLhK50V8hevFgLGYqYkhJ4jg8r/4Qg==
X-Virus-Scanned: Debian amavis at mail.independend.ch
Received: from mail.independend.ch ([127.0.0.1])
 by mail.independend.ch (mail.independend.ch [127.0.0.1]) (amavis, port 10026)
 with ESMTP id suPpP8hvHq4S for <mlmmj@mlmmj.org>;
 Fri, 10 Jul 2026 14:58:48 +0200 (CEST)
Authentication-Results: OpenDMARC; arc=none smtp.remote-ip=79.208.208.8
Received: from radeon (p4fd0d008.dip0.t-ipconnect.de [79.208.208.8])
	by mail.independend.ch (Postfix) with ESMTPSA id 4gxX2c4tNLz1gwnR;
	Fri, 10 Jul 2026 14:58:48 +0200 (CEST)
Date: Fri, 10 Jul 2026 14:58:48 +0200
From: Jona =?iso-8859-1?Q?M=FCller?= <Jona.Mueller@independend.ch>
To: Borja Velasco <me@borjavelasco.me>
Cc: "mlmmj@mlmmj.org" <mlmmj@mlmmj.org>
Subject: Re: AI Policy of the project.
Message-ID: <alDsiG-iaAcRCBYm@radeon>
References: <guEw5pe0-g8jgP0dBUpUb2fmxQnLtwsiH_CKNw2AT9jaJJdtp6gYTYy-HU7AbZ6ZnVjBjn_ByS_008n8UDFWS6zLgjAZf9U-2WNEPegQD3M=@borjavelasco.me>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jzSPzT49+DsvplHK"
Content-Disposition: inline
In-Reply-To: <guEw5pe0-g8jgP0dBUpUb2fmxQnLtwsiH_CKNw2AT9jaJJdtp6gYTYy-HU7AbZ6ZnVjBjn_ByS_008n8UDFWS6zLgjAZf9U-2WNEPegQD3M=@borjavelasco.me>


--jzSPzT49+DsvplHK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Borja,

this project has had a bunch of AI-assisted commits, you can read about it =
in
the following codeberg issue:

	https://codeberg.org/mlmmj/mlmmj/issues/105

Hope this helps,

- jm

On Fri, Jul 10, 2026 at 12:19:38PM +0000, Borja Velasco wrote:
> Hello mlmmj users and developers.
>=20
> I'm writing you because I'm starting project that wants to create a
> community and software where the LLM usage is fully optional (now it's
> not anymore since almost every system is being developed with LLMs so
> you are using LLM indirectly).
>=20
> I think that Software is a kind of art and we want a site where you
> can really use human art in your computer. Of course, I understand
> that no every person with think like me. I want to clarify that I
> compare software as architecture, is art and is useful, there are real
> structures that are beautiful and you'll love to be in and use it.
> Software allows everyone to use this kind of useful art.
>=20
> That's because I am doing a real effort to create a database of
> software that uses LLMs or has been developed with LLMs and that
> will use for our operations. (avoiding software creating with
> LLMs in our main repositories and classifying the usage and
> policy in this software to add to our "AI allowed repo" that only
> wants to be really transparent with people to know how they're
> using AI.
>=20
> For that reason, before use your mail software as our mailing list
> software "by default" and add it to our future repositories I need
> to know if you are using LLMs to made new characteristics or for=20
> solving bugs or every use.
>=20
> Of course, I have no problems with your LLM usage if you use
> LLMs. I'm asking only for classification use.
>=20
> Greetings, Borja.
>=20
>=20

--jzSPzT49+DsvplHK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEM0qOw5hydnArKgH2jALoLo7pDpwFAmpQ7IQACgkQjALoLo7p
DpwG+BAApeYS0C0t211CyO1+Pim1JtkNaev9cA2ynozVCqIfiVCF21paH70fl5HC
o2HIOBrJT/pQnt60EWquUB/EoMO4yAd8TqiFL/MpcX7sTFLRuZfbFvt0N8FBkAMb
WT9i7pW2FhY3NOw0rWJ6woCQhHfela44JNEJGtCv0PyrOt+6F3nmYGKsT3Nw+7+e
FYHvd/lxzy84MM3zOSI+I239xVHQDNf16kN/FdxJ02bssp46EdUgM4rU+vD5T64S
JSwyEHvuWpRzoZC7gl/7zwwRPawon5pBmBWlNf9oxdQH7lXc8X5kVXSzHvBI83YN
VNSzW2uARBVqNnJm/hlBt/xegdH9n0poX4GVfnbsEz8P4oRWojfsfHdAawZ7KIw6
L3VEtkIbZtsNNWAtjkrCPJllbPT7NypICctSjYo+trGy7tReCHW76u0SjdoOlm8k
nIKaGqA5ArIdQpOpWtAZBFVrMsBtCR9H84iSlldhA4IeuQji1zXw9jSCmLfNbbPO
satYAgJrkMj2tkeyuLCiJtlfgm/dBo7wcfcvEUKUmE9GjfsHKSgWIktKcB3bdXNn
gTMXqV7Bj67W3n/rYGJHcJWzYyosbFFxerQM6l4tyoGSCqtVWByDVy46/wa7lFXv
ZDd3JcyalSXK4rITuDvyzTbqBqR6HCQKdcBM3yO//k192/fZJJY=
=xcAq
-----END PGP SIGNATURE-----

--jzSPzT49+DsvplHK--


