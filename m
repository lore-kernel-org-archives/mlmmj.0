From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 06 Jun 2007 23:19:03 +0000
Subject: Re: several patches to mlmmj
Message-Id: <20070606231903.GE57769@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070606214940.GB1460@jigoku.43-1.org>
In-Reply-To: <20070606214940.GB1460@jigoku.43-1.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Ansgar Burchardt <ansgar@2007.43-1.org> [Jun 06. 2007 23:49]:
> Hi!
> 
> I started using mlmmj for two small mailinglists.  Because some things bothered
> me I wrote several patches:
>  * At two placed exit() isn't called in case the exec() fails.
>  * The German listtexts uses the ISO-8859-1 charset, but doesn't say so in
>    the headers.  I added a Content-Type and Content-Encoding header.
>  * RFC 2882 recommends using the domain name in the right hand side of the
>    Message-Id header.
>  * The English listtexts were moved into subdirectory, similar to the
>    translated listtexts.  Also I changed mlmmj-make-ml.sh:  the path to the
>    listtexts can now be relative.  This makes choosing between the provided
>    translations easier.
>  * remove a superfluous concatstr() in genmsgid()

These sounds fine! I would like to review them.

>  * the paths to the various mlmmj-* programs are already known at
>  build time, so why not use this information?  This way the programs
>  do no longer have to be called with /full/path/to/mlmmj-*.  Also use
>  sed to substitute things in mlmmj-make-ml.sh.in (the autoconf manual
>  recommends doing so, and it is required for this change).

They might not be known at build time, and they might be moved around.
By doing this and not requiring full path you remove the flexibility one
has in moving the binaries later on. Say I'm upgrading to the new one
for some lists, but I decide to move the old ones to
/usr/local/bin/mlmmj-old/ and keep the new ones where the old ones were
in /usr/local/bin. Then you cannot switch the entire list to the old
corresponding tools by just changing how it's called.

> My changes are in my mercurial repository at http://hg.43-1.org/mlmmj.  It
> would be nice, if they can be included in mlmmj.

We would very much like to do so, would you mind sending a unified diff
with the changes?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
