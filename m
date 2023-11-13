Return-Path: <mlmmj+bounces-3006-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584C8C4167D
	for <mlmmj@archiver.kernel.org>; Mon, 13 Nov 2023 18:18:58 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3006-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r2b8A-00AM1W-Q7
	for mlmmj@archiver.kernel.org; Mon, 13 Nov 2023 17:53:50 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <wolf@bergenheim.net>)
	id 1r2b84-00AM0r-2t
	for mlmmj@mlmmj.org; Mon, 13 Nov 2023 17:53:44 +0000
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6c4cf0aea06so3641794b3a.0
        for <mlmmj@mlmmj.org>; Mon, 13 Nov 2023 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bergenheim-net.20230601.gappssmtp.com; s=20230601; t=1699898519; x=1700503319; darn=mlmmj.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MMkKkAb7v1YC7QWEpgy4a9Fvd5pmrthtQGvceaMarDk=;
        b=cBOa9UgrOJIbr4Gasa7qFR3xPF/EhxPuH0mQUBibORI3+FgD7fch5u4LYgT1OmCCjt
         fsezcU1wraTSMMtvKFuaG4e00hdu+FN0jJ4uc0t9wV+B0pXnSZLe2lB/HFyhp6zjq7uc
         2kuZRgoz5A7RxJZbq8/BtULF+IClEGRp5I91iaDnwH5whZngJs2Z5/qkiiD3jsZkmqk4
         PSUrr8IoVBQ+/moUw34w4Xf5uvEDbhcNhXI8gbu8aWj1KsLA7uvod0j28bpLWGQfnSPG
         mVi4r0NXog5bcyVRiZpoJ6ApjlOMP7wFXDpTZp+G+Cg3l9ju3i1CopiY0iPHN3ZQYiPs
         814A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699898519; x=1700503319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMkKkAb7v1YC7QWEpgy4a9Fvd5pmrthtQGvceaMarDk=;
        b=o95NGRDai5l0t6f7VFd4Gi+i7vtyQGTHUUqjfV6sMgkFu+K1iQagwRANlDf41J++5E
         kInWKcr6UZBV3LDw2dCDI8qwyoDFPvfpL7IrY2hn+Sn+y9lE/mqO+fblzfauc4PqEL8W
         ceIefmcEOcoTkc888sdKUAOWH9TWXVwMf6dMkconW7+bkzOJDC3BJbUeAHbmtj7hZCqp
         dZYtaTMSfdJq/5y1AkUTc4fcQ0w/oF058hk6kzkQMmojhT3MbawkyxFXvPUxqsHpUqUH
         orQGlQEJC2RMhQr3MuSPA8lfs3aK99jXLX16u0kGUUUz5nimpLG/Dx2nkOpXCZiewxdO
         QnCw==
X-Gm-Message-State: AOJu0YzDGZKAJ0PmeefZm7/t+JzlPXf0U5kJz9T4vHEQkexN6+jT9pkz
	nhty16NU9xwGFnwPnh193hRG6naRurbZ8MK3UNeWcA==
X-Google-Smtp-Source: AGHT+IEvrVlb7ymSEgtRMVJoqfELIwxkl9pragxDZQ6ejjnKJ2emyyQjnwd13eP4P5EiumDSB700B+Cj3IbQ3D+9hko=
X-Received: by 2002:a17:90b:1810:b0:280:2652:d42 with SMTP id
 lw16-20020a17090b181000b0028026520d42mr8466330pjb.23.1699898519481; Mon, 13
 Nov 2023 10:01:59 -0800 (PST)
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
References: <ac835206-97e5-435a-9df4-dafbd6aa8234@posteo.net>
In-Reply-To: <ac835206-97e5-435a-9df4-dafbd6aa8234@posteo.net>
From: Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
Date: Mon, 13 Nov 2023 20:01:48 +0200
Message-ID: <CAJhTkW5jL35JwgAZP-QO1fDUOD1bRywcnAVM6xbTydZZTG6J+g@mail.gmail.com>
Subject: Re: [mlmmj] mlmmj.org website is down
To: Florian Berger <flberger-lists@posteo.net>
Cc: mlmmj@mlmmj.org
Content-Type: multipart/alternative; boundary="000000000000688715060a0c777f"

--000000000000688715060a0c777f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for reporting let me investigate

On Mon, Nov 13, 2023 at 1:33=E2=80=AFPM Florian Berger <flberger-lists@post=
eo.net>
wrote:

> Hi,
>
> attempting to look up the mlmmj online documentation, I found that the
> website is down.
>
> http://mlmmj.org/
>
> yields
>
> > Unable to connect to database.
>  >
> > A database error occurred while processing this request.
>
>
> I tried to file a bug about this, but also the bugtracker yields
>
> http://mlmmj.org/bugs/report.php
>
> > Greetings! We are experiencing an error, and in the spirit of Open
> Source would like you to fix
> > it. Or more likely, just wait and someone else will find and solve this=
.
> >
> > It's our guess that the database is down. Argh!!!
>
>
> Seems that the database is offline, which in turn breaks the site.
>
>
> Thanks for considering,
>
> Florian
>
>
>

--000000000000688715060a0c777f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for reporting let me investigate</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 13, 202=
3 at 1:33=E2=80=AFPM Florian Berger &lt;<a href=3D"mailto:flberger-lists@po=
steo.net">flberger-lists@posteo.net</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
attempting to look up the mlmmj online documentation, I found that the webs=
ite is down.<br>
<br>
<a href=3D"http://mlmmj.org/" rel=3D"noreferrer" target=3D"_blank">http://m=
lmmj.org/</a><br>
<br>
yields<br>
<br>
&gt; Unable to connect to database.<br>
=C2=A0&gt;<br>
&gt; A database error occurred while processing this request.<br>
<br>
<br>
I tried to file a bug about this, but also the bugtracker yields<br>
<br>
<a href=3D"http://mlmmj.org/bugs/report.php" rel=3D"noreferrer" target=3D"_=
blank">http://mlmmj.org/bugs/report.php</a><br>
<br>
&gt; Greetings! We are experiencing an error, and in the spirit of Open Sou=
rce would like you to fix<br>
&gt; it. Or more likely, just wait and someone else will find and solve thi=
s.<br>
&gt; <br>
&gt; It&#39;s our guess that the database is down. Argh!!!<br>
<br>
<br>
Seems that the database is offline, which in turn breaks the site.<br>
<br>
<br>
Thanks for considering,<br>
<br>
Florian<br>
<br>
<br>
</blockquote></div>

--000000000000688715060a0c777f--


