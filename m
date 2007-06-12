From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 12 Jun 2007 19:00:44 +0000
Subject: Re: mlmmj-1.2.14-cvs20070610
Message-Id: <c8c4c2a0c75d60fa203cdbdf4503fb8d@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <7f91e82268803dab7b16033f919a959c@mail.n0rd.dk>
In-Reply-To: <7f91e82268803dab7b16033f919a959c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Ansgar,

Ansgar Burchardt <ansgar@2007.43-1.org> wrote:
> I usually compile mlmmj in a directory different from the source
> directory.
> The change to listtexts/Makefile.am breaks this.  Please apply the
> following patch:
[snip]
> -nobase_dist_textlib_DATA = ??/????*
> +nobase_dist_textlib_DATA = $(srcdir)/??/????*

Thanks, committed to CVS.

> Also compiling contrib/recievestrip fails to build in this case.
> gcc cannot find "../config.h".  The last patch [1] in my repository
> should change change this.  Also "make clean" actually cleans
> contrib/recievestrip after this.  One downside:  make install in
> contrib/recievestrip no longer works.

Committed to CVS with one small change - autoconf 2.50 does not like
slashes in SUBDIRS:

Makefile.am:16: directory should not contain `/'
autoreconf2.50: automake failed with exit status: 1

So I added contrib/Makefile.am with just the following:

EXTRA_DIST = web
SUBDIRS = recievestrip

The new snapshot is here:

b18cce28c37c7678c77c467de5f50293
http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.14-cvs20070612.tar.bz2

62b30e55e7ffdc54782726737eda69e5
http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.14-cvs20070612.tar.gz

> Maybe there should be a configure option (e.g. --enable-recievestrip)
> to build and install recievestrip?

That would be very nice. I am no autotools guru. Could you add such
an option?

I am going to implement proper encoding for all listtexts. I plan to
finish that tonight, but we will see.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

