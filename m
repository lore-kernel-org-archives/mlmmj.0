Return-Path: <mlmmj+bounces-3112-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232B7EDB7D0
	for <mlmmj@archiver.kernel.org>; Tue,  7 Apr 2026 20:56:16 +0000 (UTC)
Received: from localhost ([127.0.0.1]:44940 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3112-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wACdv-00BbaF-2k
	for mlmmj@archiver.kernel.org;
	Tue, 07 Apr 2026 20:03:23 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51]:50682)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <mmj@mmj.dk>)
	id 1wACdo-00BbZQ-2O
	for mlmmj@mlmmj.org;
	Tue, 07 Apr 2026 20:03:16 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9d166ed21cso123330666b.1
        for <mlmmj@mlmmj.org>; Tue, 07 Apr 2026 13:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mmj.dk; s=google; t=1775592625; x=1776197425; darn=mlmmj.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPNXIjn6UIpljw6YC00P0UU4UQHNQFLelPFMgJeHD2U=;
        b=Mpf4AOU2QluGLblf6G34O7DXMveI0dUti3uU3xqkPrvv/AqrtoY2v3uThJnhYwD1Ib
         owx6d9CcPWBB1rOv5Gu04chLqZu46Lr/7xzhdzyZ2ke0fGUiOn4kNkO7PnyDVUF0KV1/
         IehyazDg+sv1GspxgMbuOSIk46s/pj03gY2sEhuIBckHkxx4IfqWAjL7x8Pws6I6rbbl
         LsET3IUeVHB1THVHemsKgpbl28tqqr2jecIN9vfWgbc33o9svoxR2B9OisGPmoIuWLop
         8dX51iAp9kaDJ4FWyKHUtuFU+yeGJarTps6S3Ug8lu0Luv3LYOz7DiIZea/6r5aNf3PK
         nCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775592625; x=1776197425;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPNXIjn6UIpljw6YC00P0UU4UQHNQFLelPFMgJeHD2U=;
        b=kNquoVekV3TO6jfRVMXxMWbAMVbxFJl2RH8uBzJuvgv8jcbx23MZ+d3XdhTkWfQNuv
         N3UBAdGnX/UpuYa5VO3NE5AFmFyN5Rt0BL0o24jWRSS/Hecm2JotLrnG+tVII9DMktHR
         7hC30UBQQXG/9nyvTx6d7QDCkfKkif2TyjtVT01Aj+KjF1OeDwDq0FLPEW1pZgLlK40p
         XzuyFS3V4PRZjYstEV03KKm4DSEKxvaNKMDoJGYMrUapqytRVTezOL7yjOrcQM3nVFti
         UsV/YNy8X2VTv529kbYdIssrgfQQx2l0V7ejq7e7W3PfbPfzn2xZSexk6lNlbvxbRtQl
         TNkQ==
X-Gm-Message-State: AOJu0YxDZtL150xfB340OTEJoiaKe32UH5DBQEopSpjja77opZEwiZXb
	N//yQcuFtgvod2wo9LWHe9g5zlUEdXCmQTEoelAWnaE5orKlsIRq4RNGzSfkfP3YHdk=
X-Gm-Gg: AeBDievkX/tJA4lV+fAnRAhwtmbjijKybS7tSq33KpdF7wr0lWymHjIxvYNog7cikxO
	2G2J9+uIINPf0aQREo5V4gtlEh3+fepM1YnihIoMFm2VJfAh66fS2k53kTC2ZdBaJx9+Lzvfl9n
	uKSZnfHfFo02xPznyACFePFIbrI18qL2YNlebRMoid+d31MsFGFHt7aglIMR6NT1ZeZjj1dzKlZ
	3BgTdIC1eEd1kkoaa3t7KQcizCM0F1MxJ5Kf9cfuogldWo4xHg85Sko2xm0KjdrB4ptqAUm/fum
	f+RcmRHgLB0o5yK0rzcwh3UyMeIpVs8XIXgg/KUz93sIxUb1r13gzZr15+V5L2wN8frafrZM6Ne
	dCDOs2aq7Wsgz98okc+6J0wVfH1jgCMupk3BqxbDeBylxGBwoA19uP+1214+GsXBvRnCWAm2nf/
	2NDNhQn+3xvmk1mT3p3raZW4QWnHqpGLjAxUGL2dk=
X-Received: by 2002:a17:907:c248:b0:b98:528b:8461 with SMTP id a640c23a62f3a-b9c67b47280mr1014902866b.52.1775592625238;
        Tue, 07 Apr 2026 13:10:25 -0700 (PDT)
Received: from smtpclient.apple ([2a05:f6c7:9606:0:290e:bf20:4f8b:ddc3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6f2bsm564891466b.35.2026.04.07.13.10.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Apr 2026 13:10:24 -0700 (PDT)
From: =?utf-8?Q?Mads_Martin_J=C3=B8rgensen?= <mmj@mmj.dk>
Message-Id: <725496B2-3415-4CC4-81AB-20C3483D1B05@mmj.dk>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0A9A19A6-E71E-4E26-B392-0F5787048331"
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: Call for testing: 2.0.0 is close to the doors
Date: Tue, 7 Apr 2026 22:10:11 +0200
In-Reply-To: <45b66d34-9e66-45aa-bb02-78b3b56ec1ea@andreasschulze.de>
Cc: mlmmj@mlmmj.org
To: "A.Schulze" <sca@andreasschulze.de>
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
 <45b66d34-9e66-45aa-bb02-78b3b56ec1ea@andreasschulze.de>
X-Mailer: Apple Mail (2.3864.500.181)


--Apple-Mail=_0A9A19A6-E71E-4E26-B392-0F5787048331
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On 7 Apr 2026, at 21.25, A.Schulze <sca@andreasschulze.de> wrote:
>=20
> Am 29.03.26 um 10:26 schrieb Baptiste Daroussin:
>> I am close to have delivered all the features I intended to add as =
such I would like to stamp it with naming the next release: 2.0.0!
>> Please test and send feedbacks!
>=20
> Hello,
>=20
> in earlier versions, "make install" installed the binaries in =
/usr/local/bin/
> Now, using the latest available commit at codeberg, binaries are =
installed in /usr/local/sbin/
>=20
> This break some things here and require path adjustments. Is it =
intentional?
> I would say, mlmmj binaries are not limited to be used by a root, so I =
favor .../bin over .../sbin


IMHO is sbin wrong. It's neither a system nor a static binary -- =
depending on what your Unix flavour used sbin for instead of bin.

--=20
"Why make things difficult, when it is possible to make them cryptic and =
totally illogical, with just a little bit more effort?" - A. P. J






--Apple-Mail=_0A9A19A6-E71E-4E26-B392-0F5787048331
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dus-ascii"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><br><div><blockquote type=3D"cite"><div>On=
 7 Apr 2026, at 21.25, A.Schulze &lt;sca@andreasschulze.de&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">Am 29.03.26 um 10:26 =
schrieb Baptiste Daroussin:</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: =
solid;"><blockquote type=3D"cite" style=3D"font-family: Menlo-Regular; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: =
none; text-decoration-thickness: auto; text-decoration-style: solid;">I =
am close to have delivered all the features I intended to add as such I =
would like to stamp it with naming the next release: 2.0.0!<br>Please =
test and send feedbacks!<br></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">Hello,</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: =
none; text-decoration-thickness: auto; text-decoration-style: =
solid;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">in earlier versions, "make install" =
installed the binaries in /usr/local/bin/</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">Now, using the latest =
available commit at codeberg, binaries are installed in =
/usr/local/sbin/</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: =
none; text-decoration-thickness: auto; text-decoration-style: =
solid;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">This =
break some things here and require path adjustments. Is it =
intentional?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">I would say, mlmmj binaries are not limited =
to be used by a root, so I favor .../bin over =
.../sbin</span></div></blockquote></div><div><br></div><div>IMHO is sbin =
wrong. It's neither a system nor a static binary -- depending on what =
your Unix flavour used sbin for instead of =
bin.</div><div><br></div><div>
<meta charset=3D"UTF-8">--&nbsp;<br>"Why make =
things&nbsp;difficult,&nbsp;when it is&nbsp;possible to =
make&nbsp;them&nbsp;cryptic and&nbsp;totally&nbsp;illogical, with just =
a&nbsp;little&nbsp;bit more effort?" -&nbsp;A. P. J<br><br><br><br><br>
</div>
<br></body></html>=

--Apple-Mail=_0A9A19A6-E71E-4E26-B392-0F5787048331--


