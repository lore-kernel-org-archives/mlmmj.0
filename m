Return-Path: <mlmmj+bounces-3028-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B64DC10DC3
	for <mlmmj@archiver.kernel.org>; Mon, 11 Dec 2023 18:51:43 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3028-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rCklI-00ER6V-PS
	for mlmmj@archiver.kernel.org; Mon, 11 Dec 2023 18:12:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1rCklC-00ER5n-4H
	for mlmmj@mlmmj.org; Mon, 11 Dec 2023 18:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 190DCB80FEA;
	Mon, 11 Dec 2023 18:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A076C433C7;
	Mon, 11 Dec 2023 18:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702318860;
	bh=HlrS4HscZUPwDFgIX4/VNw66D6fq/NXWqPulJz2QxE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5oFJy5T5EwJWntE0sADmXQ3FiBkHHCkYJCYr3YVHwdRdTYkDffH0GEksdXyZ8u1T
	 mLgnAf/cIgbfcStNjdxIIsoLLgp4ireh8utMB6X+UeG5kp1INGbWJTV6YKYCkypGZn
	 DIqlZ48kw2omLJcTMXY0xgInlI9WfMu1K7XXOUhc=
Date: Mon, 11 Dec 2023 13:20:59 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Baptiste Daroussin <bapt@nours.eu>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] Re: bug: Index is never incremented
Message-ID: <20231211-monumental-ruddy-albatross-5ad294@meerkat>
References: <20231209-watchful-screeching-marmot-a9a19f@meerkat>
 <20231209-soft-numbat-of-reading-1bd853@meerkat>
 <6xirowbbyhawpytmq5e3vv33bxsy7orhpyfysunyhanpasxivi@2aesfxdlzlyh>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6xirowbbyhawpytmq5e3vv33bxsy7orhpyfysunyhanpasxivi@2aesfxdlzlyh>

On Sat, Dec 09, 2023 at 08:23:11PM +0100, Baptiste Daroussin wrote:
> > diff --git a/src/incindexfile.c b/src/incindexfile.c
> > index ce85fa2..33fc50e 100644
> > --- a/src/incindexfile.c
> > +++ b/src/incindexfile.c
> > @@ -51,7 +51,7 @@ int incindexfile(int listfd)
> >  		return 0;
> >  	}
> >  
> > -	fp = fdopen(fd, "r");
> > +	fp = fdopen(fd, "r+");
> >  	if (fp == NULL) {
> >  		log_error(LOG_ARGS, "Error fdopening index file");
> >  		close(fd);
> > 
> > 
> > -K
> > 
> > 
> 
> Thank you for the fix, I wonder why the index was not broken for my freebsd
> mailing list using it, it actually is, simply I tested on mailing list without
> archives (bummer) meaning the index does not matter much :(

Just to confirm that everything appears to be working smoothly. I will be
enabling 1.4.1 on more lists this week, including some large-volume ones. If
there are any problems, I will report.

> The testsuite was also too naive.
> 
> 1.4.1 is now out fixing the issue, and the testsuite extended to be less naive
> 
> Sorry about that ridiculous bug :(

Hey, no worries. :) It's one of those bugs that don't manifest themselves
unless you're doing something very specific (like sending digests).

Best regards,
-K


