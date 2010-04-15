From: Chris Webb <chris@arachsys.com>
Date: Thu, 15 Apr 2010 17:41:32 +0000
Subject: Re: [mlmmj] More Nits
Message-Id: <20100415174132.GM12365@arachsys.com>
List-Id: <mlmmj.mlmmj.org>
References: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
In-Reply-To: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen <mmj@mmj.dk> writes:

> * Chris Webb <chris@arachsys.com> [Apr 15. 2010 11:52]:
> > > BTW: Will there ever be a transition period to mlmmj-receive?  Yes, I know. :-)
> > 
> > You could use the following patch which corrects the two systematic
> > spelling errors globally throughout the code. [Patch in git format
> > because of the file renames.]
> 
> Could we please install both binaries, so that we won't get something
> breaking on upgrade. That's the reason I haven't done this back in 0.7.
> If someone takes care of that, I might even submit a patch to print a
> big fat warning all over saying that mlmmj-recieve has been invoked the
> old and deprecated way, which will go away in future versions.

I think putting in a symlink for that might be as simple as

diff --git a/src/Makefile.am b/src/Makefile.am
index 79a906c..4fbae1d 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -59,3 +59,6 @@ mlmmj_maintd_SOURCES = mlmmj-maintd.c print-version.c log_error.c mygetline.c \
 
 mlmmj_list_SOURCES = mlmmj-list.c strgen.c writen.c print-version.c memory.c \
                     log_error.c random-int.c readn.c
+
+install-exec-hook:
+	ln -fs $(DESTDIR)$(bindir)/mlmmj-rec{ei,ie}ve

on top of my previous patch, although I'm never 100% sure with autoconf!

Cheers,

Chris.

