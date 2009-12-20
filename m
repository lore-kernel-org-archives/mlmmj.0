From: Morten Kirkegaard Poulsen <mopo@fabletech.com>
Date: Sun, 20 Dec 2009 22:47:33 +0000
Subject: Re: [PATCH] Re: requeued mail files going missing from archive/
Message-Id: <1261349253.2040.8.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20091216T025726-844574632Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20091216T025726-844574632Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Robin,

> > > If the maintd visited more than one mail in the /requeue/ directory, and the
> > > FIRST one set the fromrequeuedir flag to unlink the mail file, the flag was NOT
> > > cleared and caused mail in the real archive to be erronously removed.

I haven't forgotten your patches. I will look at them, and commit them,
Very Soon Now(tm). I promise.

Morten

-- 
Morten Kirkegaard Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


