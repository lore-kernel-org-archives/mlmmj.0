Return-Path: <mlmmj+bounces-3103-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508AA1061B39
	for <mlmmj@archiver.kernel.org>; Tue, 31 Mar 2026 11:42:08 +0000 (UTC)
Received: from localhost ([127.0.0.1]:56882 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3103-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w7WgN-00B9Ng-15
	for mlmmj@archiver.kernel.org;
	Tue, 31 Mar 2026 10:50:51 +0000
Received: from buildfarm.krot.org ([46.235.224.224]:36956)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <km@krot.org>)
	id 1w7WgG-00B9Mz-02
	for mlmmj@mlmmj.org;
	Tue, 31 Mar 2026 10:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=bfrsa; bh=y02WknO5/I62
	q47W0M5JwC8DPHFu6Wmh8EmL4wmpYz4=; h=in-reply-to:references:to:subject:
	from:date; d=krot.org; b=DrKPfnbucE0+a5VRo6aCI5TxgnHHZGUYu9Rv6Tf9S9q+i
	9U50rH1QPSGH/ZFfsRfrQWtVmzLQXDno72pOTSz5L5mqolm++ciS2umd5uEhoAOgvcYuna
	wnUpnWIF6Aqh8qRfDPVMNA6a8tN3M1xKigWYQXAw7sL7YVeFv4n0khT4G+uAxjwkm27Fxi
	lj0JzQ7Md8SRtC0zXkkvpx+07m0m/QYWoc6H0SBE0mWrQ5sXIr8DLytvbNKx8epD7PNw3z
	wIAsqkR5ZG96GelU7Jit3KgPzDxR7CFukk+3hqQsx56jbngZ3aR5a4fCTHgjGECLz+IrSg
	KqeIi4P7N6JLaZg4w==
Received: 
	by buildfarm.exim.org (OpenSMTPD) with ESMTPSA id 89714d24 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <mlmmj@mlmmj.org>;
	Tue, 31 Mar 2026 12:57:41 +0200 (CEST)
Message-ID: <e2900560-38dc-412f-82ec-45d2750c2fd1@krot.org>
Date: Tue, 31 Mar 2026 12:57:40 +0200
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kirill Miazine <km@krot.org>
Subject: Re: Call for testing: 2.0.0 is close to the doors
To: mlmmj@mlmmj.org
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
Content-Language: en-GB
In-Reply-To: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


• Baptiste Daroussin [2026-03-29 10:26]:
> Hello Everyone
>
> In 2022, I took over the maintenance of mlmmj which I am using for the FreeBSD mailing lists and more.
>
> I am close to have delivered all the features I intended to add as such I would like to stamp it with naming the next release: 2.0.0!
now this was news! thank you for keeping mlmmj alive and moving it forward


