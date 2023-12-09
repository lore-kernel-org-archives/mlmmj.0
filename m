Return-Path: <mlmmj+bounces-3027-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F1BC4167B
	for <mlmmj@archiver.kernel.org>; Sat,  9 Dec 2023 19:50:29 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3027-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rC2mQ-00E683-2A
	for mlmmj@archiver.kernel.org; Sat, 09 Dec 2023 19:14:26 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1rC2mJ-00E67N-FV
	for mlmmj@mlmmj.org; Sat, 09 Dec 2023 19:14:19 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id E5D08FBD43; Sat,  9 Dec 2023 20:23:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1702149791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8eB/MJMeOpZB1rKS/2Yqa1nUnMIuEKgATZkcihjDlMY=;
	b=B+5awMa1WA8Fp1s39iXcU/3jS3JE++BGdDYnXZ3BE2A3z8xhrwpPA/p4+7PYyy0RaSYO5C
	Bk7twN4byVOpw89ZgPbSiKZ3/V7Sr36W9hal92AGO3aiGbPPGGyPYXmBe+3Gmn4uNBvRHj
	kZIuGxobgNRAQr98yaPfKf++1AZK25unvU1vobC+E/0hIJSj/1M2gF4EcRKKjlXT2SwA7P
	xEsswmGPKuVU4uEQ0IdN7FL8OSV5FOpNJPwP5CGZrVA894HwrKj16KEJWm3AJ9ck5Pki3Y
	LO34xbNpBHYt7yY/FqdbDKmp2hYQK8qdHvegNYfmERYPQQsqLL/NDd1MOp1dTQ==
Date: Sat, 9 Dec 2023 20:23:11 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] Re: bug: Index is never incremented
Message-ID: <6xirowbbyhawpytmq5e3vv33bxsy7orhpyfysunyhanpasxivi@2aesfxdlzlyh>
References: <20231209-watchful-screeching-marmot-a9a19f@meerkat>
 <20231209-soft-numbat-of-reading-1bd853@meerkat>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209-soft-numbat-of-reading-1bd853@meerkat>

On Sat, Dec 09, 2023 at 11:59:52AM -0500, Konstantin Ryabitsev wrote:
> On Sat, Dec 09, 2023 at 11:26:39AM -0500, Konstantin Ryabitsev wrote:
> > Hello:
> > 
> > I just realized that I have a problem with the lists that are set up to use
> > 1.4.0 -- the index is never incremented.
> 
> Looks like in src/incindexfile.c where we're trying to write to a file that is
> open as readonly. The following patch fixes the immediate problem, but you
> probably want a test to go with it.
> 
> diff --git a/src/incindexfile.c b/src/incindexfile.c
> index ce85fa2..33fc50e 100644
> --- a/src/incindexfile.c
> +++ b/src/incindexfile.c
> @@ -51,7 +51,7 @@ int incindexfile(int listfd)
>  		return 0;
>  	}
>  
> -	fp = fdopen(fd, "r");
> +	fp = fdopen(fd, "r+");
>  	if (fp == NULL) {
>  		log_error(LOG_ARGS, "Error fdopening index file");
>  		close(fd);
> 
> 
> -K
> 
> 

Thank you for the fix, I wonder why the index was not broken for my freebsd
mailing list using it, it actually is, simply I tested on mailing list without
archives (bummer) meaning the index does not matter much :(

The testsuite was also too naive.

1.4.1 is now out fixing the issue, and the testsuite extended to be less naive

Sorry about that ridiculous bug :(

Bapt


