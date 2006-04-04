From: "James Ray" <jbray@connect-u.com.au>
Date: Tue, 04 Apr 2006 03:32:17 +0000
Subject: Not sure why a subscription request is being discarded
Message-Id: <200604040332.k343WHNj005408@daemon.connect-u.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="----=_NextPart_000_0266_01C657EC.313A23B0"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.

------=_NextPart_000_0266_01C657EC.313A23B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
 
Just wondering about a few things:
 
1. I'm getting certain subscription requests being rejected by mlmmj from my
place of work.  I tried subscribing to this mail list from there as well,
and haven't seen a repsonse, so I presume the same thing is occuring and
it's because mlmmj is rejecting the sub email.  This is the error that
appears in my mail logs:
 
/usr/local/bin/mlmmj-process[4569]: listcontrol.c:175: Discarding mail with
invalid From: which was not a bou
nce: No such file or directory
 
I'm using Sendmail.  It did come standard with smrsh but I've since disabled
this as I found it annoying trying to copy everything into /etc/smrsh.
 
To what file or directory is it referring when it says "No such file or
directory"?
 
2. Is there a way to enable a bit of debugging to see what it's talking
about?
 
3. Is there a way to disable some of the more paranoid checking that mlmmj
is doing on emails?  Personally I'd rather just leave this up to the MTA
software (Sendmail) to decide what is valid according to the RFCs.  The
reason I ask is because I've never noticed a problem sending from my work
email to anywhere, and after installing mlmmj, it seems to be rejecting
emails potentially because of something it thinks is not formatted
correctly.
 
Below is a copy of the headers of an email that I sent from my work, to
myself at home.  I can't copy one from mlmmj as it logs the error in syslog
above, and I don't see it anywhere on the system.
 
Thanks for any suggestions!
 
 
]  Return-Path: <James.Ray@team.telstra.com>
]  Received: from ASSP-nospam (localhost.localdomain [127.0.0.1])
]   by daemon.connect-u.com.au (8.12.11/8.12.11) with ESMTP id
k343Hrvw005354
]   for <jbray@rse.com.au>; Tue, 4 Apr 2006 13:17:53 +1000
]  Received: from 202.12.144.17 ([202.12.144.17]
helo=mailao.vtcif.telstra.com.au) by ASSP-nospam ;  4 Apr 06 03:17:53 -0000
]  Received: from mailbi.vtcif.telstra.com.au (mailbi.vtcif.telstra.com.au
[202.12.142.19])
]   by mailao.vtcif.telstra.com.au (Postfix) with ESMTP id 44B35233FC
]   for <jbray@rse.com.au>; Tue,  4 Apr 2006 13:17:53 +1000 (EST)
]  Received: from mail.cdn.telstra.com.au (localhost [127.0.0.1])
]   by mailbi.vtcif.telstra.com.au (Postfix) with ESMTP id CA86C1DAA5
]   for <jbray@rse.com.au>; Tue,  4 Apr 2006 13:17:52 +1000 (EST)
]  Received: from wsmsg2952.srv.dir.telstra.com
(wsmsg2952.srv.dir.telstra.com [192.74.195.51]) by mail.cdn.telstra.com.au
(8.8.2/8.6.9) 
]   with ESMTP id NAA27077 for <jbray@rse.com.au>; Tue, 4 Apr 2006 13:17:52
+1000 (EST)
]  Received: from WSMSG2153V.srv.dir.telstra.com ([192.74.195.20]) by
wsmsg2952.srv.dir.telstra.com with Microsoft SMTPSVC(6.0.3790.1830);
]    Tue, 4 Apr 2006 13:17:48 +1000
]  X-MIMEOLE: Produced By Microsoft Exchange V6.5
]  Content-class: urn:content-classes:message
]  MIME-Version: 1.0
]  Content-Type: multipart/alternative;
]   boundary="----_=_NextPart_001_01C65796.59866385"
]  Subject: test
]  Date: Tue, 4 Apr 2006 13:17:37 +1000
]  Message-ID:
<08F67550D58180419D5EAA7D8FFF70A8011B85F6@WSMSG2153V.srv.dir.telstra.com>
]  Thread-Topic: test
]  Thread-Index: AcZXllMH+j43qHx2SDuvkN77ZoQeGg==
]  From: "Ray, James" <James.Ray@team.telstra.com>
]  To: <jbray@rse.com.au>
]  X-OriginalArrivalTime: 04 Apr 2006 03:17:48.0832 (UTC)
FILETIME=[59B40A00:01C65796]
]  X-Assp-Spam-Prob: 0.00000
]  Status: O
]  X-UID: 25869
]  Content-Length: 948
]  X-Keywords:

 

------=_NextPart_000_0266_01C657EC.313A23B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2802" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2>Hi,</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial size=3D2>Just =
wondering about=20
a few things:</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial size=3D2>1. I'm =
getting=20
certain subscription requests being&nbsp;rejected by mlmmj from my place =
of=20
work.&nbsp; I tried subscribing to this mail list from there as well, =
and=20
haven't seen a repsonse, so I presume the same thing is occuring and =
it's=20
because mlmmj is rejecting the sub email.&nbsp; This is the error that =
appears=20
in my mail logs:</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2>/usr/local/bin/mlmmj-process[4569]: listcontrol.c:175: =
Discarding mail=20
with invalid From: which was not a bou<BR>nce: No such file or=20
directory</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial size=3D2>I'm =
using=20
Sendmail.&nbsp; It did come standard with smrsh but I've since disabled =
this as=20
I found it annoying trying to copy everything into=20
/etc/smrsh.</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial size=3D2>To =
what file or=20
directory is it referring when it says "No such file or=20
directory"?</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial size=3D2>2. Is =
there a way to=20
enable a bit of debugging to see what it's talking =
about?</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial size=3D2>3. Is =
there a way to=20
disable some of the more paranoid checking that mlmmj is doing on =
emails?&nbsp;=20
Personally I'd rather just leave this up to the MTA software (Sendmail) =
to=20
decide what is valid according to the RFCs.&nbsp; The reason I ask is =
because=20
I've never noticed a problem sending from my work email to anywhere, and =
after=20
installing mlmmj, it seems to be rejecting emails potentially because of =

something it thinks is not formatted correctly.</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial size=3D2>Below =
is a copy of=20
the headers of an email that I sent from my work, to myself at =
home.&nbsp; I=20
can't copy one from mlmmj as it logs the error in syslog above, and I =
don't see=20
it anywhere on the system.</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial size=3D2>Thanks =
for any=20
suggestions!</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial =
size=3D2>]&nbsp; Return-Path:=20
&lt;<A=20
href=3D"mailto:James.Ray@team.telstra.com">James.Ray@team.telstra.com</A>=
&gt;<BR>]&nbsp;=20
Received: from ASSP-nospam (localhost.localdomain =
[127.0.0.1])<BR>]&nbsp;=20
&nbsp;by daemon.connect-u.com.au (8.12.11/8.12.11) with ESMTP id=20
k343Hrvw005354<BR>]&nbsp; &nbsp;for &lt;<A=20
href=3D"mailto:jbray@rse.com.au">jbray@rse.com.au</A>&gt;; Tue, 4 Apr =
2006=20
13:17:53 +1000<BR>]&nbsp; Received: from 202.12.144.17 ([202.12.144.17]=20
helo=3Dmailao.vtcif.telstra.com.au) by ASSP-nospam ;&nbsp; 4 Apr 06 =
03:17:53=20
-0000<BR>]&nbsp; Received: from mailbi.vtcif.telstra.com.au=20
(mailbi.vtcif.telstra.com.au [202.12.142.19])<BR>]&nbsp; &nbsp;by=20
mailao.vtcif.telstra.com.au (Postfix) with ESMTP id =
44B35233FC<BR>]&nbsp;=20
&nbsp;for &lt;<A =
href=3D"mailto:jbray@rse.com.au">jbray@rse.com.au</A>&gt;;=20
Tue,&nbsp; 4 Apr 2006 13:17:53 +1000 (EST)<BR>]&nbsp; Received: from=20
mail.cdn.telstra.com.au (localhost [127.0.0.1])<BR>]&nbsp; &nbsp;by=20
mailbi.vtcif.telstra.com.au (Postfix) with ESMTP id =
CA86C1DAA5<BR>]&nbsp;=20
&nbsp;for &lt;<A =
href=3D"mailto:jbray@rse.com.au">jbray@rse.com.au</A>&gt;;=20
Tue,&nbsp; 4 Apr 2006 13:17:52 +1000 (EST)<BR>]&nbsp; Received: from=20
wsmsg2952.srv.dir.telstra.com (wsmsg2952.srv.dir.telstra.com =
[192.74.195.51]) by=20
mail.cdn.telstra.com.au (8.8.2/8.6.9) </FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial =
size=3D2>]&nbsp;&nbsp; with=20
ESMTP id&nbsp;NAA27077&nbsp;for&nbsp;&lt;<A=20
href=3D"mailto:jbray@rse.com.au">jbray@rse.com.au</A>&gt;; Tue, 4 Apr =
2006=20
13:17:52 +1000 (EST)<BR>]&nbsp; Received: from =
WSMSG2153V.srv.dir.telstra.com=20
([192.74.195.20]) by wsmsg2952.srv.dir.telstra.com with Microsoft=20
SMTPSVC(6.0.3790.1830);<BR>]&nbsp; &nbsp; Tue, 4 Apr 2006 13:17:48=20
+1000<BR>]&nbsp; X-MIMEOLE: Produced By Microsoft Exchange =
V6.5<BR>]&nbsp;=20
Content-class: urn:content-classes:message<BR>]&nbsp; MIME-Version:=20
1.0<BR>]&nbsp; Content-Type: multipart/alternative;<BR>]&nbsp;=20
&nbsp;boundary=3D"----_=3D_NextPart_001_01C65796.59866385"<BR>]&nbsp; =
Subject:=20
test<BR>]&nbsp; Date: Tue, 4 Apr 2006 13:17:37 +1000<BR>]&nbsp; =
Message-ID:=20
&lt;<A=20
href=3D"mailto:08F67550D58180419D5EAA7D8FFF70A8011B85F6@WSMSG2153V.srv.di=
r.telstra.com">08F67550D58180419D5EAA7D8FFF70A8011B85F6@WSMSG2153V.srv.di=
r.telstra.com</A>&gt;<BR>]&nbsp;=20
Thread-Topic: test<BR>]&nbsp; Thread-Index:=20
AcZXllMH+j43qHx2SDuvkN77ZoQeGg=3D=3D<BR>]&nbsp; From: "Ray, James" =
&lt;<A=20
href=3D"mailto:James.Ray@team.telstra.com">James.Ray@team.telstra.com</A>=
&gt;<BR>]&nbsp;=20
To: &lt;<A =
href=3D"mailto:jbray@rse.com.au">jbray@rse.com.au</A>&gt;<BR>]&nbsp;=20
X-OriginalArrivalTime: 04 Apr 2006 03:17:48.0832 (UTC)=20
FILETIME=3D[59B40A00:01C65796]<BR>]&nbsp; X-Assp-Spam-Prob: =
0.00000<BR>]&nbsp;=20
Status: O<BR>]&nbsp; X-UID: 25869<BR>]&nbsp; Content-Length: =
948<BR>]&nbsp;=20
X-Keywords:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D482021903-04042006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0266_01C657EC.313A23B0--

