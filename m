From: Mads Martin Joergensen <mmj@suse.de>
Date: Sat, 21 Jan 2006 19:05:19 +0000
Subject: Re: Treatment of Return-Path: headers (Re: mlmmj-recieve silently discarding messages
Message-Id: <20060121190519.GA5531@suse.de>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Charlie Brady <charlieb@budge.apana.org.au> [Jan 21. 2006 20:03]:
> >I've never seen a modern MTA that doesn't implement and use it, it's not
> >specific to Sendmail.
> 
> Well qmail does implement it but doesn't use it, so there's one counter 
> example. But since the header isn't mandated, it's not safe to assume that
> will exist for every MTA. One of the stated goals of mlmmj is mail server 
> independence, so it should be very careful about strict RFC compliance.

Sure, but it's possible for every MTA to be configured to add it, and
I'd much rather use that one than To: in the mail message.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
