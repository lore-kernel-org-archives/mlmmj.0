From: Richard Torrens <Richard@Torrens.org.uk>
Date: Mon, 04 Feb 2008 15:10:18 +0000
Subject: Re: FAQ and instructions?
Message-Id: <4f6be6277fRichard@Torrens.org.uk>
List-Id: <mlmmj.mlmmj.org>
References: <4f66334953Richard@Torrens.org.uk>
In-Reply-To: <4f66334953Richard@Torrens.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

In article <20080204105915.GO84525@mmj.dk>,
   Mads Martin Joergensen <mmj@mmj.dk> wrote:
> * Richard Torrens <Richard@Torrens.org.uk> [Jan 25. 2008 16:17]:
> > > > I ask because currently there's a mail stuck in moderation - it has
> > > > .sending appended - but has not been sent!
> > 
> > We have traced what happened here. In experimenting with subscribers,
> > I added a subscriber's email address to one of the subscribers.d
> > files. however, the file then did not have a \n terminator. So mlmmj
> > appended the next email address, getting a concatenated line with two
> > @ in it.

> Was there only \r, or was there one emailaddress in the file without a
> newline at the end?

Several email adresses. Last line did not have \n character

> > mlmmj promptly seized up! Including causing about 10 emails to
> > evaporate.

> Yikes ...

> > Dunno whether you consider that a bug, or even worth fixing. It's
> > fairly nasty, but is anyone else likely to hit it?

> It's definately worth fixing.

Then the check would be that the last char in the existing file is \n and
not an alpha!

> > Problems with files with or without \n are vague in my memory: RISC OS
> > uses the same line terminators as Unix, and we used to have programs
> > that did funny things if \n was absent. But that's so long gone, I
> > suppose I had assumed Linux also would not need care taken here!

> I never encountered it, I developed mlmmj mainly on FreeBSD with Linux
> testing as well.

RISC OS is slightly irrelevant to this: the teminal I use runs RISC OS,
connecting to the server via ssh or ftp. Server runs linux. Lots on the
www about RISC OS.

It's less mousing/keyboarding for me to download a subscriber file by ftp,
drag and drop an email address into it and upload it again. In this case 
it was only an email address, not a whole line, hence the problem!

