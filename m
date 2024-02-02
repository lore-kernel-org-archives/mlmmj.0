Return-Path: <mlmmj+bounces-3034-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD65C48291
	for <mlmmj@archiver.kernel.org>; Fri,  2 Feb 2024 10:49:52 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3034-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rVqoF-00C9SO-Lj
	for mlmmj@archiver.kernel.org; Fri, 02 Feb 2024 10:30:11 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1rVqo8-00C9RY-Ul
	for mlmmj@mlmmj.org; Fri, 02 Feb 2024 10:30:04 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id 0A5F615B6CA; Fri,  2 Feb 2024 11:40:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1706870412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VWpk7Cf+OiqSGsk4HXZQ54DSyTFBbgEq3uAZYp0zc2U=;
	b=INJlph5V442rQVjgIEPXJhZcEp79j5bRTQUH2Qomp+V6PXt96KKnih9blZXkux8eg5z6ES
	DKZS13690PB97s5iooXQq39WZ9Ll7Ia5979M5bdBO9CYkesSEk8mD/lx5AxfEv+nhvHVwb
	wJ8j3KHTpddb4eBM/7A7082yItUT4lMpXw67j+ziFVGYLBhX/XJZBcuJ825pwTPhMD0oHi
	W30/LQxhJuFo+80eq+BlOQuIRZ7/kKOXYkjZNNwJUgrejmd5gr41RXzT+Wg0GjfwbniH69
	EozzDsdhLl2AbKuRZm+I7gklQwCld90czDd4MrSybVAvabpH3MGrm6mFl3nGjQ==
Date: Fri, 2 Feb 2024 11:40:11 +0100
From: Baptiste Daroussin <bapt@nours.eu>
To: Dragan Simic <dsimic@manjaro.org>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] [RFC] Muting and unmuting threads
Message-ID: <d5o6jtudkfbvh7ge7tymvmi3ncyussfm4adxabw6stug5q4f2p@fuxhtpn2255e>
References: <44c21d525dc7844d5bd1695da6f43436@manjaro.org>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44c21d525dc7844d5bd1695da6f43436@manjaro.org>

On Fri, Feb 02, 2024 at 08:24:29AM +0100, Dragan Simic wrote:
> Hello,
> 
> It's well known that people often complain about subscribing
> to high-traffic mailing lists, which results in receiving a lot
> of unwanted messages, etc.  A recent example of such complaints
> came from the git mailing list. [1]
> 
> People often want to receive messages that belong to specific
> threads only, e.g. to those resulting from patches they send to
> the mailing list.  Thus, I was thinking about extending mlmmj
> to support such features, e.g. by implementing new features and
> commands that configure a subscription to receive only replies
> to their own messages sent to the mailing list.
> 
> Has something like this ever already appeared as a suggestion
> or a though?  Any feedback would be much appreciated.
> 
> [1] https://lore.kernel.org/git/6174fbd7-5eee-450b-a38b-1d1b695f6d14@app.fastmail.com/T/#m24a25bfc7b9dbe3a7136f5fc2d8a472e0f5f20ce
> 
> 

Hello,

On principle I am not against, as a user I would be a big consumer of such a
feature ;)

The problem is on the implementation side, I haven't given it a long thought
yet, but at first glance, it means we keep track of who sent what so kind of a
database of the threads and who has replied anything on it, which means an
forever growing database, which is something that does not exist by design
in mlmmj, the closest being the archive, but it is not contextual.

The key strength in my opinion of mlmmj is its simplicity, this has a risk to
bring in complexity so it needs to be carefully thought.

If we were to design such a feature in a mlmmj friendly way it would mean:
- a new kind of suscibtion: nomail + exception basically
- each time a mail is sent by someone with the subscrption activated, we need to
  keep track of the thread (a list of message-id ?)
- how long should we keep track of this thread? can we purge somehow this list ?
  (configurable pace for mlmmj-maintd?)

Open for ideas for how to implement this in a stupid and simple way.

Best regards,
Bapt


