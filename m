From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sun, 22 Jan 2006 00:43:28 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone	using mlmmj with qmail?)
Message-Id: <20060122004328.GJ58097@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Charlie Brady <charlieb@budge.apana.org.au> [Jan 21. 2006 21:40]:
> >7940  write(3, "Delivered-To: xen010503-gplhost-"..., 68) = 68
[snip]
> Jan 21 20:31:05 xen010503 /usr/bin/mlmmj-process[8341]: listcontrol.c:141: 
> controlstr = [gplhost-com-test-help] : No such file or directory

This is the problem with qmail's Delivered-To: header. Mlmmj sees the
recipient delimiter, splits the string in two parts (list name part and
command part), and concludes that the mail does not make any sense
(since the command part ("com-test-help") is not a valid commanad),
removes the mail file, and exits.

I will cook up a patch that logs the reason later.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
