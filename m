From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 01 Oct 2010 09:47:31 +0000
Subject: Re: [mlmmj] more than 100 lines for moderation
Message-Id: <4CA5AE33.1070703@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
In-Reply-To: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>> I doubt it, Florian. The changes have got into Mlmmj's version control,
>> but I don't expect they've got anywhere else yet (they haven't even made
>> it into an Mlmmj release yet).
>
> Ubuntu's package is the exact same one as we have in Debian, on which
> I'm working on.

Good to have somebody who knows.

I'm a bit of a 'grass roots' man, so I wouldn't recommend *against* a
standard ./configure && make approach, but I would too recommend Thomas'
approach. And once we have a git mirror set up (it hasn't been
forgotten!) he'll be able to give his even groovier instructions. (I'll
be using hg-git, as that is the right direction for me, of course. I
don't know whether git-remote-hg will do a lossless conversion like
hg-git does, or one compatible with hg-git's conversion, but that is
something to keep an eye on, too.)

> That's one thing I always find annoying with MLMMJ. Why are all scripts
> postfixed with ".sh"? Look into your distribution files, no scripts are
> like that. Using just "mlmmj-make-ml" (without the ".sh") directly into
> your source would be a wise change, IMHO. If you didn't know, in Debian,
> we had to do that change, because having the ".sh" extension is against
> the policy of Debian. What do you think?

There's only one, isn't there (asks the maintainer, who probably should
know...)? I agree, it is unconventional for a script designed to be run
by a user. Generally only scripts used as intermediate steps in a build,
or something like that, that are generally sourced, not executed, have
the .sh extension. I don't mind changing it, though will keep a symlink
for a while for compatibility. Likewise with mlmmj-receive. I've got to
find that patch someone made for that.

Ben.





