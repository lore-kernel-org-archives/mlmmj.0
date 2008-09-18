From: Neale Pickett <neale@woozle.org>
Date: Thu, 18 Sep 2008 03:02:18 +0000
Subject: Re: Discarding valid mails?
Message-Id: <w53abe69mx1.fsf@fozzie.woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <70E5D1092BCB6440A517A778C1D6E5B437F158@aathal01.aathal.itsolution.local>
In-Reply-To: <70E5D1092BCB6440A517A778C1D6E5B437F158@aathal01.aathal.itsolution.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

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
