Return-Path: <mlmmj+bounces-3082-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC72D29C28
	for <mlmmj@archiver.kernel.org>; Mon, 19 Jan 2026 13:47:32 +0000 (UTC)
Received: from localhost ([127.0.0.1]:44732 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3082-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1vhpIS-002gKL-0u
	for mlmmj@archiver.kernel.org;
	Mon, 19 Jan 2026 13:27:56 +0000
Received: from mail.eden.one ([46.224.199.17]:51543)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <tech@eden.one>)
	id 1vhpIL-002gJe-1U
	for mlmmj@mlmmj.org;
	Mon, 19 Jan 2026 13:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eden.one; s=mail;
	t=1768829571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yVgfu2i6q6rNftbCB9zRsD/CmUtT3w+8W0dxFNcfpGs=;
	b=TCoX2Gjcmy0F9GDjqPz6bQMtwbrj9TmXuSipzeChJws/GgpawTIH6Ohy98SMhpyIExCSut
	zHOqK2Uv132fZSQ30nuMnZGyTxGH7Bg1dAWCUeKWD3vsBtbEoH1zpTS6P/2o4BboeBs1Q/
	7pUjNYzCFg+B4jZJBYiK668EQl5EkvCC1+Eo2tyy7jGzdNAdtFNlHD0ttj24z72XB50O2x
	/HpDBwZfNUMjqT2JR287tmv0qXVfNyGc9bOwTr2WCopx+RGQXKUA/Ki5xFqQWPTMwAYNf3
	ibavithdk+UgE8aqQCKwFi/2aW3XI3KRpCNrNKpp3KrXPxydl4l5q91rfDYWrXJ8eniene
	9HbQITTZnE+Gd8PVJMEat6unt6JhBHWAsPz1opDxdPrG7RH1OA05VMPKGXLohLpr1su4Dh
	ITn0anM3/kDYzaHZ3/y1C9Y9e/LOf1ac7sMk85vNKNQBe7bCVTP/9uHRU5tHH+fqxtoLc7
	t4B3EqWCwg9UBsSJaj3Dujsw0JxJyXf+1GKjBMYPOaBKu4/aAq1uVuDBaP+pLHun3gLadR
	vfIclHZdfKPshDF1jvVnVhpLP1mtuDkyhW8F30vw1yr2b4Mv0KSOa5SowieUp4KtpCiQTw
	VadL1lhqRbZebnBfgsRfzPHHwae2Qxg29qdFldaT9Oxyh0IPx4UjE=
Authentication-Results: mail.eden.one;
	auth=pass smtp.mailfrom=tech@eden.one
Received: 
	by mail.eden.one (OpenSMTPD) with ESMTPSA id b7ad591c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 19 Jan 2026 14:32:51 +0100 (CET)
Date: Mon, 19 Jan 2026 14:32:56 +0100
From: Jan Eden <tech@eden.one>
To: mlmmj@mlmmj.org
Subject: Configuration of mlmmj with OpenSMTPD
Message-ID: <aW4yiHFIdqe5YIxO@client.eden.one>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

after using Mailman3 (with Postfix) for a couple of years, I was looking
for a (much) simpler solution and found mlmmj. What a great tool. I plan
to use it with OpenSMTPD and in my initial testing, I struggled to
create an elegant, integrated configuration. The following configuration
does work –

--------------------------------------------------
table mailing_lists file:/usr/local/etc/mail/lists
action "mlmmj" expand-only virtual <mailing_lists>
match from any for rcpt-to <mailing_lists> action "mlmmj"
--------------------------------------------------

with a lists file containing entries like

--------------------------------------------------
testing@example.com "|/usr/local/bin/mlmmj-receive -L /var/spool/mlmmj/testing/"
--------------------------------------------------

But when I try to reference the mlmmj-receive binary in smtpd.conf
directly like this:

--------------------------------------------------
table mailing_lists file:/usr/local/etc/mail/lists
action "mlmmj" mda "/usr/local/bin/mlmmj-receive -L /var/spool/mlmmj/%{rcpt.user}/"
match from any for rcpt-to <mailing_lists> action "mlmmj"
--------------------------------------------------

with list entries like

--------------------------------------------------
testing@example.com testing
--------------------------------------------------

The server always returns an error message:

--------------------------------------------------
msmtp: recipient address testing@example.com not accepted by the server
msmtp: server message: 550 Invalid recipient: <testing@example.com>
--------------------------------------------------

I know that the "mda" action should work in this scenario, but I cannot
get it to work, neither in the form quoted above nor with the addition
of "virtual <mailing_lists>". I asked my question on the OpenSMTPD
mailing list, too, but no one could point me to my error (which must be
somewhere).

Thanks in advance for any hint,
Jan


