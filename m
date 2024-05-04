Return-Path: <mlmmj+bounces-3063-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84405C4345F
	for <mlmmj@archiver.kernel.org>; Sat,  4 May 2024 22:55:31 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3063-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s3NaH-006HvO-Me
	for mlmmj@archiver.kernel.org; Sat, 04 May 2024 22:10:21 +0000
Received: from nours.eu ([176.31.115.77] helo=aniel.nours.eu)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bapt@nours.eu>)
	id 1s3NaA-006HtN-Us
	for mlmmj@mlmmj.org; Sat, 04 May 2024 22:10:15 +0000
Received: by aniel.nours.eu (Postfix, from userid 1001)
	id A83E2141460; Sun,  5 May 2024 00:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nours.eu; s=20190522;
	t=1714861347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0LLrzy0erlI9k11sUkAjMX6l5ex8HEVxZWN7CkBT3k=;
	b=mhOEopWgebHZ3zWZZdvm8155YVcD/W3tDnwS+PpLmwqJokya+5c5IHKgd+I8qWpaGV8VW5
	GCNGDD+OR9TRzWjC6NFFxol+0HwZOVNZF6RuyP4kkX/1nRTYiwIgHoWcLOb/qU4snlz4Lv
	r/xKrv7rTI0i5PdVcKHeIssZZYGESwtW218KAAMzNzIfD5hiR0PNHtKwQxPVAqCV2R/BYw
	CMMqwybEcnaskWDc4jlNVUrUEvelvl+buHdhgt2tsoWcQHjpX0LkebTp6zdXBPMy891mra
	N/Nzzp3kD3V3L2phyL45jmJn+jsv3aH0sZF2uiiFg78Vin4QVAiAtjQc+hAQtA==
Date: Sun, 5 May 2024 00:22:27 +0200
From: Baptiste Daroussin <bapt@nours.eu>
To: Kent <kent@kamar.nz>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] Roadmap for 1.5
Message-ID: <wvm4k5n7y7wuaezsx7mskdw3n3npdkzsbu2nsecjn4ccjjpls6@pqxp6qjngkjx>
References: <8e40c6fe4b3550052e405e068ecd13619602c4c7@nours.eu>
 <56744C60-5732-4B4D-85AF-41A4157B2FFF@kamar.nz>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56744C60-5732-4B4D-85AF-41A4157B2FFF@kamar.nz>

Hi,

if there is a strong request for this I would add it, but again this is not
necessary including with people having a reject policy like yahoo.com.

In the FreeBSD project for the mailing list we use mlmmj, we don't never munge
the from, we make sure we don't alter fields that are used for dkim signatures,
meaning no control/prefix control/footer and we have plenty of subscribers from
yahoo.com without any problem.

Best regards,
Bapt


On Sun 05 May 09:39, Kent wrote:
> Hi Baptiste,
> 
> With the enforcement of SPF / DKIM / DMARC,  acting as a mailing list where senders aren't on the same mail server as you host is problematic for mailing lists where you are essentially forwarding/sending email on behalf of someone on another domain.
> 
> I raised this issue on this mailing list recently and you replied that it's semi possible when using 1.4.1, but would need to configure something before mlmmj like rspamd.
> 
> I appreciate that From-munging is a horrible workaround (I personally don't like it either) - but this is the approach that Google takes with their mailing lists and it's the only workaround I've identified that works if the senders SPF / DKIM / Dmarc records for their domain are set to reject email from other domains.
> 
> 
> Do you think this is something you could add to mlmmj in 1.5 ?
> 
> I'm thinking this would be a 'frommungle' file flag.  And when present, automatically:
> - replaces the 'FROM' with the from specified within the file.
> - strips any of the original senders headers that are part of the original senders SPF / DMARC / DKIM checks.
> - perhaps adds a X-Original-From header with the original senders email address.
> 
> 
> 
> Cheers
> Kent
> 
> 
> 
> > On 4 May 2024, at 2:39 AM, Baptiste Daroussin <bapt@nours.eu> wrote:
> > 
> > Hello everyone,
> > 
> > Now that mlmmj 1.4 seems to have properly settle, I would like to propose a roadmap for mlmmj 1.5,
> > please find here:
> > 
> > https://codeberg.org/mlmmj/mlmmj/issues?type=all&sort=&state=open&labels=&milestone=4774&project=0&assignee=0&poster=0 
> > 
> > The list of tasks I plan to do before releasing mlmmj 1.5.0
> > 
> > Do not hesitate to comment, discuss and propose other tasks.
> > 
> > Basically 1.4 was mostly: modernize the code base (this is not finished, but advanced enough) and provide a test suite. for 1.5 I plan to cleanup features which in my opinion do not make sense anymore because they break fields used for DKIM signatures and implement the feature that has been requested by people here over the last year.
> > 
> > I have no ETA for 1.5.0 it will be released when it will be released.
> > 
> > Extra note, I would really love to get access to mlmmj.org to fix the mailing list with dkim and to be able to update the website or point it to codeberg.
> > 
> > Best regards,
> > Bapt
> > 
> > 
> 


