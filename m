Return-Path: <mlmmj+bounces-3085-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DD0F01823
	for <mlmmj@archiver.kernel.org>; Fri,  6 Mar 2026 10:16:11 +0000 (UTC)
Received: from localhost ([127.0.0.1]:36704 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3085-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1vyRBv-008la1-0S
	for mlmmj@archiver.kernel.org;
	Fri, 06 Mar 2026 09:09:51 +0000
Received: from c-mail.c-base.org ([194.29.227.135]:58964)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <grenouille@c-base.org>)
	id 1vyRBo-008lZG-0r
	for mlmmj@mlmmj.org;
	Fri, 06 Mar 2026 09:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=c-base.org;
	s=fsck_google2; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:To
	:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TTWfMrxgWMpLT6/EX+O+TBuX/L4UuCtCWZiTYA8eWvY=; b=Nh270bUH/yFd45YSx9wszzcxAy
	IqTIYfxNF6lfItmNZckNNsRNgQdZx++QobY595Ev5Yk+IjSLukvob8VBA/VozJwqfyGCrd84rNIm+
	P+yBaaRjslkqrYmEbHcDgea8bdGoPYLGWTnwEkdWdUYIY6bX+1t/qAzUqLM2xzYVNNkg=;
Received: from crew-member ([127.0.0.1])
	 by c-mail.c-base.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP384R1_SHA384__AES_256_GCM:256)
	 (Exim 4.94.2)
	(envelope-from <grenouille@c-base.org>)
	 id 1vyRHv-0005Ge-Dg 
	for mlmmj@mlmmj.org; Fri, 06 Mar 2026 10:16:03 +0100
Received: from [79.204.130.93] (helo=oscar.coulmann.de)
	by localhost with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <grenouille@c-base.org>)
	id 1vyRHu-0004E5-38
	for mlmmj@mlmmj.org;
	Fri, 06 Mar 2026 10:16:02 +0100
Received: from wulf by oscar.coulmann.de with local (Exim 4.96)
	(envelope-from <grenouille@c-base.org>)
	id 1vyRHu-0005GQ-2E
	for mlmmj@mlmmj.org;
	Fri, 06 Mar 2026 10:16:02 +0100
Date: Fri, 6 Mar 2026 10:16:02 +0100
From: wulf <grenouille@c-base.org>
To: mlmmj@mlmmj.org
Subject: [mlmmj] README.exim4 broken, needs update
Message-ID: <aaqbUl2fCk9oh9yL@coulmann.de>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df58ab7f-0592-4055-b5cd-3769fa210edc>
X-Mailer: Mutt http://www.mutt.org/


Ahoi,

> The mlmmj.org website hosts a tutorial for exim 4 setup at
> http://mlmmj.org/docs/readme-exim4/

thanks to Florian for the dsearch syntax

I added multi-domain handling and debug Output

  you still need uniq user_parts
    info@list1.org
    info@list2.org
  will not work


Git comment
  Date:   Fri Mar 6 09:40:23 2026 +0100

  Update exim4 configuration hints
    - add debug output to router and transport
    - lookup changes according
        exim4 >= 4.94 taind behaver
      (Errors like "Tainted filename for search")
    - add router condition for setups with more than one domain (you need uniq
      local_parts over all your lists, but we do not want to match the transport on
      local_part@wrong.domain)

  hint
    - VERP config is not changed/updated, may not work


changed exim4 Readme
  https://codeberg.org/mlmmj/mlmmj/src/commit/690feb17265dc589f9b5275834dd76e251b47625/README.exim4.md

pull-request
  https://codeberg.org/mlmmj/mlmmj/pulls/88


Thanks for mlmmj
Grenouille


