From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Sat, 30 Jan 2010 19:33:11 +0000
Subject: Re: PATCH: Tunables documentation and interface
Message-Id: <1264879991.3862.20.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <4B5D73FE.6040907@yahoo.com.au>
In-Reply-To: <4B5D73FE.6040907@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, 2010-01-25 at 21:35 +1100, Ben Schmidt wrote:
> Attached is a patch for consideration for inclusion in mlmmj. It
> updates the TUNABLES file with some previously-missing information,
> and the tunables.pl file for the perl and php web admin interfaces
> that were likewise missing some info.
> 
> Comments?

Thanks a lot! It's great to have a native speaker review (and correct)
our texts.

I kept the "access" tunable marked as "list" because each line is
handled separately, so I think that it is more appropriate.

> Could this be included?

I've committed your patch to CVS.

> Also, are all the relevant maintainers regulars on the list, or should
> I be CCing people individually regarding the web admin interfaces?

I *think* that everyone is on the list, but I am not 100% sure. If you
make a patch to someone's code (and you can identify who wrote it),
please CC them, just to be sure.

Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/


