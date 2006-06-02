From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Fri, 02 Jun 2006 08:25:40 +0000
Subject: Re: batch list management via email?
Message-Id: <20060602082540.GA891@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <EC7A0F40-5B1E-4721-9584-2EFA5ACAE6FE@gmail.com>
In-Reply-To: <EC7A0F40-5B1E-4721-9584-2EFA5ACAE6FE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Nate Beaty <natebeaty@gmail.com> [Jun 02. 2006 10:06]:
> I'm moving from minimalist to mlmmj and was am wondering if the  
> ability for batch list management by email was ever implemented, as  
> requested here:
> 
> <http://vs165141.v.sectoor.de/mailarchive/mlmmj/ 
> 2005-04/0005.html#replies>
> 
> In minimalist, you can put the list password as the first line (or  
> among the headers) and then a series of sub/unsub commands in the  
> body. I currently utilize this from a custom admin for the list owner.
> 
> If this isn't implemented, I assume a wrapper script could be written  
> to parse the requests and push them through mlmmj-sub, no?
> 
> Excuse me if this has been answered, I've spent all day reading the  
> archives, and may have missed it.

You didn't miss it :)

There's not been added support for batch list management over email, no.
Reasoning is it means parsing of emails, which have many ways to have
bugs. So as you say--way to go is to write a wrapper script to do it.
Languages such as perl might be mighty fine for it, and if you cook up
something good, I'll be happy to throw it in the contrib/ directory.

Thanks,
-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
