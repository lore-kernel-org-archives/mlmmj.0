From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 20 Sep 2004 21:25:20 +0000
Subject: Re: feature requests
Message-Id: <20040920212520.GG76919@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20040920191944.GA5112@cirrus.madduck.net>
In-Reply-To: <20040920191944.GA5112@cirrus.madduck.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* martin f krafft <madduck@madduck.net> [Sep 20. 2004 23:21]:
> > > Alternatively, you could not go via /etc/aliases and pass
> > > recipient as argument to a transport/director script.
> > 
> > In that case you might as well set the Delivered-To: in case you
> > don't have, because in case you do have it, it's the envelope to.
> 
> True. But how will you make it work reliably with exim and sendmail
> (and zmailer, I think)?

When Delivered-To: is not there, I'm relying on the To: header.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
