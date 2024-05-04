Return-Path: <mlmmj+bounces-3061-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01179C4345F
	for <mlmmj@archiver.kernel.org>; Sat,  4 May 2024 11:04:19 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3061-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1s3Cf8-003Gae-Kw
	for mlmmj@archiver.kernel.org; Sat, 04 May 2024 10:30:38 +0000
Received: from wfout6-smtp.messagingengine.com ([64.147.123.149])
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <xi@borderworlds.dk>)
	id 1s3Cf0-003GXp-CN
	for mlmmj@mlmmj.org; Sat, 04 May 2024 10:30:31 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id C5E791C006CA
	for <mlmmj@mlmmj.org>; Sat,  4 May 2024 06:42:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 04 May 2024 06:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=borderworlds.dk;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1714819361; x=1714905761; bh=GxalDIdsQ0
	vZ+OV6r1tsyAii9tuolaBCDYqSuWZAC8k=; b=HVhkykPbtsVWJNzjR0mf0Zx7q2
	5rBPLydDBh+kUcO85fLdRGzf23zvdxyN+CnyCnv4w3dUknb7lb5FeT78RwwDZtQb
	c6ubTyJ35lPP0eX9MSaKUz2Kx354XZUZaWFUekd9jDsN1MGxg7FGF5aZGI/8qka9
	wUfKxoXHkE+zjumcjx7q6P4GWzyYaerY0L+O6YpAaiolqXPOhRYkyOg0MtFW+vKL
	ueQMFXeF2aa4Xyzdn8CjaMatshy01G195nrboENBHSAD5b35Cm/IiXK/ltDWJcpf
	n97oqtKzb2XmVlqafuoKM6cDxU8w7H8aMxcltgfjWX+FrCD+PFzU8vsRkbYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714819361; x=1714905761; bh=GxalDIdsQ0vZ+OV6r1tsyAii9tuo
	laBCDYqSuWZAC8k=; b=gkuzh9rDYWTxp7n9jD6aqGdC7lUCPiOrdjOpPwEdbfyp
	cnKqNCC5i8LIw3BDRwDdnm7YQRNFhCnMSEHSFKlLtoUg9UtWgES685idLw3NEzTz
	8NxPtCLOhABhyu82juV7XO7dlyXcUUJdTt62QC9Jxhc+lyiSLEtUkhr7ecr6xLzM
	03QmEbTpDsaFylGzCPP6n1nzLvRL56VaztExR6XMbSvZ/sTh3PLJtPeYXmE+rEiC
	6+OqwPM/XaA5nLzyeZi06FmBNupYG+gI664gDgcANyJYwJi+qae7FshMEFZDDIoO
	05uVMqz1m+L/VvZyTebjaK/GSd+uDtzMBBLROlbAUQ==
X-ME-Sender: <xms:IBE2ZiIXK4bhDfGNiBI5rba6mfuE0DQsgC2wLYld65XanLgllw-Ltw>
    <xme:IBE2ZqKBb-5K3xoi_xCXLrett4-N86sj_ZUpMvtuoTQeHApE4Yaj-uvvHwUmJ505b
    G0HwEATTBqEYDqAVQ>
X-ME-Received: <xmr:IBE2ZisWqqiRr1hGrelUN8NyjxJdeJ4dULVVgpq1uWWZqxZr4ZXdtkkfiBBdz73HnrxFBQEigE_MnmDnVfiWn-pVqDvIC6oYE_aMxs0OVijKn7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvvddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpegtkfffgggfuffvfhfhohgjsegrtd
    erredtvdejnecuhfhrohhmpeevhhhrihhsthhirghnucfuthoorhhkuceogihisegsohhr
    uggvrhifohhrlhgushdrughkqeenucggtffrrghtthgvrhhnpeeuvdehgfegleevffehue
    dvjeejkeejffdugfetuedutddtgfejgeffheffieejtdenucffohhmrghinhepmhhlmhhm
    jhdrohhrghdpudgrphhirdhnvghtpdhhohhsthhshhgrrhhinhhgrdhnvghtnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepgihisegsohhruggv
    rhifohhrlhgushdrughk
X-ME-Proxy: <xmx:IBE2ZnZ-3Z6YTrOaepx5XEKgSV-nemZ3zuAjeinlwBY5sgeZIiJC8g>
    <xmx:IBE2Zpag-MhY5eFZfJP9-HpFC49fPRZG7mBUBCGJKilmjU2AsFsHhQ>
    <xmx:IBE2ZjDAUZF7oqSavG5LFd5GH3TCqtT73u7sn79hjw-Wy_z4OjTW_A>
    <xmx:IBE2ZvaFV5En_AtkWaPQ6tRvx5wG3hXSVgpgyCYK9SkQyLHVDxZDUw>
    <xmx:IRE2ZoyifbhLnl9S8w-F7wpwXabI0byV3_oq6M84xNYfT1Co79N-aXL_>
Feedback-ID: i69e04380:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for <mlmmj@mlmmj.org>;
 Sat, 4 May 2024 06:42:39 -0400 (EDT)
Content-Type: multipart/alternative;
 boundary="------------36xHxyDwLxq2dk70VTdW0k5Y"
Message-ID: <e48a6392-f41b-4a72-abaa-ff9938ddb718@borderworlds.dk>
Date: Sat, 4 May 2024 12:42:38 +0200
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mlmmj] Roadmap for 1.5
Content-Language: en-US
To: mlmmj@mlmmj.org
References: <8e40c6fe4b3550052e405e068ecd13619602c4c7@nours.eu>
 <836c9c87-7d0e-41b9-b33f-c4887d2ae34e@deganius.de>
 <13C5A781-18E5-423C-9599-575EB1DF63A5@nours.eu>
 <17df9faa-4a97-44b7-aa66-82cd3984deaf@deganius.de>
 <CAJhTkW4UaJXHh_-FJdc7fuKfecKomZQn85B=b60RCz9OKgbBsg@mail.gmail.com>
From: =?UTF-8?Q?Christian_St=C3=A6rk?= <xi@borderworlds.dk>
Organization: The Border Worlds
In-Reply-To: <CAJhTkW4UaJXHh_-FJdc7fuKfecKomZQn85B=b60RCz9OKgbBsg@mail.gmail.com>

This is a multi-part message in MIME format.
--------------36xHxyDwLxq2dk70VTdW0k5Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry for me not getting around to this much sooner.

I have asked for the domain to be unlocked and for a transfer code.

Best regards
Christian

On 5/4/24 09:39, Wolf Bergenheim wrote:
> On Sat, May 4, 2024 at 9:28 AM Christof Thalhofer 
> <chrisml@deganius.de> wrote:
>
>     Who owns mlmmj.org <http://mlmmj.org>?
>
>
> Huh I thought we had gone through the DNS transfer already, but 
> apparently not.
> The domain is still in the hands of @Christian Stærk 
> <mailto:xi@borderworlds.dk>
>
> I have my linode dns config set up and ready to start hosting the 
> domain... :) Just waiting for Christian to do the domain transfer...
>
> --Wolf
>
>     > whois mlmmj.org <http://mlmmj.org>
>     > Domain Name: mlmmj.org <http://mlmmj.org>
>     > Registrar URL: http://www.1api.net
>
>     The guys at hostsharing.net <http://hostsharing.net> (this is a
>     webhoster coop I am a member of)
>     said that they would be happy to sponsor the hosting of this domain.
>
>     Alles Gute
>
>     Christof Thalhofer
>
>     -- 
>     Dies ist keine Signatur
>
>
>

--------------36xHxyDwLxq2dk70VTdW0k5Y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Sorry for me not getting around to this much sooner.<br>
    <br>
    I have asked for the domain to be unlocked and for a transfer code.<br>
    <br>
    Best regards<br>
    Christian<br>
    <br>
    <div class="moz-cite-prefix">On 5/4/24 09:39, Wolf Bergenheim wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJhTkW4UaJXHh_-FJdc7fuKfecKomZQn85B=b60RCz9OKgbBsg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Sat, May 4, 2024 at 9:28 AM Christof Thalhofer
          &lt;<a href="mailto:chrisml@deganius.de" target="_blank"
            moz-do-not-send="true" class="moz-txt-link-freetext">chrisml@deganius.de</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Who
            owns <a href="http://mlmmj.org" rel="noreferrer"
              target="_blank" moz-do-not-send="true">mlmmj.org</a>?<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>Huh I thought we had gone through the DNS
            transfer already, but apparently not.</div>
          <div>The domain is still in the hands of <a
              class="gmail_plusreply"
              id="m_1083974831482065916plusReplyChip-0"
              href="mailto:xi@borderworlds.dk" target="_blank"
              moz-do-not-send="true">@Christian Stærk</a> </div>
          <div><br>
          </div>
          <div>I have my linode dns config set up and ready to start
            hosting the domain... :) Just waiting for Christian to do
            the domain transfer...</div>
          <div><br>
          </div>
          <div>--Wolf</div>
          <div> </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            &gt; whois <a href="http://mlmmj.org" rel="noreferrer"
              target="_blank" moz-do-not-send="true">mlmmj.org</a><br>
            &gt; Domain Name: <a href="http://mlmmj.org"
              rel="noreferrer" target="_blank" moz-do-not-send="true">mlmmj.org</a><br>
            &gt; Registrar URL: <a href="http://www.1api.net"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">http://www.1api.net</a><br>
            <br>
            The guys at <a href="http://hostsharing.net"
              rel="noreferrer" target="_blank" moz-do-not-send="true">hostsharing.net</a>
            (this is a webhoster coop I am a member of) <br>
            said that they would be happy to sponsor the hosting of this
            domain.<br>
            <br>
            Alles Gute<br>
            <br>
            Christof Thalhofer<br>
            <br>
            -- <br>
            Dies ist keine Signatur<br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------36xHxyDwLxq2dk70VTdW0k5Y--


