Return-Path: <mlmmj+bounces-3071-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA993CF9C72
	for <mlmmj@archiver.kernel.org>; Mon, 23 Sep 2024 16:03:06 +0000 (UTC)
Received: from localhost ([127.0.0.1]:40644 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3071-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1sskra-009Sr0-2w
	for mlmmj@archiver.kernel.org;
	Mon, 23 Sep 2024 15:20:34 +0000
Received: from nours.eu ([176.31.115.77]:23170 helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <bapt@nours.eu>)
	id 1sskrT-009Sq9-21
	for mlmmj@mlmmj.org;
	Mon, 23 Sep 2024 15:20:27 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 2149011C3B7; Mon, 23 Sep 2024 17:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1727104962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=s+/IyElMJlhgsc6+PEsNvd56kRaPofPbAtiCLK6OPzk=;
	b=vVor5h1aZyw5u2tml91G3Rr6CvYo2ij+eykoH5JQstYbF0RWsKAx+ibszyUsrjuu6g/zMY
	zm7LhjHmAOsMtJOGeYXkwsMW3RtVqGIc3kQAY9Pg07/zgKB0+HMJvFBflyyNP81t+fuwzO
	4bbs2dgN4JlP1YHMePKH03s2o5fXKIE75p302Jly7G9GGxBMU/pledvf9VCpArEo6jqISW
	HdDwKWI/3iDMjLcd/vOyMvuiQhvyI8NoaP0+wgTWJ1orT6utQAtP+Z5IRyW76E8JAQFaUL
	+HujoHgfNW8WrJcInnn4t9Mw8JCi6idl7lbRoDBRNHqpfiSel7fHr9DbUKmISA==
Date: Mon, 23 Sep 2024 17:22:42 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: mlmmj@mlmmj.org
Subject: mlmmj 1.5.0 to be released soon, please test
Message-ID: <qvbiemgwwe2bzsysnuucmnoxk427dn5djk67jozjksmvph7tz5@6ntfm5btrkv7>
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

I haven't implemented all what I had in the roadmap for 1.5.0, yet it is better
to release often, so I am now planing on releasing 1.5.0 in the next couple of
weeks.

Note I am looking at someone to upgrade the debian package, I contacted the
maintainers recently, but I haven't yet received any feedback.

to test the latest version

git clone https://codeberg.org/mlmmj/mlmmj
autoreconf -i
./configure --prefix=/somewhere
make
make install

What has been done:

Breaking changes:
=================
o remove contrib/pymime
o remove contrib/foot_filter

tools like foot_filter and friends do not belong to mlmmj, if one want to use
mlmmj to alter emails it would need to grow with a very complex code to fully
parse and understand emails, decode mime type, understand html structures etc,
this is not part of mlmmj mission, if one wants this to happen, it can be done
via a preprocessing program in between the MTA and mlmmj-receive.

o Remove support for all deprecated syntax in templates

/!\ make sure to update your templates or check if needed, all the syntax that
were mark as deprecated for years have been removed /!\


New feature:
===========
o granular access rejection message in control/access

The action "deny" can be specialised with "dash-extension". The dash-extension
is used to identify the listtext to use, if present.
For example, if "deny-html" is triggered, the rejection message is loaded from
listtexts/deny-post-access-html

Bug fixes:
==========

o fix duplicated bounce recording

Best regards,
Bapt


