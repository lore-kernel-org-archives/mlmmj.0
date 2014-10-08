From: "webmaster@vlsc.org" <webmaster@vlsc.org>
Date: Wed, 08 Oct 2014 17:00:44 +0000
Subject: [mlmmj] testing mlmmj using Sendmail on a CentOS server
Message-Id: <54356DBC.9020609@vlsc.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060602020100030908000304"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------060602020100030908000304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I looked through the documentation, and installed mlmmj per the readme 
and install documents on a virtual CentOS server.

I have created a test email list - sail2@vlsc.org - and added 2 
subscribers using mlmmj-sub.  All appears to be setup properly, but when 
I send an email to the list using one of the subscribed addresses 
(webmaster@vlsc.org), my mail log file shows the following:

Oct  7 23:14:21 cloud sendmail[1390]: s97NEL7Z001390: from=<webmaster@vlsc.org>, size=1250, class=0, nrcpts=1, msgid=<54347310.8030905@vlsc.org>, proto=ESMTP, daemon=MSA, relay=c-24-22-61-28.hsd1.or.comcast.net [24.22.61.28]

Oct  7 23:14:22 cloud sendmail[1390]: s97NEL7Z001390: Milter insert (1): header: DKIM-Signature:  v=1; a=rsa-sha256; c=simple/simple; d=vlsc.org; s=default;\n\tt=1412723662; bh=SrfRFSC5LbQjGOAy8L6/MImtgtMNuon//Nkbtb0XVZI=;\n\th=Date:From:To:Subject;\n\tb=oKK6sefKYUbo7sC8oIAK0bnVA92vas8lkpOYQsVd//ru+cu5Eyg13wGRlZ+vyAUH2\n\t ko/f+ma6dQdizl1mVIq35h62m1tS+THd8LMZtadOFT1kiyG2HHyasmiqK1UuVjCbxO\n\t 6RfbPTriyZKsXnZfDK4y4pcoAqRextw+ZdKOrDU8=

Oct  7 23:14:22 cloud opendkim[771]: s97NEL7Z001390: DKIM-Signature field added (s=default, d=vlsc.org)

Oct  7 23:14:22 cloud sendmail[1392]: s97NEL7Z001390: to=/dev/null, ctladdr=<sail2@vlsc.org>  (8/0), delay=00:00:01, xdelay=00:00:00, mailer=*file*, pri=31824, dsn=2.0.0, stat=Sent


The entry "to=/dev/null, ctladdr=<sail2@vlsc.org>" seems suspicious, 
like the email is being dumped to /dev/null instead of being delivered 
to the list.

Can anyone help me by letting me know if I've missed some piece in my 
setup, or at least how to interpret this log entry correctly?

I'm a refugee from majordomo who is trying to get our new server running 
with mlmmj so our organization can continue to run several small 
in-house email lists.

Thanks for any help!

Philip

--------------060602020100030908000304
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font face="Helvetica, Arial, sans-serif">I looked through the
      documentation, and installed mlmmj per the readme and install
      documents on a v</font><font face="Helvetica, Arial, sans-serif"><font
        face="Helvetica, Arial, sans-serif">irtual CentOS server.<br>
        <br>
      </font> I have created a test email list - <a
        class="moz-txt-link-abbreviated" href="mailto:sail2@vlsc.org">sail2@vlsc.org</a>
      - and added 2 subscribers using mlmmj-sub.&nbsp; All appears to be
      setup properly, but when I send an email to the list using one of
      the subscribed addresses (<a class="moz-txt-link-abbreviated"
        href="mailto:webmaster@vlsc.org">webmaster@vlsc.org</a>), my
      mail log file shows the following:<br>
      <br>
    </font>
    <pre><font face="Helvetica, Arial, sans-serif">Oct&nbsp; 7 23:14:21 cloud sendmail[1390]: s97NEL7Z001390: from=<a class="moz-txt-link-rfc2396E" href="mailto:webmaster@vlsc.org">&lt;webmaster@vlsc.org&gt;</a>, size=1250, class=0, nrcpts=1, msgid=<a class="moz-txt-link-rfc2396E" href="mailto:54347310.8030905@vlsc.org">&lt;54347310.8030905@vlsc.org&gt;</a>, proto=ESMTP, daemon=MSA, relay=c-24-22-61-28.hsd1.or.comcast.net [24.22.61.28]</font></pre>
    <pre><font face="Helvetica, Arial, sans-serif">Oct&nbsp; 7 23:14:22 cloud sendmail[1390]: s97NEL7Z001390: Milter insert (1): header: DKIM-Signature:&nbsp; v=1; a=rsa-sha256; c=simple/simple; d=vlsc.org; s=default;\n\tt=1412723662; bh=SrfRFSC5LbQjGOAy8L6/MImtgtMNuon//Nkbtb0XVZI=;\n\th=Date:From:To:Subject;\n\tb=oKK6sefKYUbo7sC8oIAK0bnVA92vas8lkpOYQsVd//ru+cu5Eyg13wGRlZ+vyAUH2\n\t ko/f+ma6dQdizl1mVIq35h62m1tS+THd8LMZtadOFT1kiyG2HHyasmiqK1UuVjCbxO\n\t 6RfbPTriyZKsXnZfDK4y4pcoAqRextw+ZdKOrDU8=</font></pre>
    <pre><font face="Helvetica, Arial, sans-serif">Oct&nbsp; 7 23:14:22 cloud opendkim[771]: s97NEL7Z001390: DKIM-Signature field added (s=default, d=vlsc.org)</font></pre>
    <pre><font face="Helvetica, Arial, sans-serif">Oct&nbsp; 7 23:14:22 cloud sendmail[1392]: s97NEL7Z001390: to=/dev/null, ctladdr=<a class="moz-txt-link-rfc2396E" href="mailto:sail2@vlsc.org">&lt;sail2@vlsc.org&gt;</a> (8/0), delay=00:00:01, xdelay=00:00:00, mailer=*file*, pri=31824, dsn=2.0.0, stat=Sent</font></pre>
    <font face="Helvetica, Arial, sans-serif"><br>
      The entry "to=/dev/null, ctladdr=<a class="moz-txt-link-rfc2396E"
        href="mailto:sail2@vlsc.org">&lt;sail2@vlsc.org&gt;</a>" seems
      suspicious, like the email is being dumped to /dev/null instead of
      being delivered to the list.<br>
      <br>
      Can anyone help me by letting me know if I've missed some piece in
      my setup, or at least how to interpret this log entry correctly?<br>
      <br>
      I'm a refugee from majordomo who is trying to get our new server
      running with mlmmj so our organization can continue to run several
      small in-house email lists.<br>
      <br>
      Thanks for any help!<br>
      <br>
      Philip</font>
  </body>
</html>

--------------060602020100030908000304--

