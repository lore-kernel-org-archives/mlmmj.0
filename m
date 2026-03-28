Return-Path: <mlmmj+bounces-3089-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4722B10F3DE2
	for <mlmmj@archiver.kernel.org>; Sat, 28 Mar 2026 11:46:39 +0000 (UTC)
Received: from localhost ([127.0.0.1]:54096 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3089-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w6RBy-00As1E-15
	for mlmmj@archiver.kernel.org;
	Sat, 28 Mar 2026 10:46:58 +0000
Received: from mx5.starion.dk ([185.51.78.87]:35990)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <uffe@uffe.org>)
	id 1w6RBr-00As0T-0O
	for mlmmj@mlmmj.org;
	Sat, 28 Mar 2026 10:46:51 +0000
Received: by mx5.starion.dk (Postfix, from userid 1001)
	id 8A49DA10E3; Sat, 28 Mar 2026 11:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mx5.starion.dk 8A49DA10E3
Authentication-Results: mx5.starion.dk; dkim=none
Received: from mailhost.starion.dk (localhost [127.0.0.1])
	by mx5.starion.dk (Postfix) with UTF8SMTP id 846D6A104A;
	Sat, 28 Mar 2026 11:53:43 +0100 (CET)
References: <83Su95j/WN8QKsJA6dPhlkwgNx6bkcF5@etherlight.link>
Message-ID: <cone.1774695223.429867.56304.1001@mailhost.starion.dk>
X-Mailer: https://www.courier-mta.org/cone/
From: Uffe Jakobsen <uffe@uffe.org>
To: mlmmj@mlmmj.org
Subject: Re: [PATCH] Support display name substitution in customheaders
Date: Sat, 28 Mar 2026 11:53:43 +0100
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; delsp=yes; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Lumin Etherlight writes:
> Allow substitution of  the variable $postername$ for
> the display name  of the user.  The  display name is
> extracted from the sender's From: header.  If a name
> is not found, then  this variable is substituted for
> user's address, i.e. the same value as $posteraddr$.
> Proper handling of comments,  and quoted strings, in
> the From: address is also included.
>

Thanks - I would really like this feature to go into mlmmj.

I'm working on a similar patch - but it is not as ready as this one :-)

/Uffe



