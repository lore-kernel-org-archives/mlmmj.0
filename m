From: Stefan Reinauer <stepan@openbios.org>
Date: Mon, 22 Nov 2004 18:18:22 +0000
Subject: Re: mlmmj-1.1.0-RC2 is out
Message-Id: <20041122181822.GA10521@openbios.org>
List-Id: <mlmmj.mlmmj.org>
References: <20041122150113.GA66786@mmj.dk>
In-Reply-To: <20041122150113.GA66786@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [041122 16:01]:
> Hey all,
> 
> Not a lot of changes--there was also a tiny buglet fixed and an php
> interface update.
> 
> 1.1.0-RC2
>  o Strip envelope from before resending to +owner
>  o Make statctrl bail if it's not possible to stat()
>  o Add mlmmj-list binary to list the subcribers (-count) of a list
 
Wonderful. This fixes the owner mail issues we noticed with exim 4.x
completely. 

  Stefan

