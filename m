From: "Patrick Bennett" <patrick@pebcomputing.com>
Date: Thu, 29 Sep 2005 10:37:57 +0000
Subject: silently discarded post
Message-Id: <003f01c5c4e1$dbd80420$6664a8c0@stnick>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_NextPart_000_003C_01C5C4A7.2EDBDAB0"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.

------=_NextPart_000_003C_01C5C4A7.2EDBDAB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a mlmmj 1.2.4-1 mailing list running on a debian+postfix host and =
one particular user is having trouble posting to it.  Every mail he =
sends is silently filed away into queue/discarded.  The address he is =
emailing from is properly subscribed to the "nomail" part of the list.  =
There is no control/access file.  Others, both on the mail-receipt and =
noreciept lists, are able to post to the list successfully.

Below is a copy of one of the mails that ended up in queue/discarded.  =
Two things catch my eye, I wonder if either of them has something to do =
with it: 1) his "from" address has a 3-part domain; 2) the "to" address =
has single quotes around it (he seems to be unable to prevent this in =
his mailer, and at any rate, postfix was obviously able to handle =
it...).

No information is showing up in /var/log/syslog|mail.log or =
mlmmj.operation.log- is there somewhere else I should look?  Thoughts =
anyone?

TIA,
Patrick

~*~*~*~mail.log~*~*~*~
Sep 29 00:04:16 newnorcal postfix/smtpd[17638]: B3BD6382C2: =
client=3Dlocalhost[127.0.0.1]
Sep 29 00:04:17 newnorcal postfix/cleanup[17633]: B3BD6382C2: =
message-id=3D<1BAAFEA9FFD4D411BB3300805FE685741A0A2647@eddexmb04.cahwnet.=
gov>
Sep 29 00:04:17 newnorcal postfix/smtpd[17638]: disconnect from =
localhost[127.0.0.1]
Sep 29 00:04:17 newnorcal postfix/qmgr[17663]: B3BD6382C2: =
from=3D<DPatters@edd.ca.gov>, size=3D1852, nrcpt=3D1 (queue active)
Sep 29 00:04:18 newnorcal postfix/local[17639]: B3BD6382C2: =
to=3D<stockton@norcalsolutions.com>, relay=3Dlocal, delay=3D2, =
status=3Dsent (delivered to command: /usr/bin/mlmmj-recieve -L =
/var/spool/mlmmj/stockton/)
Sep 29 00:04:18 newnorcal postfix/qmgr[17663]: B3BD6382C2: removed

~*~*~*~the discarded email~*~*~*~
From DPatters@edd.ca.gov  Thu Sep 29 00:04:17 2005
Return-Path: <DPatters@edd.ca.gov>
X-Original-To: stockton@norcalsolutions.com
Delivered-To: stockton@norcalsolutions.com
Received: from newnorcal.norcalsolutions.com (localhost [127.0.0.1])
        by mail.norcalsolutions.com (Postfix) with SMTP id B3BD6382C2
        for <stockton@norcalsolutions.com>; Thu, 29 Sep 2005 00:04:16 =
+0000 (UTC)
Received: from hwaexbh02.cahwnet.gov (hwaexbh01.cahwnet.gov =
[158.96.104.22])
        by mail.norcalsolutions.com (Postfix) with ESMTP id 6BB07382C2
        for <stockton@cielini.org>; Thu, 29 Sep 2005 00:04:01 +0000 =
(UTC)
Received: by hwaexbh01.cahwnet.gov with Internet Mail Service
        (5.5.2657.72)id <TVYNHZN0>; Wed, 28 Sep 2005 17:08:58 -0700
Message-ID: =
<1BAAFEA9FFD4D411BB3300805FE685741A0A2647@eddexmb04.cahwnet.gov>
From: "Patterson, Daniel@EDD" <DPatters@edd.ca.gov>
To: "'stockton@cielini.org'" <stockton@cielini.org>
Subject: test email. please ignore
Date: Wed, 28 Sep 2005 17:08:56 -0700
MIME-Version: 1.0
X-Mailer: Internet Mail Service (5.5.2657.72)
Content-Type: multipart/alternative;
        boundary=3D"----_=3D_NextPart_001_01C5C489.F1BA5994"
X-imss-version: 2.031
X-imss-result: Passed
X-imss-scores: Clean:57.84395 C:2 M:3 S:5 R:5
X-imss-settings: Baseline:3 C:1 M:1 S:2 R:1 (0.5000 0.5000)

This message is in MIME format. Since your mail reader does not =
understand
this format, some or all of this message may not be legible.

------_=3D_NextPart_001_01C5C489.F1BA5994
Content-Type: text/plain;
        charset=3D"iso-8859-1"

Danny Patterson

------_=3D_NextPart_001_01C5C489.F1BA5994
Content-Type: text/html;
        charset=3D"iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2658.24">
<TITLE>test email. please ignore</TITLE>
</HEAD>
<BODY>

<P><FONT FACE=3D"Arial">Danny Patterson</FONT>
</P>

</BODY>
</HTML>
------_=3D_NextPart_001_01C5C489.F1BA5994--

------=_NextPart_000_003C_01C5C4A7.2EDBDAB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2900.2722" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have a mlmmj 1.2.4-1 mailing list =
running on a=20
debian+postfix host and one particular user is having trouble posting to =

it.&nbsp; Every mail he sends is silently filed away into=20
queue/discarded.&nbsp;&nbsp;The address&nbsp;he is emailing from&nbsp;is =

properly subscribed to the "nomail" part of the list.&nbsp; There is no=20
control/access file.&nbsp; Others, both on the mail-receipt and =
noreciept lists,=20
are able to post to the list successfully.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Below is a copy of one of the mails =
that ended up=20
in queue/discarded.&nbsp; Two things catch my eye, I wonder if either of =
them=20
has something to do with it: 1) his "from" address has a 3-part domain; =
2) the=20
"to" address has single quotes around it (he seems to be unable to =
prevent this=20
in his mailer, and at any rate, postfix was obviously able to handle=20
it...).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>No information is showing up in=20
/var/log/syslog|mail.log or mlmmj.operation.log- is there somewhere else =
I=20
should look?&nbsp; Thoughts anyone?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TIA,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Patrick</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>~*~*~*~mail.log~*~*~*~</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Sep 29 00:04:16 newnorcal =
postfix/smtpd[17638]:=20
B3BD6382C2: client=3Dlocalhost[127.0.0.1]<BR>Sep 29 00:04:17 newnorcal=20
postfix/cleanup[17633]: B3BD6382C2: message-id=3D&lt;<A=20
href=3D"mailto:1BAAFEA9FFD4D411BB3300805FE685741A0A2647@eddexmb04.cahwnet=
.gov">1BAAFEA9FFD4D411BB3300805FE685741A0A2647@eddexmb04.cahwnet.gov</A>&=
gt;<BR>Sep=20
29 00:04:17 newnorcal postfix/smtpd[17638]: disconnect from=20
localhost[127.0.0.1]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Sep 29 00:04:17 newnorcal =
postfix/qmgr[17663]:=20
B3BD6382C2: from=3D&lt;<A=20
href=3D"mailto:DPatters@edd.ca.gov">DPatters@edd.ca.gov</A>&gt;, =
size=3D1852,=20
nrcpt=3D1 (queue active)<BR>Sep 29 00:04:18 newnorcal =
postfix/local[17639]:=20
B3BD6382C2: to=3D&lt;<A=20
href=3D"mailto:stockton@norcalsolutions.com">stockton@norcalsolutions.com=
</A>&gt;,=20
relay=3Dlocal, delay=3D2, status=3Dsent (delivered to command: =
/usr/bin/mlmmj-recieve=20
-L /var/spool/mlmmj/stockton/)<BR>Sep 29 00:04:18 newnorcal =
postfix/qmgr[17663]:=20
B3BD6382C2: removed<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>~*~*~*~the discarded =
email~*~*~*~</FONT><FONT=20
face=3DArial size=3D2><BR>From <A=20
href=3D"mailto:DPatters@edd.ca.gov">DPatters@edd.ca.gov</A>&nbsp; Thu =
Sep 29=20
00:04:17 2005<BR>Return-Path: &lt;<A=20
href=3D"mailto:DPatters@edd.ca.gov">DPatters@edd.ca.gov</A>&gt;<BR>X-Orig=
inal-To:=20
<A=20
href=3D"mailto:stockton@norcalsolutions.com">stockton@norcalsolutions.com=
</A><BR>Delivered-To:=20
<A=20
href=3D"mailto:stockton@norcalsolutions.com">stockton@norcalsolutions.com=
</A><BR>Received:=20
from newnorcal.norcalsolutions.com (localhost=20
[127.0.0.1])<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; by=20
mail.norcalsolutions.com (Postfix) with SMTP id=20
B3BD6382C2<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for &lt;<A=20
href=3D"mailto:stockton@norcalsolutions.com">stockton@norcalsolutions.com=
</A>&gt;;=20
Thu, 29 Sep 2005 00:04:16 +0000 (UTC)<BR>Received: from =
hwaexbh02.cahwnet.gov=20
(hwaexbh01.cahwnet.gov=20
[158.96.104.22])<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; by=20
mail.norcalsolutions.com (Postfix) with ESMTP id=20
6BB07382C2<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for &lt;<A=20
href=3D"mailto:stockton@cielini.org">stockton@cielini.org</A>&gt;; Thu, =
29 Sep=20
2005 00:04:01 +0000 (UTC)<BR>Received: by hwaexbh01.cahwnet.gov with =
Internet=20
Mail Service<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
(5.5.2657.72)id=20
&lt;TVYNHZN0&gt;; Wed, 28 Sep 2005 17:08:58 -0700<BR>Message-ID: &lt;<A=20
href=3D"mailto:1BAAFEA9FFD4D411BB3300805FE685741A0A2647@eddexmb04.cahwnet=
.gov">1BAAFEA9FFD4D411BB3300805FE685741A0A2647@eddexmb04.cahwnet.gov</A>&=
gt;<BR>From:=20
"Patterson, <A href=3D"mailto:Daniel@EDD">Daniel@EDD</A>" &lt;<A=20
href=3D"mailto:DPatters@edd.ca.gov">DPatters@edd.ca.gov</A>&gt;<BR>To: =
"<A=20
href=3D"mailto:'stockton@cielini.org'">'stockton@cielini.org'</A>" =
&lt;<A=20
href=3D"mailto:stockton@cielini.org">stockton@cielini.org</A>&gt;<BR>Subj=
ect: test=20
email. please ignore<BR>Date: Wed, 28 Sep 2005 17:08:56 =
-0700<BR>MIME-Version:=20
1.0<BR>X-Mailer: Internet Mail Service (5.5.2657.72)<BR>Content-Type:=20
multipart/alternative;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
boundary=3D"----_=3D_NextPart_001_01C5C489.F1BA5994"<BR>X-imss-version:=20
2.031<BR>X-imss-result: Passed<BR>X-imss-scores: Clean:57.84395 C:2 M:3 =
S:5=20
R:5<BR>X-imss-settings: Baseline:3 C:1 M:1 S:2 R:1 (0.5000 =
0.5000)</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This message is in MIME format. Since =
your mail=20
reader does not understand<BR>this format, some or all of this message =
may not=20
be legible.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>------_=3D_NextPart_001_01C5C489.F1BA5994<BR>Content-Type:=20
text/plain;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
charset=3D"iso-8859-1"</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Danny Patterson</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>------_=3D_NextPart_001_01C5C489.F1BA5994<BR>Content-Type:=20
text/html;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
charset=3D"iso-8859-1"</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;!DOCTYPE HTML PUBLIC "-//W3C//DTD =
HTML=20
3.2//EN"&gt;<BR>&lt;HTML&gt;<BR>&lt;HEAD&gt;<BR>&lt;META=20
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html;=20
charset=3Diso-8859-1"&gt;<BR>&lt;META NAME=3D"Generator" CONTENT=3D"MS =
Exchange Server=20
version 5.5.2658.24"&gt;<BR>&lt;TITLE&gt;test email. please=20
ignore&lt;/TITLE&gt;<BR>&lt;/HEAD&gt;<BR>&lt;BODY&gt;</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;P&gt;&lt;FONT =
FACE=3D"Arial"&gt;Danny=20
Patterson&lt;/FONT&gt;<BR>&lt;/P&gt;</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>&lt;/BODY&gt;<BR>&lt;/HTML&gt;<BR>------_=3D_NextPart_001_01C5C4=
89.F1BA5994--<BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_003C_01C5C4A7.2EDBDAB0--

