From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Fri, 04 Jan 2008 09:10:43 +0000
Subject: Re: feature request: archivedir setting
Message-Id: <1199437843.6657.0.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <20080103021341.GC17327@curie-int.orbis-terrarum.net>
In-Reply-To: <20080103021341.GC17327@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Thu, 2008-01-03 at 20:58 +0100, Mads Martin Joergensen wrote:
> * Mads Martin Joergensen <mmj@mmj.dk> [Jan 03. 2008 20:21]:
> > WRT the existing list a very simple for loop will help.
> 
> for i in /var/spool/mlmmj/* ; do
>         mv $i/archive /path/to/newplace
>         ln -s /path/to/newplace/`basename $i`/archive $/archive
> done

-         ln -s /path/to/newplace/`basename $i`/archive $/archive
+         ln -s /path/to/newplace/`basename $i`/archive $i/archive

> Untested, but you get the idea.

Still untested :)

Morten

