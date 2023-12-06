Return-Path: <mlmmj+bounces-3020-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9215FC4167B
	for <mlmmj@archiver.kernel.org>; Wed,  6 Dec 2023 16:54:46 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3020-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rAuVl-00DcGR-T5
	for mlmmj@archiver.kernel.org; Wed, 06 Dec 2023 16:12:33 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1rAuVf-00DcFo-7R
	for mlmmj@mlmmj.org; Wed, 06 Dec 2023 16:12:27 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 348E7F90A9; Wed,  6 Dec 2023 17:21:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1701879674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=S+GCz4S3M3RLhZW9d+Z6z1biLwiZGcv222NQDubIzmQ=;
	b=MFuc7VsRkbST8/eT4MDYqdiUzodYfmB8sF2vqv+8Dt1Qk9z+bHrajDKnf9ies6S0W1F6VR
	+ywVf/jQNmJ6bOYFehPyM2nx8DWB3232qaj3JOSwGd8QUTsXLwzwVRB3uFuY/TAmOyfnp9
	bUoCDQcO7rZ4k4sfp8g2TUn7marzjQ+C03R/Z4h8fjDpPw7DJrEjS2K9EoB4ei29tsh07M
	MGEEPyX0ukkHcOiI720KTLtLlNVn1E15J7QmFCTpK/eluq8qmALvFlwnTuFa5nKEpmRWL3
	PBWO3MvSk0IkcIJhGN89cmYzS6CKnjcpOXXoC57lPZSslKiSpMii2CGuBsDaNQ==
Date: Wed, 6 Dec 2023 17:21:14 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org
Subject: [mlmmj] mlmmj 1.4.0 is now out!
Message-ID: <kpsdycifpeeuhzo3qjkxv4h7hxo7exrwfxrnjvpfqfzmem4sw2@i34opbf4lduv>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello everyone,

I am proud to announce the final release of the 1.4.0 version of mlmmj.
It is a major milestone, because this is the first version with me as a
maintainer (I hope I won't disappoint you!) and there has been a huge
refactoring of the mlmmj code itself.

As end user the Changelog is not that big:

 - Add a test suite
 - Modernize code (dprintf, posix_spawn, asprintf, getline, daemon, ...)
 - Supporting passing email to a mta over ipv6
 - Fix relaying in IPV6-only systems
 - Fix decode quoted printable subject
 - Fix parsing RFC1891
 - Fix a crash if no owner has been defined
 - Validate ranges of all integers conversion
 - New 'send' tunable to allow email passthrough
 - Add support for 'X-Original-From'
 - Reduce subscription confirmation address length to fit RFC 5321
 - Use arc4random is available
 - Reduce memory manipulation
 - When unsubscribing bouncers, keep the bounce file if something went wrong and report in syslog what went wrong
 - Remove the -b option from mlmmj-unsub, it is not used anymore
 - Fix a crash with forged probe emails
 - mlmmj-send does not need anymore absolute path
 - Use copy_file_range if available
 - Use arc4random_uniform if available
 - Logs are not limited anymore to 256 characters per lines
 - manpage converted from man(7) to mdoc(7)
 - Fix a potential crash with mail without separator between headers and body
 - mlmmj-send: -l 6 has been removed
 - mlmmj-send: accept file descriptor number as -s argument
 - mlmmj-send: accept file descriptor number as -m argument
 - cleanup .omit files leftover if moderated emails are rejected and notmetoo
 - moderation cookie for subscription is now under the sub directory moderation/subscribe
 - mlmmj-make-ml: now supports non interactive mailing list creation
 - listtext: reintegrate the tree (not a submodule anymore)
 - lots of code deduplication
 - php8 support!

Thank you to everyone who has been involved by tested, sharing ideas, sending patches!

Please report bugs, I will try to fix them quickly and cut bug fixes release as often as needed.

I don't plan to start working on the next major version before at least 6 months to focus on bug fixing.

https://codeberg.org/mlmmj/mlmmj/releases/tag/RELEASE_1_4_0

Best regards,
Bapt




