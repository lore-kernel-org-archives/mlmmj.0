Return-Path: <mlmmj+bounces-3013-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A724FC4167B
	for <mlmmj@archiver.kernel.org>; Mon, 27 Nov 2023 22:27:34 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3013-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r7jRN-00CPP5-A1
	for mlmmj@archiver.kernel.org; Mon, 27 Nov 2023 21:46:53 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1r7jRG-00CPOJ-MU
	for mlmmj@mlmmj.org; Mon, 27 Nov 2023 21:46:46 +0000
Received: from [IPv6:::1] (2a02-8428-078f-2201-ad57-fc99-5211-71b2.rev.sfr.net [IPv6:2a02:8428:78f:2201:ad57:fc99:5211:71b2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aniel.nours.eu (Postfix) with ESMTPSA id 49E3419785;
	Mon, 27 Nov 2023 22:55:21 +0100 (CET)
Date: Mon, 27 Nov 2023 22:55:22 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org, Uffe Jakobsen <uffe@uffe.org>,
 "mlmmj@mlmmj.org" <mlmmj@mlmmj.org>
Subject: Re: [mlmmj] Problem with mail sent by @orange.fr to @protonmail.com
User-Agent: K-9 Mail for Android
In-Reply-To: <cone.1701097787.573100.51016.1001@mailhost.starion.dk>
References: <2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com> <cone.1701097787.573100.51016.1001@mailhost.starion.dk>
Message-ID: <3E4F30F2-AF6B-4EC6-B896-37383F645518@nours.eu>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27 novembre 2023 16:09:47 GMT+01:00, Uffe Jakobsen <uffe@uffe=2Eorg> a =
=C3=A9crit=C2=A0:
>Pierre Cros writes:
>>=20
>> It works well even for the pretty bad admin I am=2E But I don't know wh=
ere to look to understand the following problem :
>>=20
>> =E2=80=A2=C2=A0My list works well for all users most of the time
>>=20
>> =E2=80=A2=C2=A0When a sender uses orange=2Efr SMTP to send a mail on th=
is list, the subscribers with @protonmail=2Ecom adresses won't get the mail=
 at all (not even in the spams), the other subscribers will receive it=2E
>>=20
>> =E2=80=A2=C2=A0if some @orange=2Efr sender, sends a mail directly (with=
out the list) to some @protonmail=2Ecom receiver, it works
>>=20
>> It looks like mlmmj adds something that will make mails sent by orange=
=2Efr unacceptable for @protonmail=2Ecom mail serveur=2E
>>=20
>
>The most common problem is if a list member is sending from a domain that=
 exposes SPF/DMARC information=2E
>
>Relaying such message through mlmmj (and any other mailing list) will ret=
ain the sender information - but with a new origin (the mlmmj server)
>
>If the receiving part (protonmail) inspects the SPF/DMARC (supplied by th=
e originating domain) it will propably drop the email or put it in quaranti=
ne=2E
>
>Mlmmj still nedds a proper sender rewriting feature that will rewrite the=
 sender information into something ala "Original sender name via mlmmj-list=
e-name <mlmmj-list-name@mlmmj-domain-name=2Exxx>"
>
>PS: I'm just guessing about the reasons for your described problem=2E=2E=
=2E
>
>
>/UFfe
>

Well if you don t alter the email (no subject modifications for example) a=
nd the email is signed with dkim the from munging is not required, all the =
freebsd mailing lists are setup with mlmmj and have no problems with proton=
mail and orange or any other mail provider with "strong" verification polic=
y=2E

I first went down the "munging from" path using rspamd in front of mlmmj (=
hence the new feature of suporting X_ORIGINAL_FROM in mlmmj 1=2E4=2E0)=2E B=
ut then realised that if I stop altering the emails (just play with custom =
headers) then the dkim signatures remains valid and all mail providers do a=
ccept the emails as only being relayed=2E

Best regards,
Bapt



