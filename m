From: Christian Lackas <delta@lackas.net>
Date: Mon, 21 Nov 2005 16:02:55 +0000
Subject: Re: mails silently discarded
Message-Id: <20051121160255.GE95376@zel726.zel.kfa-juelich.de>
List-Id: <mlmmj.mlmmj.org>
References: <20051121144359.GD95376@zel726.zel.kfa-juelich.de>
In-Reply-To: <20051121144359.GD95376@zel726.zel.kfa-juelich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

* Mads Martin J=F8rgensen <mmj@mmj.dk> [051121 15:47]:

Hello Mads,

> > What may be the reason for the rejection? Is there a logfile that could
> > give me a clue?
> Can you show us such a discarded mail?

Sure. Here is one:

| From lackas@www.haik.de Mon Nov 21 15:28:36 2005
| Received: from www.haik.de (localhost [127.0.0.1])
|         by www.haik.de (8.13.4/8.13.4) with ESMTP id jALESZKl037958
|         for <mlmmj-test@haik.de>; Mon, 21 Nov 2005 15:28:35 +0100 (CET)
|         (envelope-from lackas@www.haik.de)
| Received: (from lackas@localhost)
|         by www.haik.de (8.13.4/8.13.4/Submit) id jALESZ7k037957
|         for mlmmj-test@haik.de; Mon, 21 Nov 2005 15:28:35 +0100 (CET)
|         (envelope-from lackas)
| Date: Mon, 21 Nov 2005 15:28:35 +0100 (CET)
| From: Christian Lackas <lackas@www.haik.de>
| Message-Id: <200511211428.jALESZ7k037957@www.haik.de>
| To: mlmmj-test@haik.de
| Subject: does it work?
|=20
| removed all control files

or this one:

| From lackas@www.haik.de Mon Nov 21 15:19:43 2005
| Received: from www.haik.de (localhost [127.0.0.1])
|         by www.haik.de (8.13.4/8.13.4) with ESMTP id jALEJhS0037782
|         for <mlmmj-test@haik.de>; Mon, 21 Nov 2005 15:19:43 +0100 (CET)
|         (envelope-from lackas@www.haik.de)
| Received: (from lackas@localhost)
|         by www.haik.de (8.13.4/8.13.4/Submit) id jALEJfMD037781
|         for mlmmj-test@haik.de; Mon, 21 Nov 2005 15:19:41 +0100 (CET)
|         (envelope-from lackas)
| Date: Mon, 21 Nov 2005 15:19:41 +0100 (CET)
| From: Christian Lackas <lackas@www.haik.de>
| Message-Id: <200511211419.jALEJfMD037781@www.haik.de>
| To: mlmmj-test@haik.de
| Subject: does it work now?
|=20
| adasdf

The adress <lackas@www.haik.de> is subscribed (the ML is, however,
supposed to be open) and the To: header line also matches the content of
control/listaddress.

As far as I have seen the system should send notifications if it rejects
mails, should'nt it?

Cheers
 Christian

--=20
Wo rohe Kr=E4fte sinnlos walten, da kann kein Knopf die Hose halten.
http://www.lackas.net/ Perl Delphi Linux MP3 Searchengines Domainchecker
