From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Tue, 16 Feb 2010 17:00:42 +0000
Subject: Re: PATCH: Memory leak appending original mail
Message-Id: <1266339642.9646.135.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <4B5EBDA6.7070501@yahoo.com.au>
In-Reply-To: <4B5EBDA6.7070501@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, 2010-02-16 at 18:35 +1100, Ben Schmidt wrote:
> > I looked at the code, and got thinking. Since the loop is only entered
> > if str is not NULL, and str is only used inside the loop, couldn't we
> > just free str inside the loop?
> >
> > Proposed patch attached.
> 
> Yeah, that works! Go for it!

Committed to CVS.


Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/


