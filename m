From: "Rocco Siegrist" <sier@itsolution.ch>
Date: Thu, 18 Sep 2008 15:36:42 +0000
Subject: AW: Discarding valid mails?
Message-Id: <70E5D1092BCB6440A517A778C1D6E5B437F1B2@aathal01.aathal.itsolution.local>
List-Id: <mlmmj.mlmmj.org>
References: <70E5D1092BCB6440A517A778C1D6E5B437F158@aathal01.aathal.itsolution.local>
In-Reply-To: <70E5D1092BCB6440A517A778C1D6E5B437F158@aathal01.aathal.itsolution.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Hi

I checked again. There is no double-newline (see sample below) ... I'm usin=
g sendmail as MTA in combination with milter-greylist and spamassassin.

I already tried to stop spamassassin and milter-greylist ... still the same=
 problem

So the problem must be between sendmail and mlmmj, but a have no idea what!

cheers
rocco


From wgsukanvc@brantainc.com Mon Sep 15 17:04:41 2008
Received: from gluk (ppp79-139-156-252.pppoe.spdop.ru [79.139.156.252] (may=
 be forged))
        by tuna.pm3.ch (8.14.2/8.14.2) with ESMTP id m8FF4Z48018710
        for <changes@pm3.ch>; Mon, 15 Sep 2008 17:04:41 +0200
Received: from [79.139.156.252] by mx5.biz.mail.yahoo.com; Mon, 15 Sep 2008=
 18:04:41 +0300
Date:   Mon, 15 Sep 2008 18:04:41 +0300
From: "Ada Decker" <wgsukanvc@brantainc.com>
X-Mailer: The Bat! (v3.5.25) Educational
Reply-To: wgsukanvc@brantainc.com
X-Priority: 3 (Normal)
Message-ID: <719504566.62729522020189@brantainc.com>
To: changes@pm3.ch
Subject: Re:
MIME-Version: 1.0
Content-Type: text/html;
  charset=3DWindows-1252
Content-Transfer-Encoding: 7bit
X-Greylist: Default is to whitelist mail, not delayed by milter-greylist-4.=
0rc1 (tuna.pm3.ch [82.195.239.162]); Mon, 15 Sep 2008 17:04:41 +0200 (CEST)

Hello



=20
--------------------------------------------------------------------------
rocco siegrist
=20
it solution gmbh
z=FCrichstrasse 63
ch-8607 aathal
=20
fon         +41 (44) 972 26 45

fax         +41 (44) 972 19 34
=20
sier@itsolution.ch
http://www.itsolution.ch/
=20
-----Urspr=FCngliche Nachricht-----

Von: Neale Pickett [mailto:neale@woozle.org]=20
Gesendet: Donnerstag, 18. September 2008 05:02
An: Rocco Siegrist
Cc: mlmmj@mmj.dk
Betreff: Re: Discarding valid mails?

"Rocco Siegrist" <sier@itsolution.ch> writes:

> I have a problem. mljmm is discarding all mails complaining that the
> FROM: is missing in the mail header. But the there is a FROM: Field.
> What is going wrong?

Maybe it's just me but I see this:

> From sier@itsolution.ch Thu Sep 11 17:59:36 2008
>
> Received: from aathal01.aathal.itsolution.local
> (62-2-168-186.static.cablecom.ch [62.2.168.186])
>
>         by tuna.pm3.ch (8.14.2/8.14.2) with ESMTP id m8BFxC8t026838
>
>         for <devel@pm3.ch>; Thu, 11 Sep 2008 17:59:36 +0200
>
> X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4133

If there's really a double-newline at the end of each line, mlmmj is
going to think there are *no* headers whatsoever, since the
double-newline is what separates headers from body.

If this isn't what's happening, you have an MTA problem sending to this
list :)

Neale

=20
=20
=20
=20

