Return-Path: <mlmmj+bounces-3064-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C786C4345F
	for <mlmmj@archiver.kernel.org>; Sun,  5 May 2024 03:23:53 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3064-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s3SD6-007Zdb-TD
	for mlmmj@archiver.kernel.org; Sun, 05 May 2024 03:06:44 +0000
Received: from mail.kamar.nz ([103.158.176.251])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <kent@kamar.nz>)
	id 1s3SCz-007Zb4-Kq
	for mlmmj@mlmmj.org; Sun, 05 May 2024 03:06:38 +0000
Received: from mail.kamar.nz (mail.kamar.nz [127.0.0.1])
	by mail.kamar.nz (Postfix) with ESMTP id 4VX8rm3P3Zz2Jg1
	for <mlmmj@mlmmj.org>; Sun,  5 May 2024 15:18:48 +1200 (NZST)
Authentication-Results: mail.kamar.nz (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=kamar.nz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kamar.nz; h=
	x-mailer:to:in-reply-to:references:message-id:date:subject
	:mime-version:from:content-transfer-encoding:content-type; s=
	dkim; t=1714879126; x=1717471127; bh=t3zpjc0X65LjsAJpr5ol4YfCzWn
	oixq5j6c/vFcCe10=; b=QKGtm7P0+ggdCSv+oodyv7ABcRBJINH8OC3qjKogcRu
	UGX6zFmXdhj48kZ/PtpRmlAeRzbxel9ZYWrn1lJcQcdv88jdlyW1gI8oB6TDu2Ho
	QaaEj5jMZXswKY5B1z8UYNcc84wWgZT4A8GZuMQnKC6hvKT3GZva5jBmuawa9AIk
	=
X-Amavis-Modified: Mail body modified (using disclaimer) - mail.kamar.nz
X-Virus-Scanned: Debian amavisd-new at mail.kamar.nz
Received: from mail.kamar.nz ([127.0.0.1])
	by mail.kamar.nz (mail.kamar.nz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 33mwD2snXpN1 for <mlmmj@mlmmj.org>;
	Sun,  5 May 2024 15:18:46 +1200 (NZST)
Received: from smtpclient.apple (17.110.224.49.dyn.cust.vf.net.nz [49.224.110.17])
	by mail.kamar.nz (Postfix) with ESMTPSA id 4VX8rj5jrgz2Hbs;
	Sun,  5 May 2024 15:18:44 +1200 (NZST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Kent Lendrum <kent@kamar.nz>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [mlmmj] Roadmap for 1.5
Date: Sun, 5 May 2024 15:18:32 +1200
Message-Id: <EED88F30-CCD6-490E-8CE1-1147ADD371F9@kamar.nz>
References: <wvm4k5n7y7wuaezsx7mskdw3n3npdkzsbu2nsecjn4ccjjpls6@pqxp6qjngkjx>
Cc: mlmmj@mlmmj.org
In-Reply-To: <wvm4k5n7y7wuaezsx7mskdw3n3npdkzsbu2nsecjn4ccjjpls6@pqxp6qjngkjx>
To: Baptiste Daroussin <bapt@nours.eu>
X-Mailer: iPhone Mail (21E236)

Hi Baptiste,

The problem arises if you do want to modify the message - such as inserting [=
listID] to the subject or adding a Reply-To header.

If the sender has their SPF record to a hard reject (as is the case for a co=
uple of users on our mailing list) - then anyone else doesn=E2=80=99t receiv=
e their messages.

I like the idea where you only mangle the =46rom if the sender has a hard SP=
F reject, that way only those senders on our list are affected and everyone e=
lse it=E2=80=99s business as normal.


Kent

> On 5 May 2024, at 10:52=E2=80=AFAM, Baptiste Daroussin <bapt@nours.eu> wro=
te:
>=20
> =EF=BB=BFHi,
>=20
> if there is a strong request for this I would add it, but again this is no=
t
> necessary including with people having a reject policy like yahoo.com.
>=20
> In the FreeBSD project for the mailing list we use mlmmj, we don't never m=
unge
> the from, we make sure we don't alter fields that are used for dkim signat=
ures,
> meaning no control/prefix control/footer and we have plenty of subscribers=
 from
> yahoo.com without any problem.
>=20
> Best regards,
> Bapt
>=20
>=20
>> On Sun 05 May 09:39, Kent wrote:
>> Hi Baptiste,
>>=20
>> With the enforcement of SPF / DKIM / DMARC,  acting as a mailing list whe=
re senders aren't on the same mail server as you host is problematic for mai=
ling lists where you are essentially forwarding/sending email on behalf of s=
omeone on another domain.
>>=20
>> I raised this issue on this mailing list recently and you replied that it=
's semi possible when using 1.4.1, but would need to configure something bef=
ore mlmmj like rspamd.
>>=20
>> I appreciate that From-munging is a horrible workaround (I personally don=
't like it either) - but this is the approach that Google takes with their m=
ailing lists and it's the only workaround I've identified that works if the s=
enders SPF / DKIM / Dmarc records for their domain are set to reject email f=
rom other domains.
>>=20
>>=20
>> Do you think this is something you could add to mlmmj in 1.5 ?
>>=20
>> I'm thinking this would be a 'frommungle' file flag.  And when present, a=
utomatically:
>> - replaces the 'FROM' with the from specified within the file.
>> - strips any of the original senders headers that are part of the origina=
l senders SPF / DMARC / DKIM checks.
>> - perhaps adds a X-Original-=46rom header with the original senders email=
 address.
>>=20
>>=20
>>=20
>> Cheers
>> Kent
>>=20
>>=20
>>=20
>>>> On 4 May 2024, at 2:39=E2=80=AFAM, Baptiste Daroussin <bapt@nours.eu> w=
rote:
>>>=20
>>> Hello everyone,
>>>=20
>>> Now that mlmmj 1.4 seems to have properly settle, I would like to propos=
e a roadmap for mlmmj 1.5,
>>> please find here:
>>>=20
>>> https://codeberg.org/mlmmj/mlmmj/issues?type=3Dall&sort=3D&state=3Dopen&=
labels=3D&milestone=3D4774&project=3D0&assignee=3D0&poster=3D0
>>>=20
>>> The list of tasks I plan to do before releasing mlmmj 1.5.0
>>>=20
>>> Do not hesitate to comment, discuss and propose other tasks.
>>>=20
>>> Basically 1.4 was mostly: modernize the code base (this is not finished,=
 but advanced enough) and provide a test suite. for 1.5 I plan to cleanup fe=
atures which in my opinion do not make sense anymore because they break fiel=
ds used for DKIM signatures and implement the feature that has been requeste=
d by people here over the last year.
>>>=20
>>> I have no ETA for 1.5.0 it will be released when it will be released.
>>>=20
>>> Extra note, I would really love to get access to mlmmj.org to fix the ma=
iling list with dkim and to be able to update the website or point it to cod=
eberg.
>>>=20
>>> Best regards,
>>> Bapt
>>>=20
>>>=20
>>=20



