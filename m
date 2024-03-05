Return-Path: <mlmmj+bounces-3042-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB62C54E41
	for <mlmmj@archiver.kernel.org>; Tue,  5 Mar 2024 16:34:20 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3042-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rhX6u-003OCg-UU
	for mlmmj@archiver.kernel.org; Tue, 05 Mar 2024 15:53:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1rhX6n-003OBw-V4
	for mlmmj@mlmmj.org; Tue, 05 Mar 2024 15:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA309CE13A6;
	Tue,  5 Mar 2024 16:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE6CC43399;
	Tue,  5 Mar 2024 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709654665;
	bh=dIrCErSNsve40NfpIaXhYJOE46jg8NzI1OV4/GQlDhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yob1+WQThK880CCy8bkTaUAbKBIigpQA3wYIR2BsA2TasHtTokkAYr5HRAbUMYxpq
	 jtiay6eTRTTdpIn4LNjSdSS5/IkX3EDQFbvoMneXpaZZ4MJlAkR0nJnMh6VfF7BX7Q
	 bjUNPzzkSrH5Y8Y6WKS7PrKeC0qq9aQyYK2P2LvI=
Date: Tue, 5 Mar 2024 11:04:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christof Thalhofer <chrisml@deganius.de>
Cc: "mlmmj@mlmmj.org" <mlmmj@mlmmj.org>
Subject: Re: [mlmmj] What do you do with Gmail accounts?
Message-ID: <20240305-futuristic-arcane-potoo-f2bb4f@meerkat>
References: <835f7d93-96e1-4101-839c-6ce02acd0d2b@deganius.de>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <835f7d93-96e1-4101-839c-6ce02acd0d2b@deganius.de>

On Tue, Mar 05, 2024 at 11:35:33AM +0100, Christof Thalhofer wrote:
> Hello,
> 
> I migrated a couple of Mls from Mailman2 to Mlmmj (1.3).
> 
> With MM2 we did Reply-To-Munging (replaced the original Reply-To header with
> 'Reply-To: list@listserver'.
> 
> Mlmmj does not allow this. I can add 'Reply-To: address@list' but I cannot
> delete 'Reply-To: from@home' with delheaders because then Mlmmj also removes
> the 'From:' header ... why ???
> 
> So if I set 'Reply-To:  list@listserver' in customheaders there are often
> two 'Reply-To:' in the headers of an outgoing mail:
> 
> 'Reply-To: from@home' (set by the author of the mail)
> 'Reply-To:  list@listserver' (set by Mlmmj)
> 
> which causes Gmail to bounce that mail.
> 
> Now we have the problem with a mailinglist that Gmail does not have a
> 'reply-to-list'-button.
> 
> It has the options 'reply' and 'reply to all'.
> 
> 'reply' answers to the address in 'From:' and the mail doesn't go to the
> list.
> 
> 'reply to all' answers to the addresses in 'From:' and 'List-Post:' creating
> dupes at the person whose mail was answered.
> 
> Reply-To-munging seems to be the only way to give Gmail-users the
> possibility to answer direct to the list. But is is impossible to be done in
> Mlmmj.
> 
> What to do?

If you rewrite headers such as Reply-To, this will almost certainly invalidate
the DKIM signature of the original message if you also keep the original
"From:" header. If you want to modify any signed headers, you *must* rewrite
the From: address.

There are only two possible solutions when it comes to mailing lists these
days:

1. Don't touch any headers, only add List-* headers (e.g. List-ID)
2. If you do change any headers, you *must* also rewrite the original From:
   header (e.g. by moving it to X-Original-From:), because otherwise you will
   violate DKIM/DMARC policies of the sender's domain

-K


