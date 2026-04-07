Return-Path: <mlmmj+bounces-3111-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7C5EDB7D0
	for <mlmmj@archiver.kernel.org>; Tue,  7 Apr 2026 20:54:05 +0000 (UTC)
Received: from localhost ([127.0.0.1]:56372 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3111-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wACak-00BbXm-0s
	for mlmmj@archiver.kernel.org;
	Tue, 07 Apr 2026 20:00:06 +0000
Received: from b.nours.eu ([54.38.177.57]:61353)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <bapt@nours.eu>)
	id 1wACad-00BbWq-0j
	for mlmmj@mlmmj.org;
	Tue, 07 Apr 2026 19:59:59 +0000
Received: from ehlo.thunderbird.net (unknown [IPv6:2a01:e0a:274:cc70:591e:a06c:d026:fe13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by b.nours.eu (Postfix) with ESMTPSA id 2FD4643DA2;
	Tue, 07 Apr 2026 22:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1775592427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gW5pV6EETMma7cYfIDtveFZiNyDfj8cZs/ovtks755U=;
	b=NqFaOJj5TMd6pAtp4PyqCYl//JOlDmNM3nBbGwdh6WB4LlVTuu3bQXAl+WRmbCcTIuqxgE
	cAK6N9t5OgSHdre4KBOc9n2oWmgsuzIX+w+KoFP+zNRR77KeiJe2/6n8xItNJNjnYsYc+C
	1KQpIYzaAE89zKOixPkHoW8/IlrIDJmZIgOBOvb9ZpwNNmwHfA7kbNnhnDXgfyFWqyQfZp
	ZlypZCD0gQMhP3BpVU311xqMNYc6QFhQlk/1rP4ggMuNVC18eb/cMXSbZJPn0KiLN4tvv+
	4xdJ2rfLABjKJInkuaRLgEOaOuTZ2UPX1sWJuTHsYN3wK5vPQm3sZLOEpxKN4Q==
Date: Tue, 07 Apr 2026 22:07:05 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org, "A.Schulze" <sca@andreasschulze.de>
Subject: Re: Call for testing: 2.0.0 is close to the doors
User-Agent: Thunderbird for Android
In-Reply-To: <45b66d34-9e66-45aa-bb02-78b3b56ec1ea@andreasschulze.de>
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu> <45b66d34-9e66-45aa-bb02-78b3b56ec1ea@andreasschulze.de>
Message-ID: <DE68916A-B6D2-4893-9966-FCCCB64260BA@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----KH98UFBKN75XERSI7YUQPX45W8DIVY
Content-Transfer-Encoding: 7bit

------KH98UFBKN75XERSI7YUQPX45W8DIVY
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

you are right, it was "almost" intentional, I reused templates from other p=
rogram I maintains which are installed in sbin, and this is just muscle mem=
ory to type sbindir instead of bindir=2E sorry about that=2E

in anycase fixed

best regards,
Bapt

Le 7 avril 2026 21:25:44 GMT+02:00, "A=2ESchulze" <sca@andreasschulze=2Ede=
> a =C3=A9crit=C2=A0:
>
>
>Am 29=2E03=2E26 um 10:26 schrieb Baptiste Daroussin:
>> I am close to have delivered all the features I intended to add as such=
 I would like to stamp it with naming the next release: 2=2E0=2E0!
>> Please test and send feedbacks!
>
>Hello,
>
>in earlier versions, "make install" installed the binaries in /usr/local/=
bin/
>Now, using the latest available commit at codeberg, binaries are installe=
d in /usr/local/sbin/
>
>This break some things here and require path adjustments=2E Is it intenti=
onal?
>I would say, mlmmj binaries are not limited to be used by a root, so I fa=
vor =2E=2E=2E/bin over =2E=2E=2E/sbin
>
>Andreas
>
>

------KH98UFBKN75XERSI7YUQPX45W8DIVY
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">you are right, it was "almost" i=
ntentional, I reused templates from other program I maintains which are ins=
talled in sbin, and this is just muscle memory to type sbindir instead of b=
indir=2E sorry about that=2E<br><br>in anycase fixed<br><br>best regards,<b=
r>Bapt</div><br><br><div class=3D"gmail_quote"><div dir=3D"auto">Le 7 avril=
 2026 21:25:44 GMT+02:00, "A=2ESchulze" &lt;sca@andreasschulze=2Ede&gt; a =
=C3=A9crit=C2=A0:</div><blockquote class=3D"gmail_quote" style=3D"margin: 0=
pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;">
<pre class=3D"net-thunderbird-android__plain-text-message-pre"><div dir=3D=
"auto"><br><br>Am 29=2E03=2E26 um 10:26 schrieb Baptiste Daroussin:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin-bottom: 1ex; --net-thun=
derbird-android__blockquote-default-border-color: #729fcf;"><div dir=3D"aut=
o">I am close to have delivered all the features I intended to add as such =
I would like to stamp it with naming the next release: 2=2E0=2E0!<br>Please=
 test and send feedbacks!<br></div></blockquote><div dir=3D"auto"><br>Hello=
,<br><br>in earlier versions, "make install" installed the binaries in /usr=
/local/bin/<br>Now, using the latest available commit at codeberg, binaries=
 are installed in /usr/local/sbin/<br><br>This break some things here and r=
equire path adjustments=2E Is it intentional?<br>I would say, mlmmj binarie=
s are not limited to be used by a root, so I favor =2E=2E=2E/bin over =2E=
=2E=2E/sbin<br><br>Andreas<br><br><br></div></pre></blockquote></div></body=
></html>
------KH98UFBKN75XERSI7YUQPX45W8DIVY--


