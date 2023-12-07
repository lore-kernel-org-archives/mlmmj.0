Return-Path: <mlmmj+bounces-3023-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B76DC4167B
	for <mlmmj@archiver.kernel.org>; Thu,  7 Dec 2023 23:01:03 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3023-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rBMjX-00DnAg-Rf
	for mlmmj@archiver.kernel.org; Thu, 07 Dec 2023 22:20:39 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <flberger-lists@posteo.net>)
	id 1rBMjR-00DnA1-1x
	for mlmmj@mlmmj.org; Thu, 07 Dec 2023 22:20:33 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id E3EB8240027
	for <mlmmj@mlmmj.org>; Thu,  7 Dec 2023 23:29:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1701988162; bh=0TIAqX3Np4zaxPYmsTeqphkNys2vxQ4MuFT1U39yYz0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:
	 Content-Transfer-Encoding:From;
	b=MoK4k1W5+Q0zt7yQUgF3b2dadtZYBo9b+93433pq1ady/ROFeui+bNGLUHKdb6SBA
	 1QqAh6KIRn6Rfj2tvUpz38pzdDdGr9WWwRwerucgcyFAo5U8kd4kfhkWrSvPvc0wm1
	 0DqyjqQCT7IPpIJWkp4qa313l+lX0xTBuOMV+4kpLXSzIz/5ApegyIUhOXJ+Qkr48l
	 I0wrO4J2/ttRh6AjjdMo4j4fdLVwE6OckASv5kC3xv3BCGYPDYFlDvT0qoLKGEkQ8l
	 aJZy18qggZrt+7Z6NKKKxLkmvjPyDpXOBL9LvzHiN+ZyhShIkV1ohc+pwUTCPJLk5A
	 1cAVAaXvxTUnw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4SmTTZ1xmnz6tn4;
	Thu,  7 Dec 2023 23:29:22 +0100 (CET)
Message-ID: <df58ab7f-0592-4055-b5cd-3769fa210edc@posteo.net>
Date: Thu,  7 Dec 2023 22:29:20 +0000
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
To: mlmmj@mlmmj.org
Content-Language: en-US
Cc: webmaster@plonk.de
From: Florian Berger <flberger-lists@posteo.net>
Subject: [mlmmj] README.exim4 broken, needs update
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The mlmmj.org website hosts a tutorial for exim 4 setup at http://mlmmj.org/docs/readme-exim4/ , 
which in turn refers to https://plonk.de/sw/mlmmj/README.exim4 as the most recent original (hence 
author Jakob Hirsch in cc:).

For the transport configuration, it advertises:

mlmmj_transport:
   [irrelevant lines left out]
   command = /usr/local/bin/mlmmj-recieve -F -L MLMMJ_HOME/${lc:$local_part}

This will no longer work in recent versions of exim (4.94 and above). exim now considers 
sender-derived data tainted, and will refuse to use them as-is. See

- https://git.exim.org/exim.git/blob/HEAD:/src/README.UPDATING
- https://www.exim.org/exim-html-current/doc/html/spec_html/ch-string_expansions.html

As far as the mlmmj config is concerned, $local_part is considered tainted.

It can reasonably be de-tainted by changing it into a directory lookup:

mlmmj_transport:
   [unchanged lines left out]
   command = /usr/bin/mlmmj-receive -F -L "${lookup {$local_part} dsearch,ret=full {MLMMJ_HOME}}"

To avoind exim users running into issues, the tutorial at plonk.de and mlmmj.org should be updated 
accordingly.


Thanks for considering,

Florian


