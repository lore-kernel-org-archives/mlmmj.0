From: Fabio Busatto <fabio.busatto@programmazione.it>
Date: Mon, 08 May 2006 11:17:53 +0000
Subject: Re: qmail+vpopmail support
Message-Id: <20060508111753.GA8657@nachos.phaseit.com>
List-Id: <mlmmj.mlmmj.org>
References: <20060503134628.GG5327@nachos.phaseit.com>
In-Reply-To: <20060503134628.GG5327@nachos.phaseit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, May 08, 2006 at 04:29:22PM +0800, Thomas Goirand wrote:
> Under my configuration it's:
> user@domain.tld -> domain-tld-user@domain.tld
> 
> In fact, it could be:
> user@domain.tld -> what-ever-you-like-user@domain.tld

Right, I only consider the vpopmail virtualdomains configuration, but
there are other scenarios (like yours).

> >+Prerequisites:
> >+- qmail (and vpopmail) correctly installed
> >+- mlmmj correctly installed
> >  
> Can it be used WITHOUT vpopmail? IMHO it shouldn't be REQUIRED.

vpopmail in brackets means that it's optional. I wrote the patch to support
both bare qmail (without virtualdomains) and qmail+vpopmail.

> >+WARNING: DO NOT USE 'preline' command in dot-qmail files, it will result 
> >in
> >+mlmmj to not work properly!!!
> >  
> I DO use the preline in the binary I use, and it works !!! Here is my 
> .qmail-default file content:
> 
> |preline -f /usr/bin/mlmmj-recieve -L 
> /var/www/sites/dtc/gplhost.sg/lists/gplhost.sg_dtcdev

Good :) I found that preline breaks mlmmj under my configuration, but I
didn't investigate too much. To be analyzed.

Maybe the final solution to support qmail is to consider the DEFAULT environment
variable, without care if this is not a real extension value.

I'll be back on code and try to include more scenarios to better support virtualdomains.

Thank you for your feedback!

-fabio
-- 
Fabio Busatto <fabio.busatto@programmazione.it>
