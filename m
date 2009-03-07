From: Thomas Goirand <thomas@goirand.fr>
Date: Sat, 07 Mar 2009 20:21:54 +0000
Subject: Re: Version control systems
Message-Id: <49B2D762.5050007@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <49B17DC7.7070600@goirand.fr>
In-Reply-To: <49B17DC7.7070600@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi there!

Thanks for your reply.

To me, there are people that are for using hg and git, and ... the one
that never tried it. All this is not a mater of tastes, as you seem to
feel. Let me reply to what you wrote, and I hope that I will explain
good enough so you understand (I'm not a very good English writer).

Morten K. Poulsen wrote:
> On Sat, 2009-03-07 at 03:47 +0800, Thomas Goirand wrote:
> Wise decision. This thread will probably end up as a flame war, but
> let's try anyway.

Let's be more constructive, ok ? I don't really care for developing
MLMMJ itself, because I wont have a lot of time to invest in it. I am
trying to make the project more attractive to other, and improve your
efficiency. :)

>> Git and HG have NOTHING to do with CVS or SVN. The work flow is totally
>> different.
> 
> It is, however, still just a system for keeping track of your revisions.

Well, CVS just store files with a history, it doesn't do so much...

>> By switching to a distributed system like Git you will gain:
>> - safety (you wont give any write access, updates are done with ssh)
> 
> Few people have write access today, so that's not an issue.

The proposal is that you will NOT NEED write access anymore.

>> - help when merging patches will be possible (you can delegate this to
>> somebody else that you trust and simply pull from him ...)
> 
> I can't remember ever having a merge conflict in mlmmj.

I can't remember seeing branches in MLMMJ, and for the sarge bug, I
would have love to have it. I would have take the tag corresponding to
the version, create a branch, and do "git cherry-pick -x PATCHNUMBER".
Then just send the patched version to sarge proposed updates. So much
more easy than trying to dig with CVS. With CVS I was simply not able to
do this, and MLMMJ was kept in Sarge with a bug. Too bad...

>> - no network access when you are doing commits
> 
> True, this is a good thing, but I don't keep you from using Git - as
> long as you send me unified diffs.

Do you think going back and forth between 2 systems is productive ?

>> - ease of branching (Git branching is really wonderful and inexpensive)
> 
> cvs tag -b BRANCH_WHATEVER

The issue with CVS is not about branching, but about merging patches
between versions. Git is far more superior in that job. And also,
there's no network access by doing it. Quite good if you are using your
laptop in the plane, for example ...

>> - Unix access rights support (sic! I can't bare that fact in CVS)
> 
> Is Unix access rights a pro or a con? CVS has it, and it works.

No it doesn't. Do a local file unix right change, do a commit, and ...
nothing happens on the server. You would need to ssh to the server and
do a chmod there. Quite bad, because it also doesn't track the changes
this way.

>> There is no "write access" to the centralized server with Git.
> 
> Christian has write access, and does a very fine job of maintaining the
> web interfaces. Why would I give that up?

Because you don't need write access AT ALL. It's a broken concept.

>> Everybody has read access to all public repository
> 
> Read access can be arranged, but nobody has requested it.

Maybe because nobody knows there's even a version tracking system ?

>> when you want to take a patch from someone, you just "git pull
>> http://www.example.com/contrib-mlmmj/mlmmj.git", see if you like the
>> patch, then just "push public" so it goes to another public
>> repository.
> 
> As opposed to this?

As opposed to apply a patch, see that it doesn't merge, but has put a
real mess in your development folder by doing so, and can't reverse
unless you pull the full tree again.

> patch -p1 <~/patch-mlmmj-1.2.16-whatever.diff
> cvs ci -m 'added whatever (Whoever)'

Which is REALLY not easy to manage. Also, patch simply applies a diff,
it doesn't do a 3 way merge with merge options...

>> http://video.google.com/videosearch?q=linus+gig&emb=0&aq=-1&oq=linus+gi#q=linus+git&emb=0
> 
> Thank you. It was interesting, though it didn't convince me.

Maybe because Linus is bad at doing conferences.

>> You see, I didn't even talk about the fact that this stupid CVS doesn't
>> even understand what is a Unix file write
> 
> What?

Read what I wrote above.

>> or that it's patches are stored at file level instead as per commit.
> 
> This is a valid argument. It makes file renaming a bit difficult, but I
> have spent less time doing this - in my entire life - than I have spent
> on writing this e-mail. Subversion does this, so that is an argument in
> favor of Subversion.

Why switching to Subversion if you agree to switch to something new ?

>> The important part is THE WORK FLOW, and the fact that it's distributed
>> (eg: anybody can merge changes from anybody).
> 
> You make it sound like mlmmj is a huge project with thousands of
> developers end as many branches. It is not.

So, the smallest the project, the more stupid the tools should be?
That's how the above can be read...

> You had access to all the patches that I merged into mlmmj-1.2.16 at the
> same time as I had access. They were sent to the mailing list. You could
> have applied them to your local Git repository. You could have arranged
> Git access with the other contributers. I am not stopping you.

Why would someone want to do this job in parallel when it can be done by
a single man, once and for all ? This is really an unproductive way of
working.

> Linus Torvalds is a great developer (some claim that he is almost as
> great as Theo de Raadt), but "Linus told me that CVS is bad and Git is
> good" is not a valid argument.

Forget about this one then. I AM saying it, and about a thousands
others, that CVS (and maybe also SVN) is something of the past.

> If the distributions start carrying versions of mlmmj which are branched
> so far away from the main repository that merging them is not a simple
> matter of applying a small patch set, then yes, I might consider using
> Git. Until then, no....

Opposite way. If you don't use Git or HG, then it's not possible to
apply security/bug-fix patches easily to a frozen version, and have some
distribution diverge. As I said above, I was stuck the other time with
Sarge, because of this, and a problematic version of MLMMJ stayed in
Debian for MONTHS until Etch came out. This would have never happen with
a Git system. I would have do a search to see in what commit you patched
what I was needing, and done ... 15 minutes of work at most, including
rebuilding the packages and changing the debian/changelog. Compare that
to being JUST STUCK...

Thomas
