Return-Path: <mlmmj+bounces-3073-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB89D1AD43
	for <mlmmj@archiver.kernel.org>; Wed, 16 Oct 2024 11:26:47 +0000 (UTC)
Received: from localhost ([127.0.0.1]:54952 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3073-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1t125c-00AvXz-1K
	for mlmmj@archiver.kernel.org;
	Wed, 16 Oct 2024 11:21:16 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182]:55411)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <inna.kutsan@bystrov.agency>)
	id 1t125U-00AvXI-1b
	for mlmmj@mlmmj.org;
	Wed, 16 Oct 2024 11:21:08 +0000
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e29687f4cc6so1863592276.2
        for <mlmmj@mlmmj.org>; Wed, 16 Oct 2024 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bystrov-agency.20230601.gappssmtp.com; s=20230601; t=1729077806; x=1729682606; darn=mlmmj.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVkEGXiOYCQqcSwPO4C0yx2WpRvI/At9H/FiTfnsAKU=;
        b=GMp8rly2TzSIWtwTLSUrMza/6ob7f3XvMqxj8Db0dxbhH36Srsn7E/zg5ELp5/vnSh
         DGHAsD+CFqTN7Dw29T8yh6ohCdjdeEX12Da5aLFhJZVcH1MIKT4r6nNl+1CIvUzEE8WG
         E21FqslAJGnWPi9PbAUhffkH0JtqtHp3ryzzc+0OefJBCcxd6DULtt/qHoinVocRO3vP
         sr8fVeA/2rPHLUJyZC6N81v5wLAeNJ1KvaRgbqW+bh3F9J5CdHG8tvBX4TCFEerQw0U1
         X8I55hPOTTU2zyi/sCtbdOm+owMEfKSLmAm51hfaojIbbaYDye4jvRUgGlSfpMJLEpy7
         +D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729077806; x=1729682606;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVkEGXiOYCQqcSwPO4C0yx2WpRvI/At9H/FiTfnsAKU=;
        b=sekjhGwfhcnFwrNqvBFEabKf21IhI854e+t/vOEbGxQ48LHNm3lLsAgIzLfRWVBjPU
         HbUSkvQgViqSwik3hUA0BzwAUJnFW/bbvuUYfOV02q85IV0kWRd/3IZKJUBqlreo3oHh
         YezCgFofXDYMSqTDaE2qsrc4fcj0r4Vryz6xvVQQ7mFz82cDQ9HPrY/auLQujq9gFEnr
         ADrKJKzykaVH73VJrZdk5rZD3SwkcdG60cUc4iRvwLMg5XZJpA/DDCk04XhGzK9FB/bt
         8qqpatYAe555yiBYWGJWLZ8sInFyjT9SI575yxEQrgkpSS4yiknhpH3B4ZtvdDNiYSRd
         h0iQ==
X-Gm-Message-State: AOJu0Yx7wjUYzgkbvpDr38nqNG4+1tTgP3zDhGy98IT2kogCeAp30Jdd
	8h03DpRsXQuXWNUPxTACwbXN+7ptZBeP9HZFsB/v/WQNCztXl602uM6YW4WfwGjTtjK7MN9u3wN
	czVdF7ooLntQ+dXkcmU+Egw4wjEHbtI6DPbcYooqL/qboFhi5upo=
X-Google-Smtp-Source: AGHT+IF79p1uLiVy8+4oD6Xbe3hlsT8zWqjbraWejOGYPR08oOuartusQkD72ypm5DuFgj/PBkc32j4NCl90HM9VLak=
X-Received: by 2002:a05:6902:c0b:b0:e29:9cc:bf34 with SMTP id
 3f1490d57ef6-e2931b39d02mr11150616276.17.1729077805735; Wed, 16 Oct 2024
 04:23:25 -0700 (PDT)
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
References: <1729077130-2604348-mlmmj-3f97b434@mlmmj.org>
In-Reply-To: <1729077130-2604348-mlmmj-3f97b434@mlmmj.org>
From: Inna Kutsan <inna.kutsan@bystrov.agency>
Date: Wed, 16 Oct 2024 14:23:14 +0300
Message-ID: <CANwmGoQobu3OWH-kBA5XUcO6B_V_Sjr3ZniM3=VofjY74SJ9gg@mail.gmail.com>
Subject: Fwd: Welcome to mlmmj@mlmmj.org
To: mlmmj@mlmmj.org
Content-Type: multipart/alternative; boundary="000000000000667ecc0624964c99"

--000000000000667ecc0624964c99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello! We have a bug that happens with using your plugin.
Your site: https://www.belgianboys.com/
After analysis with Axe extension of our page
https://www.belgianboys.com/products/original-belgian-waffle we discovered
an issue "Ensure <img> elements have alternate text or a role of none or
presentation". Our developer said that we couldnt fix this bug and it
occurs on the side of pear-widget plugin. I am providing a screenshot where
the element causing the issue is highlighted.
 Is it possible to somehow solve this on our side? Is there any way you can
help us solve this problem? Maybe you plan to update your functionality to
be able to fix this? If so, please provide information on when you plan to
do so.

---------- Forwarded message ---------
From: <mlmmj+help@mlmmj.org>
Date: Wed, Oct 16, 2024 at 2:15=E2=80=AFPM
Subject: Welcome to mlmmj@mlmmj.org
To: <inna.kutsan@bystrov.agency>


Hi, this is the Mlmmj program managing the <mlmmj@mlmmj.org> mailing list.

Thank you for confirming your subscription. You have now been added to the
normal version of the list.

The email address you are subscribed with is <inna.kutsan@bystrov.agency>.

If you ever wish to unsubscribe, send a message to
<mlmmj+unsubscribe@mlmmj.org> using this email address. The subject and the
body of the message can be anything. You will then receive confirmation or
further instructions.

For other information and help about this list, send a message to
<mlmmj+help@mlmmj.org>.

--000000000000667ecc0624964c99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello! We have a bug that happens with using your plugin.<=
br>Your site:=C2=A0<a href=3D"https://www.belgianboys.com/" target=3D"_blan=
k">https://www.belgianboys.com/</a><br>After analysis with Axe extension of=
 our page=C2=A0<a href=3D"https://www.belgianboys.com/products/original-bel=
gian-waffle" target=3D"_blank">https://www.belgianboys.com/products/origina=
l-belgian-waffle</a>=C2=A0we discovered an issue &quot;Ensure &lt;img&gt; e=
lements have alternate text or a role of none or presentation&quot;. Our de=
veloper said that we couldnt fix this bug and it occurs on the side of=C2=
=A0<span style=3D"font-family:inherit;font-size:inherit;font-style:inherit;=
font-variant-ligatures:inherit;font-variant-caps:inherit;font-weight:inheri=
t">pear-widget=C2=A0</span><span style=3D"font-family:inherit;font-style:in=
herit;font-variant-ligatures:inherit;font-variant-caps:inherit">plugin.=C2=
=A0</span>I am providing a screenshot where the element causing the issue i=
s highlighted.<br>=C2=A0Is it possible to somehow solve this on our side? I=
s there any way you can help us solve this problem? Maybe you plan to updat=
e your functionality to be able to fix this? If so, please provide informat=
ion on when you plan to do so.<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ---------<br>Fro=
m: <span dir=3D"auto">&lt;<a href=3D"mailto:mlmmj%2Bhelp@mlmmj.org">mlmmj+h=
elp@mlmmj.org</a>&gt;</span><br>Date: Wed, Oct 16, 2024 at 2:15=E2=80=AFPM<=
br>Subject: Welcome to <a href=3D"mailto:mlmmj@mlmmj.org">mlmmj@mlmmj.org</=
a><br>To:  &lt;<a href=3D"mailto:inna.kutsan@bystrov.agency">inna.kutsan@by=
strov.agency</a>&gt;<br></div><br><br>Hi, this is the Mlmmj program managin=
g the &lt;<a href=3D"mailto:mlmmj@mlmmj.org" target=3D"_blank">mlmmj@mlmmj.=
org</a>&gt; mailing list.<br>
<br>
Thank you for confirming your subscription. You have now been added to the<=
br>
normal version of the list.<br>
<br>
The email address you are subscribed with is &lt;<a href=3D"mailto:inna.kut=
san@bystrov.agency" target=3D"_blank">inna.kutsan@bystrov.agency</a>&gt;.<b=
r>
<br>
If you ever wish to unsubscribe, send a message to<br>
&lt;<a href=3D"mailto:mlmmj%2Bunsubscribe@mlmmj.org" target=3D"_blank">mlmm=
j+unsubscribe@mlmmj.org</a>&gt; using this email address. The subject and t=
he<br>
body of the message can be anything. You will then receive confirmation or<=
br>
further instructions.<br>
<br>
For other information and help about this list, send a message to<br>
&lt;<a href=3D"mailto:mlmmj%2Bhelp@mlmmj.org" target=3D"_blank">mlmmj+help@=
mlmmj.org</a>&gt;.<br>
<br>
<br>
</div></div>

--000000000000667ecc0624964c99--


