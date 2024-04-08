Return-Path: <mlmmj+bounces-3047-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4989C67861
	for <mlmmj@archiver.kernel.org>; Mon,  8 Apr 2024 05:52:08 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3047-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rthQq-00DIHy-Db
	for mlmmj@archiver.kernel.org; Mon, 08 Apr 2024 05:20:36 +0000
Received: from mail.kamar.nz ([103.158.176.251])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <kent@kamar.nz>)
	id 1rthQj-00DIHB-4X
	for mlmmj@mlmmj.org; Mon, 08 Apr 2024 05:20:29 +0000
Received: from mail.kamar.nz (mail.kamar.nz [127.0.0.1])
	by mail.kamar.nz (Postfix) with ESMTP id 4VCd500s8pz2JrH
	for <mlmmj@mlmmj.org>; Mon,  8 Apr 2024 17:32:04 +1200 (NZST)
Authentication-Results: mail.kamar.nz (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=kamar.nz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kamar.nz; h=
	x-mailer:to:date:message-id:subject:mime-version
	:content-transfer-encoding:content-type:from; s=dkim; t=
	1712554322; x=1715146323; bh=o9G1H0X2RvS6Dhv9YB53T5iCeR78lkYEDMd
	vGgXBWYI=; b=ix0Aa3wb1EPizKYCzz8XxRDFR2KS8noodg6PtrxPe7hZneNquQ4
	C5eIh0nQTfkHc1WK4qh8cm332RklKsgfiV3cxWk5D4ajdOBhw5kvHDcY03s7RcX9
	ppczlM98SlY5292+BuxghV5lipED+ADW4jmXMtdshODc9idRmrs3QbYA=
X-Amavis-Modified: Mail body modified (using disclaimer) - mail.kamar.nz
X-Virus-Scanned: Debian amavisd-new at mail.kamar.nz
Received: from mail.kamar.nz ([127.0.0.1])
	by mail.kamar.nz (mail.kamar.nz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VXgitjkCuJtI for <mlmmj@mlmmj.org>;
	Mon,  8 Apr 2024 17:32:02 +1200 (NZST)
Received: from smtpclient.apple (unknown [192.168.41.40])
	by mail.kamar.nz (Postfix) with ESMTPSA id 4VCd4y04gZz2Jn9
	for <mlmmj@mlmmj.org>; Mon,  8 Apr 2024 17:32:01 +1200 (NZST)
From: Kent <kent@kamar.nz>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: [mlmmj] Mailing Lists and DKIM signing breaking when sender DKIM policy is REJECT
Message-Id: <81DB5D4E-7D63-4B97-8DCB-320872DDB801@kamar.nz>
Date: Mon, 8 Apr 2024 17:32:01 +1200
To: mlmmj@mlmmj.org
X-Mailer: Apple Mail (2.3774.500.171.1.1)

Hi All,

We run a mailing list using mlmmj on our mail server.  Recently I've had =
clients report that emails either aren't delivered to some recipients or =
end up in spam for other recipients.  This started Feb apparently.

Digging into it further, I discovered that the client in question had =
set up their DMARC policy to REJECT.

This meant whenever they sent an email via our mailing list, their =
original dkim signature, after us forwarding on, was failing. And =
depending on the destination mail server it was either rejected =
completely (eg. mac.com) or sent to spam (eg. Google.com).


I set up a Google mailing list and looked into how they handle mailing =
lists.  It appears they strip out all relevant authentication headers =
and replace the 'FROM' with:   "'Sender Name' via List Name" =
<listname@google.com>

And based on this I have got to the point where I've replicated this =
behaviour, stripping the relevant headers and replacing the 'From' with =
the list name.

The only thing I haven't worked out is how to insert the original =
senders name into the 'From' so each message at least looks like it came =
from someone different.


Anyone have any ideas on how I can achieve this last bit in the puzzle ?

Thanks
Kent.



I followed these instructions:  http://mlmmj.org/docs/tunables/

1) Edited 'contentheaders' to:
----
Precedence: bulk
From: List Name <listname@domain.nz>
X-Mailing-List: listname@domain.nz
List-Id: <listname@domain.nz>
List-Post: <mailto:listname@domain.nz>
List-Subscribe: <mailto:listname+subscribe@domain.nz?subject=3DSubscribe>
List-Unsubscribe: =
<mailto:listname+unsubscribe@domain.nz?subject=3DUnsubscribe>
----

2) Edited 'delheaders' to:
----
From:
DKIM-Signature:
X-Google-DKIM-Signature:
X-Gm-Message-State:
X-Google-Smtp-Source:
Authentication-Results:
ARC-Seal:
ARC-Message-Signature:
ARC-Authentication-Results:
-----




