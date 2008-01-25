From: Richard Torrens <Richard@Torrens.org.uk>
Date: Fri, 25 Jan 2008 15:04:14 +0000
Subject: Re: FAQ and instructions?
Message-Id: <4f66bf3d5aRichard@Torrens.org.uk>
List-Id: <mlmmj.mlmmj.org>
References: <4f66334953Richard@Torrens.org.uk>
In-Reply-To: <4f66334953Richard@Torrens.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

In article <1201262984.6564.19.camel@mopo-laptop>,
   Morten K. Poulsen <morten@afdelingp.dk> wrote:
> Hi Richard,

[Snip]

> What kind of instructions are you looking for? I am not sure I
> understand exactly what you are looking for...

I don't have admin access: I buy space on arachsys.com, a shell account.
So I'm not installing from scratch, therefore many of the instructions are
not quite relevant. I have a mlmmj-create script which sets up the new
list.

I don't work from Unix, but from RISC OS, so knowing which instructions
were not relevant was not immediately obvious. I'm still learning!

[Snip]

> > My preferred method of maintenance is not via SSH and the command line,
> > but via FTP. But how safe is it to delete or alter files in archive,
> > bounce, incoming, moderation and queue?

> Well, it is safe, but why would you want to do that?

Because in general RISC OS has better script editing and user interface
than Linux... And I'm used to it!

Coming at this from probably not the usual direction (not a new list, but
moving an existing one) I was trying to determine how far I could make
punter's life easier by automating the process. Water under the bridge now!

It's a genealogy list, so populated by windows users [spit]. So much top
posting, excess quoting, htlm etc. Sure you know the scene.

But they are newbies, although mlmmj makes rules easy to implement, I
don't want to be too draconian in enforcing them initially, so will
probably edit some of the /moderate files as an example. Nice to have it
confirmed that editing files in /moderate is safe.

[clear flow explanation snipped, thanks]

> > I ask because currently there's a mail stuck in moderation - it has
> > .sending appended - but has not been sent!

We have traced what happened here. In experimenting with subscribers, I
added a subscriber's email address to one of the subscribers.d files.
however, the file then did not have a \n terminator. So mlmmj appended the
next email address, getting a concatenated line with two @ in it.

mlmmj promptly seized up! Including causing about 10 emails to evaporate.

Dunno whether you consider that a bug, or even worth fixing. It's fairly
nasty, but is anyone else likely to hit it?

Problems with files with or without \n are vague in my memory: RISC OS
uses the same line terminators as Unix, and we used to have programs that
did funny things if \n was absent. But that's so long gone, I suppose I
had assumed Linux also would not need care taken here!

Thanks for some carefully conceived software, Morten and Mads.

