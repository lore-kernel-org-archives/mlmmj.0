From: Dan Andersen <sync913@hotmail.com>
Date: Fri, 20 Feb 2009 20:34:15 +0000
Subject: RE: Autoresponders/autoreply replies are marked as bounces
Message-Id: <BAY104-W31580979B6DB9238E9C8DEF3B30@phx.gbl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="_9833b2f8-3ada-494c-8671-17a1ee2f4111_"
List-Id: <mlmmj.mlmmj.org>
References: <BAY104-W266C7128CDB3A9284333E8F3B30@phx.gbl>
In-Reply-To: <BAY104-W266C7128CDB3A9284333E8F3B30@phx.gbl>
To: mlmmj@mlmmj.org

--_9833b2f8-3ada-494c-8671-17a1ee2f4111_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



=20

> Date: Sat=2C 21 Feb 2009 01:32:49 +0800
> From: thomas@goirand.fr
> CC: mlmmj@mmj.dk
> Subject: Re: Autoresponders/autoreply replies are marked as bounces
>=20
> Yarema wrote:
> > Dan Andersen wrote:
> >> Hi there=2C
> >>
> >> Hope someone can help me out here.
> >>
> >> When Im sending mails to the maillist by mlmmj and the subscriber
> >> got a autoreply/out of office agent running=2C the mail is returned
> >> as a bounce.
> >> I guess that the problem is that the responder is using the
> >> envelope-from address.
> >>
> >> Is it posible to force the autoresponder to reply to etc. the From:
> >> address ?
> >>
> >> There is no Return-Path header on the mail=2C is that a problem ? If
> >> so...I have tried adding the header when Im sending the mail to the
> >> mlmmj list (by php)=2C but It looks like it has been removed=2C either=
 by
> >> mlmmj or postfix?!?! or am I missing another header?
> >>
> >> Im using mlmmj 1.2.16 and postfix 2.3.3
> >=20
> > In my experience the Return-Path header is set by the receiving MTA
> > based on the envelope sender. So manually setting the Return-Path
> > header will get you nowhere. Seems to me that it's a problem with the
> > auto-responder over which you have no control.
>=20
> I agree. A good auto-responder should detect messages from a list. Our
> autoresponders are using .mailfilter. In it I have this:
>=20
> RECIPIENT=3D$LOGNAME
> RESPOND=3D"~/.vacation.msg"
> RESPONDDB=3D"~/.vacation.db"
> if ( ! /^Precedence: (bulk|list|junk)/ && \
> ! /^List-Id:/ && \
> ! /^List-Unsubscribe:/ && \
> ! /^Return-Path:.*<#@\[\]>/ && \
> ! /^Return-Path:.*<>/ && \
> ! /^From:.*MAILER-DAEMON/ && \
> ! /^X-ClamAV-Notice-Flag: *YES/ && \
> ! /^Content-Type:.*message\/delivery-status/ && \
> ! /^Subject:.*Delivery Status Notification/ && \
> ! /^Subject:.*Undelivered Mail Returned to Sender/ && \
> ! /^Subject:.*Delivery failure/ && \
> ! /^Subject:.*Message delay/ && \
> ! /^Subject:.*Mail Delivery Subsystem/ && \
> ! /^Subject:.*Mail System Error.*Returned Mail/ && \
> ! /^X-Spam-Flag: YES/ )
> {
> cc "| mailbot -t $RESPOND -d $RESPONDDB -D 1 -A 'From:
> $RECIPIENT' -s 'Auto Response: from $RECIP
> IENT' /usr/sbin/sendmail -t"
>=20
> }
>=20
> which I believe is enough to NOT send bounce messages. In the case of
> MLMMJ=2C it will match the List-Id: header.
>=20
> Has any of you other header types that my autoresponder should match?
> Did we miss some?
>=20
> Thomas
>=20


So what you'r saying is that im not missing any headers/settings=2C some ma=
ilserveres are just stupid and reply to the wrong email ?  What are some RF=
Cxxx says about it=2C what are the right email to reply to ? The problem is=
 also with Notes server=2C wich I asume is quite a large/big one.. ?

=20

Im not caple of finding any rfc there describe wich email the mail server s=
hould reply to=2C can anyone help wich that?

=20

Dan

=20

_________________________________________________________________
Den nye Windows Live Messenger er kommet. Hent den her!
http://download.live.com/messenger=

--_9833b2f8-3ada-494c-8671-17a1ee2f4111_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style>
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Verdana
}
</style>
</head>
<body class=3D'hmmessage'>
<BR>&nbsp=3B<BR>
&gt=3B Date: Sat=2C 21 Feb 2009 01:32:49 +0800<BR>&gt=3B From: thomas@goira=
nd.fr<BR>&gt=3B CC: mlmmj@mmj.dk<BR>&gt=3B Subject: Re: Autoresponders/auto=
reply replies are marked as bounces<BR>&gt=3B <BR>&gt=3B Yarema wrote:<BR>&=
gt=3B &gt=3B Dan Andersen wrote:<BR>&gt=3B &gt=3B&gt=3B Hi there=2C<BR>&gt=
=3B &gt=3B&gt=3B<BR>&gt=3B &gt=3B&gt=3B Hope someone can help me out here.<=
BR>&gt=3B &gt=3B&gt=3B<BR>&gt=3B &gt=3B&gt=3B When Im sending mails to the =
maillist by mlmmj and the subscriber<BR>&gt=3B &gt=3B&gt=3B got a autoreply=
/out of office agent running=2C the mail is returned<BR>&gt=3B &gt=3B&gt=3B=
 as a bounce.<BR>&gt=3B &gt=3B&gt=3B I guess that the problem is that the r=
esponder is using the<BR>&gt=3B &gt=3B&gt=3B envelope-from address.<BR>&gt=
=3B &gt=3B&gt=3B<BR>&gt=3B &gt=3B&gt=3B Is it posible to force the autoresp=
onder to reply to etc. the From:<BR>&gt=3B &gt=3B&gt=3B address ?<BR>&gt=3B=
 &gt=3B&gt=3B<BR>&gt=3B &gt=3B&gt=3B There is no Return-Path header on the =
mail=2C is that a problem ? If<BR>&gt=3B &gt=3B&gt=3B so...I have tried add=
ing the header when Im sending the mail to the<BR>&gt=3B &gt=3B&gt=3B mlmmj=
 list (by php)=2C but It looks like it has been removed=2C either by<BR>&gt=
=3B &gt=3B&gt=3B mlmmj or postfix?!?! or am I missing another header?<BR>&g=
t=3B &gt=3B&gt=3B<BR>&gt=3B &gt=3B&gt=3B Im using mlmmj 1.2.16 and postfix =
2.3.3<BR>&gt=3B &gt=3B <BR>&gt=3B &gt=3B In my experience the Return-Path h=
eader is set by the receiving MTA<BR>&gt=3B &gt=3B based on the envelope se=
nder. So manually setting the Return-Path<BR>&gt=3B &gt=3B header will get =
you nowhere. Seems to me that it's a problem with the<BR>&gt=3B &gt=3B auto=
-responder over which you have no control.<BR>&gt=3B <BR>&gt=3B I agree. A =
good auto-responder should detect messages from a list. Our<BR>&gt=3B autor=
esponders are using .mailfilter. In it I have this:<BR>&gt=3B <BR>&gt=3B RE=
CIPIENT=3D$LOGNAME<BR>&gt=3B RESPOND=3D"~/.vacation.msg"<BR>&gt=3B RESPONDD=
B=3D"~/.vacation.db"<BR>&gt=3B if ( ! /^Precedence: (bulk|list|junk)/ &amp=
=3B&amp=3B \<BR>&gt=3B ! /^List-Id:/ &amp=3B&amp=3B \<BR>&gt=3B ! /^List-Un=
subscribe:/ &amp=3B&amp=3B \<BR>&gt=3B ! /^Return-Path:.*&lt=3B#@\[\]&gt=3B=
/ &amp=3B&amp=3B \<BR>&gt=3B ! /^Return-Path:.*&lt=3B&gt=3B/ &amp=3B&amp=3B=
 \<BR>&gt=3B ! /^From:.*MAILER-DAEMON/ &amp=3B&amp=3B \<BR>&gt=3B ! /^X-Cla=
mAV-Notice-Flag: *YES/ &amp=3B&amp=3B \<BR>&gt=3B ! /^Content-Type:.*messag=
e\/delivery-status/ &amp=3B&amp=3B \<BR>&gt=3B ! /^Subject:.*Delivery Statu=
s Notification/ &amp=3B&amp=3B \<BR>&gt=3B ! /^Subject:.*Undelivered Mail R=
eturned to Sender/ &amp=3B&amp=3B \<BR>&gt=3B ! /^Subject:.*Delivery failur=
e/ &amp=3B&amp=3B \<BR>&gt=3B ! /^Subject:.*Message delay/ &amp=3B&amp=3B \=
<BR>&gt=3B ! /^Subject:.*Mail Delivery Subsystem/ &amp=3B&amp=3B \<BR>&gt=
=3B ! /^Subject:.*Mail System Error.*Returned Mail/ &amp=3B&amp=3B \<BR>&gt=
=3B ! /^X-Spam-Flag: YES/ )<BR>&gt=3B {<BR>&gt=3B cc "| mailbot -t $RESPOND=
 -d $RESPONDDB -D 1 -A 'From:<BR>&gt=3B $RECIPIENT' -s 'Auto Response: from=
 $RECIP<BR>&gt=3B IENT' /usr/sbin/sendmail -t"<BR>&gt=3B <BR>&gt=3B }<BR>&g=
t=3B <BR>&gt=3B which I believe is enough to NOT send bounce messages. In t=
he case of<BR>&gt=3B MLMMJ=2C it will match the List-Id: header.<BR>&gt=3B =
<BR>&gt=3B Has any of you other header types that my autoresponder should m=
atch?<BR>&gt=3B Did we miss some?<BR>&gt=3B <BR>&gt=3B Thomas<BR>&gt=3B <BR=
><BR>
So what you'r saying is that im not missing any headers/settings=2C some ma=
ilserveres are just stupid and reply to the wrong email ?&nbsp=3B What are =
some RFCxxx says about it=2C&nbsp=3Bwhat are the&nbsp=3Bright email to repl=
y to&nbsp=3B? The problem is also with Notes server=2C wich I asume is quit=
e a large/big one.. ?<BR>
&nbsp=3B<BR>
Im not caple of finding any rfc there describe wich email the mail server s=
hould reply to=2C can anyone help wich that?<BR>
&nbsp=3B<BR>
Dan<BR>
&nbsp=3B<BR><br /><hr />Find den laptop der passer til dig. <a href=3D'http=
://www.microsoft.com/danmark/din_virksomhed/koeb_online/operativsystemer.ms=
px' target=3D'_new'>L=E6s mere her.</a></body>
</html>=

--_9833b2f8-3ada-494c-8671-17a1ee2f4111_--
