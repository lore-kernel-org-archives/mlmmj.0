Return-Path: <mlmmj+bounces-3059-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5588DC4345F
	for <mlmmj@archiver.kernel.org>; Sat,  4 May 2024 07:29:25 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3059-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s398a-002I10-TD
	for mlmmj@archiver.kernel.org; Sat, 04 May 2024 06:44:48 +0000
Received: from degmail.deganius.de ([162.55.175.133])
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <chrisml@deganius.de>)
	id 1s398U-002Hz3-5P
	for mlmmj@mlmmj.org; Sat, 04 May 2024 06:44:42 +0000
Received: from mail.wacker.deganius.de (p578c211e.dip0.t-ipconnect.de [87.140.33.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by degmail.deganius.de (Postfix) with ESMTPSA id 8A960177BEA
	for <mlmmj@mlmmj.org>; Sat,  4 May 2024 08:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=deganius.de; s=2021;
	t=1714805815; bh=P4s0UXxUrwJi73j+H7LX7uPFBilVs4iHi4u8CNKx7B8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YEunW1XjlzI6Zmr2wX6ap2jobMeIMFHSxx4i/F88wHcSnHS9tMH6kHUV84fHy+105
	 jwPgr2lSOI/tKkqI+KBXK5knv4vxWYSmuDDiWLe+8JBfKrhpYJrIzC6xzJelCgFOeW
	 sFjoVoiQzdLyzqe/FJ1WwQF7F++OPBNrX4HvWQTTUpYKCIqnE77qMEAqPwmLr3qLdS
	 0w+Zg0DS4yR/Fa7z6gIHxU54x/JK+m+ClhCXDrFDytvnoimaHANmtVBcAvPnU+IcMF
	 6AV+C2Igpba+ZjGeQ31xAhNgyEH0wlG6TGPOn4mX6dgzgkTmC/I9bPgRT8VEBybrXX
	 k0CeuIt3g6+Yw==
Received: from [172.16.31.6] (unknown [172.16.31.6])
	by mail.wacker.deganius.de (Postfix) with ESMTP id F109F49F9F4E
	for <mlmmj@mlmmj.org>; Sat,  4 May 2024 08:56:54 +0200 (CEST)
Message-ID: <17df9faa-4a97-44b7-aa66-82cd3984deaf@deganius.de>
Date: Sat, 4 May 2024 08:56:54 +0200
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mlmmj] Roadmap for 1.5
To: mlmmj@mlmmj.org
References: <8e40c6fe4b3550052e405e068ecd13619602c4c7@nours.eu>
 <836c9c87-7d0e-41b9-b33f-c4887d2ae34e@deganius.de>
 <13C5A781-18E5-423C-9599-575EB1DF63A5@nours.eu>
Content-Language: de-DE, en-US
From: Christof Thalhofer <chrisml@deganius.de>
Autocrypt: addr=chrisml@deganius.de; keydata=
 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
Organization: Deganius
In-Reply-To: <13C5A781-18E5-423C-9599-575EB1DF63A5@nours.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 04.05.24 um 08:11 schrieb Baptiste Daroussin:

> I love this kind of "abuse" of a software! I need to get this
> documented, this is a clever usage of mlmmj.

Cool, thank you! :-)

It would be very helpful if we have the possibility to document such 
scenarios.

Who owns mlmmj.org?

> whois mlmmj.org
> Domain Name: mlmmj.org
> Registrar URL: http://www.1api.net

The guys at hostsharing.net (this is a webhoster coop I am a member of) 
said that they would be happy to sponsor the hosting of this domain.

Alles Gute

Christof Thalhofer

-- 
Dies ist keine Signatur



