From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 29 Mar 2005 09:24:06 +0000
Subject: Re: memory management in mlmmj
Message-Id: <20050329092406.GA7738@note231205.webdmz.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
In-Reply-To: <20050323212830.GA21199@mopo.webdmz.tv2.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Mar 24, 2005 at 01:38:44AM +0100, Mads Martin Joergensen wrote:
> > Is it a bad idea?
> 
> The idea is nice, but why start changing all this code that works already
> with something that had no serious testing yet? There's so many other places
> that could need some work before this.

True, but the code is getting big and relatively difficult to maintain.

> Also we should have a look at:
> 
>  http://irccrew.org/~cras/security/c-guide.html

Dovecot memory pools look very nice. And they are under the MIT license. I will
look at the source code soon.

On Wed, Mar 23, 2005 at 11:44:36PM +0100, Christian Laursen wrote:
> > It is not new, I think PHP does something like this (where a request is the
> > scope).
> 
> Apache has also done something similar for years. It is probably available in
> APR, but it's probably not feasible to link against that monstrosity.

I think you are right ;-)

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
