Return-Path: <mlmmj+bounces-3096-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518D4FF492D
	for <mlmmj@archiver.kernel.org>; Mon, 30 Mar 2026 02:20:18 +0000 (UTC)
Received: from localhost ([127.0.0.1]:54008 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3096-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w71fy-00B10F-36
	for mlmmj@archiver.kernel.org;
	Mon, 30 Mar 2026 01:44:23 +0000
Received: from mail.vnetworx.net ([86.48.29.242]:38773)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ron@vnetworx.net>)
	id 1w71fr-00B0zG-1v
	for mlmmj@mlmmj.org;
	Mon, 30 Mar 2026 01:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vnetworx.net; s=mail;
	t=1774835469; bh=9flrC18wQnSazpq5YQOVUdnfH6j9nHxjcV5WboL82VQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=qyfcd0Ob1AjS1pPuC1xsKy2Tv2SMQ9yrSWO0KiElEMlEELfjCwuyfR7HeoppFt9t6
	 KKY45Ckjyyvwk/fvamEHmiKc8u2LZDqICgnIIbqvZQh1Zm3tWLwuqU4l3yvVt4R5Dc
	 BqXKiOEQGGncePKpf9pnDP2RstYbTHxLQebLetHo=
Received: from [192.168.1.151] (unknown [66.24.89.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	(Authenticated sender: ron@vnetworx.net)
	by mail.vnetworx.net (Postfix) with ESMTPSA id 1D133660DE9
	for <mlmmj@mlmmj.org>; Sun, 29 Mar 2026 21:51:08 -0400 (EDT)
Message-ID: <679f813b-3bfa-4d06-b258-c8bb3c8a2cec@vnetworx.net>
Date: Sun, 29 Mar 2026 21:51:07 -0400
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Call for testing: 2.0.0 is close to the doors
To: mlmmj@mlmmj.org
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
From: Ron Guerin <ron@vnetworx.net>
Content-Language: en-US
In-Reply-To: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Checked: ClamAV using ClamSMTP by mail.vnetworx.net

On 3/29/26 4:26 AM, Baptiste Daroussin wrote:
> Hello Everyone
> 
> In 2022, I took over the maintenance of mlmmj which I am using for the FreeBSD mailing lists and more.

mlmmj seems in a practical sense, to be "the last man standing", when it 
comes to mailing list managers.  I've recently come over, as a refugee 
from Mailman 2, in despair of Mailman 3.  The SDLU successor to the old 
SPAM-L list recently shut down as it was running on Mailman 2, and I 
suspect there will be more of these this year as continuing to operate 
Python 2 things becomes increasingly problematic.

I offer my thanks to you for taking over mlmmj.

> I am close to have delivered all the features I intended to add as such I would like to stamp it with naming the next release: 2.0.0!

Apologies if this is the wrong place to make a request.

(And I realize it's too late for 2.0.0.)

I would like to have a hook available, so that when mlmmj places a 
message in the archive, it allows me to run some other program, 
specifically in my case, a web archiver script I've developed to produce 
web pages substantially similar to those produced by Pipermail from GNU 
Mailman 2.  I would offer a patch if I were capable of producing one. 
Having not written a line of C in 35 years, I haven't been able to do so.

Vive la mlmmj!

- Ron


