Return-Path: <mlmmj+bounces-3076-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0F8E77188
	for <mlmmj@archiver.kernel.org>; Tue, 14 Jan 2025 14:49:07 +0000 (UTC)
Received: from localhost ([127.0.0.1]:60312 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3076-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1tXhhx-002Mgw-2Z
	for mlmmj@archiver.kernel.org;
	Tue, 14 Jan 2025 14:15:53 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51]:58747)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <dave@biff.org.uk>)
	id 1tXhhq-002MgC-0s
	for mlmmj@mlmmj.org;
	Tue, 14 Jan 2025 14:15:46 +0000
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54263b52b5aso5622863e87.1
        for <mlmmj@mlmmj.org>; Tue, 14 Jan 2025 06:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=biff-org-uk.20230601.gappssmtp.com; s=20230601; t=1736864411; x=1737469211; darn=mlmmj.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufUNpKBhyCC8PfVNnWED59aZuw9ndp3cH4M3xgk7o8w=;
        b=CKnuUTx0hHskp2TcnjcjkBpN0XU9DrvfKGp6NfLqmUcfdT/Zmqlgvi4NAtzne82JrL
         /mRMa1iBZBa5DTBS4pSIwqMfPzJo5xVWgTSglqBeFXWQ21RhDo2r9bmP7vyKwEe5R++i
         rH9O8zQaL46u7GrMJ5qbSS/ifseeEhsXDjnAwcfUeC//WOHRbAVisld6jyX29m5Ezfi5
         A9oxW4NAeQSlV3yFqOEReP0Z2dNKQwrOS9nLBLznmW0Vk031nLobqOT1xtPfKr32M2n2
         kl3xzf98Hk862nTjrpOn8ielgq5YGFQNFtVo6MituhglyGdW+Xj1NJAF5TDz3OhAOpCs
         yc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864411; x=1737469211;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufUNpKBhyCC8PfVNnWED59aZuw9ndp3cH4M3xgk7o8w=;
        b=XV9pbYa0XebXm1y4p7PLlAFHoU5W4XkDDX/yEsGyFbfgtbeezs9tDZIBOwQmULjCeA
         2kuWMKGeNLy3dCmQy/Hfy/ni3QJsUwbdTkD0wLv0koHfXyeNsMuhVl8WRs9JXXC08yoF
         hcTzARcAdycCumnyt78w7UwEJynwLaukHWrfl5Zp+DJtTKNFti2mfCPa5U6f/TMnE8g2
         DgMF1vE8rxy+1105ZMCSQIJiruZFaL9LPVnGC2GVbRscK5UjMMvvLkAtnCqMmzp+o6py
         j8+ilPkN4UJ6aYQDzrZzShvxL9QXZQdG1uulY6RUksXi+06hvFXkhXZUAp5XrPV/t49/
         nY7Q==
X-Gm-Message-State: AOJu0YzbQQjQg7dHmy46UvjpnaWA6u2P3wQKG+4E1VpzioYI0HR+8a79
	qcIQvLGC3KUXXT3OcOitUF1a1kQbki4o4/Kbj9IIOWLP8QYuY/CVkf/sMzGgVMaXgn5CxBszGko
	H51tHIQzw4SyXP894r+30uEqDX1kOyX2uuU+eO7qtoYomW+q8PDBA
X-Gm-Gg: ASbGncsERtPTjRFfNdFI2xQvzzfnB+4bmnWfwM9eKsD59W9hHhM9Sp/kEuUVcNxaUgj
	nM+0EfCnnr8kvUAJ39gY/9Y/ytWfzF/iGVmqDITIbaSeazKLs7OSq7oL0sZQlO7+Y6IS4jw==
X-Google-Smtp-Source: AGHT+IFZjs4lWJxGUrqBEBz1ikxBNaRnGOKPNgcO2ISUb+GEQvx7DeJT4N2fyMZfi5A4cKyxoE0XgV/OX7AWFC8Mehs=
X-Received: by 2002:a05:6512:e83:b0:540:2022:e3c6 with SMTP id
 2adb3069b0e04-542847fec24mr8220631e87.35.1736864410606; Tue, 14 Jan 2025
 06:20:10 -0800 (PST)
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
References: <CAJ=5wKNdxVpb9KR-y-tccfh+FQD2hrtX1iXAZ9Q_GwaL=Yy7Tg@mail.gmail.com>
In-Reply-To: <CAJ=5wKNdxVpb9KR-y-tccfh+FQD2hrtX1iXAZ9Q_GwaL=Yy7Tg@mail.gmail.com>
From: Dave Holland <dave@biff.org.uk>
Date: Tue, 14 Jan 2025 14:19:59 +0000
X-Gm-Features: AbW1kvbRb51PoGYbpKNMcLcc3NBSOsYaL1a_qafvAiczLMKtQN-7HQgpiE2MfX4
Message-ID: <CAJ=5wKPRiMM+yod02-9DNYJeyxMPRauQ_TWjRdKBTWYhnPv2jg@mail.gmail.com>
Subject: Re: difficulty with Exim
To: mlmmj@mlmmj.org
Content-Type: multipart/alternative; boundary="00000000000037bc98062bab422a"

--00000000000037bc98062bab422a
Content-Type: text/plain; charset="UTF-8"

Looking at it with a fresh pair of eyes... I hadn't realised mlmmj logged
some things to syslog. That led me to this message:
2025-01-13T21:42:36.508886+00:00 dory /usr/bin/mlmmj-receive[3142800]:
mlmmj-receive.c:122: Could not stat : No such file or directory

It looked like there should have been a filename there. Reading the source,
it should have been the listdir supplied with -L. Bodging a fixed list name
into the Exim config made everything work (for that list).

Triple-checking the Exim config, I found I had put "local_part" where I
should have put "$local_part". (Doh.)

All working now.

Cheers,
Dave

-- 



On Mon, 13 Jan 2025 at 22:10, Dave Holland <dave@biff.org.uk> wrote:

> Hi,
>
> I'm having trouble getting my first list working. I'm using Exim4 on
> Debian 12 (bookworm). I'm using the packaged version of mlmmj, version
> 1.3.0-4. I've followed the instructions in README.exim4, including the
> change to the "command" setting to de-taint local_part for recent versions
> of Exim. I've used the command line to create a list and subscribe an
> address to it.
>
> When I try to send an email to the list, Exim logs this error:
>
> 2025-01-13 21:44:41 1tXSEj-00DBc0-0X ** testlist@biff.org.uk
> R=mlmmj_router T=mlmmj_transport: Child process of mlmmj_transport
> transport returned 1 from command: /usr/bin/mlmmj-receive
>
> ...which isn't giving me many clues to go on.
>
> If I invoke mlmmj-receive from the command line, and feed it a message, it
> returns exit code 0.
>
> How can I get more debug information out to see what I've done wrong?
>
> Thanks,
> Dave
>
>
>
>

--00000000000037bc98062bab422a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looking at it with a fresh pair of eyes... I hadn&#39=
;t realised mlmmj logged some things to syslog. That led me to this message=
:</div><div>2025-01-13T21:42:36.508886+00:00 dory /usr/bin/mlmmj-receive[31=
42800]: mlmmj-receive.c:122: Could not stat : No such file or directory<br>=
</div><div><br></div><div>It looked like there should have been a filename =
there. Reading the source, it should have been the listdir supplied with -L=
. Bodging a fixed list name into the Exim config made everything work (for =
that list).</div><div><br></div><div>Triple-checking the Exim config, I fou=
nd I had put &quot;local_part&quot; where I should have put &quot;$local_pa=
rt&quot;. (Doh.)</div><div><br></div><div>All working now.</div><div><br></=
div><div>Cheers,</div><div>Dave</div><div><br></div><div><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><div><div dir=3D"ltr"><div>--=C2=A0</div><div><br></div></div></div></div=
></div></div><br></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 13 Jan 2025 at 22:10, Dave H=
olland &lt;<a href=3D"mailto:dave@biff.org.uk">dave@biff.org.uk</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div>Hi,</div><div><br></div><div>I&#39;m having trouble getting my fi=
rst list working. I&#39;m using Exim4 on Debian 12 (bookworm). I&#39;m usin=
g the packaged version of mlmmj, version 1.3.0-4. I&#39;ve followed the ins=
tructions in=C2=A0README.exim4, including the change to the &quot;command&q=
uot; setting to de-taint local_part for recent versions of Exim. I&#39;ve u=
sed the command line to create a list and subscribe an address to it.</div>=
<div><br></div><div>When I try to send an email to the list, Exim logs this=
 error:</div><div><br></div><div>2025-01-13 21:44:41 1tXSEj-00DBc0-0X ** <a=
 href=3D"mailto:testlist@biff.org.uk" target=3D"_blank">testlist@biff.org.u=
k</a> R=3Dmlmmj_router T=3Dmlmmj_transport: Child process of mlmmj_transpor=
t transport returned 1 from command: /usr/bin/mlmmj-receive<br></div><div><=
br></div><div>...which isn&#39;t giving me many clues to go on.</div><div><=
br></div><div>If I invoke mlmmj-receive from the command line, and feed it =
a message, it returns exit code 0.</div><div><br></div><div>How can I get m=
ore debug information out to see what I&#39;ve done=C2=A0wrong?</div><div><=
br></div><div>Thanks,</div><div>Dave</div><div><br></div><div><br></div><di=
v><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"l=
tr"><div><br></div></div></div></div></div></div>
</blockquote></div>

--00000000000037bc98062bab422a--


