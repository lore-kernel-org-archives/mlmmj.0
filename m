From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 24 Mar 2005 08:07:11 +0000
Subject: Re: memory management in mlmmj
Message-Id: <20050324080711.GF67964@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
In-Reply-To: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Toftum <mads@toftum.dk> [Mar 24. 2005 09:03]:
> > Apache has also done something similar for years. It is probably available in
> > APR, but it's probably not feasible to link against that monstrosity.
> > 
> Correct, it is in apr -
> http://apr.apache.org/docs/apr/group__apr__pools.html
> There is quite a few things in apr that might come in handy - first of
> all there's the main portability issue and then along with the that we

Main portability issue? Can you mention a platform where mlmmj is not
compiling and working as of today? Or are you referring to something
else?

> would get things like ldap and database support (dbm, mysql, postgres and
> sqllite). 

This should probably not go directly into mlmmj, but into wrapper
scripts with helper apps.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
