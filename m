From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 20 Sep 2004 21:00:23 +0000
Subject: Re: feature requests
Message-Id: <20040920210023.GX76919@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040920191944.GA5112@cirrus.madduck.net>
In-Reply-To: <20040920191944.GA5112@cirrus.madduck.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* martin f krafft <madduck@madduck.net> [Sep 20. 2004 22:59]:
> also sprach Mads Martin Joergensen <mmj@mmj.dk> [2004.09.20.2254 +0200]:
> > No, it's not not necessary. It's a bug--allthough quite harmless.
> > It'll be fixed in next version--we already use Delivered-To: for
> > sanity checks, so might as well use it exclusively if present.
> 
> Right. Please consider that Delivered-To is non-standard. Postfix
> and qmail do it. exim and sendmail don't, I think.

Yeah, if it's there it's used, if not fallback to To: is done. It's a
shame it didn't make it into the standards.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
