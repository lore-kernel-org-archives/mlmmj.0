Return-Path: <mlmmj+bounces-3022-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B817C4167B
	for <mlmmj@archiver.kernel.org>; Wed,  6 Dec 2023 21:18:51 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3022-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rAyho-00DeET-3f
	for mlmmj@archiver.kernel.org; Wed, 06 Dec 2023 20:41:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <konstantin@linuxfoundation.org>)
	id 1rAyhh-00DeDf-By
	for mlmmj@mlmmj.org; Wed, 06 Dec 2023 20:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C99D61E8B;
	Wed,  6 Dec 2023 20:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29637C433C8;
	Wed,  6 Dec 2023 20:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701895795;
	bh=jTMnCBUTI4ANmxfKMNu9s85tlArHvx9kqXla3tjVqro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gMfE180R1Dr0SCoz3qE1iPk7BJUOPJYdTt997bergL3Y3+FBiCqvN8LhSuNVRisNE
	 oiVMUDX54wYYyGru1KPw85cuuPmap33vWm6jYw63p3eYnLgJsrzZEB5e2Oh342xrrn
	 JtGO9d+Hk4DoN/mr3gM8NdLY+HHzzHzdRbDlbH4o=
Date: Wed, 6 Dec 2023 15:49:53 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Baptiste Daroussin <bapt@nours.eu>
Cc: mlmmj@mlmmj.org
Subject: Re: [mlmmj] mlmmj 1.4.0 is now out!
Message-ID: <20231206-infrared-starling-of-temperance-ea3cab@lemur>
References: <kpsdycifpeeuhzo3qjkxv4h7hxo7exrwfxrnjvpfqfzmem4sw2@i34opbf4lduv>
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <kpsdycifpeeuhzo3qjkxv4h7hxo7exrwfxrnjvpfqfzmem4sw2@i34opbf4lduv>

On Wed, Dec 06, 2023 at 05:21:14PM +0100, Baptiste Daroussin wrote:
> Hello everyone,
> 
> I am proud to announce the final release of the 1.4.0 version of mlmmj.
> It is a major milestone, because this is the first version with me as a
> maintainer (I hope I won't disappoint you!) and there has been a huge
> refactoring of the mlmmj code itself.

Thank you, Baptiste! I look forward to more goodness in mlmmj-1.5! :)

For anyone who, like us, is stuck for a bit longer on CentOS-7, I package
mlmmj-1.4 as part of our LF IT repo:

https://copr.fedorainfracloud.org/coprs/icon/lfit/packages/

-K


