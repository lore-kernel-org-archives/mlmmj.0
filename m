From: Baptiste Daroussin <bapt@nours.eu>
Date: Thu, 09 Nov 2023 07:40:07 +0000
Subject: Re: [mlmmj] Odd message truncation with 1.4.0-rc2
Message-Id: <7nrnvdgimjajmz4vaetqyo4yansyim26rpvuf5fucnf4mjdypw@auiyhgru65od>
List-Id: <mlmmj.mlmmj.org>
References: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
In-Reply-To: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Nov 08, 2023 at 04:58:49PM -0500, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> I had some bad corruption with 1.4.0-rc2 today -- I am trying to figure out
> what happened, but I'm not sure I can easily narrow it down. Here's the
> description, at least:
> 
> The same conversation was sent to 2 lists, both managed by rc2 (+1 commit in
> the latest master):
> 
> - users@linux.kernel.org
> - ksummit@lists.linux.dev
> 
> They are both configured to invoke /opt/mlmmj/bin/mlmmj* commands, which is
> where the rc2 is installed: 
> 
>     ksummit.lists.linux.dev@localhost.mlmmj mlmmjopt:ksummit.lists.linux.dev
>     users.linux.kernel.org@localhost.mlmmj mlmmjopt:users.linux.kernel.org
> 
> From master.cf:
> 
>     mlmmjopt  unix  -       n       n       -       -       pipe
>         flags=Rhu user=mlmmj argv=/opt/mlmmj/bin/mlmmj-receive -F -L /var/spool/mlmmj/$nexthop
> 
> All other lists on that system still use mlmmj-1.3.0 that is in /usr/bin/*.
> The only major difference between the two lists is that the users list is set
> as "noarchive".
> 
> This is the thread in question:
> https://lore.kernel.org/ksummit/CAL_Jsq+j1f_MkLaA3WBG-u1oA5gQra4PyoHmpta=gxB94Q1XrQ@mail.gmail.com/T/#m510ece017fcd0f5d413b5a2bb6ef054cede4a7c2
> 
> Note, that public-inbox reads the messages directly from the "archive"
> directory, so you won't see problems in that thread, just Joe getting
> progressively more frustrated because the messages he gets back from the list
> are all truncated after this line:
> 
>     > BTW, you have joined some of the discussions to these patches in the past.
> 
> I can confirm that the same truncation was seen going out to the users@
> mailing list, to which I am subscribed from a different address.
> 
> I also note that all 4 messages came out with the same ID (865) in the return path:
> 
>     Return-Path: <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>
> 
> So, not only the truncation happened, but the index was not updated between
> deliveries, suggesting that the process probably terminated incorrectly.
> 
> I attach msg1-msg4, which you can compare to what we have in public-inbox
> (which reads directly from the disk in archive/, remember):
> 
> msg1.txt: https://lore.kernel.org/ksummit/fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com/raw
> msg2.txt: https://lore.kernel.org/ksummit/bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com/raw
> msg3.txt: https://lore.kernel.org/ksummit/3eee9b9494870c20e189133eeac6af100f591af7.camel@perches.com/raw
> msg4.txt: https://lore.kernel.org/ksummit/88a5fb768bee48db508c366a0110e88b193d59a3.camel@perches.com/raw
> 
> I am happy to offer any further details or run any further tests, but at this
> point I don't think rc2 is ready to go out.
> 
> -K

Thank you for the detailed report, I believe I have a pretty good
hint, on what causes this issue, I will try to isolate, reproduce it and fix it!

Best regards,
Bapt

> Return-Path: <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>
> Delivered-To: konstantin.ryabitsev@linux.dev
> Received: from mp12.migadu.com ([2001:41d0:303:e224::])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
> 	by ms13.migadu.com with LMTPS
> 	id 2E7JBUfsS2U6aAAAauVa8A:P1
> 	(envelope-from <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>)
> 	for <konstantin.ryabitsev@linux.dev>; Wed, 08 Nov 2023 21:15:03 +0100
> Received: from aspmx1.migadu.com ([2001:41d0:303:e224::])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
> 	by mp12.migadu.com with LMTPS
> 	id 2E7JBUfsS2U6aAAAauVa8A
> 	(envelope-from <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>)
> 	for <konstantin.ryabitsev@linux.dev>; Wed, 08 Nov 2023 21:15:03 +0100
> Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
> 	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
> 	(No client certificate requested)
> 	by aspmx1.migadu.com (Postfix) with ESMTPS id E3CB517A76
> 	for <konstantin.ryabitsev@linux.dev>; Wed,  8 Nov 2023 21:15:02 +0100 (CET)
> Authentication-Results: aspmx1.migadu.com;
> 	dkim=none;
> 	dmarc=none;
> 	spf=pass (aspmx1.migadu.com: domain of "users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org" designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org"
> ARC-Seal: i=1; s=key1; d=linux.dev; t99474503; a=rsa-sha256; cv=none;
> 	b=PdvUsx1LP0pOkEVKq/YS/a/fMJm91PBd3fkyab1Gg/FVj6JTf9/2nPra5w0dzncu8spKfc
> 	3yoOWkLabINEUI9O2S/QJXvLQjXfncl5xoIHSKdsuC18pp73Q9fK1coUKhk09is7J72JsV
> 	7rFs95N6oVw53bW09X/qm2xRl9PsMI8> ARC-Authentication-Results: i=1;
> 	aspmx1.migadu.com;
> 	dkim=none;
> 	dmarc=none;
> 	spf=pass (aspmx1.migadu.com: domain of "users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org" designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org"
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev;
> 	s=key1; t99474503;
> 	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
> 	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
> 	 content-transfer-encoding:content-transfer-encoding:
> 	 in-reply-to:in-reply-to:references:references:list-id:
> 	 list-unsubscribe:list-subscribe;
> 	bh=ejzI2RCodvPkI33hnzdSsGwbCjQ8ZAFOh44tv8NK2WY=;
> 	b=bJuYtJcXsyZmw1G+9K42W2sCal6OKB3qbZ3O6tufqDA1Zl/j7N5M/an90j5LBthNLGoMwa
> 	M3Ek5GFyx2YqoYJgG6bTfXHi3VGTCZ5eFw8bXfSqnDPt7OA71BYVnt0L5zphQ8Fa+mMaTa
> 	Zfev4IyKj2HLFKxN2NnarTfFj2kSpvY> Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F37B21C20A0D
> 	for <konstantin.ryabitsev@linux.dev>; Wed,  8 Nov 2023 20:15:01 +0000 (UTC)
> Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
> 	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229BD37165;
> 	Wed,  8 Nov 2023 20:14:59 +0000 (UTC)
> Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3933730341
> 	for <users@linux.kernel.org>; Wed,  8 Nov 2023 20:14:56 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
> Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
> 	by unirelay02.hostedemail.com (Postfix) with ESMTP id A4038120CBB;
> 	Wed,  8 Nov 2023 20:14:55 +0000 (UTC)
> Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id A2D3620027;
> 	Wed,  8 Nov 2023 20:14:53 +0000 (UTC)
> Message-ID: <fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com>
> Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
>  MAINTAINERS away from linux-kernel@vger.kernel.org
> From: Joe Perches <joe@perches.com>
> To: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
> 	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
> 	ksummit@lists.linux.dev
> Date: Wed, 08 Nov 2023 12:14:52 -0800
> In-Reply-To: <20231108150749.13b7a0ee@gandalf.local.home>
> References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
> 	 <20231106110547.6956a430@gandalf.local.home>
> 	 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
> 	 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
> 	 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
> 	 <20231108140415.46f84baa@gandalf.local.home>
> 	 <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
> 	 <20231108143447.12d73140@gandalf.local.home>
> 	 <20231108150749.13b7a0ee@gandalf.local.home>
> Content-Type: text/plain; charset="ISO-8859-1"
> Content-Transfer-Encoding: quoted-printable
> User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
> Precedence: bulk
> X-Mailing-List: users@linux.kernel.org
> List-Id: <users.linux.kernel.org>
> List-Subscribe: <mailto:users+subscribe@linux.kernel.org>
> List-Unsubscribe: <mailto:users+unsubscribe@linux.kernel.org>
> MIME-Version: 1.0
> X-Rspamd-Server: rspamout03
> X-Rspamd-Queue-Id: A2D3620027
> X-Stat-Signature: y45ybparcpbipph5xrh75ah4whbmsbtw
> X-Session-Marker: 6A6F6540706572636865732E636F6D
> X-Session-ID: U2FsdGVkX1+xzUnc191JhPJlSN6SMU/qltJe5ppUf+U> X-HE-Tag: 1699474493-779491
> X-HE-Meta: U2FsdGVkX1/BJa0Taun1pph8xznUQ7N2opbYP58Qf6lwpp8h+lNi0HrMeroKlP514xcGNFJh4wjLhj5tFZHr/5ejO4k7HTgkCJW/DJ3hwZ4w8lXX9Qhqg8giaPeyRuShkQ54LZVL/cDkRg8AfyIXNXRwPF25sMsLXGvYpLY9ObmOxLRktF7kJLrvsFLgQ0/gAogamCxriGmXwfVZWlCCI7qOQBxD7x6uNYVhq9HNKXelwJUymaF6AMXsop6Ul1lgBx7bm97OVCiu7IxNbSR3LaHldCUay+s8ESAIFVnSLPgErSvgqaqqttm6hDSos7maBNNXsWMhL6Edk4zI4NrhR12INzJd1NTf0YwvkZK8+3kNfjjhcKEhPdzuEe9gWYiD
> X-Migadu-Flow: FLOW_IN
> X-Migadu-Country: US
> X-Migadu-Queue-Id: E3CB517A76
> X-Migadu-Scanner: mx12.migadu.com
> X-Migadu-Spam-Score: -7.17
> X-Spam-Score: -7.17
> 
> On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> > BTW, you have joined some of the discussions to these patches in the past
> Return-Path: <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>
> Delivered-To: konstantin.ryabitsev@linux.dev
> Received: from mp12.migadu.com ([2001:41d0:403:4876::])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
> 	by ms13.migadu.com with LMTPS
> 	id gF5kJnLxS2V4dgEAauVa8A:P1
> 	(envelope-from <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>)
> 	for <konstantin.ryabitsev@linux.dev>; Wed, 08 Nov 2023 21:37:06 +0100
> Received: from aspmx1.migadu.com ([2001:41d0:403:4876::])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
> 	by mp12.migadu.com with LMTPS
> 	id gF5kJnLxS2V4dgEAauVa8A
> 	(envelope-from <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>)
> 	for <konstantin.ryabitsev@linux.dev>; Wed, 08 Nov 2023 21:37:06 +0100
> Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
> 	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
> 	(No client certificate requested)
> 	by aspmx1.migadu.com (Postfix) with ESMTPS id 41D7722235
> 	for <konstantin.ryabitsev@linux.dev>; Wed,  8 Nov 2023 21:37:06 +0100 (CET)
> Authentication-Results: aspmx1.migadu.com;
> 	dkim=none;
> 	dmarc=none;
> 	spf=pass (aspmx1.migadu.com: domain of "users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org" designates 147.75.48.161 as permitted sender) smtp.mailfrom="users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org"
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev;
> 	s=key1; t99475826;
> 	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
> 	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
> 	 content-transfer-encoding:content-transfer-encoding:
> 	 in-reply-to:in-reply-to:references:references:list-id:
> 	 list-unsubscribe:list-subscribe;
> 	bh=q30MsbMkde5Dgvyl0rYYIjUEeyXfaUl2em/HQCnP8/c=;
> 	b=EWSRagb2grDwLK05MkyLHtEOujUl0SDems8nqiAMRxkInJsSQ0dKctRYzrFMT8NfuKhNvH
> 	u8pFNS/F2D03E2sd2b+8INv8GHibO9Exm7bCFjB52vwkgzxcg7qkA2fxfOJo6OgHRppSJT
> 	sURhLAI0NnjGrU8OmRG0zYOyDlCZKGc> ARC-Authentication-Results: i=1;
> 	aspmx1.migadu.com;
> 	dkim=none;
> 	dmarc=none;
> 	spf=pass (aspmx1.migadu.com: domain of "users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org" designates 147.75.48.161 as permitted sender) smtp.mailfrom="users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org"
> ARC-Seal: i=1; s=key1; d=linux.dev; t99475826; a=rsa-sha256; cv=none;
> 	b=cNcf4o7/M2Y8XvynpVnHyw3FmGIJq5FUblwpHyIfG9yGD4xR//9ONfLgU2fsCJqY4MyQpx
> 	n2UBcpeIWmgWt8v/rGyzUbqjiKKMJD/wcOFDEcMJaJ0CG8O6nGmNN1GNm4bPK5Ze6Iaps+
> 	xMSmM5DlNw2iFXo+R8Ag7YtE4p3Ji84> Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D36B8B20D05
> 	for <konstantin.ryabitsev@linux.dev>; Wed,  8 Nov 2023 20:37:03 +0000 (UTC)
> Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
> 	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355303715F;
> 	Wed,  8 Nov 2023 20:37:02 +0000 (UTC)
> Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BBD374C9
> 	for <users@linux.kernel.org>; Wed,  8 Nov 2023 20:36:58 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
> Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
> 	by unirelay10.hostedemail.com (Postfix) with ESMTP id C9F0AC0C97;
> 	Wed,  8 Nov 2023 20:36:57 +0000 (UTC)
> Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id C7EFD2002A;
> 	Wed,  8 Nov 2023 20:36:55 +0000 (UTC)
> Message-ID: <bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com>
> Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
>  MAINTAINERS away from linux-kernel@vger.kernel.org
> From: Joe Perches <joe@perches.com>
> To: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
> 	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
> 	ksummit@lists.linux.dev
> Date: Wed, 08 Nov 2023 12:36:54 -0800
> In-Reply-To: <fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com>
> References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
> 	 <20231106110547.6956a430@gandalf.local.home>
> 	 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
> 	 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
> 	 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
> 	 <20231108140415.46f84baa@gandalf.local.home>
> 	 <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
> 	 <20231108143447.12d73140@gandalf.local.home>
> 	 <20231108150749.13b7a0ee@gandalf.local.home>
> 	 <fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com>
> Content-Type: text/plain; charset="ISO-8859-1"
> Content-Transfer-Encoding: quoted-printable
> User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
> Precedence: bulk
> X-Mailing-List: users@linux.kernel.org
> List-Id: <users.linux.kernel.org>
> List-Subscribe: <mailto:users+subscribe@linux.kernel.org>
> List-Unsubscribe: <mailto:users+unsubscribe@linux.kernel.org>
> MIME-Version: 1.0
> X-Stat-Signature: 36n1nwrpp5m66nmsgrhg3w4ne97e4rqu
> X-Rspamd-Server: rspamout04
> X-Rspamd-Queue-Id: C7EFD2002A
> X-Session-Marker: 6A6F6540706572636865732E636F6D
> X-Session-ID: U2FsdGVkX1+ZNEjOqJ4tGFY4bbN+ePJyAC00wxSUUng> X-HE-Tag: 1699475815-129251
> X-HE-Meta: U2FsdGVkX1/daq2BSPP3C5V+F2oBSP4b4a+LhdFUchnQR5shy3sWXZuLsObaA6vMGCCstD3GpfDUiwY9eg4c1rme00I8S121k1HmBpCd/jXNnpquVLvaPrLyLjJuuvj9loMBtTSd2TwGcsIq4Hec+eJwdCTWGKWh9xx12kdWWFZZ7pM0gdfmnsE7+QxUMX2W2RNJjjvwx2xxsFTgvuOWefNVD6kLevO+obs+4kldwj/JDixJpCy8N872jMT+V5LUDqR75x62j3cdMBzSxTRXlb2u4FdDO36wQM3Z20cCF+LuxTogoT1KeO/fCKys2VGA68Gx1kl4IkmTdsGdDzO3HD4xvplFWSpW82cSq/vaGNjJcriu70Km0f7BahwfYxLB
> X-Migadu-Flow: FLOW_IN
> X-Migadu-Country: US
> X-Migadu-Spam-Score: -7.14
> X-Spam-Score: -7.14
> X-Migadu-Queue-Id: 41D7722235
> X-Migadu-Scanner: mx10.migadu.com
> 
> On Wed, 2023-11-08 at 12:14 -0800, Joe Perches wrote:
> > On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> 
> <empty email?  evolution still sucks>
> 
> My sent email folder entry for this is:
> 
> On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> > BTW, you have joined some of the discussions to these patches in the past
> Return-Path: <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>
> Delivered-To: konstantin.ryabitsev@linux.dev
> Received: from mp10.migadu.com ([2001:41d0:403:4876::])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
> 	by ms13.migadu.com with LMTPS
> 	id SF31MqDyS2UDhQEAG6o9tA:P1
> 	(envelope-from <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>)
> 	for <konstantin.ryabitsev@linux.dev>; Wed, 08 Nov 2023 21:42:09 +0100
> Received: from aspmx1.migadu.com ([2001:41d0:403:4876::])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
> 	by mp10.migadu.com with LMTPS
> 	id SF31MqDyS2UDhQEAG6o9tA
> 	(envelope-from <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>)
> 	for <konstantin.ryabitsev@linux.dev>; Wed, 08 Nov 2023 21:42:08 +0100
> Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
> 	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
> 	(No client certificate requested)
> 	by aspmx1.migadu.com (Postfix) with ESMTPS id 6C1322244A
> 	for <konstantin.ryabitsev@linux.dev>; Wed,  8 Nov 2023 21:42:08 +0100 (CET)
> Authentication-Results: aspmx1.migadu.com;
> 	dkim=none;
> 	dmarc=none;
> 	spf=pass (aspmx1.migadu.com: domain of "users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org" designates 139.178.88.99 as permitted sender) smtp.mailfrom="users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org"
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev;
> 	s=key1; t99476128;
> 	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
> 	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
> 	 content-transfer-encoding:content-transfer-encoding:
> 	 in-reply-to:in-reply-to:references:references:list-id:
> 	 list-unsubscribe:list-subscribe;
> 	bh=Q/ufbCNMXkJmSR68W6MsoOhaGZf1oY0RZdWFde6QXEg=;
> 	b=XGjLu4meMhwjSNhkA2HPHaWerjvEGGaZfL/C2HyAwvXtl3euTQtDh1b36kpge3jJdLaxkp
> 	unLsPrZvLgn4HeLJU+xRFgffJyyq2xSPKwDzajxSQemoyDCvNkUQey9HC3+z8TEhjULcol
> 	XbhMiReDXGxxKMbjlpHWeKGWTU0YGME> ARC-Authentication-Results: i=1;
> 	aspmx1.migadu.com;
> 	dkim=none;
> 	dmarc=none;
> 	spf=pass (aspmx1.migadu.com: domain of "users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org" designates 139.178.88.99 as permitted sender) smtp.mailfrom="users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org"
> ARC-Seal: i=1; s=key1; d=linux.dev; t99476128; a=rsa-sha256; cv=none;
> 	b=ATr8YohMfvF3hR4IO1xwn4bL1ZyuT2Ct8gJO+b+US3nWLw+ZNXgdWG8Qdmbihn5JTtBQJ6
> 	yo97LJgBikTwDMGag/mXbxxXepG2TQrZQB6UzpcsanfAK2ui8hJP6UrtfQjM4u1Is3jXD6
> 	A0t819wOeQa6ZISmihLmVRgC1Q6s4KA> Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AF042815E0
> 	for <konstantin.ryabitsev@linux.dev>; Wed,  8 Nov 2023 20:42:06 +0000 (UTC)
> Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
> 	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716C430F94;
> 	Wed,  8 Nov 2023 20:42:04 +0000 (UTC)
> Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B393715F
> 	for <users@linux.kernel.org>; Wed,  8 Nov 2023 20:42:01 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
> Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
> 	by unirelay10.hostedemail.com (Postfix) with ESMTP id 08DC7C0C52;
> 	Wed,  8 Nov 2023 20:41:59 +0000 (UTC)
> Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id DA35020024;
> 	Wed,  8 Nov 2023 20:41:56 +0000 (UTC)
> Message-ID: <3eee9b9494870c20e189133eeac6af100f591af7.camel@perches.com>
> Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
>  MAINTAINERS away from linux-kernel@vger.kernel.org
> From: Joe Perches <joe@perches.com>
> To: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
> 	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
> 	ksummit@lists.linux.dev
> Date: Wed, 08 Nov 2023 12:41:55 -0800
> In-Reply-To: <20231108150749.13b7a0ee@gandalf.local.home>
> References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
> 	 <20231106110547.6956a430@gandalf.local.home>
> 	 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
> 	 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
> 	 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
> 	 <20231108140415.46f84baa@gandalf.local.home>
> 	 <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
> 	 <20231108143447.12d73140@gandalf.local.home>
> 	 <20231108150749.13b7a0ee@gandalf.local.home>
> Content-Type: text/plain; charset="ISO-8859-1"
> Content-Transfer-Encoding: quoted-printable
> User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
> Precedence: bulk
> X-Mailing-List: users@linux.kernel.org
> List-Id: <users.linux.kernel.org>
> List-Subscribe: <mailto:users+subscribe@linux.kernel.org>
> List-Unsubscribe: <mailto:users+unsubscribe@linux.kernel.org>
> MIME-Version: 1.0
> X-Rspamd-Server: rspamout03
> X-Rspamd-Queue-Id: DA35020024
> X-Stat-Signature: k3fpnyofdpfa1go1cwe4qx1r5dzgf8qq
> X-Session-Marker: 6A6F6540706572636865732E636F6D
> X-Session-ID: U2FsdGVkX18AZJeauIe8gsf6+XqfTrqV/JCMwRkJw0I> X-HE-Tag: 1699476116-185375
> X-HE-Meta: U2FsdGVkX1/i1uZ9DMu9qgMxF7OUBasMmiC+Yj4KBjyxNipepnS2bvmWox7raJZ7YnjsuOu3zKTXybZ4WZHs1Aclf6t6TErPMvMeahn19aCHIe/IAZBaU7oCq5VaFFXQ6WkBrUxYvQVKl4vW2uwffwD/aUA28URB273EjtEVbhuP9zi/dAML77UzucyKJvdo8fqX2Wxk/j52KTNRkVGaDqI1UNrxBErKmWEwtonERQWsK7bT1/RQ821XLPZcC7uC3NTbsf5JY8bN+X76++hGOjeHNlktlaHZhmMkgnzyK64PhbHywJ/y7BftaVJD2m6Q3q8BAKfXO0HhRcfkhfL9QDxntzMwnxXVgkCglfT8TR3iiaRfmAgGZiy2FFSJQfFwNRCNzybxOKY+Tm6nQS4L3fz9KCpvRxz/YmvP7QXDLkmw5J0GMBLMpw/TNqzKBP7r
> X-Migadu-Flow: FLOW_IN
> X-Migadu-Country: US
> X-Migadu-Spam-Score: -6.57
> X-Spam-Score: -6.57
> X-Migadu-Queue-Id: 6C1322244A
> X-Migadu-Scanner: mx10.migadu.com
> 
> On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> > On Wed, 8 Nov 2023 14:34:47 -0500
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> > 
> > > I use to only do discussions on LKML and have myself Cc'd (or Cc myself>  in
> > > the discussions), but then I couldn't manage the patches from my inbox.>  So
> > > I set up the mailing list and added that to be Cc'd too in MAINTAINERS,>  so
> > > that everything goes to the other mailing list as well. That would then>  keep
> > > the patches in patchwork, but the discussions would still be visible to>  the
> > > general audience on LKML.
> > 
> > BTW, you have joined some of the discussions to these patches in the past
> Return-Path: <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>
> Delivered-To: konstantin.ryabitsev@linux.dev
> Received: from mp10.migadu.com ([2001:41d0:303:e16b::])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
> 	by ms13.migadu.com with LMTPS
> 	id CH9fI1b0S2VUBgAAG6o9tA:P1
> 	(envelope-from <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>)
> 	for <konstantin.ryabitsev@linux.dev>; Wed, 08 Nov 2023 21:49:26 +0100
> Received: from aspmx1.migadu.com ([2001:41d0:303:e16b::])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
> 	by mp10.migadu.com with LMTPS
> 	id CH9fI1b0S2VUBgAAG6o9tA
> 	(envelope-from <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>)
> 	for <konstantin.ryabitsev@linux.dev>; Wed, 08 Nov 2023 21:49:26 +0100
> Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
> 	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
> 	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
> 	(No client certificate requested)
> 	by aspmx1.migadu.com (Postfix) with ESMTPS id 9DD5741E8E
> 	for <konstantin.ryabitsev@linux.dev>; Wed,  8 Nov 2023 21:49:25 +0100 (CET)
> Authentication-Results: aspmx1.migadu.com;
> 	dkim=none;
> 	spf=pass (aspmx1.migadu.com: domain of "users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org" designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org";
> 	dmarc=none
> ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev;
> 	s=key1; t99476566;
> 	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
> 	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
> 	 content-transfer-encoding:content-transfer-encoding:
> 	 in-reply-to:in-reply-to:references:references:list-id:
> 	 list-unsubscribe:list-subscribe;
> 	bh=uqj1YM9BxJ3EmsI0IpaFbLi0fhJJ7zRDuVYh5UsInYA=;
> 	b=M2IazwvlhaD0lSaiLboe+vUBoyNKJg1BjHJkAFPX7OwvU6arqAoJI81Cjwxaoe0fVQEcTH
> 	JO9iGV/HVQoHkasF4i+9/6NTkKwGgvSsP2I/th9tuPvFdVYpt36FKjUdroBlzFCd3+ukeE
> 	Pe9wdU3m1GGoSNN2ysyXh/EKA9KYYY4> ARC-Authentication-Results: i=1;
> 	aspmx1.migadu.com;
> 	dkim=none;
> 	spf=pass (aspmx1.migadu.com: domain of "users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org" designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org";
> 	dmarc=none
> ARC-Seal: i=1; s=key1; d=linux.dev; t99476566; a=rsa-sha256; cv=none;
> 	b=upH4sDdJzsaYcnFaE2ClQHZ2afdbA0rNwVzzJkYIp8CEfG6wQ5sJD3aJc+PPr4WBAAOnOr
> 	5SmlHkb8f8iLM0fAZ1iVng2E4hTbM4msyD2f08sBxxUkxh/1VzZV8PBkgNsl/em2Q0ugEe
> 	r7haeDEqhM3xpmovw5rYP9UznEouhAo> Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4BDFB20CC6
> 	for <konstantin.ryabitsev@linux.dev>; Wed,  8 Nov 2023 20:49:22 +0000 (UTC)
> Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
> 	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0F332C80;
> 	Wed,  8 Nov 2023 20:49:20 +0000 (UTC)
> Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C92632C65
> 	for <users@linux.kernel.org>; Wed,  8 Nov 2023 20:49:17 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
> Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
> Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
> 	by unirelay02.hostedemail.com (Postfix) with ESMTP id C4443120CD9;
> 	Wed,  8 Nov 2023 20:49:16 +0000 (UTC)
> Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id C6EEC20028;
> 	Wed,  8 Nov 2023 20:49:14 +0000 (UTC)
> Message-ID: <88a5fb768bee48db508c366a0110e88b193d59a3.camel@perches.com>
> Subject: Re: [workflows]Re: [workflows]RFC: switching "THE REST" in
>  MAINTAINERS away from linux-kernel@vger.kernel.org
> From: Joe Perches <joe@perches.com>
> To: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mark Brown <broonie@kernel.org>, Konstantin Ryabitsev
> 	 <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
> 	ksummit@lists.linux.dev
> Date: Wed, 08 Nov 2023 12:49:13 -0800
> In-Reply-To: <bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com>
> References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
> 	 <20231106110547.6956a430@gandalf.local.home>
> 	 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
> 	 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
> 	 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
> 	 <20231108140415.46f84baa@gandalf.local.home>
> 	 <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
> 	 <20231108143447.12d73140@gandalf.local.home>
> 	 <20231108150749.13b7a0ee@gandalf.local.home>
> 	 <fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com>
> 	 <bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com>
> Content-Type: text/plain; charset="ISO-8859-1"
> Content-Transfer-Encoding: quoted-printable
> User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
> Precedence: bulk
> X-Mailing-List: users@linux.kernel.org
> List-Id: <users.linux.kernel.org>
> List-Subscribe: <mailto:users+subscribe@linux.kernel.org>
> List-Unsubscribe: <mailto:users+unsubscribe@linux.kernel.org>
> MIME-Version: 1.0
> X-Stat-Signature: wggy5taj9mqmfuogtmx86hxuqtjersgu
> X-Rspamd-Server: rspamout05
> X-Rspamd-Queue-Id: C6EEC20028
> X-Session-Marker: 6A6F6540706572636865732E636F6D
> X-Session-ID: U2FsdGVkX18qiRppxu1mpwr+5NB2JHzz3NOuJetDjYA> X-HE-Tag: 1699476554-505269
> X-HE-Meta: U2FsdGVkX193d8Q2Sn59pLyTbcaJg32Oj+bO1gmFJ5JP2j6WyXvkSIb60cu1dhTm1WaWnt3WajwVKQdt/VTuQRUzLl3FRPXwBhIgPBsKmDh1aQ7rM5kltFh8Mo7s6pARtKMNsEAsrc6vzbub2rUN+aeUgyNklRmrv4ltzBP7Nmw/uQuHQZY/OgzqVW/yacl20Y+gRAHIdhzO7ubeV7TqZfeoxCGhcarNU2LJvyJrfqGNTOCA1Rqu13uAxLrsyUkp51sTb3zyolqr/itYIq5O0zdI13zZ+dqVfAsViWTek++gix15JbvgxvnS4cggUg+1z4SLWphq68NkNqdw3/MdefCraeAwApiaTKpEoMdfPa7Ml+iyxHDw0I8quBQJmPH1
> X-Migadu-Flow: FLOW_IN
> X-Migadu-Country: US
> X-Migadu-Spam-Score: -7.22
> X-Spam-Score: -7.22
> X-Migadu-Queue-Id: 9DD5741E8E
> X-Migadu-Scanner: mx13.migadu.com
> 
> fourth try, this time above the fold, no idea why these
> are showing up on ksummit as blank.
> 
> Nope.
> 
> I'm not even subscribed to lkml and now rarely join discussions at all.
> 
> Basically I look at lore every now and again using keyword searches
> then download messages of some threads manually.
> 
> 
> On Wed, 2023-11-08 at 12:36 -0800, Joe Perches wrote:
> > On Wed, 2023-11-08 at 12:14 -0800, Joe Perches wrote:
> > > On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> > 
> > <empty email?  evolution still sucks>
> > 
> > My sent email folder entry for this is:
> > 
> > On Wed, 2023-11-08 at 15:07 -0500, Steven Rostedt wrote:
> > > BTW, you have joined some of the discussions to these patches in the pa> st
> 
> 




