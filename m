From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 16 Mar 2005 11:58:01 +0000
Subject: Re: exim4
Message-Id: <20050316115801.GA59702@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Mar 16. 2005 12:55]:
> Anyway, I think I will code myself a shell script to have something like 
> a frontend to the usual functions (sub, unsub, list). That also saves me 
> from entering the mlmmj spool directory every time :)

Actually mlmmj-list doesn't invoke any other binaries, so I'll remove
the check in that one for the next version.

> Another possibility would be to use default values for these things 
> (taken at configure time). Would you accept a patch for that?

Not likely. But I would love to put your wrapper scripts in contrib/

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
