From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Sat, 07 Mar 2009 13:53:14 +0000
Subject: Re: Version control systems
Message-Id: <1236433994.6496.54.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <49B17DC7.7070600@goirand.fr>
In-Reply-To: <49B17DC7.7070600@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sat, 2009-03-07 at 03:47 +0800, Thomas Goirand wrote:
> I have opened another thread, as I think that otherwise it's a mess.

Wise decision. This thread will probably end up as a flame war, but
let's try anyway.

First of all, I want to make it clear that this is not personal in any
way. It's not me vs. you; It's CVS vs. Git.

> Git and HG have NOTHING to do with CVS or SVN. The work flow is totally
> different.

It is, however, still just a system for keeping track of your revisions.

> By switching to a distributed system like Git you will gain:
> - safety (you wont give any write access, updates are done with ssh)

Few people have write access today, so that's not an issue.

> - help when merging patches will be possible (you can delegate this to
> somebody else that you trust and simply pull from him ...)

I can't remember ever having a merge conflict in mlmmj.

> - no network access when you are doing commits

True, this is a good thing, but I don't keep you from using Git - as
long as you send me unified diffs.

> - ease of branching (Git branching is really wonderful and inexpensive)

cvs tag -b BRANCH_WHATEVER

> - a wonderful git-web interface to see the work of everyone

We can install viewcvs or something similar, if people want a web
interface.

> - Unix access rights support (sic! I can't bare that fact in CVS)

Is Unix access rights a pro or a con? CVS has it, and it works.

> There is no "write access" to the centralized server with Git.

Christian has write access, and does a very fine job of maintaining the
web interfaces. Why would I give that up?

> Everybody has read access to all public repository

Read access can be arranged, but nobody has requested it.

> when you want to take a patch from someone, you just "git pull
> http://www.example.com/contrib-mlmmj/mlmmj.git", see if you like the
> patch, then just "push public" so it goes to another public
> repository.

As opposed to this?

patch -p1 <~/patch-mlmmj-1.2.16-whatever.diff
cvs ci -m 'added whatever (Whoever)'

> if you want to know why Git is better (or mercurial if you want to use
> that one), then you can read this video:
> 
> http://video.google.com/videosearch?q=linus+gig&emb=0&aq=-1&oq=linus+gi#q=linus+git&emb=0

Thank you. It was interesting, though it didn't convince me.

> You see, I didn't even talk about the fact that this stupid CVS doesn't
> even understand what is a Unix file write

What?

> or that it's patches are stored at file level instead as per commit.

This is a valid argument. It makes file renaming a bit difficult, but I
have spent less time doing this - in my entire life - than I have spent
on writing this e-mail. Subversion does this, so that is an argument in
favor of Subversion.

> The important part is THE WORK FLOW, and the fact that it's distributed
> (eg: anybody can merge changes from anybody).

You make it sound like mlmmj is a huge project with thousands of
developers end as many branches. It is not.

You had access to all the patches that I merged into mlmmj-1.2.16 at the
same time as I had access. They were sent to the mailing list. You could
have applied them to your local Git repository. You could have arranged
Git access with the other contributers. I am not stopping you.

> We spent a long time learning the new concepts. This is really
> different, and confusing at start. But I really don't want to go back
> to that CVS crap. On the SVN site, we could read "CVS done right". As
> Linus said on that video, there is NO WAY to make CVS right, the
> concept is bad and that's it.

Linus Torvalds is a great developer (some claim that he is almost as
great as Theo de Raadt), but "Linus told me that CVS is bad and Git is
good" is not a valid argument.

If the distributions start carrying versions of mlmmj which are branched
so far away from the main repository that merging them is not a simple
matter of applying a small patch set, then yes, I might consider using
Git. Until then, no....

Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

