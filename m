Return-Path: <mlmmj+bounces-3106-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6847CD6AB0A
	for <mlmmj@archiver.kernel.org>; Thu,  2 Apr 2026 20:26:58 +0000 (UTC)
Received: from localhost ([127.0.0.1]:49080 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3106-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w8O8Y-00BKJN-10
	for mlmmj@archiver.kernel.org;
	Thu, 02 Apr 2026 19:55:30 +0000
Received: from b.nours.eu ([54.38.177.57]:62242)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <bapt@nours.eu>)
	id 1w8O8R-00BKIZ-10
	for mlmmj@mlmmj.org;
	Thu, 02 Apr 2026 19:55:23 +0000
Received: from ehlo.thunderbird.net (unknown [IPv6:2a01:e0a:274:cc70:fc6a:e8f2:d332:f6a6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by b.nours.eu (Postfix) with ESMTPSA id 05C91134487;
	Thu, 02 Apr 2026 22:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1775160144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4ZCiv0HH7VZfZOfolGS7bmZhSS8Z64uCykvhfxqphI=;
	b=cYD1g7MiBMIgBVxmg+PGp6jK+YHtbzHR7nutb6c5UyUKC384wTWXHqbDW6w78HMGpSchI0
	TsyMJZbGOCe3+aFtGyDI3rMQnDVxuup+FdE/gh3Ed0/xFtD2o5a9p8Zei3ha7Ijw3+h2hU
	1Sc+q6BXvBclgHNQZOoc0bNNzERkd4qMFIcJOcuXgHfJKY4fS/YfGlGDFHZ5CgKVl5ASrm
	ANkECsmvZ0f4ZO2XRCvlTQ54LFH4OgOsokxeg+mVjsrKeCi7QVpLBScqJNmeitb2WgiD7y
	QXaq35tr0Vix9FpuDF7/JXl4mppqMPjyk22lgCq8G8SWpP0Ln9/6/pJCYuWz+Q==
Date: Thu, 02 Apr 2026 22:02:22 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org, webmaster@vlsc.org
Subject: Re: Call for testing: 2.0.0 is close to the doors
User-Agent: Thunderbird for Android
In-Reply-To: <091f6edc-6634-442b-8df9-e568af3f22e5@vlsc.org>
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu> <091f6edc-6634-442b-8df9-e568af3f22e5@vlsc.org>
Message-ID: <BB5393BB-F762-441D-B53E-90D772AC663A@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----3NXE35J0LBE5I34BBE23IBQDDI0YS4
Content-Transfer-Encoding: 7bit

------3NXE35J0LBE5I34BBE23IBQDDI0YS4
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

I don t think such configuration belongs to mlmmj should be imho on the MTA=
 side, for example on postfix, I think something this should cover your nee=
d

default_destination_rate_delay =3D 5s can ve configured more fine grained

Bapt


Le 2 avril 2026 21:12:32 GMT+02:00, webmaster@vlsc=2Eorg a =C3=A9crit=C2=
=A0:
>This may have already appeared in a recent rev=2E=2E=2E but I have a ques=
tion/request:
>
>Is there a tunable (or can someone create one) that would set a throttle =
on the # of emails sent within a time period (i=2Ee=2E no more than 10 emai=
ls sent per minute)?
>
>Using mlmmj, I continue to see (in my server logs) that the big email ser=
vice vendors (gmail, microsoft, comcast, etc=2E) will deliver a handful of =
emails sent their way, but then balk at some point, and send a response abo=
ut "deferring" delivery of the rest of the emails sent to them; which usual=
ly means they don't send the rest at all=2E This happens even with relative=
ly small email lists (< 150 emails)=2E With a very limited list (<12 emails=
) all emails are delivered=2E
>
>The reason I think a "throttle" tunable would be useful, is because on th=
e same server, I have separate internal processes that periodically send em=
ail notifications effectively to the same emails, based on some user-profil=
e condition=2E The code builds a custom email for each user-profile, and th=
en sends out that email and moves to the next profile=2E
>
>I have an adjustable throttle for that process, and have experimented wit=
h time intervals=2E Slowing down the deliveries does in fact get all the em=
ails delivered=2E Of course this means it slows down the time it takes to d=
eliver all the emails, but under most conditions, at least for me, that's n=
ot an issue=2E
>
>Would it be possible to add a time "throttle" tunable that would enable s=
ome control over how fast the server sends out the emails?
>
>Very respectfully,
>
>Philip
>
>
>
>On 3/29/2026 1:26 AM, Baptiste Daroussin wrote:
>> Hello Everyone
>>=20
>> In 2022, I took over the maintenance of mlmmj which I am using for the =
FreeBSD mailing lists and more=2E
>>=20
>> I am close to have delivered all the features I intended to add as such=
 I would like to stamp it with naming the next release: 2=2E0=2E0!
>>=20
>> Here is what happened since 1=2E3=2E0
>>=20
>> - Code cleanup and modernization
>> - Addition of a test suite which lead to plenty of fixes
>> - Fix many of RFC compliances issues
>> - Improved bounce email by adding the messageid to it
>> - Finish the old non finished "subrelease" feature
>> - Add autoscribe feature
>>=20
>> The new things from 1=2E8=2E0 to 2=2E0=2E0 are:
>> - new build system
>> - by default respect RFC 2919/2369 List-* and Precedence headers genera=
ted by default (can be disabled via nolistheaders)
>> - Subscription follow reply-to for confirmations
>> - X-Forwarded-To (Gmail forwarding) (xforwardedto tunables) (incompatib=
le with VERP)
>> - X-Signed-Recipient (DARA/ARC) (data tunable)=2E (Incompatible with VE=
RP)
>> - A bit of hardening
>> - some portability fixes
>> - archive partionning option (archive/YYYY/MM) with automatic migration=
 (that's per request of Gentoo people)
>>=20
>> Please test and send feedbacks!
>>=20
>> note: autotools are not needed anymore but the build workflow remain th=
e same:
>>=20
>> =2E/configure
>> make
>> make check
>>=20
>> Best regards,
>> Bapt
>>=20
>>=20
>>=20

------3NXE35J0LBE5I34BBE23IBQDDI0YS4
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!doctype html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body><div dir=3D"auto">I don t think such configuration belongs to mlmm=
j should be imho on the MTA side, for example on postfix, I think something=
 this should cover your need<br><br>default_destination_rate_delay =3D 5s c=
an ve configured more fine grained<br><br>Bapt<br></div><br><br><div class=
=3D"gmail_quote"><div dir=3D"auto">Le 2 avril 2026 21:12:32 GMT+02:00, webm=
aster@vlsc=2Eorg a =C3=A9crit=C2=A0:</div><blockquote class=3D"gmail_quote"=
 style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204,=
 204); padding-left: 1ex;">

    <font size=3D"4" face=3D"Helvetica, Arial, sans-serif">This may have
      already appeared in a recent rev=2E=2E=2E but I have a question/requ=
est:<br>
      <br>
      Is there a tunable (or can someone create one) that would set a
      throttle on the # of emails sent within a time period (i=2Ee=2E no
      more than 10 emails sent per minute)?<br>
      <br>
      Using mlmmj, I continue to see (in my server logs) that the big
      email service vendors (gmail, microsoft, comcast, etc=2E) will
      deliver a handful of emails sent their way, but then balk at some
      point, and send a response about "deferring" delivery of the rest
      of the emails sent to them; which usually means they don't send
      the rest at all=2E This happens even with relatively small email
      lists (&lt; 150 emails)=2E With a very limited list (&lt;12 emails)
      all emails are delivered=2E<br>
      <br>
      The reason I think a "throttle" tunable would be useful, is
      because on the same server, I have separate internal processes
      that periodically send email notifications effectively to the same
      emails, based on some user-profile condition=2E The code builds a
      custom email for each user-profile, and then sends out that email
      and moves to the next profile=2E&nbsp;&nbsp;<br>
      <br>
      I have an adjustable throttle for that process, and have
      experimented with time intervals=2E Slowing down the deliveries does
      in fact get all the emails delivered=2E Of course this means it
      slows down the time it takes to deliver all the emails, but under
      most conditions, at least for me, that's not an issue=2E<br>
      <br>
      Would it be possible to add a time "throttle" tunable that would
      enable some control over how fast the server sends out the emails?<b=
r>
      <br>
      Very respectfully,<br>
      <br>
      Philip<br>
      <br>
      <br>
    </font><br>
    <div class=3D"moz-cite-prefix">On 3/29/2026 1:26 AM, Baptiste
      Daroussin wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:b98dcb9ff3ce9dfbc79312d9b716917f=
fdc33a5c@nours=2Eeu">
      <pre wrap=3D"" class=3D"moz-quote-pre">Hello Everyone

In 2022, I took over the maintenance of mlmmj which I am using for the Fre=
eBSD mailing lists and more=2E

I am close to have delivered all the features I intended to add as such I =
would like to stamp it with naming the next release: 2=2E0=2E0!

Here is what happened since 1=2E3=2E0

- Code cleanup and modernization
- Addition of a test suite which lead to plenty of fixes
- Fix many of RFC compliances issues
- Improved bounce email by adding the messageid to it
- Finish the old non finished "subrelease" feature
- Add autoscribe feature

The new things from 1=2E8=2E0 to 2=2E0=2E0 are:
- new build system
- by default respect RFC 2919/2369 List-* and Precedence headers generated=
 by default (can be disabled via nolistheaders)
- Subscription follow reply-to for confirmations
- X-Forwarded-To (Gmail forwarding) (xforwardedto tunables) (incompatible =
with VERP)
- X-Signed-Recipient (DARA/ARC) (data tunable)=2E (Incompatible with VERP)
- A bit of hardening
- some portability fixes
- archive partionning option (archive/YYYY/MM) with automatic migration (t=
hat's per request of Gentoo people)

Please test and send feedbacks!

note: autotools are not needed anymore but the build workflow remain the s=
ame:

=2E/configure
make
make check

Best regards,
Bapt



</pre>
    </blockquote>
    <br>
  </blockquote></div></body>
</html>

------3NXE35J0LBE5I34BBE23IBQDDI0YS4--


