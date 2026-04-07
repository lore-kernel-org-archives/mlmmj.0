Return-Path: <mlmmj+bounces-3113-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A37FEEF55
	for <mlmmj@archiver.kernel.org>; Tue,  7 Apr 2026 21:52:09 +0000 (UTC)
Received: from localhost ([127.0.0.1]:59656 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3113-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1wADiY-00Bc5q-0o
	for mlmmj@archiver.kernel.org;
	Tue, 07 Apr 2026 21:12:14 +0000
Received: from weierstrass.telenet-ops.be ([195.130.137.81]:44788)
	by mlmmj.mlmmj.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <liedekef@telenet.be>)
	id 1wADiR-00Bc4s-0d
	for mlmmj@mlmmj.org;
	Tue, 07 Apr 2026 21:12:07 +0000
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4fqzbS0v8Lz4x23R
	for <mlmmj@mlmmj.org>; Tue, 07 Apr 2026 23:19:16 +0200 (CEST)
Received: from [IPV6:2a02:a03f:89de:9a00:e698:f5ff:9a5a:a234] ([IPv6:2a02:a03f:89de:9a00:e698:f5ff:9a5a:a234])
	by baptiste.telenet-ops.be with cmsmtp
	id 0MKE2H00E3pj0pK01MKF0u; Tue, 07 Apr 2026 23:19:15 +0200
Content-Type: multipart/alternative;
 boundary="------------rton4bdtNUL1jG8YrwpX0nxe"
Message-ID: <0533e887-4d6e-4d43-9eb8-7ffeb667e711@telenet.be>
Date: Tue, 7 Apr 2026 23:19:14 +0200
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Call for testing: 2.0.0 is close to the doors
To: mlmmj@mlmmj.org
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
 <45b66d34-9e66-45aa-bb02-78b3b56ec1ea@andreasschulze.de>
 <725496B2-3415-4CC4-81AB-20C3483D1B05@mmj.dk>
Content-Language: en-US
From: Franky Van Liedekerke <liedekef@telenet.be>
In-Reply-To: <725496B2-3415-4CC4-81AB-20C3483D1B05@mmj.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telenet.be; s=r26;
	t=1775596755; bh=XmMZzw2T8hnrtZzoRZQBsCLPBD6hIvPigy6pKbLnhJk=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To:From;
	b=qY25MgdVnJzl1L19QOVhcW7z2TrkEJHAppSKmUdOxtOD9JpwHvNr1aFqBR3lXNNfS
	 xjg/+jd4iJZ5ys1hyxT7MjZWXQbY3eZQYna3KX77MuOL353bDyRwDz+M6PHWG6sS+W
	 YBCedwj5W736kR4bEmwipiLAMlR0ZRQhz/gBkIrXjaDWTHdDkZ6gWqpg0CSmaDzHp6
	 CBP0rcBXeIMGeTx4R9W1PhEpmWlDSQWuuhlL70egYEwGVXJdD4QYMQ/F2RNkq2rX7O
	 gJL2wFdGebYu6k5qWKcd+UyjBGDR/+gVUosPYGBB1qmWHXVhXuHsspsgSL/5KWngt0
	 kBz2gGdcszkFg==

This is a multi-part message in MIME format.
--------------rton4bdtNUL1jG8YrwpX0nxe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/04/2026 22:10, Mads Martin Jørgensen wrote:
>
>> On 7 Apr 2026, at 21.25, A.Schulze <sca@andreasschulze.de> wrote:
>>
>> Am 29.03.26 um 10:26 schrieb Baptiste Daroussin:
>>> I am close to have delivered all the features I intended to add as 
>>> such I would like to stamp it with naming the next release: 2.0.0!
>>> Please test and send feedbacks!
>>
>> Hello,
>>
>> in earlier versions, "make install" installed the binaries in 
>> /usr/local/bin/
>> Now, using the latest available commit at codeberg, binaries are 
>> installed in /usr/local/sbin/
>>
>> This break some things here and require path adjustments. Is it 
>> intentional?
>> I would say, mlmmj binaries are not limited to be used by a root, so 
>> I favor .../bin over .../sbin
>
> IMHO is sbin wrong. It's neither a system nor a static binary -- 
> depending on what your Unix flavour used sbin for instead of bin.
>
sbin is old-school anyway. Fedora decided on symlinking sbin to bin (and 
getting rid of /bin, /sbin too) more than a year ago:

lrwxrwxrwx  1 root root     7 Feb  6 01:00 /bin -> usr/bin
lrwxrwxrwx  1 root root     8 Feb  6 01:00 /sbin -> usr/sbin
lrwxrwxrwx  1 root root     3 Apr 24  2024 /usr/sbin -> bin
drwxr-xr-x. 1 root root 41788 Mar 27 12:50 /usr/bin

lrwxrwxrwx  1 root root     3 Apr 18  2024 /usr/local/sbin -> bin
drwxr-xr-x. 1 root root    48 Feb  6 01:00 /usr/local/bin

(see https://fedoraproject.org/wiki/Changes/Unify_bin_and_sbin , the 
reasoning that both bin and sbin are always in your PATH anyway was also 
an important factor in their decision)

So yes, /usr/local/bin (and/or /usr/bin) are correct locations.

Franky
--------------rton4bdtNUL1jG8YrwpX0nxe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 07/04/2026 22:10, Mads Martin
      Jørgensen wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:725496B2-3415-4CC4-81AB-20C3483D1B05@mmj.dk">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <br>
      <div>
        <blockquote type="cite">
          <div>On 7 Apr 2026, at 21.25, A.Schulze
            <a class="moz-txt-link-rfc2396E" href="mailto:sca@andreasschulze.de">&lt;sca@andreasschulze.de&gt;</a> wrote:</div>
          <br class="Apple-interchange-newline">
          <div><span
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">Am
              29.03.26 um 10:26 schrieb Baptiste Daroussin:</span><br
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
            <blockquote type="cite"
style="font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">I
              am close to have delivered all the features I intended to
              add as such I would like to stamp it with naming the next
              release: 2.0.0!<br>
              Please test and send feedbacks!<br>
            </blockquote>
            <br
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">Hello,</span><br
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
            <br
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">in
              earlier versions, "make install" installed the binaries in
              /usr/local/bin/</span><br
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">Now,
              using the latest available commit at codeberg, binaries
              are installed in /usr/local/sbin/</span><br
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
            <br
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">This
              break some things here and require path adjustments. Is it
              intentional?</span><br
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: none; text-decoration-thickness: auto; text-decoration-style: solid;">
            <span
style="caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; display: inline !important;">I
              would say, mlmmj binaries are not limited to be used by a
              root, so I favor .../bin over .../sbin</span></div>
        </blockquote>
      </div>
      <div><br>
      </div>
      <div>IMHO is sbin wrong. It's neither a system nor a static binary
        -- depending on what your Unix flavour used sbin for instead of
        bin.</div>
      <br>
    </blockquote>
    sbin is old-school anyway. Fedora decided on symlinking sbin to bin
    (and getting rid of /bin, /sbin too) more than a year ago:<br>
    <br>
    lrwxrwxrwx  1 root root     7 Feb  6 01:00 /bin -&gt; usr/bin<br>
    lrwxrwxrwx  1 root root     8 Feb  6 01:00 /sbin -&gt; usr/sbin<br>
    lrwxrwxrwx  1 root root     3 Apr 24  2024 /usr/sbin -&gt; bin<br>
    drwxr-xr-x. 1 root root 41788 Mar 27 12:50 /usr/bin<br>
    <br>
    lrwxrwxrwx  1 root root     3 Apr 18  2024 /usr/local/sbin -&gt; bin<br>
    drwxr-xr-x. 1 root root    48 Feb  6 01:00 /usr/local/bin<br>
    <br>
    (see <a class="moz-txt-link-freetext" href="https://fedoraproject.org/wiki/Changes/Unify_bin_and_sbin">https://fedoraproject.org/wiki/Changes/Unify_bin_and_sbin</a> , the
    reasoning that both bin and sbin are always in your PATH anyway was
    also an important factor in their decision)<br>
    <br>
    So yes, /usr/local/bin (and/or /usr/bin) are correct locations.<br>
    <br>
    Franky
  </body>
</html>

--------------rton4bdtNUL1jG8YrwpX0nxe--


