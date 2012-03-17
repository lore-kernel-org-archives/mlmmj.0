From: Lukas Fleischer <mlmmj@cryptocrack.de>
Date: Sat, 17 Mar 2012 12:16:26 +0000
Subject: Re: [mlmmj] Mlmmj 1.2.18a1 released
Message-Id: <20120317121626.GA28513@blizzard>
List-Id: <mlmmj.mlmmj.org>
References: <4F5E32B9.6090908@yahoo.com.au>
In-Reply-To: <4F5E32B9.6090908@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Mar 15, 2012 at 10:51:02PM +1100, Ben Schmidt wrote:
> >>>>An alpha release for the upcoming Mlmmj 1.2.18 has been published.
> >
> >Works fine so far. Didn't notice any regression.
> 
> Thanks a lot for the feedback.
> 
> >>>Later, if you publish 1.2.18.0, it's going to be considered smaller
> >>>than 1.2.18a1
> 
> In trying to figure out a better scheme, I disproved it for Debian:
> 
> $ dpkg --compare-versions 1.2.18a1 lt 1.2.18.0 && echo YES || echo NO
> YES
> 
> It's a problem if the final .0 is omitted:
> 
> $ dpkg --compare-versions 1.2.18a1 lt 1.2.18 && echo YES || echo NO
> NO
> 
> That is what I would have done, but due to this issue, I'm happy enough
> to include the final .0 as occasionally we do have three-point releases
> anyway, and this may be the best solution.

Oh, I didn't even notice the missing revision/build part. Yeah, should
should include that...

> 
> >Yeah, this is used by several projects and shouldn't cause any
> >trouble... It works under Arch Linux (pacman, which uses a version
> >comparison algorithm ripped off from RPM):
> >
> >     $ vercmp 1.2.17.0 1.2.18.0
> >     -1
> >     $ vercmp 1.2.18.0a1 1.2.18.0
> >     -1
> 
> What about
> 
> $ vercmp 1.2.18a1 1.2.18.0

It is pretty clever:

    $ vercmp 1.2.18a1 1.2.18.0
    -1

... :)

> 
> ?
> 
> Smiles,
> 
> Ben.
> 
> 
> 

