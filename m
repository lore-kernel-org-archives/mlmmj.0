From: Ansgar Burchardt <ansgar@2007.43-1.org>
Date: Wed, 06 Jun 2007 21:49:40 +0000
Subject: several patches to mlmmj
Message-Id: <20070606214940.GB1460@jigoku.43-1.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi!

I started using mlmmj for two small mailinglists.  Because some things bothered
me I wrote several patches:
 * At two placed exit() isn't called in case the exec() fails.
 * The German listtexts uses the ISO-8859-1 charset, but doesn't say so in
   the headers.  I added a Content-Type and Content-Encoding header.
 * RFC 2882 recommends using the domain name in the right hand side of the
   Message-Id header.
 * The English listtexts were moved into subdirectory, similar to the
   translated listtexts.  Also I changed mlmmj-make-ml.sh:  the path to the
   listtexts can now be relative.  This makes choosing between the provided
   translations easier.
 * remove a superfluous concatstr() in genmsgid()
 * the paths to the various mlmmj-* programs are already known at build time,
   so why not use this information?  This way the programs do no longer have to
   be called with /full/path/to/mlmmj-*.  Also use sed to substitute things in
   mlmmj-make-ml.sh.in (the autoconf manual recommends doing so, and it is
   required for this change).

My changes are in my mercurial repository at http://hg.43-1.org/mlmmj.  It
would be nice, if they can be included in mlmmj.

Regards,
Ansgar

