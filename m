Return-Path: <mlmmj+bounces-3035-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A23AC4828E
	for <mlmmj@archiver.kernel.org>; Fri,  2 Feb 2024 11:23:10 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3035-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rVrB9-00C9s7-Uu
	for mlmmj@archiver.kernel.org; Fri, 02 Feb 2024 10:53:52 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dsimic@manjaro.org>)
	id 1rVrB3-00C9rG-7l
	for mlmmj@mlmmj.org; Fri, 02 Feb 2024 10:53:45 +0000
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1706871831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYzong7sgE2Pb1GHLwQn0DJ8nlmizE1hEupJ/ZhjUqo=;
	b=v4Cnjg2X6C5ogDykeeBeNYXQ265fkdEt+dWDtiSO8/zefckWfXiAFYhH28FR6DAeBzsvpH
	Q4KMue3taCdxU1Lre8UaEd2d2qkoDt7hMiIOUz9avifc2RJVChWCwwbHLwwKkMx2qBYbRw
	kqCu4vEx1ScBef1stLbhf/5A3D33MD17ehsm7RqX51K9cCUG8+9jK2zOgQLBVTVa2bAiiY
	IjKv0z8JvcZnx0RaLdTUUPFOqh8N6ZWOH5KghA2xakyO6mF0AO/iQgw/Js4Lf8R3W7TKt5
	UhzakbcP4LzgRioqemy+mcp32nmHV+wteUAWWaqysPVPl1N5TAHq3fpJupwJDQ==
Date: Fri, 02 Feb 2024 12:03:51 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Baptiste Daroussin <bapt@nours.eu>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] [RFC] Muting and unmuting threads
In-Reply-To: <d5o6jtudkfbvh7ge7tymvmi3ncyussfm4adxabw6stug5q4f2p@fuxhtpn2255e>
References: <44c21d525dc7844d5bd1695da6f43436@manjaro.org>
 <d5o6jtudkfbvh7ge7tymvmi3ncyussfm4adxabw6stug5q4f2p@fuxhtpn2255e>
Message-ID: <040c10240994e385291dbe51af82efe1@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2024-02-02 11:40, Baptiste Daroussin wrote:
> On Fri, Feb 02, 2024 at 08:24:29AM +0100, Dragan Simic wrote:
>> It's well known that people often complain about subscribing
>> to high-traffic mailing lists, which results in receiving a lot
>> of unwanted messages, etc.  A recent example of such complaints
>> came from the git mailing list. [1]
>> 
>> People often want to receive messages that belong to specific
>> threads only, e.g. to those resulting from patches they send to
>> the mailing list.  Thus, I was thinking about extending mlmmj
>> to support such features, e.g. by implementing new features and
>> commands that configure a subscription to receive only replies
>> to their own messages sent to the mailing list.
>> 
>> Has something like this ever already appeared as a suggestion
>> or a though?  Any feedback would be much appreciated.
>> 
>> [1] 
>> https://lore.kernel.org/git/6174fbd7-5eee-450b-a38b-1d1b695f6d14@app.fastmail.com/T/#m24a25bfc7b9dbe3a7136f5fc2d8a472e0f5f20ce
>> 
>> 
> On principle I am not against, as a user I would be a big consumer of 
> such a
> feature ;)

I'm glad that you like the idea. :)

> The problem is on the implementation side, I haven't given it a long 
> thought
> yet, but at first glance, it means we keep track of who sent what so 
> kind of a
> database of the threads and who has replied anything on it, which means 
> an
> forever growing database, which is something that does not exist by 
> design
> in mlmmj, the closest being the archive, but it is not contextual.

Of course, I've also concluded that the implementation wouldn't be easy.
There would be a lot of data to store and process, which is a challenge.

> The key strength in my opinion of mlmmj is its simplicity, this has a 
> risk to
> bring in complexity so it needs to be carefully thought.

Totally agreed.  The implementation would have to be highly efficient
and as simple as possible.

> If we were to design such a feature in a mlmmj friendly way it would 
> mean:
> - a new kind of suscibtion: nomail + exception basically
> - each time a mail is sent by someone with the subscrption activated, 
> we need to
>   keep track of the thread (a list of message-id ?)
> - how long should we keep track of this thread? can we purge somehow 
> this list ?
>   (configurable pace for mlmmj-maintd?)
> 
> Open for ideas for how to implement this in a stupid and simple way.

Very good points, thank you.  I'll go through the mlmmj source code
and get back with some ideas, so we can discuss this further.


