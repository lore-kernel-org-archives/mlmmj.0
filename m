From: Thomas Goirand <thomas@goirand.fr>
Date: Fri, 06 Mar 2009 19:47:19 +0000
Subject: Version control systems
Message-Id: <49B17DC7.7070600@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I have opened another thread, as I think that otherwise it's a mess.

>> To me, it would be wise to switch to Git. You would never regret
>> it!!!
>
> Git is just the RCS flavor of the month. I don't see any compelling
> arguments in favor of switching. Subversion might be an alternative to
> CVS, but what do we gain by switching away from a tried and tested
> revision control system which does a perfect job of keeping track of the
> source code?

No, Git is NOT yet-another-RCS, and for sure not only the flavor of the
month. If you were comparing Git to let's say bitkeeper (commercial) or
mercurial (open source), then that would make sense. But Git and HG have
NOTHING to do with CVS or SVN. The work flow is totally different.

By switching to a distributed system like Git you will gain:
- safety (you wont give any write access, updates are done with ssh)
- help when merging patches will be possible (you can delegate this to
somebody else that you trust and simply pull from him ...)
- no network access when you are doing commits
- ease of branching (Git branching is really wonderful and inexpensive)
- a wonderful git-web interface to see the work of everyone
- Unix access rights support (sic! I can't bare that fact in CVS)
- and many more ...

There is no "write access" to the centralized server with Git. Everybody
has read access to all public repository, and write access to only it's
OWN public repository. Then when you want to take a patch from someone,
you just "git pull http://www.example.com/contrib-mlmmj/mlmmj.git", see
if you like the patch, then just "push public" so it goes to another
public repository. If it's you, the "main" author of the project, then
we declare that public repository as the master MLMMJ server. But that's
only truth because we say so.

These are just few general sayings about distributed control version
system, if you want to know why Git is better (or mercurial if you want
to use that one), then you can read this video:

http://video.google.com/videosearch?q=linus+gig&emb=0&aq=-1&oq=linus+gi#q=linus+git&emb=0

You see, I didn't even talk about the fact that this stupid CVS doesn't
even understand what is a Unix file write, or that it's patches are
stored at file level instead as per commit. I could have, but this is
not even the important part. The important part is THE WORK FLOW, and
the fact that it's distributed (eg: anybody can merge changes from anybody).

We spent a long time learning the new concepts. This is really
different, and confusing at start. But I really don't want to go back to
that CVS crap. On the SVN site, we could read "CVS done right". As Linus
said on that video, there is NO WAY to make CVS right, the concept is
bad and that's it.

I hope it was not too boring to read and that I made my point. :)

Thomas

P.S: There are some tools to convert your CVS repo to Git if you don't
want to loose the history.
