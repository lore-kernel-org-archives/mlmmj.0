From: Chris Webb <chris@arachsys.com>
Date: Fri, 01 Oct 2010 08:44:12 +0000
Subject: Re: [mlmmj] more than 100 lines for moderation
Message-Id: <20101001084412.GC11007@arachsys.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
In-Reply-To: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thomas Goirand <thomas@goirand.fr> writes:

> Hum... Still mercurial. If we had a Git support, I would have been able
> to give instructions on how to build an experimental package with few
> git and git-buildpackage commands... What? I'm being a pain to ask
> AGAIN? Ok, I shut my big mouth then! :)

You may be interested in git-remote-hg. I've been watching with great
interest, as it promises to make interop much less painful:

  http://github.com/SRabbelier/git/tree/remote-hg/git_remote_helpers/hg/

You'll be able to use git to clone from an hg repo in exactly the same way
as you can clone from a git repo.

The other direction, using mercurial to work on git projects, already exists
in the form of hg-git, but this is quite slow and is the 'wrong' direction
for me too.

Best wishes,

Chris.

