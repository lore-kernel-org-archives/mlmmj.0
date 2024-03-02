Return-Path: <mlmmj+bounces-3037-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CD1C54798
	for <mlmmj@archiver.kernel.org>; Sat,  2 Mar 2024 22:27:00 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3037-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rgXCh-002cvR-O2
	for mlmmj@archiver.kernel.org; Sat, 02 Mar 2024 21:47:35 +0000
Received: from degmail.deganius.de ([162.55.175.133])
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <chrisml@deganius.de>)
	id 1rgXCa-002cun-TN
	for mlmmj@mlmmj.org; Sat, 02 Mar 2024 21:47:28 +0000
Received: from mail.wacker.deganius.de (p578c211e.dip0.t-ipconnect.de [87.140.33.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by degmail.deganius.de (Postfix) with ESMTPSA id E3FED1787CC
	for <mlmmj@mlmmj.org>; Sat,  2 Mar 2024 22:58:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=deganius.de; s=2021;
	t=1709416696; bh=8acsNQerkvf/X+0zdyezl0g9Tu4oUYp2O5RMJaddVUA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZGpYc97fihXTtk6d6ywZ78PaH6UPUR35UxK4WbbaGzahc5IrGtCFiNccAS+pB8yQO
	 hPpdTiqDBt1lupZ64CVhcGKFSPZGXMcePaDFVWiF7fS+oyIRUQGwNj/70ASgDvZVrR
	 xf7wvhPgoiA4+87pZS+NskyLbySGmX82yS/iKxFxCv+/SCgCZE102QgvZOVylBzHCK
	 gv66da9h/tfdMgLgVOFnXqYEq8Cav8wQSriWaORiiqPAxX3cqc9WauQSlw/z3JXGyw
	 fMcvpET93lFmlhLxdu45LTrT9H5fz01rZ0ZIsCyl5N8/NaFcUpdzAdpObhnl4rh0O3
	 nA4Xs7hPdVfNw==
Received: from [172.16.31.6] (unknown [172.16.31.6])
	by mail.wacker.deganius.de (Postfix) with ESMTP id 5F6316EE2EF1
	for <mlmmj@mlmmj.org>; Sat,  2 Mar 2024 22:58:16 +0100 (CET)
Message-ID: <9dfa1f9e-f566-478c-9234-2f8fe776f5cd@deganius.de>
Date: Sat, 2 Mar 2024 22:58:16 +0100
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mlmmj] 150 email list - only ~100 emails actually sent out, per
 the exim main.log and member reports
Content-Language: en-US
To: mlmmj@mlmmj.org
References: <4c8b7b95-9fcd-41f7-a482-6d9d91988b63@vlsc.org>
From: Christof Thalhofer <chrisml@deganius.de>
Organization: Deganius
In-Reply-To: <4c8b7b95-9fcd-41f7-a482-6d9d91988b63@vlsc.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 05.02.24 um 07:43 schrieb webmaster@vlsc.org:

> It does not appear to be exactly the same "missing" emails each time,
>  but it does appear that the "missing" emails are physically farther
> down the actual list of emails in the subscribers.d/email_list.txt
> file.
...

> This behavior first appeared with mlmmj 1.3 installed - I have
> recently upgraded the server to mlmmj 1.4.4, but this behavior is
> still there.
...

 > Any advice and help would be very appreciated!

I'm curious about your "subscribers.d/email_list.txt".

In the Mlmmj-installation that I manage the files looks like that:

> ~ » ls subscribers.d 
> 6  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  r  s  t  u  v  w  y  z

Where for example the file "a" contains all addresses starting with "a" 
and so on.

Alles Gute

Christof Thalhofer

-- 
Dies ist keine Signatur



