Return-Path: <mlmmj+bounces-3049-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C30BCD1292
	for <mlmmj@archiver.kernel.org>; Mon,  8 Apr 2024 22:59:17 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3049-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rtxDf-00DS0V-39
	for mlmmj@archiver.kernel.org; Mon, 08 Apr 2024 22:12:03 +0000
Received: from mail.kamar.nz ([103.158.176.251])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <kent@kamar.nz>)
	id 1rtxDY-00DRze-0Q
	for mlmmj@mlmmj.org; Mon, 08 Apr 2024 22:11:56 +0000
Received: from mail.kamar.nz (mail.kamar.nz [127.0.0.1])
	by mail.kamar.nz (Postfix) with ESMTP id 4VD3X15Bhmz2Jmt
	for <mlmmj@mlmmj.org>; Tue,  9 Apr 2024 10:23:29 +1200 (NZST)
Authentication-Results: mail.kamar.nz (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=kamar.nz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kamar.nz; h=
	x-mailer:to:references:message-id:content-transfer-encoding:date
	:in-reply-to:from:subject:mime-version:content-type; s=dkim; t=
	1712615008; x=1715207009; bh=RNTMt9+4MXCbrazF91TN84xLiOZX7BBpdvM
	6NFKqMeQ=; b=1fEyxWXkIC72PVrzkd3JbBGdb1bojmH4Dl1cLWwdZkZfHpiqU8w
	X79rlAaFo1pABH0wWdtv7eUJlaYs/xXNrjLGRjkRTgzb4f6zYve/BBQkdN4Efd+0
	dtutKULwyXcDdFRlvDVvYK8lr616esRBupZdXd8V04i0S6cGu2fEV+1E=
X-Amavis-Modified: Mail body modified (using disclaimer) - mail.kamar.nz
X-Virus-Scanned: Debian amavisd-new at mail.kamar.nz
Received: from mail.kamar.nz ([127.0.0.1])
	by mail.kamar.nz (mail.kamar.nz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1P0Ei3YV3494 for <mlmmj@mlmmj.org>;
	Tue,  9 Apr 2024 10:23:28 +1200 (NZST)
Received: from smtpclient.apple (kent-wifi.kamar.nz [10.0.3.41])
	by mail.kamar.nz (Postfix) with ESMTPSA id 4VD3Wz6dyWz2JWC;
	Tue,  9 Apr 2024 10:23:27 +1200 (NZST)
Content-Type: text/plain;
	charset=utf-8
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [mlmmj] Mailing Lists and DKIM signing breaking when sender DKIM
 policy is REJECT
From: Kent <kent@kamar.nz>
In-Reply-To: <ab501d33-6446-40dc-bf91-e6d3c3a3b00e@deganius.de>
Date: Tue, 9 Apr 2024 10:23:27 +1200
Cc: Christof Thalhofer <chrisml@deganius.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7055F300-DB55-48CC-BDFD-A54D456559AA@kamar.nz>
References: <81DB5D4E-7D63-4B97-8DCB-320872DDB801@kamar.nz>
 <ab501d33-6446-40dc-bf91-e6d3c3a3b00e@deganius.de>
To: mlmmj@mlmmj.org
X-Mailer: Apple Mail (2.3774.500.171.1.1)

Hi Christof,

Thanks for the reply - and yes, it's From-munging that I'm wanting to be =
able to do.


I want to be able to:
1) Insert [ListName] into the start of the subject.
2) Make it so when someone uses 'Reply' (not Reply-All), that their =
reply comes back to the list by default. This means either the 'From' or =
'Reply-To' has to be set to the list address.

However doing either/both these actions is invalidating the original =
senders dkim and then its delivery is dependant on the dmarc policy of =
the original user (and anything other than a policy of none means =
delivery isn't guaranteed).


The guide you referenced highlights the issue.

1) If mlmmj just passes on the message unmodified, then the original =
senders dkim is checked (and should pass).

2) if mlmmj modifies the subject and/or adds another header (eg =
Reply-To:) then depending on the original senders dkim criteria (eg. =
Google includes Reply-To in their dkim signature) will fail in this =
case.  And when it fails, it may send or not depending on their DMARC =
policy.
This is exactly what was happening in our case.



I note this mailing list:

1) Modifies the 'Subject' by inserting [mlmmj] at the start - this will =
invalidate the original senders dkim.

2) Sets the 'Sender:' header, however this didn't make any difference =
when I used 'Reply'  It wasn't until I clicked 'Reply All' that the list =
was added as a recipient (and the Cc recipient) and hence why I was =
originally setting the 'Reply-To:' header.



What's the process to request a flag to make this option available ?

As much as I avoid Google myself, the enforcing by Google and Yahoo of =
SPF, DKIM and DMARC means you are needing to do what they do like it or =
not, and their own mailing lists are From-munging !


Cheers
Kent



> On 8 Apr 2024, at 6:23=E2=80=AFPM, Christof Thalhofer =
<chrisml@deganius.de> wrote:
>=20
> Am 08.04.24 um 07:32 schrieb Kent:
>=20
>> The only thing I haven't worked out is how to insert the original
>> senders name into the 'From' so each message at least looks like it
>> came from someone different.
>> Anyone have any ideas on how I can achieve this last bit in the
>> puzzle ?
>=20
> Mlmmj cannot do From-munging. But if you don't break DKIM-Signatures =
by altering headers like From, Subject, Body and Reply-To the mails from =
your mailinglist will be accepted.
>=20
> https://begriffs.com/posts/2018-09-18-dmarc-mailing-list.html
>=20
> Alles Gute
>=20
> Christof Thalhofer
>=20
> --=20
> Dies ist keine Signatur
>=20
>=20
>=20



