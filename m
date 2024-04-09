Return-Path: <mlmmj+bounces-3051-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98969C67861
	for <mlmmj@archiver.kernel.org>; Tue,  9 Apr 2024 08:53:06 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3051-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1ru6wR-00DZJK-Pr
	for mlmmj@archiver.kernel.org; Tue, 09 Apr 2024 08:34:55 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1ru6wL-00DZIa-0p
	for mlmmj@mlmmj.org; Tue, 09 Apr 2024 08:34:49 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id DEDD91AF3E6; Tue,  9 Apr 2024 10:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1712652387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ey9rLiohuj+hLqedey54Gp1b5OaDTupCywgG+JmVK/Y=;
	b=rbP2mkl3hJf8Nb8FvOgcQHSnv3EuEwLFZgrbPoKiEVfzgm5XQzlVlaZwOpjvCAEzBG5zs6
	CnjQRkN+ZeyfwYD136kUoWndY+a26nBuNE8nyMDjJOLqHIbyxK2Y6kE5JPkoHc+K8Db9/E
	dxWYiQxLWZXsxsO2MNORmycd5JimgxzASB+R8lJC3RJUF4BmPfFJYNlq3es0q8VYuvpTw9
	txCGcwRJIeQbV6kZJi5HIT/inVfaIvCEPot2kHe04gkohut9yzPOq51LCANOTDghVCDiKL
	bzQfzh6bHF/kw16BgzR9GgYTWd0W4HaDmyHA/HWP8QEbOVHbKmU+fYmEMz4dVQ==
Date: Tue, 9 Apr 2024 10:46:27 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: Christof Thalhofer <chrisml@deganius.de>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] Mailing Lists and DKIM signing breaking when sender DKIM
 policy is REJECT
Message-ID: <akzm25ybse7v7m24fd3qt3glhi3j2khyvnpd43n7f2mvbqp4pz@h2hhcdwasj3a>
References: <81DB5D4E-7D63-4B97-8DCB-320872DDB801@kamar.nz>
 <ab501d33-6446-40dc-bf91-e6d3c3a3b00e@deganius.de>
 <7055F300-DB55-48CC-BDFD-A54D456559AA@kamar.nz>
 <dcdcd149-e5f8-4094-bf3e-c5c1b91b52f3@deganius.de>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcdcd149-e5f8-4094-bf3e-c5c1b91b52f3@deganius.de>

On Tue 09 Apr 09:40, Christof Thalhofer wrote:
> Am 09.04.24 um 00:23 schrieb Kent:
> 
> > I note this mailing list:
> > 
> > 1) Modifies the 'Subject' by inserting [mlmmj] at the start - this
> > will invalidate the original senders dkim.
> > 
> > 2) Sets the 'Sender:' header, however this didn't make any difference
> > when I used 'Reply'  It wasn't until I clicked 'Reply All' that the
> > list was added as a recipient (and the Cc recipient) and hence why I
> > was originally setting the 'Reply-To:' header.
> 
> I'm not the maintainer of this ML. Seems that it's a long time ago since it
> was configured and so it 'naturally' filters out every Gmail account that
> bounces.

If only I had access to the website and the mailing list I would reconfigure it
to be dkim compliant but also update the website to actually tell about the
1.4.x series.
> 
> > What's the process to request a flag to make this option available ?
> > 
> > As much as I avoid Google myself, the enforcing by Google and Yahoo
> > of SPF, DKIM and DMARC means you are needing to do what they do like
> > it or not, and their own mailing lists are From-munging !
> 
> If you want to do From-munging then Mlmmj is the wrong software for you.
> Sympa can do that but that's another beast.
> 
> I configured my mailinglists so that the original DKIM signatures are kept
> (no prefix, no footer, no extra Reply-To) and wrote in
> 'control/customheaders':
> 

You can configure From-munging with mlmmj, but yes this is not in mlmmj. you
will need mlmmj 1.4.x which supports X-Original-From and configure something
before mlmmj reception like rspamd which will do the munging and move the From
into the X-Original-From.

rspamd will only munge when the email is sent from a sender which has a very
restrictive DMARC policy.

In rspamd the configuration is easy:

in dmarc.conf:
```
munging {
	list_map =  "/usr/local/mlmmj/rspamd-munging";
	mitigate_strict_only = true;
}
```


in rspamd-munging files you have the list address you expect to munge from.

Note that this feature was specifically designed for mlmmj :D
https://github.com/rspamd/rspamd/issues/3647

This was done to help migration from mailman to mlmmj for the FreeBSD project

We don't use it anymore in the FreeBSD project as we don't alter anymore fields
use in the dkim signatures.

> > Precedence: list List-Id: User Mailing List <user.example.com>
> > List-Unsubscribe: <https://example.com/>,
> > <mailto:user+unsubscribe@example.com?subject=unsubscribe> List-Post:
> > <mailto:user@example.com> List-Help:
> > <mailto:user+help@example.com?subject=help> List-Subscribe:
> > <http://example.com/>,
> > <mailto:user+subscribe@example.com?subject=subscribe> Sender:
> > <user@example.com> Mail-Followup-To: <user@example.com>
> 
> The 'Mail-Followup-To:'-header makes it possible that Gmail-Users can hit
> Reply-to-all to answer to the list.
> 
> And then I said to the users they should answer to the list or to all and
> filter their mail for 'To: user@example.com' and that works now.
> 
I did not know the Mail-Followup-To trick, I will look into it ;)

Best regards,
Bapt


