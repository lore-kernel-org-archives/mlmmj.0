Return-Path: <mlmmj+bounces-3009-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C2DC072A2
	for <mlmmj@archiver.kernel.org>; Sun, 19 Nov 2023 13:59:43 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3009-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r4hnX-00BD98-Da
	for mlmmj@archiver.kernel.org; Sun, 19 Nov 2023 13:25:15 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1r4hnQ-00BD8M-PS
	for mlmmj@mlmmj.org; Sun, 19 Nov 2023 13:25:08 +0000
Received: from [IPv6:::1] (unknown [IPv6:2a04:cec0:c014:2f12:0:33:e37d:ca01])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aniel.nours.eu (Postfix) with ESMTPSA id 1AC31140611;
	Sun, 19 Nov 2023 14:33:32 +0100 (CET)
Date: Sun, 19 Nov 2023 14:33:33 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: =?ISO-8859-1?Q?Rapha=EBl_Jadot?= <rj@hodo.fr>,
 "mlmmj@mlmmj.org" <mlmmj@mlmmj.org>
Subject: Re: [mlmmj] Release 1.4.0 rc2
User-Agent: K-9 Mail for Android
In-Reply-To: <251101700393649@mail.yandex.com>
References: <ttakhkfcehtadqyxzkxflp45abpyo4xoxkfaruqr7p5jb62mw6@2lbe52374cda> <251101700393649@mail.yandex.com>
Message-ID: <2FCB34BE-4D27-43BA-84A2-147BA7C1CB28@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----OYXNWNA1FZDURE3PKAPS8IRXI1ZBFQ
Content-Transfer-Encoding: 7bit

------OYXNWNA1FZDURE3PKAPS8IRXI1ZBFQ
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 19 novembre 2023 12:49:21 GMT+01:00, "Rapha=C3=ABl Jadot" <rj@hodo=2Efr>=
 a =C3=A9crit=C2=A0:
>Hi there,
>
>I wanted to let you know that I'm working on a new Yunohost package for m=
lmmj=2E I'm doing this because Mailman 3 (which is provide in the list of a=
pplications) seems a bit too heavy for small servers, and I really love mlm=
mj=2E
>
>This is my first time making a package for Yunohost, so it's a bit of a l=
earning process=2E I might need some help or advice as I go along=2E
>
>I'm also thinking about adding a web interface for looking at email archi=
ves=2E Do you have any suggestions for the best existing solution, or shoul=
d I develop something from scratch?
>
>You can check out what I've done so far here: https://github=2Ecom/ashled=
ombos/mlmmj-ynh=2E Right now, I've mostly worked on the manifest=2Etoml and=
 install scripts=2E The other files are still just the basic template=2E
>
>Best regards,
>
>24=2E10=2E2023, 22:53, "Baptiste Daroussin" <bapt@nours=2Eeu>:
>
>Hello everyone,
>
>You can now find the RC2 release:
>https://codeberg=2Eorg/mlmmj/mlmmj/releases/tag/RELEASE_1_4_0rc2
>
>It contains 2 important regression fixes spotted by Konstantin (thanks a =
lot!)
>- VERP with postix
>- modifymod tunable
>
>Given a week has passed since last bug report, I think we are safe to
>issue a 1=2E4=2E0 rc2 release!
>
>Please test and report issue!
>Best regards,
>Bapt
>
>--=20
>
>Rapha=C3=ABl J=2E
Excellent! Please make sure to use latest git there aee important fixes th=
ere=2E

I can issue a rc3 if needed or I think it is stable enough for a final rel=
ease=2E

For the archives on freebsd, the index https://lists=2Efreebsd=2Eorg is us=
ing
https://codeberg=2Eorg/bapt/mlmmj-webview

The archives themselves are generated using https://fossil=2Enours=2Eeu/ml=
mmj-archiver/doc/trunk/README=2Emd

Both are maybe portable, maybe not, but I accept portability patches for b=
oth=2E

I can move mlmmj-archiver to codeberg to ease contribution if that helps

There are plenty of other options=2E

Bapt
------OYXNWNA1FZDURE3PKAPS8IRXI1ZBFQ
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"gmail_quote"><div dir=3D"auto">Le 19=
 novembre 2023 12:49:21 GMT+01:00, "Rapha=C3=ABl Jadot" &lt;rj@hodo=2Efr&gt=
; a =C3=A9crit=C2=A0:</div><blockquote class=3D"gmail_quote" style=3D"margi=
n: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); padding-=
left: 1ex;">
<div><p>Hi there,</p><p>I wanted to let you know that I'm working on a new=
 Yunohost package for mlmmj=2E I'm doing this because Mailman 3 (which is p=
rovide in the list of applications) seems a bit too heavy for small servers=
, and I really love mlmmj=2E</p><p>This is my first time making a package f=
or Yunohost, so it's a bit of a learning process=2E I might need some help =
or advice as I go along=2E</p><p>I'm also thinking about adding a web inter=
face for looking at email archives=2E Do you have any suggestions for the b=
est existing solution, or should I develop something from scratch?</p><p>Yo=
u can check out what I've done so far here: <a href=3D"https://github=2Ecom=
/ashledombos/mlmmj-ynh" rel=3D"noopener noreferrer">https://github=2Ecom/as=
hledombos/mlmmj-ynh</a>=2E Right now, I've mostly worked on the manifest=2E=
toml and install scripts=2E The other files are still just the basic templa=
te=2E</p>Best regards,</div><div>&nbsp;</div><div>24=2E10=2E2023, 22:53, "B=
aptiste Daroussin" &lt;bapt@nours=2Eeu&gt;:</div><blockquote><p>Hello every=
one,<br><br>You can now find the RC2 release:<br><a href=3D"https://codeber=
g=2Eorg/mlmmj/mlmmj/releases/tag/RELEASE_1_4_0rc2" rel=3D"noopener noreferr=
er">https://codeberg=2Eorg/mlmmj/mlmmj/releases/tag/RELEASE_1_4_0rc2</a><br=
><br>It contains 2 important regression fixes spotted by Konstantin (thanks=
 a lot!)<br>- VERP with postix<br>- modifymod tunable<br><br>Given a week h=
as passed since last bug report, I think we are safe to<br>issue a 1=2E4=2E=
0 rc2 release!<br><br>Please test and report issue!<br>Best regards,<br>Bap=
t<br><br>&nbsp;</p></blockquote><div>&nbsp;</div><div>&nbsp;</div></blockqu=
ote></div><br clear=3D"all"><div dir=3D"auto">Excellent! Please make sure t=
o use latest git there aee important fixes there=2E<br><br>I can issue a rc=
3 if needed or I think it is stable enough for a final release=2E<br><br>Fo=
r the archives on freebsd, the index <a href=3D"https://lists=2Efreebsd=2Eo=
rg">https://lists=2Efreebsd=2Eorg</a>=C2=A0is using<br><a href=3D"https://c=
odeberg=2Eorg/bapt/mlmmj-webview">https://codeberg=2Eorg/bapt/mlmmj-webview=
</a><br><br>The archives themselves are generated using <a href=3D"https://=
fossil=2Enours=2Eeu/mlmmj-archiver/doc/trunk/README=2Emd">https://fossil=2E=
nours=2Eeu/mlmmj-archiver/doc/trunk/README=2Emd</a><br><br>Both are maybe p=
ortable, maybe not, but I accept portability patches for both=2E<br><br>I c=
an move mlmmj-archiver to codeberg to ease contribution if that helps<br><b=
r>There are plenty of other options=2E<br><br>Bapt</div></body></html>
------OYXNWNA1FZDURE3PKAPS8IRXI1ZBFQ--


