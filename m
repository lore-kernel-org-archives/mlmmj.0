From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Thu, 23 Jul 2015 07:23:58 +0000
Subject: Re: [mlmmj] archive options
Message-Id: <20150723072357.GA6579@europa.afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20150722201312.Horde.-2qEu7m07EG88JaIYKfPDiy@andreasschulze.de>
In-Reply-To: <20150722201312.Horde.-2qEu7m07EG88JaIYKfPDiy@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Jul 22, 2015 at 07:04:43PM -0400, Chris Knadle wrote:
> Because there were > 64k files the wildcards (?, *, etc) couldn't be
> parsed by the system anymore, but the filesystem other than that didn't
> have an issue

The wildcards are handled by your shell, and will be expanded to a list
of arguments to a program.

> And I'm not sure what the limit on the number of files in a directory
> is anymore -- it's probably filesystem dependent,

It is.

> and I think the wildcards work past 64k files now too, IIRC.

Probably, but there is still a limit. A small trick is to use the "find"
command, instead of having your shell expand the filenames, e.g.:

$ find list/archive/ -type f -name qwe\* -exec grep blah '{}' \;

This would probably work on most modern systems, and be a bit faster as
it doesn't execute grep once per file:

$ find list/archive/ -type f -name qwe\* -exec grep blah '{}' +

> > Are there options to distribute the archived content over multiple
> > sub-directories?

That is not a bad idea. I am sure a patch would be welcome :)

Kind regards,
Morten

