From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 21 Sep 2004 10:42:34 +0000
Subject: Re: feature requests
Message-Id: <20040921104234.GC1826@mopo.tv2.local>
List-Id: <mlmmj.mlmmj.org>
References: <20040920191944.GA5112@cirrus.madduck.net>
In-Reply-To: <20040920191944.GA5112@cirrus.madduck.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Sep 20, 2004 at 11:21:12PM +0200, martin f krafft wrote:
> > > Alternatively, you could not go via /etc/aliases and pass
> > > recipient as argument to a transport/director script.

How do you do that? Remember, we need the extended part (+stuff) as
well.

> > In that case you might as well set the Delivered-To: in case you
> > don't have, because in case you do have it, it's the envelope to.
> 
> True. But how will you make it work reliably with exim and sendmail
> (and zmailer, I think)?

When you configure your mail server for mlmmj, just make sure to set it
up to add a Delivered-To: header. Thats reliable.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
