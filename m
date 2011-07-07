From: <axel.weber@cbc.de>
Date: Thu, 07 Jul 2011 06:57:33 +0000
Subject: [mlmmj] help needed: mails are not sent from remote clients
Message-Id: <324F4CE41849CF4DB056C3C8DC696548DFF76F1240@ERRA.netrtlsrv.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="_000_324F4CE41849CF4DB056C3C8DC696548DFF76F1240ERRAnetrtlsrv_"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

--_000_324F4CE41849CF4DB056C3C8DC696548DFF76F1240ERRAnetrtlsrv_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi there,

I can't get the mailing list up and running.
Let me describe the situation.

Sending a mail to the mailing list on the local machine itself is successfu=
l. That is what maillog says:

Jul  7 08:58:26 glenfiddich.netrtl.com postfix/pickup[4974]: 182DFE80D3: ui=
d=3D0 from=3D<root>
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/cleanup[7355]: 182DFE80D3: m=
essage-id=3D<20110707065826.182DFE80D3@glenfiddich.netrtl.com>
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/qmgr[2734]: 182DFE80D3: from=
=3D<root@glenfiddich.netrtl.com>, size=3D323, nrcpt=3D1 (queue active)
Jul  7 08:58:26 glenfiddich.netrtl.com /usr/bin/mlmmj-process[7425]: mlmmj-=
process.c:724: Found To: saw-filing3@cbc.de: No such file or directory
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/smtpd[7352]: connect from lo=
calhost.localdomain[127.0.0.1]
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/smtpd[7352]: 78E1EE808E: cli=
ent=3Dlocalhost.localdomain[127.0.0.1]
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/cleanup[7355]: 78E1EE808E: m=
essage-id=3D<20110707065826.182DFE80D3@glenfiddich.netrtl.com>
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/qmgr[2734]: 78E1EE808E: from=
=3D<saw-filing3+bounces-15-axel.weber=3Dcbc.de@cbc.de>, size=3D634, nrcpt=
=3D1 (queue active)
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/smtpd[7352]: disconnect from=
 localhost.localdomain[127.0.0.1]
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/pipe[7424]: 182DFE80D3: to=
=3D<saw-filing3@glenfiddich.netrtl.com>, orig_to=3D<saw-filing3@cbc.de>, re=
lay=3Dmlmmj, delay=3D0.51, delays=3D0.2/0.01/0/0.31, dsn=3D2.0.0, status=3D=
sent (delivered via mlmmj service)
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/qmgr[2734]: 182DFE80D3: remo=
ved
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/smtp[7356]: 78E1EE808E: to=
=3D<axel.weber@cbc.de>, relay=3Dmailhostsrv.netrtl.com[10.98.233.151]:25, d=
elay=3D0.26, delays=3D0.08/0/0/0.17, dsn=3D2.6.0, status=3Dsent (250 2.6.0 =
<20110707065826.182DFE80D3@glenfiddich.netrtl.com> Queued mail for delivery=
)
Jul  7 08:58:26 glenfiddich.netrtl.com postfix/qmgr[2734]: 78E1EE808E: remo=
ved

And that is what is stored in the archive directory, file 15:
X-Original-To: saw-filing3@cbc.de
Delivered-To: saw-filing3@glenfiddich.netrtl.com
Received: by glenfiddich.netrtl.com (Postfix, from userid 0)
                id 182DFE80D3; Thu,  7 Jul 2011 08:58:26 +0200 (CEST)
To: saw-filing3@cbc.de
Subject: test
Message-Id: <20110707065826.182DFE80D3@glenfiddich.netrtl.com>
Date: Thu,  7 Jul 2011 08:58:26 +0200 (CEST)
From: root@glenfiddich.netrtl.com (root)
List-ID:saw-filing3

test local

-----------------------------

If I send a mail from a different host to the mailing list it is not forwar=
ded to the recipient, although it gets stored in the archive directory. Tha=
t again is what maillog says:

Jul  7 09:00:41 glenfiddich.netrtl.com postfix/smtpd[7496]: connect from bo=
wmore.netrtl.com[10.98.69.142]
Jul  7 09:00:41 glenfiddich.netrtl.com postfix/smtpd[7496]: AB07FE808E: cli=
ent=3Dbowmore.netrtl.com[10.98.69.142]
Jul  7 09:00:41 glenfiddich.netrtl.com postfix/cleanup[7499]: AB07FE808E: m=
essage-id=3D<20110707065257.DC87A1C804B@bowmore.netrtl.com>
Jul  7 09:00:41 glenfiddich.netrtl.com postfix/qmgr[2734]: AB07FE808E: from=
=3D<root@bowmore.netrtl.com>, size=3D518, nrcpt=3D1 (queue active)
Jul  7 09:00:41 glenfiddich.netrtl.com postfix/smtpd[7496]: disconnect from=
 bowmore.netrtl.com[10.98.69.142]
Jul  7 09:00:42 glenfiddich.netrtl.com /usr/bin/mlmmj-process[7501]: mlmmj-=
process.c:724: Found To: saw-filing3@cbc.de: No such file or directory
Jul  7 09:00:42 glenfiddich.netrtl.com postfix/smtpd[7496]: connect from lo=
calhost.localdomain[127.0.0.1]
Jul  7 09:00:42 glenfiddich.netrtl.com postfix/smtpd[7496]: 0D171E80D3: cli=
ent=3Dlocalhost.localdomain[127.0.0.1]
Jul  7 09:00:42 glenfiddich.netrtl.com postfix/cleanup[7499]: 0D171E80D3: m=
essage-id=3D<20110707065257.DC87A1C804B@bowmore.netrtl.com>
Jul  7 09:00:42 glenfiddich.netrtl.com postfix/qmgr[2734]: 0D171E80D3: from=
=3D<saw-filing3+bounces-16-axel.weber=3Dcbc.de@cbc.de>, size=3D829, nrcpt=
=3D1 (queue active)
Jul  7 09:00:42 glenfiddich.netrtl.com postfix/qmgr[2734]: AB07FE808E: remo=
ved
Jul  7 09:00:42 glenfiddich.netrtl.com postfix/smtpd[7496]: disconnect from=
 localhost.localdomain[127.0.0.1]
Jul  7 09:00:42 glenfiddich.netrtl.com postfix/pipe[7500]: AB07FE808E: to=
=3D<saw-filing3@glenfiddich.netrtl.com>, orig_to=3D<saw-filing3@cbc.de>, re=
lay=3Dmlmmj, delay=3D0.47, delays=3D0.2/0.01/0/0.26, dsn=3D2.0.0, status=3D=
sent (delivered via mlmmj service)
Jul  7 09:00:42 glenfiddich.netrtl.com postfix/smtp[7502]: 0D171E80D3: to=
=3D<axel.weber@cbc.de>, relay=3Dmailhostsrv.netrtl.com[10.98.248.151]:25, d=
elay=3D0.32, delays=3D0.11/0.01/0.01/0.2, dsn=3D2.6.0, status=3Dsent (250 2=
.6.0 <20110707065257.DC87A1C804B@bowmore.netrtl.com> Queued mail for delive=
ry)
Jul  7 09:00:42 glenfiddich.netrtl.com postfix/qmgr[2734]: 0D171E80D3: remo=
ved


An that is what is stored in the archive directory, file 16:
X-Original-To: saw-filing3@cbc.de
Delivered-To: saw-filing3@glenfiddich.netrtl.com
Received: from bowmore.netrtl.com (bowmore.netrtl.com [10.98.69.142])
                by glenfiddich.netrtl.com (Postfix) with ESMTP id AB07FE808=
E
                for <saw-filing3@cbc.de>; Thu,  7 Jul 2011 09:00:41 +0200 (=
CEST)
Received: by bowmore.netrtl.com (Postfix, from userid 0)
                id DC87A1C804B; Thu,  7 Jul 2011 08:52:57 +0200 (CEST)
To: saw-filing3@cbc.de
Subject: bowmore
Message-Id: <20110707065257.DC87A1C804B@bowmore.netrtl.com>
Date: Thu,  7 Jul 2011 08:52:57 +0200 (CEST)
From: root@bowmore.netrtl.com (root)
List-ID:saw-filing3

test remote


Axel Weber
System-Ing. Postproduktionssysteme
_____________________________________
Tel.: +49 221 456 44188
Fax: +49 221 456 95 44180

CBC Cologne Broadcasting Center GmbH
Picassoplatz1 50679 K=F6ln
Sitz der Gesellschaft: K=F6ln  AG K=F6ln  HRB 25232
Gesch=E4ftsf=FChrer: Thomas Harscheidt  www.cbc.de <http://www.cbc.de>

--_000_324F4CE41849CF4DB056C3C8DC696548DFF76F1240ERRAnetrtlsrv_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type content=
=3D"text/html; charset=3Diso-8859-1"><meta name=3DGenerator content=3D"Micr=
osoft Word 14 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.apple-tab-span
	{mso-style-name:apple-tab-span;}
span.E-MailFormatvorlage18
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DDE link=3Dblue vlink=
=3Dpurple style=3D'word-wrap: break-word;-webkit-nbsp-mode: space;-webkit-l=
ine-break: after-white-space'><div class=3DWordSection1><p class=3DMsoNorma=
l><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:=
black'>Hi there,<o:p></o:p></span></p><div><p class=3DMsoNormal><span style=
=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'><o:p>&=
nbsp;</o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-s=
ize:10.5pt;font-family:"Calibri","sans-serif";color:black'>I can't get the =
mailing list up and running.<o:p></o:p></span></p></div><div><p class=3DMso=
Normal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";c=
olor:black'>Let me describe the situation.<o:p></o:p></span></p></div><div>=
<p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri",=
"sans-serif";color:black'><o:p>&nbsp;</o:p></span></p></div><div><p class=
=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-se=
rif";color:black'>Sending a mail to the mailing list on the local machine i=
tself is successful. That is what maillog says:<o:p></o:p></span></p></div>=
<div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Cali=
bri","sans-serif";color:black'><o:p>&nbsp;</o:p></span></p></div><div><div>=
<p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri",=
"sans-serif";color:black'>Jul &nbsp;7 08:58:26 glenfiddich.netrtl.com postf=
ix/pickup[4974]: 182DFE80D3: uid=3D0 from=3D&lt;root&gt;<o:p></o:p></span><=
/p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-fam=
ily:"Calibri","sans-serif";color:black'>Jul &nbsp;7 08:58:26 glenfiddich.ne=
trtl.com postfix/cleanup[7355]: 182DFE80D3: message-id=3D&lt;20110707065826=
.182DFE80D3@glenfiddich.netrtl.com&gt;<o:p></o:p></span></p></div><div><p c=
lass=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","san=
s-serif";color:black'>Jul &nbsp;7 08:58:26 glenfiddich.netrtl.com postfix/q=
mgr[2734]: 182DFE80D3: from=3D&lt;root@glenfiddich.netrtl.com&gt;, size=3D3=
23, nrcpt=3D1 (queue active)<o:p></o:p></span></p></div><div><p class=3DMso=
Normal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";c=
olor:black'>Jul &nbsp;7 08:58:26 glenfiddich.netrtl.com /usr/bin/mlmmj-proc=
ess[7425]: mlmmj-process.c:724: Found To: saw-filing3@cbc.de: No such file =
or directory<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span sty=
le=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>Jul =
&nbsp;7 08:58:26 glenfiddich.netrtl.com postfix/smtpd[7352]: connect from l=
ocalhost.localdomain[127.0.0.1]<o:p></o:p></span></p></div><div><p class=3D=
MsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif=
";color:black'>Jul &nbsp;7 08:58:26 glenfiddich.netrtl.com postfix/smtpd[73=
52]: 78E1EE808E: client=3Dlocalhost.localdomain[127.0.0.1]<o:p></o:p></span=
></p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-f=
amily:"Calibri","sans-serif";color:black'>Jul &nbsp;7 08:58:26 glenfiddich.=
netrtl.com postfix/cleanup[7355]: 78E1EE808E: message-id=3D&lt;201107070658=
26.182DFE80D3@glenfiddich.netrtl.com&gt;<o:p></o:p></span></p></div><div><p=
 class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","s=
ans-serif";color:black'>Jul &nbsp;7 08:58:26 glenfiddich.netrtl.com postfix=
/qmgr[2734]: 78E1EE808E: from=3D&lt;saw-filing3+bounces-15-axel.weber=3Dcbc=
.de@cbc.de&gt;, size=3D634, nrcpt=3D1 (queue active)<o:p></o:p></span></p><=
/div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:=
"Calibri","sans-serif";color:black'>Jul &nbsp;7 08:58:26 glenfiddich.netrtl=
.com postfix/smtpd[7352]: disconnect from localhost.localdomain[127.0.0.1]<=
o:p></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-si=
ze:10.5pt;font-family:"Calibri","sans-serif";color:black'>Jul &nbsp;7 08:58=
:26 glenfiddich.netrtl.com postfix/pipe[7424]: 182DFE80D3: to=3D&lt;saw-fil=
ing3@glenfiddich.netrtl.com&gt;, orig_to=3D&lt;saw-filing3@cbc.de&gt;, rela=
y=3Dmlmmj, delay=3D0.51, delays=3D0.2/0.01/0/0.31, dsn=3D2.0.0, status=3Dse=
nt (delivered via mlmmj service)<o:p></o:p></span></p></div><div><p class=
=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-se=
rif";color:black'>Jul &nbsp;7 08:58:26 glenfiddich.netrtl.com postfix/qmgr[=
2734]: 182DFE80D3: removed<o:p></o:p></span></p></div><div><p class=3DMsoNo=
rmal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";col=
or:black'>Jul &nbsp;7 08:58:26 glenfiddich.netrtl.com postfix/smtp[7356]: 7=
8E1EE808E: to=3D&lt;axel.weber@cbc.de&gt;, relay=3Dmailhostsrv.netrtl.com[1=
0.98.233.151]:25, delay=3D0.26, delays=3D0.08/0/0/0.17, dsn=3D2.6.0, status=
=3Dsent (250 2.6.0 &lt;20110707065826.182DFE80D3@glenfiddich.netrtl.com&gt;=
 Queued mail for delivery)<o:p></o:p></span></p></div><div><p class=3DMsoNo=
rmal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";col=
or:black'>Jul &nbsp;7 08:58:26 glenfiddich.netrtl.com postfix/qmgr[2734]: 7=
8E1EE808E: removed<o:p></o:p></span></p></div></div><div><p class=3DMsoNorm=
al><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color=
:black'><o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNormal><span s=
tyle=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>An=
d that is what is stored in the archive directory, file 15:<o:p></o:p></spa=
n></p></div><div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;=
font-family:"Calibri","sans-serif";color:black'>X-Original-To: saw-filing3@=
cbc.de<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'=
font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>Delivered-=
To: saw-filing3@glenfiddich.netrtl.com<o:p></o:p></span></p></div><div><p c=
lass=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","san=
s-serif";color:black'>Received: by glenfiddich.netrtl.com (Postfix, from us=
erid 0)<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span class=3D=
apple-tab-span><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-=
serif";color:black'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </span></=
span><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";col=
or:black'>id 182DFE80D3; Thu, &nbsp;7 Jul 2011 08:58:26 +0200 (CEST)<o:p></=
o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.=
5pt;font-family:"Calibri","sans-serif";color:black'>To: saw-filing3@cbc.de<=
o:p></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-si=
ze:10.5pt;font-family:"Calibri","sans-serif";color:black'>Subject: test<o:p=
></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-size:=
10.5pt;font-family:"Calibri","sans-serif";color:black'>Message-Id: &lt;2011=
0707065826.182DFE80D3@glenfiddich.netrtl.com&gt;<o:p></o:p></span></p></div=
><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Cal=
ibri","sans-serif";color:black'>Date: Thu, &nbsp;7 Jul 2011 08:58:26 +0200 =
(CEST)<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'=
font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>From: root=
@glenfiddich.netrtl.com (root)<o:p></o:p></span></p></div><div><p class=3DM=
soNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif"=
;color:black'>List-ID:saw-filing3<o:p></o:p></span></p></div><div><p class=
=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-se=
rif";color:black'><o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNorm=
al><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color=
:black'>test local<o:p></o:p></span></p></div></div><div><p class=3DMsoNorm=
al><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color=
:black'><o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNormal><span s=
tyle=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>--=
---------------------------<o:p></o:p></span></p></div><div><p class=3DMsoN=
ormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";co=
lor:black'><o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNormal><spa=
n style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'=
>If I send a mail from a different host to the mailing list it is not forwa=
rded to the recipient, although it gets stored in the archive directory. Th=
at again is what maillog says:<o:p></o:p></span></p></div><div><div><p clas=
s=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-s=
erif";color:black'><o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNor=
mal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";colo=
r:black'>Jul &nbsp;7 09:00:41 glenfiddich.netrtl.com postfix/smtpd[7496]: c=
onnect from bowmore.netrtl.com[10.98.69.142]<o:p></o:p></span></p></div><di=
v><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri=
","sans-serif";color:black'>Jul &nbsp;7 09:00:41 glenfiddich.netrtl.com pos=
tfix/smtpd[7496]: AB07FE808E: client=3Dbowmore.netrtl.com[10.98.69.142]<o:p=
></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-size:=
10.5pt;font-family:"Calibri","sans-serif";color:black'>Jul &nbsp;7 09:00:41=
 glenfiddich.netrtl.com postfix/cleanup[7499]: AB07FE808E: message-id=3D&lt=
;20110707065257.DC87A1C804B@bowmore.netrtl.com&gt;<o:p></o:p></span></p></d=
iv><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"C=
alibri","sans-serif";color:black'>Jul &nbsp;7 09:00:41 glenfiddich.netrtl.c=
om postfix/qmgr[2734]: AB07FE808E: from=3D&lt;root@bowmore.netrtl.com&gt;, =
size=3D518, nrcpt=3D1 (queue active)<o:p></o:p></span></p></div><div><p cla=
ss=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-=
serif";color:black'>Jul &nbsp;7 09:00:41 glenfiddich.netrtl.com postfix/smt=
pd[7496]: disconnect from bowmore.netrtl.com[10.98.69.142]<o:p></o:p></span=
></p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-f=
amily:"Calibri","sans-serif";color:black'>Jul &nbsp;7 09:00:42 glenfiddich.=
netrtl.com /usr/bin/mlmmj-process[7501]: mlmmj-process.c:724: Found To: saw=
-filing3@cbc.de: No such file or directory<o:p></o:p></span></p></div><div>=
<p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri",=
"sans-serif";color:black'>Jul &nbsp;7 09:00:42 glenfiddich.netrtl.com postf=
ix/smtpd[7496]: connect from localhost.localdomain[127.0.0.1]<o:p></o:p></s=
pan></p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;fon=
t-family:"Calibri","sans-serif";color:black'>Jul &nbsp;7 09:00:42 glenfiddi=
ch.netrtl.com postfix/smtpd[7496]: 0D171E80D3: client=3Dlocalhost.localdoma=
in[127.0.0.1]<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span st=
yle=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>Jul=
 &nbsp;7 09:00:42 glenfiddich.netrtl.com postfix/cleanup[7499]: 0D171E80D3:=
 message-id=3D&lt;20110707065257.DC87A1C804B@bowmore.netrtl.com&gt;<o:p></o=
:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5=
pt;font-family:"Calibri","sans-serif";color:black'>Jul &nbsp;7 09:00:42 gle=
nfiddich.netrtl.com postfix/qmgr[2734]: 0D171E80D3: from=3D&lt;saw-filing3+=
bounces-16-axel.weber=3Dcbc.de@cbc.de&gt;, size=3D829, nrcpt=3D1 (queue act=
ive)<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'fo=
nt-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>Jul &nbsp;7 =
09:00:42 glenfiddich.netrtl.com postfix/qmgr[2734]: AB07FE808E: removed<o:p=
></o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-size:=
10.5pt;font-family:"Calibri","sans-serif";color:black'>Jul &nbsp;7 09:00:42=
 glenfiddich.netrtl.com postfix/smtpd[7496]: disconnect from localhost.loca=
ldomain[127.0.0.1]<o:p></o:p></span></p></div><div><p class=3DMsoNormal><sp=
an style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black=
'>Jul &nbsp;7 09:00:42 glenfiddich.netrtl.com postfix/pipe[7500]: AB07FE808=
E: to=3D&lt;saw-filing3@glenfiddich.netrtl.com&gt;, orig_to=3D&lt;saw-filin=
g3@cbc.de&gt;, relay=3Dmlmmj, delay=3D0.47, delays=3D0.2/0.01/0/0.26, dsn=
=3D2.0.0, status=3Dsent (delivered via mlmmj service)<o:p></o:p></span></p>=
</div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family=
:"Calibri","sans-serif";color:black'>Jul &nbsp;7 09:00:42 glenfiddich.netrt=
l.com postfix/smtp[7502]: 0D171E80D3: to=3D&lt;axel.weber@cbc.de&gt;, relay=
=3Dmailhostsrv.netrtl.com[10.98.248.151]:25, delay=3D0.32, delays=3D0.11/0.=
01/0.01/0.2, dsn=3D2.6.0, status=3Dsent (250 2.6.0 &lt;20110707065257.DC87A=
1C804B@bowmore.netrtl.com&gt; Queued mail for delivery)<o:p></o:p></span></=
p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-fami=
ly:"Calibri","sans-serif";color:black'>Jul &nbsp;7 09:00:42 glenfiddich.net=
rtl.com postfix/qmgr[2734]: 0D171E80D3: removed<o:p></o:p></span></p></div>=
</div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family=
:"Calibri","sans-serif";color:black'><o:p>&nbsp;</o:p></span></p></div><div=
><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri"=
,"sans-serif";color:black'><o:p>&nbsp;</o:p></span></p></div><div><p class=
=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-se=
rif";color:black'>An that is what is stored in the archive directory, file =
16:<o:p></o:p></span></p></div><div><div><p class=3DMsoNormal><span style=
=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>X-Orig=
inal-To: saw-filing3@cbc.de<o:p></o:p></span></p></div><div><p class=3DMsoN=
ormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";co=
lor:black'>Delivered-To: saw-filing3@glenfiddich.netrtl.com<o:p></o:p></spa=
n></p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-=
family:"Calibri","sans-serif";color:black'>Received: from bowmore.netrtl.co=
m (bowmore.netrtl.com [10.98.69.142])<o:p></o:p></span></p></div><div><p cl=
ass=3DMsoNormal><span class=3Dapple-tab-span><span style=3D'font-size:10.5p=
t;font-family:"Calibri","sans-serif";color:black'>=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 </span></span><span style=3D'font-size:10.5pt;font-fa=
mily:"Calibri","sans-serif";color:black'>by glenfiddich.netrtl.com (Postfix=
) with ESMTP id AB07FE808E<o:p></o:p></span></p></div><div><p class=3DMsoNo=
rmal><span class=3Dapple-tab-span><span style=3D'font-size:10.5pt;font-fami=
ly:"Calibri","sans-serif";color:black'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 </span></span><span style=3D'font-size:10.5pt;font-family:"Calibr=
i","sans-serif";color:black'>for &lt;saw-filing3@cbc.de&gt;; Thu, &nbsp;7 J=
ul 2011 09:00:41 +0200 (CEST)<o:p></o:p></span></p></div><div><p class=3DMs=
oNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";=
color:black'>Received: by bowmore.netrtl.com (Postfix, from userid 0)<o:p><=
/o:p></span></p></div><div><p class=3DMsoNormal><span class=3Dapple-tab-spa=
n><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:=
black'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </span></span><span st=
yle=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>id =
DC87A1C804B; Thu, &nbsp;7 Jul 2011 08:52:57 +0200 (CEST)<o:p></o:p></span><=
/p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-fam=
ily:"Calibri","sans-serif";color:black'>To: saw-filing3@cbc.de<o:p></o:p></=
span></p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;fo=
nt-family:"Calibri","sans-serif";color:black'>Subject: bowmore<o:p></o:p></=
span></p></div><div><p class=3DMsoNormal><span style=3D'font-size:10.5pt;fo=
nt-family:"Calibri","sans-serif";color:black'>Message-Id: &lt;2011070706525=
7.DC87A1C804B@bowmore.netrtl.com&gt;<o:p></o:p></span></p></div><div><p cla=
ss=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:"Calibri","sans-=
serif";color:black'>Date: Thu, &nbsp;7 Jul 2011 08:52:57 +0200 (CEST)<o:p><=
/o:p></span></p></div><div><p class=3DMsoNormal><span style=3D'font-size:10=
.5pt;font-family:"Calibri","sans-serif";color:black'>From: root@bowmore.net=
rtl.com (root)<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span s=
tyle=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>Li=
st-ID:saw-filing3<o:p></o:p></span></p></div><div><p class=3DMsoNormal><spa=
n style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'=
><o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNormal><span style=3D=
'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'>test remo=
te<o:p></o:p></span></p></div></div><div><p class=3DMsoNormal><span style=
=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";color:black'><o:p>&=
nbsp;</o:p></span></p></div><div><div><p class=3DMsoNormal><span style=3D'f=
ont-size:10.5pt;font-family:"Calibri","sans-serif";color:black'><o:p>&nbsp;=
</o:p></span></p></div><p class=3DMsoNormal style=3D'margin-bottom:12.0pt'>=
<b><span style=3D'font-size:10.0pt;font-family:"Arial","sans-serif";color:#=
7F7F7F'>Axel Weber<br></span></b><span style=3D'font-size:10.0pt;font-famil=
y:"Arial","sans-serif";color:#7F7F7F'>System-Ing. Postproduktionssysteme<br=
>_____________________________________<br></span><span style=3D'font-size:7=
.0pt;font-family:"Arial","sans-serif";color:#7F7F7F'>Tel.: +49 221 456 4418=
8<br>Fax: +49 221 456 95 44180<br></span><span style=3D'font-size:11.0pt;fo=
nt-family:"Calibri","sans-serif";color:black'><br></span><b><span style=3D'=
font-size:10.0pt;font-family:"Arial","sans-serif";color:#7F7F7F'>CBC Cologn=
e Broadcasting Center GmbH<br></span></b><span style=3D'font-size:10.0pt;fo=
nt-family:"Arial","sans-serif";color:#7F7F7F'>Picassoplatz1 50679 K=F6ln<br=
></span><span style=3D'font-size:7.0pt;font-family:"Arial","sans-serif";col=
or:#7F7F7F'>Sitz der Gesellschaft: K=F6ln &nbsp;AG K=F6ln &nbsp;HRB 25232<b=
r>Gesch=E4ftsf=FChrer: Thomas Harscheidt &nbsp;</span><span style=3D'font-s=
ize:7.0pt;font-family:"Arial","sans-serif";color:black'>www.cbc.de</span><s=
pan style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:blac=
k'> &lt;</span><u><span style=3D'font-size:11.0pt;font-family:"Calibri","sa=
ns-serif";color:blue'><a href=3D"http://www.cbc.de">http://www.cbc.de</a></=
span></u><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif"=
;color:black'>&gt; &nbsp;&nbsp;</span><span style=3D'font-size:11.0pt;font-=
family:"Calibri","sans-serif";color:silver'> &nbsp;</span><span style=3D'fo=
nt-size:10.5pt;font-family:"Calibri","sans-serif";color:black'><o:p></o:p><=
/span></p></div></div></body></html>=

--_000_324F4CE41849CF4DB056C3C8DC696548DFF76F1240ERRAnetrtlsrv_--

