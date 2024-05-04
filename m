Return-Path: <mlmmj+bounces-3060-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92A8C4345F
	for <mlmmj@archiver.kernel.org>; Sat,  4 May 2024 07:52:46 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3060-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s39o3-002TiE-KZ
	for mlmmj@archiver.kernel.org; Sat, 04 May 2024 07:27:39 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <wolf@bergenheim.net>)
	id 1s39nw-002Tg7-RH
	for mlmmj@mlmmj.org; Sat, 04 May 2024 07:27:32 +0000
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2b37bc39decso300830a91.0
        for <mlmmj@mlmmj.org>; Sat, 04 May 2024 00:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bergenheim-net.20230601.gappssmtp.com; s=20230601; t=1714808385; x=1715413185; darn=mlmmj.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DEYU3BPA8Hw+QhMQnCMGLpLQx4LtOJ+4hNkVqy38vd8=;
        b=TADlm/8gZ+KbRBxN/+p8222GaeKba6lNjJvz6DidgF6aC4JY0oG9Xb28TmFNI8bl8D
         LT0L89fEsxoPRegEKdFEpXddCcH9FafYvaCjLlsAXi0AsqhNlsYO8TikvXwkWnodcOv2
         E1YyO7dbfN2ChDeJSiL/Q6zoAHmPj5Y1m0+kL6amiCR1h0h/roc+zf+xlud0l+Ixbcuw
         D3BVh2qRdJdxG9gxspkk2kVfyELNMVjYJwbQnqkl7yKXR5Im/YwoNDEu4RsA816WzfPH
         GoAfuSn/z64UHFIFPFJNb5oIk0pCaC+mcOotvkXcUf13fyaZomi88npgeBMGfn1x37by
         r0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714808385; x=1715413185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEYU3BPA8Hw+QhMQnCMGLpLQx4LtOJ+4hNkVqy38vd8=;
        b=nniN7wIutI/PbMT6OubIvxpiYirjoXvKSn9T1P1KYMUoNOl0zBBvYRuxV1E0yRs4Op
         xEG3j5/Ae/Ud0aPsywXmXHZ4Dqvgs9D1i7l8+ADjojQ/aHDDU/Omrueoy5I6ahL4rlZy
         jhAm8FkafXwqkCDQmtRDSnGJmFzoE4/xiyy6b4gArMs0RqG8wT4SXwYnh/uTDqiiGb/6
         FTOWw28GWcaOcelYqyIEqBGPFCLwJpihNcEjg4+FUOjNkRthqkQOqK/v71IJtbpmCKJr
         zxHnvBsr1+PKaaon0XFF7vXtCuSGlTYvPOfojAl7YdnyxTmJfdHdJgwYXj2GiwRS/vCX
         SddQ==
X-Gm-Message-State: AOJu0YyGPyyL/2dVN1PLxNNjx5ej/ne13ZoiJ3S97caweZLRsR6Tewz0
	2ty6svU7dvX5buNLjVKB60YG6OQUfCjOTvOQiq/gKOXfpGo3Bpe96RjiNhkvOPYXINAAcKVsqlZ
	4nHXxUXMgUpbhQ2KFl7kS/ELctiLdppERgjLLEA==
X-Google-Smtp-Source: AGHT+IHs0dOIPPNO0+ApC3WcjfVZN+BOcPDaIYr4yBAl87QiZn3KenP7XQVDNqNp2hfPYuseiYRzxBK70Ket3ZwaAc8=
X-Received: by 2002:a17:90b:4c85:b0:2b3:a79a:7e4b with SMTP id
 my5-20020a17090b4c8500b002b3a79a7e4bmr4638018pjb.22.1714808384419; Sat, 04
 May 2024 00:39:44 -0700 (PDT)
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
References: <8e40c6fe4b3550052e405e068ecd13619602c4c7@nours.eu>
 <836c9c87-7d0e-41b9-b33f-c4887d2ae34e@deganius.de> <13C5A781-18E5-423C-9599-575EB1DF63A5@nours.eu>
 <17df9faa-4a97-44b7-aa66-82cd3984deaf@deganius.de>
In-Reply-To: <17df9faa-4a97-44b7-aa66-82cd3984deaf@deganius.de>
From: Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
Date: Sat, 4 May 2024 09:39:33 +0200
Message-ID: <CAJhTkW4UaJXHh_-FJdc7fuKfecKomZQn85B=b60RCz9OKgbBsg@mail.gmail.com>
Subject: Re: [mlmmj] Roadmap for 1.5
To: Christof Thalhofer <chrisml@deganius.de>, =?UTF-8?Q?Christian_St=C3=A6rk?= <xi@borderworlds.dk>
Cc: mlmmj@mlmmj.org
Content-Type: multipart/alternative; boundary="0000000000009ca0ee06179bf06e"

--0000000000009ca0ee06179bf06e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 9:28=E2=80=AFAM Christof Thalhofer <chrisml@deganius=
.de>
wrote:

> Who owns mlmmj.org?
>
>
Huh I thought we had gone through the DNS transfer already, but apparently
not.
The domain is still in the hands of @Christian St=C3=A6rk <xi@borderworlds.=
dk>

I have my linode dns config set up and ready to start hosting the domain...
:) Just waiting for Christian to do the domain transfer...

--Wolf


> > whois mlmmj.org
> > Domain Name: mlmmj.org
> > Registrar URL: http://www.1api.net
>
> The guys at hostsharing.net (this is a webhoster coop I am a member of)
> said that they would be happy to sponsor the hosting of this domain.
>
> Alles Gute
>
> Christof Thalhofer
>
> --
> Dies ist keine Signatur
>
>
>
>

--0000000000009ca0ee06179bf06e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, May 4, 2024 at 9:28=E2=80=AFAM Ch=
ristof Thalhofer &lt;<a href=3D"mailto:chrisml@deganius.de" target=3D"_blan=
k">chrisml@deganius.de</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Who owns <a href=3D"http:/=
/mlmmj.org" rel=3D"noreferrer" target=3D"_blank">mlmmj.org</a>?<br>
<br></blockquote><div><br></div><div>Huh I thought we had gone through the =
DNS transfer=C2=A0already, but apparently not.</div><div>The domain is stil=
l in the hands of=C2=A0<a class=3D"gmail_plusreply" id=3D"m_108397483148206=
5916plusReplyChip-0" href=3D"mailto:xi@borderworlds.dk" target=3D"_blank">@=
Christian St=C3=A6rk</a>=C2=A0</div><div><br></div><div>I have my linode dn=
s config set up and ready to start hosting the domain... :) Just waiting fo=
r Christian to do the domain transfer...</div><div><br></div><div>--Wolf</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; whois <a href=3D"http://mlmmj.org" rel=3D"noreferrer" target=3D"_blank=
">mlmmj.org</a><br>
&gt; Domain Name: <a href=3D"http://mlmmj.org" rel=3D"noreferrer" target=3D=
"_blank">mlmmj.org</a><br>
&gt; Registrar URL: <a href=3D"http://www.1api.net" rel=3D"noreferrer" targ=
et=3D"_blank">http://www.1api.net</a><br>
<br>
The guys at <a href=3D"http://hostsharing.net" rel=3D"noreferrer" target=3D=
"_blank">hostsharing.net</a> (this is a webhoster coop I am a member of) <b=
r>
said that they would be happy to sponsor the hosting of this domain.<br>
<br>
Alles Gute<br>
<br>
Christof Thalhofer<br>
<br>
-- <br>
Dies ist keine Signatur<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000009ca0ee06179bf06e--


