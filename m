Return-Path: <mlmmj+bounces-3062-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84CDC4345F
	for <mlmmj@archiver.kernel.org>; Sat,  4 May 2024 21:53:15 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3062-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s3MuQ-00662N-Ds
	for mlmmj@archiver.kernel.org; Sat, 04 May 2024 21:27:06 +0000
Received: from mail.kamar.nz ([103.158.176.251])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <kent@kamar.nz>)
	id 1s3MuJ-0065zX-5w
	for mlmmj@mlmmj.org; Sat, 04 May 2024 21:26:59 +0000
Received: from mail.kamar.nz (mail.kamar.nz [127.0.0.1])
	by mail.kamar.nz (Postfix) with ESMTP id 4VX1Js49Ctz2Jk1
	for <mlmmj@mlmmj.org>; Sun,  5 May 2024 09:39:09 +1200 (NZST)
Authentication-Results: mail.kamar.nz (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=kamar.nz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kamar.nz; h=
	x-mailer:to:references:message-id:content-transfer-encoding:date
	:in-reply-to:from:subject:mime-version:content-type; s=dkim; t=
	1714858747; x=1717450748; bh=6n3ztEjC4KvSJIjAyQaUzc/Ldr9w6IjDpDQ
	7mPC73Rg=; b=dJyfmbzLdDq8nPUeb/1KQ9Fag9/RMl3hi6t/8f8RfclIME7gJgB
	O3Dpv/tpOer4mOYY5RjDA0MjqZ8OIjQIJj07DQEg0q2QG2eIowgPSO5BJ3xVTWHL
	dcsxN3rwY0RdEtRhXqAGDMYj2d84ilLbuubXUePUeUgBhjU/PQYCEDgM=
X-Amavis-Modified: Mail body modified (using disclaimer) - mail.kamar.nz
X-Virus-Scanned: Debian amavisd-new at mail.kamar.nz
Received: from mail.kamar.nz ([127.0.0.1])
	by mail.kamar.nz (mail.kamar.nz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TypmIrNJ-uAw for <mlmmj@mlmmj.org>;
	Sun,  5 May 2024 09:39:07 +1200 (NZST)
Received: from smtpclient.apple (unknown [192.168.41.40])
	by mail.kamar.nz (Postfix) with ESMTPSA id 4VX1Jp3mV2z2JbZ;
	Sun,  5 May 2024 09:39:06 +1200 (NZST)
Content-Type: text/plain;
	charset=utf-8
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [mlmmj] Roadmap for 1.5
From: Kent <kent@kamar.nz>
In-Reply-To: <8e40c6fe4b3550052e405e068ecd13619602c4c7@nours.eu>
Date: Sun, 5 May 2024 09:39:05 +1200
Cc: mlmmj@mlmmj.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <56744C60-5732-4B4D-85AF-41A4157B2FFF@kamar.nz>
References: <8e40c6fe4b3550052e405e068ecd13619602c4c7@nours.eu>
To: Baptiste Daroussin <bapt@nours.eu>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

Hi Baptiste,

With the enforcement of SPF / DKIM / DMARC,  acting as a mailing list =
where senders aren't on the same mail server as you host is problematic =
for mailing lists where you are essentially forwarding/sending email on =
behalf of someone on another domain.

I raised this issue on this mailing list recently and you replied that =
it's semi possible when using 1.4.1, but would need to configure =
something before mlmmj like rspamd.

I appreciate that From-munging is a horrible workaround (I personally =
don't like it either) - but this is the approach that Google takes with =
their mailing lists and it's the only workaround I've identified that =
works if the senders SPF / DKIM / Dmarc records for their domain are set =
to reject email from other domains.


Do you think this is something you could add to mlmmj in 1.5 ?

I'm thinking this would be a 'frommungle' file flag.  And when present, =
automatically:
- replaces the 'FROM' with the from specified within the file.
- strips any of the original senders headers that are part of the =
original senders SPF / DMARC / DKIM checks.
- perhaps adds a X-Original-=46rom header with the original senders =
email address.



Cheers
Kent



> On 4 May 2024, at 2:39=E2=80=AFAM, Baptiste Daroussin <bapt@nours.eu> =
wrote:
>=20
> Hello everyone,
>=20
> Now that mlmmj 1.4 seems to have properly settle, I would like to =
propose a roadmap for mlmmj 1.5,
> please find here:
>=20
> =
https://codeberg.org/mlmmj/mlmmj/issues?type=3Dall&sort=3D&state=3Dopen&la=
bels=3D&milestone=3D4774&project=3D0&assignee=3D0&poster=3D0=20
>=20
> The list of tasks I plan to do before releasing mlmmj 1.5.0
>=20
> Do not hesitate to comment, discuss and propose other tasks.
>=20
> Basically 1.4 was mostly: modernize the code base (this is not =
finished, but advanced enough) and provide a test suite. for 1.5 I plan =
to cleanup features which in my opinion do not make sense anymore =
because they break fields used for DKIM signatures and implement the =
feature that has been requested by people here over the last year.
>=20
> I have no ETA for 1.5.0 it will be released when it will be released.
>=20
> Extra note, I would really love to get access to mlmmj.org to fix the =
mailing list with dkim and to be able to update the website or point it =
to codeberg.
>=20
> Best regards,
> Bapt
>=20
>=20



