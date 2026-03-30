Return-Path: <mlmmj+bounces-3100-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7979C1061B20
	for <mlmmj@archiver.kernel.org>; Mon, 30 Mar 2026 19:51:02 +0000 (UTC)
Received: from localhost ([127.0.0.1]:46510 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3100-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w7I6N-00B6gw-0X
	for mlmmj@archiver.kernel.org;
	Mon, 30 Mar 2026 19:16:43 +0000
Received: from dahlem.somaf.de ([185.183.157.243]:49042)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sca@andreasschulze.de>)
	id 1w7I6G-00B6g9-0V
	for mlmmj@mlmmj.org;
	Mon, 30 Mar 2026 19:16:36 +0000
Received: from mta.somaf.de (mta.somaf.de [IPv6:2001:470:77b3:103::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature ECDSA (prime256v1 raw public key) server-digest SHA256)
	(Client did not present a certificate)
	by dahlem.somaf.de (Postfix) with ESMTPS id 4fl1Pb5qYkz6tqH
	for <mlmmj@mlmmj.org>; Mon, 30 Mar 2026 21:23:31 +0200 (CEST)
ARC-Seal: i=2; a=rsa-sha256; d=dahlem.somaf.de; s=arc1; t=1774898611;
	cv=none; b=R1kmsnTi6GvdfZZkBLl6J2A6X0RyvLWFwXLAngpHlNXdlT2XTnbHhlGFB2rQdX0i7NclF46BVHGiW30PBoMrofcA5kxrIF+oM85YCIcRmPZsHcvOcUzzSa3rt4MM9L/PUvRWaAh/C4+D/Piz4MdiRyfpO01dANEkXkC7zkmjXJwS5gkAr3j7iMc6GeokHWHTrlSBpPCts9NfIe0OEG5hb4QL2kDKwTQnASL1AdVHSjSROqBLnSBv0WPoxcNtFm5FHkrbP/AdMmt3dod/p6hULnGgLYFcHpNl3MFLSCWvfaE3hA02GVVbnCaHI3hF5Zkof2HSeHTLvyyRpYts1scY/g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=dahlem.somaf.de; s=arc1;
	t=1774898611; c=relaxed/relaxed;
	bh=/ioMk5IWdty7s7Jb6D3pvc9LbgPB1HkOyDW/a/RSWWc=;
	h=Message-ID:ARC-Message-Signature:ARC-Authentication-Results:
	 DKIM-Signature:DKIM-Signature:Date:MIME-Version:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=eWOO3bklYEGfX/csaQm+rSCD46ybZu8iv3crTsYkLgN8lgOkNdrQrYQJeFMy9su5Op2PGD6m2MbH9YuA6GcjeVt+1g+QLo7IEKzXutVDKeICz5+c6ktFaL6MwQwG6nTQcLQAk5KP+IU1IfY0R6UepFrDcGDoadn1fHrznNdbIrcIm4bbk7lGSuxJUEJv5g9Ajk4fYZ3zq4tcGsUFLc5cdTwu1orcdKXuJX7TdZuXuW9RrVqUxMehTH9ugFO3teZPQJMTHiVfNB1BeFsnJan5G3EMIZI1j8AefOO3m3DZTsPgnKeXoTgfJbl4SFdzF/F54sl1CHfB+QTdtrdVYu3R9A==
ARC-Authentication-Results: i=2; dahlem.somaf.de
Message-ID: <3abe4042-99df-4461-ac15-28fed4b021ab@andreasschulze.de>
ARC-Seal: i=1; a=rsa-sha256; d=mta.somaf.de; s=arc1; t=1774898610; cv=none;
	b=nAyreEkez1f4ri3iKu/38xchoKzwCfXbcv8+Jj0kSe9u2WLcE+RQzDfjujvXFQkWaICvjgu0kbkYYWyoNVQMRX/wtqk+LKJyfeF6nN6PE4ECcyeEpB8nYfk3INzKgxjUsB5tfJdnmhGpT10xiC2epoACG1gWPazrfpV1dGcF16XKeaD4vnpfrBfMB6dojyB6JBkSiHQ4cMxTvdEA38BvJnR6piA3jZ/dauwgquffEjT04noeAeBj3+PH+MUaaEBGT7KenbiAoZ0I8c40uGHF70RwK/Mm6ozBkhT0ZBS50UnCObjqAhQER/jr0xq/GV/BM/jyquUhzIc3hGWUY6FOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=mta.somaf.de; s=arc1;
	t=1774898610; c=relaxed/relaxed;
	bh=/ioMk5IWdty7s7Jb6D3pvc9LbgPB1HkOyDW/a/RSWWc=;
	h=Message-ID:DKIM-Signature:DKIM-Signature:Date:MIME-Version:
	 Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=LxJZiLaQqyQjPWfDn9lQ07hQORvquNgGI4xRNGzKMTWTUcm1HgJek5hJbZ0hRTUsgKVrbdClpUIZkNEDmVx/UojuYZpFS8+gqXO84oU8YJC9cfDL3Vzlo7qjVUMO++vnfgptrxRuqRnKHKupHH8xXMPq4eBp4RZskW+WC/OW6X8IiA1pqucWrDIGv8HPrBWpPpXsztI7G4fjBLn8HlaOs4Y3yFe3JGYyVtjx92RF8An4jnbtXjzOWMpi7sM1Nri5C9fJjPPZ/W6Yq3ZJco0M+oPTn0IVhM1oAxx8maSijqlVncNVz4btvgmQLv5nlGqtQDkeBkOTqvg8yrl7r/o37Q==
ARC-Authentication-Results: i=1; mta.somaf.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andreasschulze.de;
	s=20260330-BF35CB2D; t=1774898610; x=1779898610;
	bh=/ioMk5IWdty7s7Jb6D3pvc9LbgPB1HkOyDW/a/RSWWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:autocrypt:cc:
	 content-transfer-encoding:content-type:date:from:in-reply-to:
	 message-id:mime-version:openpgp:references:subject:to;
	b=lsdx5sCH61uU9p9Y6MfMDh1hIbAcA8xMTdOUTLLF6+0KDofOo3irByQvRbwSX5Cl9
	 9+j7vgzKYz021YmGf01/sXgValkhqzt7BzuXN0mCKkILzv1QTwqfMiQX8TG2Ck4BD+
	 +I41a373gswszF70wbSnCC2XEuDXU+APw37t4mVledA4LJBZ2gUgq6wY1Kxl40bFhI
	 t6jN1hZy0V8OOWrlAvVnEFQ1/wFoPGf5tnmzeOGry/BJGGbtFAgc6Ph90l+SiHIKMC
	 jlD5VUkIBq2pOsb6WPmykUOuYifc/Q5SDcBeFHb/EFNUZ5RhCtgFwUPBZ7gNROijEv
	 dxrwIJ5fayYrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=andreasschulze.de; s=20260316-74BFB72E; t=1774898610;
	x=1779898610; bh=/ioMk5IWdty7s7Jb6D3pvc9LbgPB1HkOyDW/a/RSWWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:autocrypt:cc:
	 content-transfer-encoding:content-type:date:from:in-reply-to:
	 message-id:mime-version:openpgp:references:subject:to;
	b=KRbg+pih8qsdXnfJ8eM/jg8s5Bq63PFmdapsrelaxAWEgzzrEZx+ljTrZGwljiTxq
	 D0aop/Ry5sf5Vx8x+dfBw==
Date: Mon, 30 Mar 2026 21:23:29 +0200
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
Subject: Re: Call for testing: 2.0.0 is close to the doors
To: mlmmj@mlmmj.org
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
Content-Language: en-US, de-DE
From: "A.Schulze" <sca@andreasschulze.de>
In-Reply-To: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 29.03.26 um 10:26 schrieb Baptiste Daroussin:
> I am close to have delivered all the features I intended to add as such I would like to stamp it with naming the next release: 2.0.0!

Hello,

thanks to this announcement, I start to update my mlmmj builds.

1.6.0 is running in prod
1.7.0 compile
1.7.1 compile & I enabled 'make check' -> all tests pass
1.8.0 compile but 'make check' fail

(the buildsystem is Debian/Trixie)

...

234/235 passed (1 failed)
===> Execution context
Current directory: /tmp
Environment variables:
     CFLAGS=-g -O2 -Werror=implicit-function-declaration -ffile-prefix-map=/=. -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection
     CPPFLAGS=-Wdate-time -D_FORTIFY_SOURCE=2
     CXXFLAGS=-g -O2 -ffile-prefix-map=/=. -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection
     FCFLAGS=-g -O2 -ffile-prefix-map=/=. -fstack-protector-strong -fstack-clash-protection -fcf-protection
     FFLAGS=-g -O2 -ffile-prefix-map=/=. -fstack-protector-strong -fstack-clash-protection -fcf-protection
     GCJFLAGS=
     HOME=/root
     HOSTNAME=8baa659f2c1b
     LDFLAGS=-Wl,-z,relro -Wl,-z,now
     MAKEFLAGS=
     MAKELEVEL=3
     MFLAGS=
     OBJCFLAGS=-g -O2 -ffile-prefix-map=/=. -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection
     OBJCXXFLAGS=-g -O2 -ffile-prefix-map=/=. -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection
     PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
     PWD=/tmp
     SHLVL=2
     VERSION=1.8.0
     _=/usr/bin/kyua
===> tests/mlmmj-receive:subrelease
Result:     failed: atf-check failed; see the output of the test for details
Start time: 2026-03-30T19:11:49.873919Z
End time:   2026-03-30T19:11:50.095029Z
Duration:   0.221s

Metadata:
     allowed_architectures is empty
     allowed_platforms is empty
     description is empty
     has_cleanup = false
     is_exclusive = false
     required_configs is empty
     required_disk_space = 0
     required_files is empty
     required_memory = 0
     required_programs is empty
     required_user is empty
     timeout = 300

Standard output:
Executing command [ /tmp/tests/fakesmtpd ]
Executing command [ /tmp/src/mlmmj-receive -L list -F ]
Executing command [ cat mail-1.txt ]
Executing command [ cat mail-1.txt ]
Executing command [ cat mail-1.txt ]
Executing command [ cat mail-1.txt ]
Executing command [ /tmp/src/mlmmj-receive -L list -F ]
Executing command [ cat list/subscribers.d/b ]
Executing command [ test -f list/archive/1 ]
Executing command [ sed -e /^Message-ID:/d; /^Date:/d; mail-2.txt ]

Standard error:
Fail: stdout does not match golden output
--- expected-release.txt	2026-03-30 19:11:50.087813040 +0000
+++ /tmp/kyua.nrwQgG/236/work/check.X23Y8G/stdout	2026-03-30 19:11:50.087813040 +0000
@@ -1,6 +1,6 @@
  EHLO heloname
-MAIL FROM:<test+bounces-1-bob=test@mlmmjtest>
-RCPT TO:<bob@test>
+MAIL FROM:<test+bounces-1-user=test@mlmmjtest>
+RCPT TO:<user@test>
  DATA
  From: bob@test
  To: test@mlmmjtest
@@ -9,8 +9,8 @@
  Let's go, first email
  
  .
-MAIL FROM:<test+bounces-1-user=test@mlmmjtest>
-RCPT TO:<user@test>
+MAIL FROM:<test+bounces-1-user2=test@mlmmjtest>
+RCPT TO:<user2@test>
  DATA
  From: bob@test
  To: test@mlmmjtest
@@ -19,8 +19,8 @@
  Let's go, first email
  
  .
-MAIL FROM:<test+bounces-1-user2=test@mlmmjtest>
-RCPT TO:<user2@test>
+MAIL FROM:<test+bounces-1-bob=test@mlmmjtest>
+RCPT TO:<bob@test>
  DATA
  From: bob@test
  To: test@mlmmjtest
Files left in work directory after failure: debugmail.txt, expected-release.txt, first, list, mail-1.txt, mail-2.txt, subrel
===> Failed tests
tests/mlmmj-receive:subrelease  ->  failed: atf-check failed; see the output of the test for details  [0.221s]
===> Summary
Results read from /root/.kyua/store/results.tmp.20260330-191140-863923.db
Test cases: 235 total, 6 skipped, 0 expected failures, 0 broken, 1 failed
Start time: 2026-03-30T19:11:40.871920Z
End time:   2026-03-30T19:11:52.421728Z
Total time: 11.243s

-----

is there a better place to report such failures?

Andreas


