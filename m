From: Ansgar Burchardt <ansgar@2007.43-1.org>
Date: Thu, 07 Jun 2007 00:35:38 +0000
Subject: Re: several patches to mlmmj
Message-Id: <20070607003538.GA9859@jigoku.43-1.org>
List-Id: <mlmmj.mlmmj.org>
References: <20070606214940.GB1460@jigoku.43-1.org>
In-Reply-To: <20070606214940.GB1460@jigoku.43-1.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi!

Mads Martin Joergensen wrote:
> * Ansgar Burchardt <ansgar@2007.43-1.org> [Jun 06. 2007 23:49]:
> >  * the paths to the various mlmmj-* programs are already known at
> >  build time, so why not use this information?  This way the programs
> >  do no longer have to be called with /full/path/to/mlmmj-*.  Also use
> >  sed to substitute things in mlmmj-make-ml.sh.in (the autoconf manual
> >  recommends doing so, and it is required for this change).
> 
> They might not be known at build time, and they might be moved around.
> By doing this and not requiring full path you remove the flexibility one
> has in moving the binaries later on.

Ok, I undid this change.

> > My changes are in my mercurial repository at http://hg.43-1.org/mlmmj.  It
> > would be nice, if they can be included in mlmmj.
> 
> We would very much like to do so, would you mind sending a unified diff
> with the changes?

I put together a diff at http://43-1.org/tmp/mlmmj.diff.  It should be a bit
cleaner than the diffs in the repository as I didn't include the Makefile.in
diffs.
After applying the patch, you should run autoconf/automake as I changed
configure.ac.

Regards,
Ansgar

