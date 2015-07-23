From: Piotr Auksztulewicz <mlmmj-listrcpt@hasiok.net>
Date: Thu, 23 Jul 2015 13:36:20 +0000
Subject: Re: [mlmmj] archive options
Message-Id: <20150723133620.GK2331@kibel.hasiok.net>
List-Id: <mlmmj.mlmmj.org>
References: <20150722201312.Horde.-2qEu7m07EG88JaIYKfPDiy@andreasschulze.de>
In-Reply-To: <20150722201312.Horde.-2qEu7m07EG88JaIYKfPDiy@andreasschulze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Jul 23, 2015 at 09:23:58AM +0200, Morten Shearman Kirkegaard wrote:
> On Wed, Jul 22, 2015 at 07:04:43PM -0400, Chris Knadle wrote:
> > Because there were > 64k files the wildcards (?, *, etc) couldn't be
> > parsed by the system anymore, but the filesystem other than that didn't
> > have an issue
> 
> The wildcards are handled by your shell, and will be expanded to a list
> of arguments to a program.

Exactly, and the problem is not the number of files, but the command line
length limit of your shell.

> 
> > And I'm not sure what the limit on the number of files in a directory
> > is anymore -- it's probably filesystem dependent,
> 
> It is.

There were never a limit on a number of files in a single directory in
unix-like filesystems. Early ones were just inefficient when scanning
large directories, because the structure was unordered linear list,
originally with fixed-size recorasd (e.g. 16 bytes: 2 bytes for inode
number, 14 bytes for null-terminated filename - out of currenly used
filesystems Minix still has such structure), later with variable-sized
records, allowing for longer file names.

Modern filesystems for (including ext3 and ext4) use hashed or tree-like
structures for directories and modern kernels apply extensive caching of
directory entries (and modern systems have much more memory for cache use)
so it is no more a big problem.

> A small trick is to use the "find"
> command, instead of having your shell expand the filenames, e.g.:
> 
> $ find list/archive/ -type f -name qwe\* -exec grep blah '{}' \;
> 
> This would probably work on most modern systems, and be a bit faster as
> it doesn't execute grep once per file:
> 
> $ find list/archive/ -type f -name qwe\* -exec grep blah '{}' +
> 

The '+' feature works in GNU find. A compatible way to run a command with
multpile file names from a long list (too long to fit into one command line)
is using xargs:

$ find <dir> <options> | xargs <command>

-- 
Piotr "Malgond" Auksztulewicz                     firstname@lastname.net

