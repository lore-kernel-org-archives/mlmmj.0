From: Ansgar Burchardt <ansgar@2007.43-1.org>
Date: Sun, 10 Jun 2007 23:11:05 +0000
Subject: Re: mlmmj-1.2.14-cvs20070610
Message-Id: <20070610231105.GA5946@jigoku.43-1.org>
List-Id: <mlmmj.mlmmj.org>
References: <7f91e82268803dab7b16033f919a959c@mail.n0rd.dk>
In-Reply-To: <7f91e82268803dab7b16033f919a959c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi!

Morten K. Poulsen wrote:
> Does anybody have anything else, before I roll 1.2.15-RC1 ?

I usually compile mlmmj in a directory different from the source directory.
The change to listtexts/Makefile.am breaks this.  Please apply the following
patch:

--- upstream/listtexts/Makefile.am      2007-06-10 23:40:00.000000000 +0200
+++ work2/listtexts/Makefile.am 2007-06-11 00:32:37.000000000 +0200
@@ -1,6 +1,6 @@
 ## Process this file with automake to produce Makefile.in
 
-nobase_dist_textlib_DATA = ??/????*
+nobase_dist_textlib_DATA = $(srcdir)/??/????*
 
 dist-hook:
        rmdir "$(distdir)/??"


Also compiling contrib/recievestrip fails to build in this case.  gcc cannot
find "../config.h".  The last patch [1] in my repository should change
change this.  Also "make clean" actually cleans contrib/recievestrip after
this.  One downside:  make install in contrib/recievestrip no longer works.
Maybe there should be a configure option (e.g. --enable-recievestrip) to
build and install recievestrip?
I prepared a slightly smaller patch [2] which should apply cleanly to the
CVS snapshot.

Regards,
Ansgar

[1] http://hg.43-1.org/mlmmj?cmd=changeset;nodeT99fee442b7
[2] http://www.43-1.org/tmp/mlmmj-build-recievestrip.diff

