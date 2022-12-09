From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Fri, 09 Dec 2022 05:36:54 +0000
Subject: Re: [mlmmj] mlmmj patches from distributions: Gentoo
Message-Id: <robbat2-20221209T053117-521596366Z@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Dec 09, 2022 at 06:25:58AM +0100, Baptiste Daroussin wrote:
> >Cleaning up the archives directory will break the +get-NNNN
> >functionality.
> >
> >It makes the directory take extremely long to scan during backups.
> >I think it should be partitioned more, but any +get-NNNN code will need
> >to support both partitioned & non-partitioned.
> Good point and easy to implement, I ll looking into it.
Great to hear. Please do consider how to migrate existing /archive/
directories into it.

> >mbox support for +get would be nice, but that's much more work than just
> >partitioning the directory.
> >
> >We do have our own archives site:
> >https://archives.gentoo.org/
> >
> >The older versions used to use mhonarc, but also ran into scaling
> >concerns, so we built something more custom (earlier versions used
> >ElasticSearch as a DB; I don't recall what the current version uses
> >underneath, but we can re-ingest everything if we need to).
> If this is public I am interrested into it, i wrote mlmmj-archiver for
> scaling issues as well.
Yes, it's public (and still running ES as it turns out):
https://gitweb.gentoo.org/sites/archives/frontend.git/
https://gitweb.gentoo.org/sites/archives/backend.git/

Some crappy instructions here:
https://wiki.gentoo.org/wiki/Project:Infrastructure/Service_Catalog/Archives

This is the 4th or 5th rewrite of that service in the last 20 years.


-- 
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

