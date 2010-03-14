From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Sun, 14 Mar 2010 00:13:16 +0000
Subject: [mlmmj] Re: public code repository (was Re: [PATCH] add MIME-aware footers)
Message-Id: <20100314001316.GA15807@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Feb 19, 2010 at 09:40:21AM +0100, Gerd v. Egidy wrote:
> I'd vote for git and I can offer to convert the history from cvs to git. But 
> I'm just occasionally sending a patch so my preferences should not count so 
> much. Mostly the maintainer should be comfortable with the "something" chosen.
I'll shortly be able to offer Git hosting using gitolite [1] for it.

For the conversion, it's most effective if you have a direct copy of the
CVS ,v files, rather than doing server round-trips. I've put in a lot of
work with cvs2svn doing Git conversions for various Gentoo repositories
(latest conversion stats on the largest CVS repo here:
http://archives.gentoo.org/gentoo-scm/msg_57eaa893711e1b63faa4502e8921376b.xml)

> I've made good experience with git. But when deciding where to host it, you 
> should check if you can give commit rights to others and how hard it is to do 
> so.
> 
> I'm hosting some projects on our own server: 
> http://developer.intra2net.com/git/
My personal gitweb:
http://git.orbis-terrarum.net/

I've just put up a conversion of the tarballs to history, to help respin
some patches:
http://git.orbis-terrarum.net/?p=misc-open-source/mlmmj.git

> But it took a while to set it up so that others can commit, but just to the 
> specific projects they are allowed to.
Gitolite can handle that quite nicely, with per-branch and per-file
ACLs as well. Auth purely by SSH key, managed via git itself, so easy to
add users and update permissions.

[1] http://github.com/sitaramc/gitolite#readme

-- 
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

