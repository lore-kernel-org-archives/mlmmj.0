From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 20 Sep 2004 21:17:02 +0000
Subject: Re: feature requests
Message-Id: <20040920211702.GC76919@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040920191944.GA5112@cirrus.madduck.net>
In-Reply-To: <20040920191944.GA5112@cirrus.madduck.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* martin f krafft <madduck@madduck.net> [Sep 20. 2004 23:15]:
> also sprach Mads Martin Joergensen <mmj@mmj.dk> [2004.09.20.2305 +0200]:
> > Which header is that? I've looked through the RFCs but didn't find
> > it, so please educate me, there's nothing I would rather do.
> 
> Return-Path, I think.

Return-Path is the envelope from. RFC{,2}821.

> Alternatively, you could not go via /etc/aliases and pass recipient
> as argument to a transport/director script.

In that case you might as well set the Delivered-To: in case you don't
have, because in case you do have it, it's the envelope to.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
