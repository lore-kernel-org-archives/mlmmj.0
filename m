Return-Path: <mlmmj+bounces-3077-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF65C02192
	for <mlmmj@archiver.kernel.org>; Mon,  3 Feb 2025 18:55:57 +0000 (UTC)
Received: from localhost ([127.0.0.1]:52696 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3077-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1tf19X-004iZS-11
	for mlmmj@archiver.kernel.org;
	Mon, 03 Feb 2025 18:26:35 +0000
Received: from mx5.starion.dk ([213.83.176.199]:14627)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <uffe@uffe.org>)
	id 1tf19P-004iYl-27
	for mlmmj@mlmmj.org;
	Mon, 03 Feb 2025 18:26:27 +0000
Received: by mx5.starion.dk (Postfix, from userid 1001)
	id 1A132A1049; Mon,  3 Feb 2025 19:32:15 +0100 (CET)
Received: from mailhost.starion.dk (localhost [127.0.0.1])
	by mx5.starion.dk (Postfix) with UTF8SMTP id 14A1BA1016;
	Mon,  3 Feb 2025 19:32:15 +0100 (CET)
Message-ID: <cone.1738607534.997231.20846.1001@mailhost.starion.dk>
X-Mailer: http://www.courier-mta.org/cone/
From: Uffe Jakobsen <uffe@uffe.org>
To: mlmmj@mlmmj.org
Subject: Usage scenario for new tuneable option =?UTF-8?B?InJlcGx5dG8i?=
         (copy From: to Reply-To:) =?UTF-8?Q?=3F?=
Date: Mon, 03 Feb 2025 19:32:14 +0100
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

Hello,

Can someone share some insight on a setup/scenario - where the new tuneable option "replyto" ("copy From: to Reply-To:") is useful in respect to DMARC ?

Thanks in advance

/Uffe



