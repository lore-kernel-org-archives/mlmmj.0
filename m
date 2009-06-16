From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Tue, 16 Jun 2009 11:06:50 +0000
Subject: Re: Patch to extend list command
Message-Id: <1245150410.8626.47.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
In-Reply-To: <46320.172.16.32.1.1243882244.squirrel@130.83.185.211>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, 2009-06-08 at 13:12 +0200, Christoph Wilke wrote:
> On Sun, June 7, 2009 14:37, Morten K. Poulsen wrote:
> > It looks clean, but would you mind moving the code to a function, so we
> > don't have three copies of the same code?
> 
> The loop is now in the function print_subs(), as you sugested.
> This time I made tests by running mlmmj-process with an appropriate
> mail file, a test list and the "-P" switch. The resulting queue file
> looked fine.

Perfect! I have committed it to CVS. Thanks a lot for the patch.


Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


