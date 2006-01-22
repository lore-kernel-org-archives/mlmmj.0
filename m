From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sun, 22 Jan 2006 00:13:48 +0000
Subject: Re: Treatment of Return-Path: headers (Re: mlmmj-recieve silently discarding messages
Message-Id: <20060122001348.GI58097@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Charlie Brady <charlieb@budge.apana.org.au> [Jan 21. 2006 20:15]:
> > > One of the stated goals of mlmmj is mail server independence, so
> > > it should be very careful about strict RFC compliance.
> >
> > Sure, but it's possible for every MTA to be configured to add it, ..
> 
> You can't say that, because you can't possibly know about all MTAs which 
> currently exist or which might exist in the future. But you are right, it 
> will usually be possible to find a way to provide it.

OK. The interface between the MTA and the MDA is - as far as I know -
not defined in any RFC. Please correct me, if I am wrong. Therefore we
CANNOT know how EVERY MTA will be passing us the envelope information.
It can be some environment variables, added headers, written to
inhireted open file descriptors, as X Window Events, whatever...

If you know a way to make sure that we - inspite of having NO RFC - can
make sure that we get that info from any current or future MTA... Please
send us the patch ;-)

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
