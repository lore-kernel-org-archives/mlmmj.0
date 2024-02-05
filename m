Return-Path: <mlmmj+bounces-3036-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75367C48291
	for <mlmmj@archiver.kernel.org>; Mon,  5 Feb 2024 06:50:57 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.94.2)
	(envelope-from <mlmmj+bounces-3036-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1rWsXr-00Cyna-8Z
	for mlmmj@archiver.kernel.org; Mon, 05 Feb 2024 06:33:31 +0000
Received: from new.vlsc.org ([68.169.58.153])
	by mlmmj.mlmmj.org with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <webmaster@vlsc.org>)
	id 1rWsXk-00Cymn-0n
	for mlmmj@mlmmj.org; Mon, 05 Feb 2024 06:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=vlsc.org;
	 s=dkim; h=Subject:From:To:MIME-Version:Date:Message-ID:Content-Type:Sender:
	Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=N1V+MCuqDGQ0WNJf11B66WNWz2eNa8BGs7GBuq4kttE=; b=kq+WNMvQECkqByFDYFFLunNwS9
	xUAq/oozuielLFqjosX1WxH8ZI4VrPtMhzQsYwKdX+4dUl6l2/E3Gg02OqvZv9lYZSFALociRg+rJ
	glBdf46846s8YC1xVgssb4VmGXDKEIxkK7Gnp2qx0q73VFt8QO4gV7GjHe0djX4J3lv8=;
Received: from c-71-236-142-158.hsd1.wa.comcast.net ([71.236.142.158] helo=[192.168.1.107])
	by new.vlsc.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <webmaster@vlsc.org>)
	id 1rWshW-0007pB-GI
	for mlmmj@mlmmj.org; Sun, 04 Feb 2024 22:43:30 -0800
Content-Type: multipart/alternative;
 boundary="------------Jni6R0dV95UouSXL4Xckf0O6"
Message-ID: <4c8b7b95-9fcd-41f7-a482-6d9d91988b63@vlsc.org>
Date: Sun, 4 Feb 2024 22:43:28 -0800
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mlmmj@mlmmj.org
Content-Language: en-US
From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Subject: [mlmmj] 150 email list - only ~100 emails actually sent out, per the
 exim main.log and member reports

This is a multi-part message in MIME format.
--------------Jni6R0dV95UouSXL4Xckf0O6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I've been seeing a strange behavior with one of our mlmmj lists, for 
several months now.

Running about 12 different mlmmj (closed) lists for a small org, all on 
the same CentOS 7 server.  The smallest lists have 10-15 emails, with 
the largest averaging about 150 emails. These mlmmj lists have been in 
existence for many years, mostly without any troubles.

Recently (6-8 months) the largest list (~150 emails) has not been 
sending all the emails out - it varies but I'd say 60-80% of list 
members have an email sent, but the rest of the emails on the list 
receive nothing.

The exim main.log file contains log entries for the emails that do go 
out, but there is no sign of the other emails in the list that mlmmj 
appears to miss completely.

It does not appear to be exactly the same "missing" emails each time, 
but it does appear that the "missing" emails are physically farther down 
the actual list of emails in the subscribers.d/email_list.txt file.

The smaller lists are working without any issues, ie. emails 
consistently sent to all list members.

This behavior first appeared with mlmmj 1.3 installed - I have recently 
upgraded the server to mlmmj 1.4.4, but this behavior is still there.

Within the exim.conf file, I have tried adjusting the 
"smtp_accept_max_per_connection" and "smtp_accept_max" configuration 
settings (and re-starting exim) but the behavior persists.

I'm struggling to determine what might be happening, and of course this 
is concerning for the organization, as it cannot rely on mlmmj to get 
communications out to all the members on the email list.

Has anyone seen this before? Does anyone have an idea where I could 
start looking for the source of the problem?

Any advice and help would be very appreciated!

Philip


--------------Jni6R0dV95UouSXL4Xckf0O6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Helvetica, Arial, sans-serif">I've been seeing a strange
      behavior with one of our mlmmj lists, for several months now.<br>
      <br>
      Running about 12 different mlmmj (closed) lists for a small org,
      all on the same CentOS 7 server.  The smallest lists have 10-15
      emails, with the largest averaging about 150 emails. These mlmmj
      lists have been in existence for many years, mostly without any
      troubles.<br>
      <br>
      Recently (6-8 months) the largest list (~150 emails) has not been
      sending all the emails out - it varies but I'd say 60-80% of list
      members have an email sent, but the rest of the emails on the list
      receive nothing.<br>
      <br>
      The exim main.log file contains log entries for the emails that do
      go out, but there is no sign of the other emails in the list that
      mlmmj appears to miss completely.  <br>
      <br>
      It does not appear to be exactly the same "missing" emails each
      time, but it does appear that the "missing" emails are physically
      farther down the actual list of emails in the
      subscribers.d/email_list.txt file.<br>
      <br>
      The smaller lists are working without any issues, ie. emails
      consistently sent to all list members.<br>
      <br>
      This behavior first appeared with mlmmj 1.3 installed - I have
      recently upgraded the server to mlmmj 1.4.4, but this behavior is
      still there.<br>
      <br>
      Within the exim.conf file, I have tried adjusting the
      "smtp_accept_max_per_connection" and "smtp_accept_max"
      configuration settings (and re-starting exim) but the behavior
      persists.<br>
      <br>
      I'm struggling to determine what might be happening, and of course
      this is concerning for the organization, as it cannot rely on
      mlmmj to get communications out to all the members on the email
      list. <br>
      <br>
      Has anyone seen this before? Does anyone have an idea where I
      could start looking for the source of the problem?<br>
      <br>
      Any advice and help would be very appreciated!<br>
      <br>
      Philip<br>
    </font><font face="Helvetica, Arial, sans-serif"><br>
    </font><font face="Helvetica, Arial, sans-serif"><br>
    </font>
  </body>
</html>

--------------Jni6R0dV95UouSXL4Xckf0O6--


