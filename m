Return-Path: <mlmmj+bounces-3109-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFD1E63FF6
	for <mlmmj@archiver.kernel.org>; Sat,  4 Apr 2026 20:15:24 +0000 (UTC)
Received: from localhost ([127.0.0.1]:40150 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3109-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w96cJ-00BQey-2s
	for mlmmj@archiver.kernel.org;
	Sat, 04 Apr 2026 19:25:11 +0000
Received: from new.vlsc.org ([68.169.58.153]:42142)
	by mlmmj.mlmmj.org with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <webmaster@vlsc.org>)
	id 1w96cC-00BQeJ-13
	for mlmmj@mlmmj.org;
	Sat, 04 Apr 2026 19:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=vlsc.org;
	 s=dkim; h=In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bvtBldRakeGPOJ1VPG9uuHFQbkacuBU/7flTtU+3/aE=; b=O1OODTFITf8rAcz32l+Q9jRsGe
	DlIu1yCEahdWl2DUMd9K6/WkfzpkiX0i+AD/p/D3KwvYuf/+6y23AQPY+rocABu2gukMdj+JOnZwW
	ZXoerM9/3XJOUmQu1yPcpTjsB/QOyY9+dGbq3BN8RoEBmvkweDYefmsHe7rnhX21ir24=;
Received: from c-67-189-97-28.hsd1.or.comcast.net ([67.189.97.28] helo=[192.168.1.102])
	by new.vlsc.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <webmaster@vlsc.org>)
	id 1w96j0-00015v-IF; Sat, 04 Apr 2026 12:32:06 -0700
Content-Type: multipart/alternative;
 boundary="------------xSNiZ0Y18mqndaYMWjtKFtjv"
Message-ID: <4c0ab7ba-4741-4502-bdd8-2767ce3cf3ae@vlsc.org>
Date: Sat, 4 Apr 2026 12:32:04 -0700
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Subject: Re: Call for testing: 2.0.0 is close to the doors
To: jon.fairbairn@bookofsand.co.uk, mlmmj@mlmmj.org
References: <580852.1775296877@calligramme-substitute-arm.fritz.box>
Content-Language: en-US
In-Reply-To: <580852.1775296877@calligramme-substitute-arm.fritz.box>

This is a multi-part message in MIME format.
--------------xSNiZ0Y18mqndaYMWjtKFtjv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Which rate limit parameters?

Philip

On 4/4/2026 3:01 AM, jon.fairbairn@bookofsand.co.uk wrote:
> Wouldn’t one of the ratelimit parameters do what you want?
>
>     — Jón
>

--------------xSNiZ0Y18mqndaYMWjtKFtjv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font size="4" face="Helvetica, Arial, sans-serif">Which rate limit
      parameters?<br>
      <br>
      Philip<br>
    </font><br>
    <div class="moz-cite-prefix">On 4/4/2026 3:01 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:jon.fairbairn@bookofsand.co.uk">jon.fairbairn@bookofsand.co.uk</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:580852.1775296877@calligramme-substitute-arm.fritz.box">
      <pre wrap="" class="moz-quote-pre">Wouldn’t one of the ratelimit parameters do what you want?

   — Jón

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------xSNiZ0Y18mqndaYMWjtKFtjv--


