Return-Path: <mlmmj+bounces-3007-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44579C4332F
	for <mlmmj@archiver.kernel.org>; Mon, 13 Nov 2023 18:49:28 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3007-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r2bNV-00AMGe-Bh
	for mlmmj@archiver.kernel.org; Mon, 13 Nov 2023 18:09:41 +0000
Received: from mail-pg1-f182.google.com ([209.85.215.182])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <wolf@bergenheim.net>)
	id 1r2bNO-00AMFk-M6
	for mlmmj@mlmmj.org; Mon, 13 Nov 2023 18:09:34 +0000
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3701682a12.3
        for <mlmmj@mlmmj.org>; Mon, 13 Nov 2023 10:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bergenheim-net.20230601.gappssmtp.com; s=20230601; t=1699899470; x=1700504270; darn=mlmmj.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+kZfT5x2TmUXT7UB6FpPqUE15vL3NSWv+E27/HKfAmc=;
        b=Sk4p2YXr7i/CPCf42twaxqAf11xIofi+D5FoKEYl5czJpds/MrUCiBgX2fqXGY8BQe
         RIs6jjV42Jxxhsn2ZdJzUaFS4i+v2xONXX+iMI6/F6JPllcFd3quo83ZRONmNa6u3cqp
         a8Gi5J/LKCuuY93ohlL/qckna+h91I6sSfjaoCjO7RgGAJ84XWSNjOD1r3QHb0fY7rQA
         OXmWxsuw258Wluu76ILo8C9wXG1h2V1wYpFKa8+oN/Doys2tQgNwvqwQvfWssYG0aVKu
         3jgGMRC3r+8b1ZygoqE424DS0uthYq0+KhLJU4Jw/Wid3hj7OfVwFJ85GAZ671RxuGFa
         XEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899470; x=1700504270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kZfT5x2TmUXT7UB6FpPqUE15vL3NSWv+E27/HKfAmc=;
        b=EslHsrI/sQ/sdGLpM/tvGUm7jqUJFtelAef0vrxlZN5v4P86vljLQ9EOQgRXfPODkn
         02PUgybK+WlYcvhfktmN++EM0WUs0yy+aBDKYVkh79ylYyJuH33Ai3mgYmy17no+xxdv
         W+oKLXbu5dHAx9qKBwTd9rZWqUJ05iklvE0KTgxyL+imjJCcLDtIYH2B7nxkS5eZ8UvS
         jWFvjY0KFcg2gV8LsxAZvZjkhYl4O1WmcZHVgewHe5I9TOaeeyVowFRpXiozC2NbJwzC
         b8PNsazj7Wj6tQ6pTj4gM4z3XAElcQTL3aNVnbe9aD0MeVxvICI+kXRBt8a6mhzJNBlE
         MrAA==
X-Gm-Message-State: AOJu0Yy3AbI4emEGrcWXwc0vtifeKM/azL8rcZkPdMCSqaIoazlit+7j
	CIVuuQzH0BygTS2dY8HfQLsX63q4qtryh90tuxZpf57uIFCzZJ+f
X-Google-Smtp-Source: AGHT+IHh95Wn8p0NyheMbUA0MCFPyuoeh1xcSeZgmCqnQaNRDHbsCTDkfgNDIeT6IGfkk9R2JrYBCueOVutaZ6EL2CE=
X-Received: by 2002:a05:6a20:1602:b0:136:e26b:6401 with SMTP id
 l2-20020a056a20160200b00136e26b6401mr9798113pzj.16.1699899469509; Mon, 13 Nov
 2023 10:17:49 -0800 (PST)
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
References: <ac835206-97e5-435a-9df4-dafbd6aa8234@posteo.net> <CAJhTkW5jL35JwgAZP-QO1fDUOD1bRywcnAVM6xbTydZZTG6J+g@mail.gmail.com>
In-Reply-To: <CAJhTkW5jL35JwgAZP-QO1fDUOD1bRywcnAVM6xbTydZZTG6J+g@mail.gmail.com>
From: Wolf Bergenheim <wolf+mlmmj@bergenheim.net>
Date: Mon, 13 Nov 2023 20:17:38 +0200
Message-ID: <CAJhTkW5DBzNMUQ+mURAgZiQ1VKWvdQCbsu+pWTnjOCWsWxsTdw@mail.gmail.com>
Subject: Re: [mlmmj] mlmmj.org website is down
To: Florian Berger <flberger-lists@posteo.net>
Cc: mlmmj@mlmmj.org
Content-Type: multipart/alternative; boundary="00000000000008cb29060a0cb0ae"

--00000000000008cb29060a0cb0ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

the DB required a restart.

On Mon, Nov 13, 2023 at 8:01=E2=80=AFPM Wolf Bergenheim <wolf+mlmmj@bergenh=
eim.net>
wrote:

> Thanks for reporting let me investigate
>
> On Mon, Nov 13, 2023 at 1:33=E2=80=AFPM Florian Berger <flberger-lists@po=
steo.net>
> wrote:
>
>> Hi,
>>
>> attempting to look up the mlmmj online documentation, I found that the
>> website is down.
>>
>> http://mlmmj.org/
>>
>> yields
>>
>> > Unable to connect to database.
>>  >
>> > A database error occurred while processing this request.
>>
>>
>> I tried to file a bug about this, but also the bugtracker yields
>>
>> http://mlmmj.org/bugs/report.php
>>
>> > Greetings! We are experiencing an error, and in the spirit of Open
>> Source would like you to fix
>> > it. Or more likely, just wait and someone else will find and solve thi=
s.
>> >
>> > It's our guess that the database is down. Argh!!!
>>
>>
>> Seems that the database is offline, which in turn breaks the site.
>>
>>
>> Thanks for considering,
>>
>> Florian
>>
>>
>>

--00000000000008cb29060a0cb0ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">the DB required a restart.</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 13, 2023 at 8:01=E2=
=80=AFPM Wolf Bergenheim &lt;<a href=3D"mailto:wolf%2Bmlmmj@bergenheim.net"=
>wolf+mlmmj@bergenheim.net</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr">Thanks for reporting let me inve=
stigate</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Nov 13, 2023 at 1:33=E2=80=AFPM Florian Berger &lt;<a href=
=3D"mailto:flberger-lists@posteo.net" target=3D"_blank">flberger-lists@post=
eo.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi,<br>
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
</blockquote></div>

--00000000000008cb29060a0cb0ae--


