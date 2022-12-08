From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Thu, 08 Dec 2022 23:18:46 +0000
Subject: Re: [mlmmj] mlmmj patches from distributions: Gentoo
Message-Id: <robbat2-20221208T203647-368261533Z@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
References: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
In-Reply-To: <robbat2-20221208T005748-436219077Z@orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Dec 08, 2022 at 09:01:29AM +0100, Baptiste Daroussin wrote:
> > There's one scaling discussion we need to have, but the handling needs
> > to include how to incrementally get there:
> > 
> > How to have millions of mails in /archive/!
> > 
> > Our most active list is now approaching 1.5M emails in that directory,
> > and it worries me.
> 
> Why is it worrying you? a directory can hold way more than that.
>
> On FreeBSD, one thing we are doing is when creating the public archives via:
> https://fossil.nours.eu/mlmmj-archiver/doc/trunk/README.md (this may move to
> codeberg), I append the archives to a mbox, so I can cleanup what ever is in the
> archives directory if I need (I did not need up to now).
Cleaning up the archives directory will break the +get-NNNN
functionality.

It makes the directory take extremely long to scan during backups.
I think it should be partitioned more, but any +get-NNNN code will need
to support both partitioned & non-partitioned.

mbox support for +get would be nice, but that's much more work than just
partitioning the directory.

We do have our own archives site:
https://archives.gentoo.org/

The older versions used to use mhonarc, but also ran into scaling
concerns, so we built something more custom (earlier versions used
ElasticSearch as a DB; I don't recall what the current version uses
underneath, but we can re-ingest everything if we need to).

-- 
Robin Hugh Johnson
Gentoo Linux: Dev, Infra Lead, Foundation Treasurer
E-Mail   : robbat2@gentoo.org
GnuPG FP : 11ACBA4F 4778E3F6 E4EDF38E B27B944E 34884E85
GnuPG FP : 7D0B3CEB E9B85B1F 825BCECF EE05E6F6 A48F6136

