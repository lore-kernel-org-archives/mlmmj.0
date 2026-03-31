Return-Path: <mlmmj+bounces-3104-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0FD109B461
	for <mlmmj@archiver.kernel.org>; Tue, 31 Mar 2026 12:49:33 +0000 (UTC)
Received: from localhost ([127.0.0.1]:59452 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3104-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w7YO9-00BA0Q-0W
	for mlmmj@archiver.kernel.org;
	Tue, 31 Mar 2026 12:40:09 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41]:53388)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <mmj@mmj.dk>)
	id 1w7YO2-00B9zb-0S
	for mlmmj@mlmmj.org;
	Tue, 31 Mar 2026 12:40:02 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66bd3d05e03so2913463a12.2
        for <mlmmj@mlmmj.org>; Tue, 31 Mar 2026 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mmj.dk; s=google; t=1774961219; x=1775566019; darn=mlmmj.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOV8ihIZEsqmRdLSGYZBa0LHApkKYdNAD9Fj8gz30C4=;
        b=M9Ri9ywylM2wT1PNC6BUTQT80m2IQBV2UxDLsxJ3afbvY4GxPdxBPEfNYzf4ZoNi+a
         +s1M7imo8G8P/MAKEh1NhV4o34dpEhkTnQiZ4LaoGD1yA6FPcYXGvBhG3np28Lk8Ftxz
         Cp6J3KlalTfV4oUHDVwuUyZwdyYR6hFR8qLi5r3K6dCzYP5eAPJwPwMUoHRDvFFBf1+7
         QUzq92Hdn9bhK18GMY3aw2EEUr85YxzeYHt/lbIRgtf1df4+iR1HdBX4B4qLfX/TZPR3
         yXLjCV/Hl2KM8iH2nqs9KS1vfU0kuM4qlKPgJuu3xFhU3O9JY4l/Am0afmQz0/2kCu/i
         LcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774961219; x=1775566019;
        h=message-id:in-reply-to:to:references:date:subject:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOV8ihIZEsqmRdLSGYZBa0LHApkKYdNAD9Fj8gz30C4=;
        b=NQ6hL8+cp336sF0mRgPUSr9dBeXVFBwYZd+Vo+gJuR5AEfG3menfHq3VvrB8fV+kML
         8e+LHyo4O9S0aP8JNs/4Sf6kejYrT97kDswEb7AIXK+IaIGDpNr1BNyddyqab5YTkpxP
         WMgdpOq7EXmJhpdh8bnnqsUN6ekCA8iw3ppIiCvONfyoqHk3rX+n3V2NIjY9TaicdWKh
         mmyAb9jc2XSbrj43nlTHpOyRva0G8NxvDFId+7SJigWQNrMpDr98ykWwcQcBVPn+uOok
         Z2VTCy9dmsyZQHDWFOBrZ2Q8M/c6Vc9Bow5ZszECju6ylV6uOlG/7dnDFXauneyz0qyR
         YUIg==
X-Gm-Message-State: AOJu0YxM/9/8BdBysDc38QsGrPGuLGu8Xg39twNK8My+peOsjhHHoQnw
	E/7EoU/U8EiXiz3jJ9cubThNrHz7dNF7q8kGt7P2lZBeblUU+fg3eXsdjww0m9u6bNGubrAgENU
	4951e
X-Gm-Gg: ATEYQzy6+e6CNMsiQfK5lLfQWsRisulHRUvmeB+Te82tkf44OvWLCwfpolcqm+9lNfH
	1oCFTc80BAsMVw/3OVvz7KfK3G8d2mIuWfMMBZSWCa+7o0WifSK48JJrXNooMmV/ZaFZwbrKVff
	Tx0R9CfpKmeWzbcOUu4hE011ttSYQV7GX5JB9HGFU/k/EitcAUA5hbi//YtlTZJJkuR4+jdwoEp
	ViR+c21gZJhseFfzUnzJw0aFIDr5wHxObxJXvq3ognWs+Oo09L9WF/alPjgbX2QVW16FF+sEBI/
	rb5x2muLIR4oI+SuxeJkOctdE2EiMxQnOiCf8/pAbKFNYF2lMjIXH9cByhWXV0MQLq4Z8hMubK7
	+dQtYnqdeVyO9VrSyT/TuKIPvN5lcsT5K6Iyx7D8RB4Am8qu3dF0xvecz6KJT8UJ8dvq97RqwnW
	PRtIc5YxVljSiolWSUqjFBezqv7XneCsUYXtQ=
X-Received: by 2002:a17:907:706:b0:b98:6177:2f16 with SMTP id a640c23a62f3a-b9b509b401amr1073483866b.53.1774961218386;
        Tue, 31 Mar 2026 05:46:58 -0700 (PDT)
Received: from smtpclient.apple ([152.115.200.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e33c0sm391665266b.49.2026.03.31.05.46.55
        for <mlmmj@mlmmj.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Mar 2026 05:46:56 -0700 (PDT)
From: =?utf-8?Q?Mads_Martin_J=C3=B8rgensen?= <mmj@mmj.dk>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_700B8211-3D33-4FCB-8067-67D19864398D"
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: Call for testing: 2.0.0 is close to the doors
Date: Tue, 31 Mar 2026 14:46:44 +0200
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
 <e2900560-38dc-412f-82ec-45d2750c2fd1@krot.org>
To: mlmmj@mlmmj.org
In-Reply-To: <e2900560-38dc-412f-82ec-45d2750c2fd1@krot.org>
Message-Id: <AAFE2BD6-38D9-4BA9-8959-CD06E4A278F0@mmj.dk>
X-Mailer: Apple Mail (2.3864.500.181)


--Apple-Mail=_700B8211-3D33-4FCB-8067-67D19864398D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

+1

So happy my old, first, open source project is still used and alive =
today :)

> On 31 Mar 2026, at 12.57, Kirill Miazine <km@krot.org> wrote:
>=20
>=20
> =E2=80=A2 Baptiste Daroussin [2026-03-29 10:26]:
>> Hello Everyone
>>=20
>> In 2022, I took over the maintenance of mlmmj which I am using for =
the FreeBSD mailing lists and more.
>>=20
>> I am close to have delivered all the features I intended to add as =
such I would like to stamp it with naming the next release: 2.0.0!
> now this was news! thank you for keeping mlmmj alive and moving it =
forward
>=20
>=20

--=20
"Why make things difficult, when it is possible to make them cryptic and =
totally illogical, with just a little bit more effort?" - A. P. J






--Apple-Mail=_700B8211-3D33-4FCB-8067-67D19864398D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;">+1<div><br></div><div>So happy my old, =
first, open source project is still used and alive today :)<br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On 31 Mar 2026, at 12.57, Kirill Miazine =
&lt;km@krot.org&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div><br>=E2=80=A2 Baptiste =
Daroussin [2026-03-29 10:26]:<br><blockquote type=3D"cite">Hello =
Everyone<br><br>In 2022, I took over the maintenance of mlmmj which I am =
using for the FreeBSD mailing lists and more.<br><br>I am close to have =
delivered all the features I intended to add as such I would like to =
stamp it with naming the next release: 2.0.0!<br></blockquote>now this =
was news! thank you for keeping mlmmj alive and moving it =
forward<br><br><br></div></div></blockquote></div><br><div>
<meta charset=3D"UTF-8">--&nbsp;<br>"Why make =
things&nbsp;difficult,&nbsp;when it is&nbsp;possible to =
make&nbsp;them&nbsp;cryptic and&nbsp;totally&nbsp;illogical, with just =
a&nbsp;little&nbsp;bit more effort?" -&nbsp;A. P. J<br><br><br><br><br>
</div>
<br></div></body></html>=

--Apple-Mail=_700B8211-3D33-4FCB-8067-67D19864398D--


