From: Morten Kirkegaard Poulsen <mopo@fabletech.com>
Date: Mon, 21 Dec 2009 06:42:24 +0000
Subject: Re: [PATCH] Re: requeued mail files going missing from archive/
Message-Id: <1261377744.2091.10.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20091216T025726-844574632Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20091216T025726-844574632Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, 2009-12-20 at 23:47 +0100, Morten Kirkegaard Poulsen wrote:
> > > > If the maintd visited more than one mail in the /requeue/ directory, and the
> > > > FIRST one set the fromrequeuedir flag to unlink the mail file, the flag was NOT
> > > > cleared and caused mail in the real archive to be erronously removed.
> 
> I haven't forgotten your patches. I will look at them, and commit them,
> Very Soon Now(tm). I promise.

I have now committed it (and the listhelp et al. patch) to CVS, and I
will roll a RC based on that.

Morten

-- 
Morten Kirkegaard Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


