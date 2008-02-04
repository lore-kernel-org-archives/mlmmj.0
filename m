From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 04 Feb 2008 10:59:15 +0000
Subject: Re: FAQ and instructions?
Message-Id: <20080204105915.GO84525@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4f66334953Richard@Torrens.org.uk>
In-Reply-To: <4f66334953Richard@Torrens.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Richard Torrens <Richard@Torrens.org.uk> [Jan 25. 2008 16:17]:
> > > I ask because currently there's a mail stuck in moderation - it has
> > > .sending appended - but has not been sent!
> 
> We have traced what happened here. In experimenting with subscribers, I
> added a subscriber's email address to one of the subscribers.d files.
> however, the file then did not have a \n terminator. So mlmmj appended the
> next email address, getting a concatenated line with two @ in it.

Was there only \r, or was there one emailaddress in the file without a
newline at the end?

> mlmmj promptly seized up! Including causing about 10 emails to evaporate.

Yikes ...

> Dunno whether you consider that a bug, or even worth fixing. It's fairly
> nasty, but is anyone else likely to hit it?

It's definately worth fixing.

> Problems with files with or without \n are vague in my memory: RISC OS
> uses the same line terminators as Unix, and we used to have programs that
> did funny things if \n was absent. But that's so long gone, I suppose I
> had assumed Linux also would not need care taken here!

I never encountered it, I developed mlmmj mainly on FreeBSD with Linux
testing as well.

> Thanks for some carefully conceived software, Morten and Mads.

You're most welcome! Let's fix that bug though :)

What version of mlmmj are you running on what version of RISC OS. I
think you're our first report that it works on RISC OS.

Regards,
-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
