Return-Path: <mlmmj+bounces-3081-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85FCD111A8
	for <mlmmj@archiver.kernel.org>; Sun, 30 Nov 2025 06:34:53 +0000 (UTC)
Received: from localhost ([127.0.0.1]:60058 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3081-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1vPaSg-00DWxk-2z
	for mlmmj@archiver.kernel.org;
	Sun, 30 Nov 2025 05:59:06 +0000
Received: from yorick.ofobscurity.com ([69.195.140.133]:51191)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Chris.Knadle@coredump.us>)
	id 1vPaSa-00DWx1-0V
	for mlmmj@mlmmj.org;
	Sun, 30 Nov 2025 05:59:00 +0000
Received: from pool-100-33-240-150.nycmny.fios.verizon.net ([100.33.240.150] helo=[10.137.0.42])
	by yorick.ofobscurity.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <Chris.Knadle@coredump.us>)
	id 1vPaWC-003GR0-2j
	for mlmmj@mlmmj.org; Sun, 30 Nov 2025 01:02:46 -0500
Message-ID: <6d3ae229-d10c-4e7a-834c-b0dee05ee749@coredump.us>
Date: Sun, 30 Nov 2025 01:02:39 -0500
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: control/amime-footer-base64
To: mlmmj@mlmmj.org
References: <5c7451cc-07d2-4d64-a1db-fc998241d282@vnetworx.net>
 <7f82c96e-d58f-49a4-9ee6-32b72f217eb2@coredump.us>
 <db1084c0-e20e-4a2f-8877-05e3d27b3e51@coredump.us>
 <336e2b62-29f1-40f5-8b67-5f5a18e24caf@vnetworx.net>
Content-Language: en-US, fo-FO
From: Chris Knadle <Chris.Knadle@coredump.us>
Autocrypt: addr=Chris.Knadle@coredump.us; keydata=
 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
 hhRdBRUgHWUDis6VRoMNZhvr2oo=
In-Reply-To: <336e2b62-29f1-40f5-8b67-5f5a18e24caf@vnetworx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -

Hey, Ron.

You had written me privately in your reply below, but based on the 
contents of the mail I think it was meant to go to the [mlmmj-discuss] 
mailing list, so I'm sending a reply there. If my guess was wrong let me 
know, but looking at it, it seems safe to send to the list.

mlmmj-receive-strip -- okay yep, got it. As long as it's useful for 
admins then it should also be included.

Thanks for the heads-up on that.

There is a little more work to cosider as these two binaries are 
included. The Debian Policy Manual, section 12.1 states that:

     "Each program, utility, and function should have an associated 
manual page included in the same package or a dependency.
      It is suggested that all configuration files also have a manual 
page included as well."

and

     "If no manual page is available, this is considered as a bug and 
should be reported to the Debian Bug Tracking System
     (the maintainer of the package is allowed to write this bug report 
themselves, if they so desire)."

There's a number of options to handle this, and in this case I'm tempted 
to create "wishlist" bugs tagged "newbie" for someone helpful looking to 
get into Debian packaging to create them and send a patch.

Also I note that in looking at mlmmj-receive-strip, it is a full 
replacement for mlmmj-receive, and mlmmj-amime-receive is meant to be 
used in /etc/aliases as a replacement for mlmmj-receive too, and pipes 
the output of the script to mlmmj-receive. i.e. There seem to be 
competing replacements for mlmmj-receive between the two. Presumably one 
would not want to use both at the same time, but I'm mentioning this so 
that can be considered.

    -- Chris

Chris Knadle
Chris.Knadle@coredump.us

On 11/29/25 23:49, Ron Guerin wrote:
> Hi Chris,
>
> I've been reluctant to make requests in this regard, knowing how much 
> you've got on your plate.  But since you've asked, I'm going to say 
> that yes, I think it's a worthy addition, as it allows you to add 
> footers to HTML emails.
>
> Related, for those who don't want any MIME content on their lists, I'd 
> also like to ask that you consider adding mlmmj-receive-strip, which 
> is also in the contrib directory.
>
> /* a version of mlmmj-receive that parses the mail on the fly and 
> strips unwanted
>    mime parts
>    opens the files control/mimedeny and control/mimestrip for a list 
> of mime
>    types for body parts that should be denied or stripped.
>    It adds an extra header X-ThisMailContainsUnwantedMimeParts: Y for 
> mails that
>    contain disallowed mimeparts and 
> X-ThisMailContainsUnwantedMimeParts: N otherwise
> */
>
> - Ron 


