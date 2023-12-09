Return-Path: <mlmmj+bounces-3026-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A80C4167B
	for <mlmmj@archiver.kernel.org>; Sat,  9 Dec 2023 17:27:48 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3026-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rC0Xn-00E4ks-8B
	for mlmmj@archiver.kernel.org; Sat, 09 Dec 2023 16:51:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1rC0Xg-00E4kA-CT
	for mlmmj@mlmmj.org; Sat, 09 Dec 2023 16:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 88E6ACE2B20;
	Sat,  9 Dec 2023 16:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F45DC433C8;
	Sat,  9 Dec 2023 16:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702141193;
	bh=r+k9LwuFM5BtVM97fMj+NTJgyJ6E5HP1l2HegKuShvI=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Bq43NQEQGdw+lEwCRiIAshdaCRuZ6NT1DeQUdQtQsMD1euovetgWKsyKO8t36Ol3F
	 rALrFFMOAmeX5id+u/aqGb7NNzD1hWyWv52Fj2dlBKxVzNcatr0LzCYWae6uwIRRqI
	 YG2STvRIFBY3yMh9w1qTEcJ0ZsrV+R0anhujSG+c=
Date: Sat, 9 Dec 2023 11:59:52 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: mlmmj@mlmmj.org
Subject: [mlmmj] Re: bug: Index is never incremented
Message-ID: <20231209-soft-numbat-of-reading-1bd853@meerkat>
References: <20231209-watchful-screeching-marmot-a9a19f@meerkat>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231209-watchful-screeching-marmot-a9a19f@meerkat>

On Sat, Dec 09, 2023 at 11:26:39AM -0500, Konstantin Ryabitsev wrote:
> Hello:
> 
> I just realized that I have a problem with the lists that are set up to use
> 1.4.0 -- the index is never incremented.

Looks like in src/incindexfile.c where we're trying to write to a file that is
open as readonly. The following patch fixes the immediate problem, but you
probably want a test to go with it.

diff --git a/src/incindexfile.c b/src/incindexfile.c
index ce85fa2..33fc50e 100644
--- a/src/incindexfile.c
+++ b/src/incindexfile.c
@@ -51,7 +51,7 @@ int incindexfile(int listfd)
 		return 0;
 	}
 
-	fp = fdopen(fd, "r");
+	fp = fdopen(fd, "r+");
 	if (fp == NULL) {
 		log_error(LOG_ARGS, "Error fdopening index file");
 		close(fd);


-K


