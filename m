From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 21 Nov 2005 17:36:47 +0000
Subject: Re: mails silently discarded
Message-Id: <20051121173647.GC51521@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20051121144359.GD95376@zel726.zel.kfa-juelich.de>
In-Reply-To: <20051121144359.GD95376@zel726.zel.kfa-juelich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Christian Lackas <delta@lackas.net> [Nov 21. 2005 17:03]:
> | From lackas@www.haik.de Mon Nov 21 15:28:36 2005
> | Received: from www.haik.de (localhost [127.0.0.1])
> |         by www.haik.de (8.13.4/8.13.4) with ESMTP id jALESZKl037958
> |         for <mlmmj-test@haik.de>; Mon, 21 Nov 2005 15:28:35 +0100 (CET)
> |         (envelope-from lackas@www.haik.de)
> | Received: (from lackas@localhost)
> |         by www.haik.de (8.13.4/8.13.4/Submit) id jALESZ7k037957
> |         for mlmmj-test@haik.de; Mon, 21 Nov 2005 15:28:35 +0100 (CET)
> |         (envelope-from lackas)
> | Date: Mon, 21 Nov 2005 15:28:35 +0100 (CET)
> | From: Christian Lackas <lackas@www.haik.de>
> | Message-Id: <200511211428.jALESZ7k037957@www.haik.de>
> | To: mlmmj-test@haik.de
> | Subject: does it work?
> | 
> | removed all control files

As you can see, there's no Return-Path: header in the mail. You have to
get sendmail to add the envelope from in the Return-Path: header, or it
will be considered an illegal mail, and thus be discarded.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
