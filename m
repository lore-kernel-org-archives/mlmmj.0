Return-Path: <mlmmj+bounces-3075-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352DBC02184
	for <mlmmj@archiver.kernel.org>; Mon, 13 Jan 2025 22:25:26 +0000 (UTC)
Received: from localhost ([127.0.0.1]:38216 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3075-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1tXSZW-002EZR-3A
	for mlmmj@archiver.kernel.org;
	Mon, 13 Jan 2025 22:06:11 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171]:47221)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <dave@biff.org.uk>)
	id 1tXSZP-002EYk-15
	for mlmmj@mlmmj.org;
	Mon, 13 Jan 2025 22:06:03 +0000
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a04so23482981fa.2
        for <mlmmj@mlmmj.org>; Mon, 13 Jan 2025 14:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=biff-org-uk.20230601.gappssmtp.com; s=20230601; t=1736806226; x=1737411026; darn=mlmmj.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hxee2u0XsxnYXM8GRZbU1E30Ds7tz0dvxHryWlsCEqA=;
        b=1e/sOSBiafWQZqwK5PKHaHCa2vMOg+2UH4s+HTd1aKOEKVktE/3IZH57AK+7oYyg1U
         xbsndBPmo99AHZ/f5VHJUix5UXRgAa00w0bhz7MFuLeGI+M9m7U98Rvlmp8d0rn6LVxr
         7Yc4ccOZks7SPxi3wKTE5GJsDZwDgHrX2TalX1ztSc6vt6E/kAw7J2eNHqu3FIObQ0XO
         B02aUjQ/dJsGSJdTRs6y7a3bk/3yf/oYa57kNcfDSNIyZ+xJkit+zK2seHnls3HjffHf
         qefannzZUAzfzwwdKCA/DmJ1klerIO7xFi/o6cvdFjLhcEpsY5w0hfjIJUi94PapG1M2
         HtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736806226; x=1737411026;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hxee2u0XsxnYXM8GRZbU1E30Ds7tz0dvxHryWlsCEqA=;
        b=eSqA+hdhnl6aTVhasGOGfV53BAOJbWOHNzSM7+JP1zohbevn3KfsPC/dlGaUw8rb/5
         MbCHoEA/AMf2IlYUDHE+ZPRyieaQckJGAk0nZhXvxaAYg5fN6WYTX+qu7h+D+9fBRHYR
         iNl67Z8YOh0a4fUbRYPL2mOLlP2Q/lPlW/9YMvwparjZZXuoR+ngytL8GVzFYz1FM+Z/
         RwiKIWzmjt3/6Ngd8K70JSZHVBufTysJP7/PHt+5hTmZRHSym91Id2LPIAwHxA65Lj9a
         zuLuJ7HxDgITUbsZIc0ImKffJBiNa/mzoLN32Ml2DE8+s3FRlygV/T7s6NhkOOAh1z4v
         9X9Q==
X-Gm-Message-State: AOJu0YxBtCxwnmhVsMB0UlajY67dysjVV5AtPWtjiHejoATd61o2Y2dU
	O1jL/fKhOSwxVFJ4WDoSgKS4yK8/wfd2t72dz4P+NomjY3jIz6GAmwrlFDqlcxyMpjAeKxsaVxA
	xDAFXCMa1od2LpTyzIEZK0akukInQt/BuCFZSk6lJvB9Sioc7WJQ9
X-Gm-Gg: ASbGnctSnfFBIaEoR4y3qnJzPl5lKj1KjgetE8s3mQ7BNE+FiNtRVfBDd4NUeV3k7XT
	CTnj0FXReW/LLIt7TGrz6XeXnSrvjsoz4A0xfxQ==
X-Google-Smtp-Source: AGHT+IEbv9G0hr0L3ufFhoWBAiMT7G1TMNGcS3LKXwP0VkSL8kVVefhvKvpdKKoRnL0uqBxdK+/uxl5Dr9HnZnpeTs4=
X-Received: by 2002:a05:6512:3b22:b0:53e:2f9d:6a81 with SMTP id
 2adb3069b0e04-54284810c67mr7153810e87.39.1736806226378; Mon, 13 Jan 2025
 14:10:26 -0800 (PST)
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
From: Dave Holland <dave@biff.org.uk>
Date: Mon, 13 Jan 2025 22:10:15 +0000
X-Gm-Features: AbW1kvauocwQeTV2QRZy36eVuhhozto-XT9DT-j0-J4kIQcAGsylQuogDpmJ46s
Message-ID: <CAJ=5wKNdxVpb9KR-y-tccfh+FQD2hrtX1iXAZ9Q_GwaL=Yy7Tg@mail.gmail.com>
Subject: difficulty with Exim
To: mlmmj@mlmmj.org
Content-Type: multipart/alternative; boundary="0000000000002ade9a062b9db6a5"

--0000000000002ade9a062b9db6a5
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm having trouble getting my first list working. I'm using Exim4 on Debian
12 (bookworm). I'm using the packaged version of mlmmj, version 1.3.0-4.
I've followed the instructions in README.exim4, including the change to the
"command" setting to de-taint local_part for recent versions of Exim. I've
used the command line to create a list and subscribe an address to it.

When I try to send an email to the list, Exim logs this error:

2025-01-13 21:44:41 1tXSEj-00DBc0-0X ** testlist@biff.org.uk R=mlmmj_router
T=mlmmj_transport: Child process of mlmmj_transport transport returned 1
from command: /usr/bin/mlmmj-receive

...which isn't giving me many clues to go on.

If I invoke mlmmj-receive from the command line, and feed it a message, it
returns exit code 0.

How can I get more debug information out to see what I've done wrong?

Thanks,
Dave

--0000000000002ade9a062b9db6a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;m having trouble g=
etting my first list working. I&#39;m using Exim4 on Debian 12 (bookworm). =
I&#39;m using the packaged version of mlmmj, version 1.3.0-4. I&#39;ve foll=
owed the instructions in=C2=A0README.exim4, including the change to the &qu=
ot;command&quot; setting to de-taint local_part for recent versions of Exim=
. I&#39;ve used the command line to create a list and subscribe an address =
to it.</div><div><br></div><div>When I try to send an email to the list, Ex=
im logs this error:</div><div><br></div><div>2025-01-13 21:44:41 1tXSEj-00D=
Bc0-0X ** <a href=3D"mailto:testlist@biff.org.uk">testlist@biff.org.uk</a> =
R=3Dmlmmj_router T=3Dmlmmj_transport: Child process of mlmmj_transport tran=
sport returned 1 from command: /usr/bin/mlmmj-receive<br></div><div><br></d=
iv><div>...which isn&#39;t giving me many clues to go on.</div><div><br></d=
iv><div>If I invoke mlmmj-receive from the command line, and feed it a mess=
age, it returns exit code 0.</div><div><br></div><div>How can I get more de=
bug information out to see what I&#39;ve done=C2=A0wrong?</div><div><br></d=
iv><div>Thanks,</div><div>Dave</div><div><br></div><div><br></div><div><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div></div></div></div></d=
iv>

--0000000000002ade9a062b9db6a5--


