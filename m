Return-Path: <mlmmj+bounces-3107-mlmmj=archiver.kernel.org@mlmmj.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mlmmj.mlmmj.org (mlmmj.mlmmj.org [194.233.166.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53DBD6AB10
	for <mlmmj@archiver.kernel.org>; Thu,  2 Apr 2026 23:23:50 +0000 (UTC)
Received: from localhost ([127.0.0.1]:34680 helo=mlmmj.mlmmj.org)
	by mlmmj.mlmmj.org with esmtp (Exim 4.96)
	(envelope-from <mlmmj+bounces-3107-mlmmj=archiver.kernel.org@mlmmj.org>)
	id 1w8QyX-00BKnk-2k
	for mlmmj@archiver.kernel.org;
	Thu, 02 Apr 2026 22:57:21 +0000
Received: from new.vlsc.org ([68.169.58.153]:45149)
	by mlmmj.mlmmj.org with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <webmaster@vlsc.org>)
	id 1w8QyP-00BKmw-2e
	for mlmmj@mlmmj.org;
	Thu, 02 Apr 2026 22:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=vlsc.org;
	 s=dkim; h=In-Reply-To:References:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q8Dxkn3Nsmub8zCZjtGFVwQKkU1A48BDWzfFwreB+jI=; b=hHtqgx2ANEs7WBqbGZ21lWBKsW
	Rndq2XSS3RVD7U/QzCP/qOa6Szeo+V9cdVficeqPOLB4dTNzWj+b25/rrPxJJBHH+1dYTVaAEndoL
	czXjclGtAeOmszHkXGuWYGp/bm1iKAaIe2lAZoPpgVWqBron7v/G13WXCG+ZelnpSHTA=;
Received: from c-67-189-97-28.hsd1.or.comcast.net ([67.189.97.28] helo=[192.168.1.102])
	by new.vlsc.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <webmaster@vlsc.org>)
	id 1w8R5A-0006jR-Hp
	for mlmmj@mlmmj.org; Thu, 02 Apr 2026 16:04:12 -0700
Content-Type: multipart/alternative;
 boundary="------------YzbgNAuR1fpu0UE2STMR0YM7"
Message-ID: <8fa3fcee-ef60-4271-ab77-b25806d744c4@vlsc.org>
Date: Thu, 2 Apr 2026 16:04:11 -0700
List-Id: <mlmmj.mlmmj.org>
List-Help: <mailto:mlmmj+help@mlmmj.org>
List-Post: <mailto:mlmmj@mlmmj.org>
List-Subscribe: <mailto:mlmmj+subscribe@mlmmj.org>
List-Unsubscribe: <mailto:mlmmj+unsubscribe@mlmmj.org>
Sender: <mlmmj@mlmmj.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: webmaster@vlsc.org
Subject: Re: Call for testing: 2.0.0 is close to the doors
To: mlmmj@mlmmj.org
References: <b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu>
 <091f6edc-6634-442b-8df9-e568af3f22e5@vlsc.org>
 <BB5393BB-F762-441D-B53E-90D772AC663A@nours.eu>
Content-Language: en-US
In-Reply-To: <BB5393BB-F762-441D-B53E-90D772AC663A@nours.eu>

This is a multi-part message in MIME format.
--------------YzbgNAuR1fpu0UE2STMR0YM7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks, I looked up the postfix docs, and will try this!

Philip



On 4/2/2026 1:02 PM, Baptiste Daroussin wrote:
> I don t think such configuration belongs to mlmmj should be imho on 
> the MTA side, for example on postfix, I think something this should 
> cover your need
>
> default_destination_rate_delay = 5s can ve configured more fine grained
>
> Bapt
>
>
> Le 2 avril 2026 21:12:32 GMT+02:00, webmaster@vlsc.org a écrit :
>
>     This may have already appeared in a recent rev... but I have a
>     question/request:
>
>     Is there a tunable (or can someone create one) that would set a
>     throttle on the # of emails sent within a time period (i.e. no
>     more than 10 emails sent per minute)?
>
>     Using mlmmj, I continue to see (in my server logs) that the big
>     email service vendors (gmail, microsoft, comcast, etc.) will
>     deliver a handful of emails sent their way, but then balk at some
>     point, and send a response about "deferring" delivery of the rest
>     of the emails sent to them; which usually means they don't send
>     the rest at all. This happens even with relatively small email
>     lists (< 150 emails). With a very limited list (<12 emails) all
>     emails are delivered.
>
>     The reason I think a "throttle" tunable would be useful, is
>     because on the same server, I have separate internal processes
>     that periodically send email notifications effectively to the same
>     emails, based on some user-profile condition. The code builds a
>     custom email for each user-profile, and then sends out that email
>     and moves to the next profile.
>
>     I have an adjustable throttle for that process, and have
>     experimented with time intervals. Slowing down the deliveries does
>     in fact get all the emails delivered. Of course this means it
>     slows down the time it takes to deliver all the emails, but under
>     most conditions, at least for me, that's not an issue.
>
>     Would it be possible to add a time "throttle" tunable that would
>     enable some control over how fast the server sends out the emails?
>
>     Very respectfully,
>
>     Philip
>
>
>
>     On 3/29/2026 1:26 AM, Baptiste Daroussin wrote:
>>     Hello Everyone
>>
>>     In 2022, I took over the maintenance of mlmmj which I am using for the FreeBSD mailing lists and more.
>>
>>     I am close to have delivered all the features I intended to add as such I would like to stamp it with naming the next release: 2.0.0!
>>
>>     Here is what happened since 1.3.0
>>
>>     - Code cleanup and modernization
>>     - Addition of a test suite which lead to plenty of fixes
>>     - Fix many of RFC compliances issues
>>     - Improved bounce email by adding the messageid to it
>>     - Finish the old non finished "subrelease" feature
>>     - Add autoscribe feature
>>
>>     The new things from 1.8.0 to 2.0.0 are:
>>     - new build system
>>     - by default respect RFC 2919/2369 List-* and Precedence headers generated by default (can be disabled via nolistheaders)
>>     - Subscription follow reply-to for confirmations
>>     - X-Forwarded-To (Gmail forwarding) (xforwardedto tunables) (incompatible with VERP)
>>     - X-Signed-Recipient (DARA/ARC) (data tunable). (Incompatible with VERP)
>>     - A bit of hardening
>>     - some portability fixes
>>     - archive partionning option (archive/YYYY/MM) with automatic migration (that's per request of Gentoo people)
>>
>>     Please test and send feedbacks!
>>
>>     note: autotools are not needed anymore but the build workflow remain the same:
>>
>>     ./configure
>>     make
>>     make check
>>
>>     Best regards,
>>     Bapt
>>
>>
>>
>

--------------YzbgNAuR1fpu0UE2STMR0YM7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font size="4" face="Helvetica, Arial, sans-serif">Thanks, I looked
      up the postfix docs, and will try this!<br>
      <br>
      Philip<br>
      <br>
      <br>
    </font><br>
    <div class="moz-cite-prefix">On 4/2/2026 1:02 PM, Baptiste Daroussin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:BB5393BB-F762-441D-B53E-90D772AC663A@nours.eu">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="auto">I don t think such configuration belongs to mlmmj
        should be imho on the MTA side, for example on postfix, I think
        something this should cover your need<br>
        <br>
        default_destination_rate_delay = 5s can ve configured more fine
        grained<br>
        <br>
        Bapt<br>
      </div>
      <br>
      <br>
      <div class="gmail_quote">
        <div dir="auto">Le 2 avril 2026 21:12:32 GMT+02:00,
          <a class="moz-txt-link-abbreviated" href="mailto:webmaster@vlsc.org">webmaster@vlsc.org</a> a écrit :</div>
        <blockquote class="gmail_quote"
style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
          <font size="4" face="Helvetica, Arial, sans-serif">This may
            have already appeared in a recent rev... but I have a
            question/request:<br>
            <br>
            Is there a tunable (or can someone create one) that would
            set a throttle on the # of emails sent within a time period
            (i.e. no more than 10 emails sent per minute)?<br>
            <br>
            Using mlmmj, I continue to see (in my server logs) that the
            big email service vendors (gmail, microsoft, comcast, etc.)
            will deliver a handful of emails sent their way, but then
            balk at some point, and send a response about "deferring"
            delivery of the rest of the emails sent to them; which
            usually means they don't send the rest at all. This happens
            even with relatively small email lists (&lt; 150 emails).
            With a very limited list (&lt;12 emails) all emails are
            delivered.<br>
            <br>
            The reason I think a "throttle" tunable would be useful, is
            because on the same server, I have separate internal
            processes that periodically send email notifications
            effectively to the same emails, based on some user-profile
            condition. The code builds a custom email for each
            user-profile, and then sends out that email and moves to the
            next profile.  <br>
            <br>
            I have an adjustable throttle for that process, and have
            experimented with time intervals. Slowing down the
            deliveries does in fact get all the emails delivered. Of
            course this means it slows down the time it takes to deliver
            all the emails, but under most conditions, at least for me,
            that's not an issue.<br>
            <br>
            Would it be possible to add a time "throttle" tunable that
            would enable some control over how fast the server sends out
            the emails?<br>
            <br>
            Very respectfully,<br>
            <br>
            Philip<br>
            <br>
            <br>
          </font><br>
          <div class="moz-cite-prefix">On 3/29/2026 1:26 AM, Baptiste
            Daroussin wrote:<br>
          </div>
          <blockquote type="cite"
            cite="mid:b98dcb9ff3ce9dfbc79312d9b716917ffdc33a5c@nours.eu">
            <pre wrap="" class="moz-quote-pre">Hello Everyone

In 2022, I took over the maintenance of mlmmj which I am using for the FreeBSD mailing lists and more.

I am close to have delivered all the features I intended to add as such I would like to stamp it with naming the next release: 2.0.0!

Here is what happened since 1.3.0

- Code cleanup and modernization
- Addition of a test suite which lead to plenty of fixes
- Fix many of RFC compliances issues
- Improved bounce email by adding the messageid to it
- Finish the old non finished "subrelease" feature
- Add autoscribe feature

The new things from 1.8.0 to 2.0.0 are:
- new build system
- by default respect RFC 2919/2369 List-* and Precedence headers generated by default (can be disabled via nolistheaders)
- Subscription follow reply-to for confirmations
- X-Forwarded-To (Gmail forwarding) (xforwardedto tunables) (incompatible with VERP)
- X-Signed-Recipient (DARA/ARC) (data tunable). (Incompatible with VERP)
- A bit of hardening
- some portability fixes
- archive partionning option (archive/YYYY/MM) with automatic migration (that's per request of Gentoo people)

Please test and send feedbacks!

note: autotools are not needed anymore but the build workflow remain the same:

./configure
make
make check

Best regards,
Bapt



</pre>
          </blockquote>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------YzbgNAuR1fpu0UE2STMR0YM7--


