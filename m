Return-Path: <mlmmj+bounces-3012-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54278C4167B
	for <mlmmj@archiver.kernel.org>; Mon, 27 Nov 2023 15:24:34 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3012-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r7d6r-00CMsj-GZ
	for mlmmj@archiver.kernel.org; Mon, 27 Nov 2023 15:01:17 +0000
Received: from mx5.starion.dk ([213.83.176.199])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uffe@uffe.org>)
	id 1r7d6k-00CMrp-R4
	for mlmmj@mlmmj.org; Mon, 27 Nov 2023 15:01:10 +0000
Received: by mx5.starion.dk (Postfix, from userid 1001)
	id C0AA1A100E; Mon, 27 Nov 2023 16:09:47 +0100 (CET)
Received: from mailhost.starion.dk (localhost [127.0.0.1])
	by mx5.starion.dk (Postfix) with UTF8SMTP id BAC40A1002;
	Mon, 27 Nov 2023 16:09:47 +0100 (CET)
References: <2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com>
Message-ID: <cone.1701097787.573100.51016.1001@mailhost.starion.dk>
X-Mailer: http://www.courier-mta.org/cone/
From: Uffe Jakobsen <uffe@uffe.org>
To: =?UTF-8?Q?mlmmj=40mlmmj=2Eorg?= <mlmmj@mlmmj.org>
Subject: Re: [mlmmj] Problem with mail sent by @orange.fr to @protonmail.com
Date: Mon, 27 Nov 2023 16:09:47 +0100
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; delsp=yes; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Pierre Cros writes:
>
> It works well even for the pretty bad admin I am. But I don't know where to  
> look to understand the following problem :
>
> • My list works well for all users most of the time
>
> • When a sender uses orange.fr SMTP to send a mail on this list, the  
> subscribers with @protonmail.com adresses won't get the mail at all (not even  
> in the spams), the other subscribers will receive it.
>
> • if some @orange.fr sender, sends a mail directly (without the list) to some  
> @protonmail.com receiver, it works
>
> It looks like mlmmj adds something that will make mails sent by orange.fr  
> unacceptable for @protonmail.com mail serveur.
>

The most common problem is if a list member is sending from a domain that  
exposes SPF/DMARC information.

Relaying such message through mlmmj (and any other mailing list) will retain the sender information - but with a new origin (the mlmmj server)

If the receiving part (protonmail) inspects the SPF/DMARC (supplied by the originating domain) it will propably drop the email or put it in quarantine.

Mlmmj still nedds a proper sender rewriting feature that will rewrite the sender information into something ala "Original sender name via mlmmj-liste-name <mlmmj-list-name@mlmmj-domain-name.xxx>"

PS: I'm just guessing about the reasons for your described problem...


/UFfe




