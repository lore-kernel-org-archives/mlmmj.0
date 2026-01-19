Return-Path: <mlmmj+bounces-3083-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA13CCF2DE
	for <mlmmj@archiver.kernel.org>; Mon, 19 Jan 2026 19:03:44 +0000 (UTC)
Received: from localhost ([127.0.0.1]:49630 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3083-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1vhu14-002iTh-32
	for mlmmj@archiver.kernel.org;
	Mon, 19 Jan 2026 18:30:18 +0000
Received: from mail.eden.one ([46.224.199.17]:61932)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <tech@eden.one>)
	id 1vhu0y-002iSr-01
	for mlmmj@mlmmj.org;
	Mon, 19 Jan 2026 18:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eden.one; s=mail;
	t=1768847714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C4Uu8Z/ZhF2CKj8N8RSqUn2Sk5ySW1PN8jQP1v8dAa4=;
	b=NqcknuTgVohXYFjPWmxVvFbrbRNjDKKWGIgc1XJbLL4WvEJeB9D/9IOLM5pSGpDZdjAOe6
	Rd0/qXoVH+3T4J+k0d8MKcTA5XU5XlAo1lSf+9fx4DFbLevzgSXWL79qKOc2sf8jPCOTff
	Qn5DWKVvXTRyAnocgT9BceOP6ewBWqazMcg8EKZLtr99i/KHMyK9EEI6XYzp9iTP0Lyopg
	LJIVPtJUQnegbF/3ksxcMJ9vlFMovIB6cr5XMaqEFjLH8yWbNske//gtlKAiN/2vnEUPHe
	38yOuhueQnMvUkDIj+/G1ZIWNtNzrk1yolrK3foCrgRZkSBGkixo6+JbpbGWRLebCMhjUl
	/bu+aE6QhfqoPVpppzC5+0h8YjdjlVhNGvfxBeEB7n5rgCzMU9dIwk7+D9kNNWKqqmlcds
	2kvxKZKJDcnPO6jEE4Zg9Veunr6TQVdMhm2uW4bfxgorHx9I54Q8j4Hg1uqU1gGfPHeHyq
	BMIOCLuPCXPMhKuZrpiVlmnom4W2t2qxnLxiVQ9ECoPFaKn9Ec2CHSGDYUjhTJ/jti4kXI
	Z2eDcfEzQGHn3zWYOHs+9OjkpN/nUreipkLhRbYaacJwO4NL0r0b3/GOAbOhYDNNagzY83
	7sk0Gl+t9r9jd/O14gYACBztXUDw/EcMB3MxN4eqgs9Jv9Rf5a4oM=
Authentication-Results: mail.eden.one;
	auth=pass smtp.mailfrom=tech@eden.one
Received: 
	by mail.eden.one (OpenSMTPD) with ESMTPSA id e936c661 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 19 Jan 2026 19:35:13 +0100 (CET)
Date: Mon, 19 Jan 2026 19:35:18 +0100
From: Jan Eden <tech@eden.one>
To: mlmmj@mlmmj.org
Subject: Storing names with addresses
Message-ID: <aW55ZqOEii3t9WKK@client.eden.one>
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

I would like to use mlmmj for a couple of smaller, closed lists which are
managed manually (by me). The email addresses of several subscribers are
not linked to their name, so I need to store the names with the
addresses. This is obivously possible, but not the standard scenario.

Apart from the addresses being stored in the file matching the
subscribers' first names – are there any downsides to subscribing people
like this?

/usr/local/bin/mlmmj-sub -f -L /var/spool/mlmmj/testing/ -a "John Doe <john.doe@government.ie>"

They won't be unsubscribing themselves, so a mismatch of the name and
the header they are using when sending messages does not matter.

But will I cause any trouble for the listmaster (me!)?

- Jan


