From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 03 Jan 2008 19:21:25 +0000
Subject: Re: feature request: archivedir setting
Message-Id: <20080103192125.GF1940@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20080103021341.GC17327@curie-int.orbis-terrarum.net>
In-Reply-To: <20080103021341.GC17327@curie-int.orbis-terrarum.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Robin H. Johnson <robbat2@gentoo.org> [Jan 03. 2008 20:00]:
> > On 03/01/2008, at 3.13, Robin H. Johnson wrote:
> >> I'd like a tunable to specify what directory to use for the archive.
> > I wouldn't mind implementing this for you, but why not just symlink the 
> > archive dir to somewhere else?
> While that works fine for a single instance (and indeed I tested a
> single list with it), I've got 114 lists presently, with a fair growth,
> and I want to have it smartly set during list creation time.

How about a patch to specify a place to symlink to for
mlmmj-create-ml.sh than? WRT the existing list a very simple for loop
will help.

Will you have to change the existing lists as well?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
