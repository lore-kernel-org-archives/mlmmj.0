Return-Path: <mlmmj+bounces-3019-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24552C4167B
	for <mlmmj@archiver.kernel.org>; Fri,  1 Dec 2023 01:30:33 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3019-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1r8rp9-00CrsY-Og
	for mlmmj@archiver.kernel.org; Fri, 01 Dec 2023 00:56:07 +0000
Received: from new.vlsc.org ([68.169.58.153])
	by mlmmj.mlmmj.org with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <webmaster@vlsc.org>)
	id 1r8rp2-00Crrl-UI
	for mlmmj@mlmmj.org; Fri, 01 Dec 2023 00:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=vlsc.org;
	 s=dkim; h=In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aya34DIMZ2gkD9exRqIRhf0l2ltaL3MyVqRhZjueAa4=; b=Bsg2ARDTaubLDRUGsCgr4otOl3
	WkoaHHhNLtqbS7bHeOvJNG7KVKmn8A9r/Owq1NfVZPZ3UhbtY4+widvNF55rCxKe7mwdSpCU4bogQ
	Tv2uYSuOf77blvCkLuhZ5QNnRqviU+dW7lECO3Urr+7leRtgLHaH8+rgUPmZhE01tbpM=;
Received: from c-71-236-142-158.hsd1.wa.comcast.net ([71.236.142.158] helo=[192.168.1.107])
	by new.vlsc.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <webmaster@vlsc.org>)
	id 1r8rxN-00006O-NO
	for mlmmj@mlmmj.org; Thu, 30 Nov 2023 17:04:37 -0800
Content-Type: multipart/alternative;
 boundary="------------TjSFyABC2d8nWgh0HaDxFg51"
Message-ID: <d63cc86f-13c6-4eb7-b105-016368446310@vlsc.org>
Date: Thu, 30 Nov 2023 17:04:36 -0800
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: webmaster@vlsc.org
Subject: Re: [mlmmj] Problem with mail sent by @orange.fr to @protonmail.com
Content-Language: en-US
To: mlmmj@mlmmj.org
References: <2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com>
In-Reply-To: <2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com>

This is a multi-part message in MIME format.
--------------TjSFyABC2d8nWgh0HaDxFg51
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I must admit I've seen this behavior also; it is a troubling issue to 
track down, and it reduces the trust list-members have (approx 150) that 
everyone is receiving all the email posts.

I have been using mlmmj for many years, and I'm grateful for all the 
recent work being done!

Having said that, I haven't yet updated my installations as I've been 
waiting for a stable release - I'm optimistic that will be soon, and I 
hope it will address this issue for my participants.

Thank you all!

Philip

On 11/27/2023 5:25 AM, Pierre Cros wrote:
> Hello there,
>
> I installed mlmmj (via iRedMail) on Debian Bookworm.
>
> It works well even for the pretty bad admin I am. But I don't know 
> where to look to understand the following problem :
>
>   * My list works well for all users most of the time
>   * When a sender uses orange.fr SMTP to send a mail on this list, the
>     subscribers with @protonmail.com adresses won't get the mail at
>     all (not even in the spams), the other subscribers will receive it.
>   * if some @orange.fr sender, sends a mail directly (without the
>     list) to some @protonmail.com receiver, it works
>
> It looks like mlmmj adds something that will make mails sent by 
> orange.fr unacceptable for @protonmail.com mail serveur.
>
> Any idea where I should look ? Thank you
>
> Pierre
>
>
> Envoyé avec la messagerie sécurisée Proton Mail. <https://proton.me/>

--------------TjSFyABC2d8nWgh0HaDxFg51
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Helvetica, Arial, sans-serif">I must admit I've seen
      this behavior also; it is a troubling issue to track down, and it
      reduces the trust list-members have (approx 150) that everyone is
      receiving all the email posts.<br>
      <br>
      I have been using mlmmj for many years, and I'm grateful for all
      the recent work being done!<br>
      <br>
      Having said that, I haven't yet updated my installations as I've
      been waiting for a stable release - I'm optimistic that will be
      soon, and I hope it will address this issue for my participants.<br>
      <br>
      Thank you all!<br>
      <br>
      Philip<br>
    </font><br>
    <div class="moz-cite-prefix">On 11/27/2023 5:25 AM, Pierre Cros
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:2shIYpcGYGDjX-CmJQn6qMG7Hcji--MPqGFEcZUWEfWhzTaiQ28M7Y0h9LrCZcAANJ4D4eUTK2PQBgUBCsGKjPgIcz2caiqDEjrckCNF-dU=@protonmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div style="font-family: Arial, sans-serif; font-size: 14px;">Hello
        there,</div>
      <div style="font-family: Arial, sans-serif; font-size: 14px;"><br>
      </div>
      <div style="font-family: Arial, sans-serif; font-size: 14px;">I
        installed mlmmj (via iRedMail) on Debian Bookworm.</div>
      <div style="font-family: Arial, sans-serif; font-size: 14px;"><br>
      </div>
      <div style="font-family: Arial, sans-serif; font-size: 14px;">It
        works well even for the pretty bad admin I am. But I don't know
        where to look to understand the following problem :</div>
      <div style="font-family: Arial, sans-serif; font-size: 14px;">
        <ul
data-editing-info="{&quot;orderedStyleType&quot;:1,&quot;unorderedStyleType&quot;:1}">
          <li style="list-style-type: disc;"><span>My list works well
              for all users most of the time</span></li>
          <li style="list-style-type: disc;"><span>When a sender uses
              orange.fr SMTP to send a mail on this list, the
              subscribers with @protonmail.com adresses won't get the
              mail at all (not even in the spams), the other subscribers
              will receive it.</span></li>
          <li style="list-style-type: disc;"><span>if some @orange.fr
              sender, sends a mail directly (without the list) to some
              @protonmail.com receiver, it works<br>
            </span></li>
        </ul>
        <div>It looks like mlmmj adds something that will make mails
          sent by orange.fr unacceptable for @protonmail.com mail
          serveur.</div>
        <div><br>
        </div>
        <div>Any idea where I should look ? Thank you</div>
        <div><br>
        </div>
        <div>Pierre<br>
        </div>
      </div>
      <div style="font-family: Arial, sans-serif; font-size: 14px;"><br>
      </div>
      <div style="font-family: Arial, sans-serif; font-size: 14px;"><br>
      </div>
      <div class="protonmail_signature_block"
        style="font-family: Arial, sans-serif; font-size: 14px;">
        <div
class="protonmail_signature_block-user protonmail_signature_block-empty">
        </div>
        <div class="protonmail_signature_block-proton"> Envoyé avec la
          messagerie sécurisée <a target="_blank"
            href="https://proton.me/" rel="noopener noreferrer"
            moz-do-not-send="true">Proton Mail.</a> </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------TjSFyABC2d8nWgh0HaDxFg51--


