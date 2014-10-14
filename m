From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Tue, 14 Oct 2014 18:16:00 +0000
Subject: Re: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <543D6860.1030906@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020009000204040608000108"
List-Id: <mlmmj.mlmmj.org>
References: <54356DBC.9020609@vlsc.org>
In-Reply-To: <54356DBC.9020609@vlsc.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------020009000204040608000108
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geof!

Thanks for your note.

I have not heard any response, except an automated note - some list 
member's original email address is no longer valid.

I'm still attempting to chase down the proper configuration to get mlmmj 
running with Sendmail as the MTA.  I too, considered using Postfix, but 
Sendmail is already running, and don't want to try with Postfix if it's 
not required.

I've begun the slow process of reading through the list archives, but 
haven't found anything that helps me yet.

When you tried asking the list previously, did you receive any 
responses?  If so, can you recall more specifically when that might have 
been? - I'd like to go back and see any feedback you might have 
received, even if it wasn't enough to help you solve this. Perhaps a 2nd 
pair of eyes on the same feedback, combined with what I'm seeing on my 
server, might somehow reveal the trick.

Is there anyone still doing development/support for mlmmj?

I've spend years working with and configuring servers, including 
customizing automated processes that work in the background with 
majordomo lists. Unfortunately majordomo hasn't been supported in years 
and is quickly becoming unusable in today's server/mail environments.

I would love to find a new mailing list tool to work with, and mlmmj 
seems like a great candidate, but I need some help getting out of the 
starting blocks with configuring this on a CentOS LAMP server 
environment running Sendmail - a very common platform.

Unless I've completely missed something obvious, the documentation on 
the mlmmj website doesn't speak to running with Sendmail, except when 
trying to use VERP (using VERP isn't a requirement for configuring mlmmj 
to work with Sendmail, is it?)

I'm not even sure that my issue is related Sendmail, but I can't find 
any documentation that can tell me either way.

Any help that can be provided would be greatly appreciated!!!

Philip



On 10/14/2014 5:26 AM, G Stansfield wrote:
> On 08-Oct-14 7:00 PM, webmaster@vlsc.org wrote:
>> I looked through the documentation, and installed mlmmj per the readme
>> and install documents on a virtual CentOS server.
>>
>> I have created a test email list - sail2@vlsc.org - and added 2
>> subscribers using mlmmj-sub. All appears to be setup properly, but when
>> I send an email to the list using one of the subscribed addresses
>> (webmaster@vlsc.org), my mail log file shows the following:
>>
>> Oct    7 23:14:21 cloud sendmail[1390]: s97NEL7Z001390: 
>> from=<webmaster@vlsc.org>, size=1250, class=0, nrcpts=1, 
>> msgid=<54347310.8030905@vlsc.org>, proto=ESMTP, daemon=MSA, 
>> relay=c-24-22-61-28.hsd1.or.comcast.net [24.22.61.28]
>>
>> Oct    7 23:14:22 cloud sendmail[1390]: s97NEL7Z001390: Milter insert 
>> (1): header: DKIM-Signature:    v=1; a=rsa-sha256; c=simple/simple; 
>> d=vlsc.org; s=default;\n\tt=1412723662; 
>> bh=SrfRFSC5LbQjGOAy8L6/MImtgtMNuon//Nkbtb0XVZI=;\n\th=Date:From:To:Subject;\n\tb=oKK6sefKYUbo7sC8oIAK0bnVA92vas8lkpOYQsVd//ru+cu5Eyg13wGRlZ+vyAUH2\n\t 
>> ko/f+ma6dQdizl1mVIq35h62m1tS+THd8LMZtadOFT1kiyG2HHyasmiqK1UuVjCbxO\n\t 6RfbPTriyZKsXnZfDK4y4pcoAqRextw+ZdKOrDU8= 
>>
>>
>> Oct    7 23:14:22 cloud opendkim[771]: s97NEL7Z001390: DKIM-Signature 
>> field added (s=default, d=vlsc.org)
>>
>> Oct    7 23:14:22 cloud sendmail[1392]: s97NEL7Z001390: to=/dev/null, 
>> ctladdr=<sail2@vlsc.org>  (8/0), delay=00:00:01, xdelay=00:00:00, 
>> mailer=*file*, pri=31824, dsn=2.0.0, stat=Sent
>>
>>
>> The entry "to=/dev/null, ctladdr=<sail2@vlsc.org>" seems suspicious,
>> like the email is being dumped to /dev/null instead of being delivered
>> to the list.
>>
>> Can anyone help me by letting me know if I've missed some piece in my
>> setup, or at least how to interpret this log entry correctly?
>>
>> I'm a refugee from majordomo who is trying to get our new server running
>> with mlmmj so our organization can continue to run several small
>> in-house email lists.
>>
>> Thanks for any help!
>>
>> Philip
> Hi Philip!
> Did you come right with this? If so, please tell me how!
>
> I tried this some years ago in a home / test environment (using 
> OpenSUSE) before rolling out to a small production LAN - and failed 
> miserably! The only documentation I found was from mlmmj. Asked the 
> mlmmj list and still did not come right. Perhaps I was 
> misunderstanding something on the sendmail side of things.
>
> I toyed with the idea of switching to postfix, but have some custom 
> rules in sendmail so did not want to take on a new learning curve for 
> what was essentially a functionality for which the users were not 
> clamouring at that time.
>
> Regards,
> Geoff
>
>
>
>
> -----
> No virus found in this message.
> Checked by AVG - www.avg.com
> Version: 2014.0.4765 / Virus Database: 4040/8384 - Release Date: 10/13/14
>
>


--------------020009000204040608000108
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font face="Helvetica, Arial, sans-serif">Hi Geof!<br>
      <br>
      Thanks for your note.<br>
      <br>
      I have not heard any response, except an automated note - some
      list member's original email address is no longer valid.<br>
      <br>
      I'm still attempting to chase down the proper configuration to get
      mlmmj running with Sendmail as the MTA.&nbsp; I too, considered using
      Postfix, but Sendmail is already running, and don't want to try
      with Postfix if it's not required.<br>
      <br>
      I've begun the slow process of reading through the list archives,
      but haven't found anything that helps me yet.&nbsp; <br>
      <br>
      When you tried asking the list previously, did you receive any
      responses?&nbsp; If so, can you recall more specifically when that
      might have been? - I'd like to go back and see any feedback you
      might have received, even if it wasn't enough to help you solve
      this. Perhaps a 2nd pair of eyes on the same feedback, combined
      with what I'm seeing on my server, might somehow reveal the trick.<br>
      <br>
      Is there anyone still doing development/support for mlmmj?&nbsp; <br>
      <br>
      I've spend years working with and configuring servers, including
      customizing automated processes that work in the background with
      majordomo lists. Unfortunately majordomo hasn't been supported in
      years and is quickly becoming unusable in today's server/mail
      environments.&nbsp; <br>
      <br>
      I would love to find a new mailing list tool to work with, and
      mlmmj seems like a great candidate, but I need some help getting
      out of the starting blocks with configuring this on a CentOS LAMP
      server environment running Sendmail - a very common platform. <br>
      <br>
      Unless I've completely missed something obvious, the documentation
      on the mlmmj website doesn't speak to running with Sendmail,
      except when trying to use VERP (using VERP isn't a requirement for
      configuring mlmmj to work with Sendmail, is it?) <br>
      <br>
      I'm not even sure that my issue is related Sendmail, but I can't
      find any documentation that can tell me either way. <br>
      <br>
      Any help that can be provided would be greatly appreciated!!!<br>
      <br>
      Philip<br>
      <br>
      <br>
      <br>
    </font>
    <div class="moz-cite-prefix">On 10/14/2014 5:26 AM, G Stansfield
      wrote:<br>
    </div>
    <blockquote cite="mid:543D167F.6060603@isat.co.za" type="cite">On
      08-Oct-14 7:00 PM, <a class="moz-txt-link-abbreviated" href="mailto:webmaster@vlsc.org">webmaster@vlsc.org</a> wrote:
      <br>
      <blockquote type="cite">I looked through the documentation, and
        installed mlmmj per the readme
        <br>
        and install documents on a virtual CentOS server.
        <br>
        <br>
        I have created a test email list - <a class="moz-txt-link-abbreviated" href="mailto:sail2@vlsc.org">sail2@vlsc.org</a> - and added 2
        <br>
        subscribers using mlmmj-sub. All appears to be setup properly,
        but when
        <br>
        I send an email to the list using one of the subscribed
        addresses
        <br>
        (<a class="moz-txt-link-abbreviated" href="mailto:webmaster@vlsc.org">webmaster@vlsc.org</a>), my mail log file shows the following:
        <br>
        <br>
        Oct&nbsp;&nbsp;&nbsp; 7 23:14:21 cloud sendmail[1390]: s97NEL7Z001390:
        from=<a class="moz-txt-link-rfc2396E" href="mailto:webmaster@vlsc.org">&lt;webmaster@vlsc.org&gt;</a>, size=1250, class=0, nrcpts=1,
        msgid=<a class="moz-txt-link-rfc2396E" href="mailto:54347310.8030905@vlsc.org">&lt;54347310.8030905@vlsc.org&gt;</a>, proto=ESMTP,
        daemon=MSA, relay=c-24-22-61-28.hsd1.or.comcast.net
        [24.22.61.28]
        <br>
        <br>
        Oct&nbsp;&nbsp;&nbsp; 7 23:14:22 cloud sendmail[1390]: s97NEL7Z001390: Milter
        insert (1): header: DKIM-Signature:&nbsp;&nbsp;&nbsp; v=1; a=rsa-sha256;
        c=simple/simple; d=vlsc.org; s=default;\n\tt=1412723662;
        bh=SrfRFSC5LbQjGOAy8L6/MImtgtMNuon//Nkbtb0XVZI=;\n\th=Date:From:To:Subject;\n\tb=oKK6sefKYUbo7sC8oIAK0bnVA92vas8lkpOYQsVd//ru+cu5Eyg13wGRlZ+vyAUH2\n\t
        ko/f+ma6dQdizl1mVIq35h62m1tS+THd8LMZtadOFT1kiyG2HHyasmiqK1UuVjCbxO\n\t
        6RfbPTriyZKsXnZfDK4y4pcoAqRextw+ZdKOrDU8=
        <br>
        <br>
        Oct&nbsp;&nbsp;&nbsp; 7 23:14:22 cloud opendkim[771]: s97NEL7Z001390:
        DKIM-Signature field added (s=default, d=vlsc.org)
        <br>
        <br>
        Oct&nbsp;&nbsp;&nbsp; 7 23:14:22 cloud sendmail[1392]: s97NEL7Z001390:
        to=/dev/null, ctladdr=<a class="moz-txt-link-rfc2396E" href="mailto:sail2@vlsc.org">&lt;sail2@vlsc.org&gt;</a>&nbsp; (8/0),
        delay=00:00:01, xdelay=00:00:00, mailer=*file*, pri=31824,
        dsn=2.0.0, stat=Sent
        <br>
        <br>
        <br>
        The entry "to=/dev/null, ctladdr=<a class="moz-txt-link-rfc2396E" href="mailto:sail2@vlsc.org">&lt;sail2@vlsc.org&gt;</a>" seems
        suspicious,
        <br>
        like the email is being dumped to /dev/null instead of being
        delivered
        <br>
        to the list.
        <br>
        <br>
        Can anyone help me by letting me know if I've missed some piece
        in my
        <br>
        setup, or at least how to interpret this log entry correctly?
        <br>
        <br>
        I'm a refugee from majordomo who is trying to get our new server
        running
        <br>
        with mlmmj so our organization can continue to run several small
        <br>
        in-house email lists.
        <br>
        <br>
        Thanks for any help!
        <br>
        <br>
        Philip
        <br>
      </blockquote>
      Hi Philip!
      <br>
      Did you come right with this? If so, please tell me how!
      <br>
      <br>
      I tried this some years ago in a home / test environment (using
      OpenSUSE) before rolling out to a small production LAN - and
      failed miserably! The only documentation I found was from mlmmj.
      Asked the mlmmj list and still did not come right. Perhaps I was
      misunderstanding something on the sendmail side of things.
      <br>
      <br>
      I toyed with the idea of switching to postfix, but have some
      custom rules in sendmail so did not want to take on a new learning
      curve for what was essentially a functionality for which the users
      were not clamouring at that time.
      <br>
      <br>
      Regards,
      <br>
      Geoff
      <br>
      <br>
      <br>
      <br>
      <br>
      -----
      <br>
      No virus found in this message.
      <br>
      Checked by AVG - <a class="moz-txt-link-abbreviated" href="http://www.avg.com">www.avg.com</a>
      <br>
      Version: 2014.0.4765 / Virus Database: 4040/8384 - Release Date:
      10/13/14
      <br>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------020009000204040608000108--

