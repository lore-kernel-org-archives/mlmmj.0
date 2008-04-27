From: "James Scott" <jlscott@clear.net.nz>
Date: Sun, 27 Apr 2008 09:47:53 +0000
Subject: RE: Some Questions
Message-Id: <008201c8a84b$c46201b0$be90a8c0@mainspring.co.nz>
List-Id: <mlmmj.mlmmj.org>
References: <002c01c8a6b3$95995570$be90a8c0@mainspring.co.nz>
In-Reply-To: <002c01c8a6b3$95995570$be90a8c0@mainspring.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thanks Morten.

Your answer has pointed me in the right direction :)

Regards,

James
 

> -----Original Message-----
> From: Morten K. Poulsen [mailto:morten@afdelingp.dk] 
> Sent: Saturday, 26 April 2008 7:49 p.m.
> To: James Scott
> Cc: mlmmj@mmj.dk
> Subject: Re: Some Questions
> 
> Hi James,
> 
> On Fri, 2008-04-25 at 21:06 +1200, James Scott wrote:
> > 1.  Configuring a mail list to allow subscribers only to post
> 
> >From the TUNABLES documentation:
> 
> . subonlypost          (boolean)
> 
> When this file is present, only people who are subscribed to the list,
> are allowed to post to it. The check is made against the 
> "From:" header.
>  
> > 2.  Auxiliary address that may post but not receive 
> messages (just put
> > addresses in "nomailsubs.d"?)
> 
> Yes.
>  
> > 3. Procedure for moderators to approve messages posted by
> > non-subscribers
> 
> >From the TUNABLES documentation:
> 
> . modnonsubposts       (boolean)
> 
> When this file is present and subonlypost is enabled, all 
> postings from
> people who are not subscribed to the list will be moderated.
>  
> > 4 Web interfaces for: admin, archives, user subscription management.
> 
> See the contrib/web/ directory.
> 
> > 5. Custom footers (the file 'control/footers" seems to be ignored).
> 
> >From the README documentation:
> 
> 7) If you want every mail to have something like:
>    --
>    To unsubscribe send a mail to coollist+unsubscribe@lists.domain.net
> 
>    Just add what you want to a file named "footer" in the same dir as
>    "customheader" (listdir/control/).
> 
> Hint: "footer" not "footers"
> 
> 
> I hope this answered your questions.
> 
> 
> Morten

