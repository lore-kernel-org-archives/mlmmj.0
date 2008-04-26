From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sat, 26 Apr 2008 07:48:40 +0000
Subject: Re: Some Questions
Message-Id: <1209196120.25864.5.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <002c01c8a6b3$95995570$be90a8c0@mainspring.co.nz>
In-Reply-To: <002c01c8a6b3$95995570$be90a8c0@mainspring.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hi James,

On Fri, 2008-04-25 at 21:06 +1200, James Scott wrote:
> 1.  Configuring a mail list to allow subscribers only to post

From the TUNABLES documentation:

· subonlypost          (boolean)

When this file is present, only people who are subscribed to the list,
are allowed to post to it. The check is made against the "From:" header.
 
> 2.  Auxiliary address that may post but not receive messages (just put
> addresses in "nomailsubs.d"?)

Yes.
 
> 3. Procedure for moderators to approve messages posted by
> non-subscribers

From the TUNABLES documentation:

· modnonsubposts       (boolean)

When this file is present and subonlypost is enabled, all postings from
people who are not subscribed to the list will be moderated.
 
> 4 Web interfaces for: admin, archives, user subscription management.

See the contrib/web/ directory.

> 5. Custom footers (the file 'control/footers" seems to be ignored).

From the README documentation:

7) If you want every mail to have something like:
   --
   To unsubscribe send a mail to coollist+unsubscribe@lists.domain.net

   Just add what you want to a file named "footer" in the same dir as
   "customheader" (listdir/control/).

Hint: "footer" not "footers"


I hope this answered your questions.


Morten

