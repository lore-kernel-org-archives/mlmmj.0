From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Thu, 18 Feb 2010 16:25:44 +0000
Subject: Re: [PATCH] add MIME-aware footers
Message-Id: <1266510344.22451.56.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <200812140123.13634.lists@egidy.de>
In-Reply-To: <200812140123.13634.lists@egidy.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Gerd,

On Thu, 2010-02-18 at 16:30 +0100, Gerd v. Egidy wrote:
> this patch has already been sent in dec 2008 and jan 2010 to this ml but was 
> not yet applied. I guess it was forgotten.

Not forgotten, but I am still working my way through January's mail.

> You said something about pestering you until you commited it. So here I
> am...

I really appreciate your patience with me. 

> The patch allows adding footers to different MIME-types. It uses altermime to 
> add the footers before giving the mail to the regular mlmmj-functions. Mlmmj 
> itself doesn't need to be changed to use this.

Thanks a lot. I've committed it to CVS now, and it will be included in
the next release.


Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/


