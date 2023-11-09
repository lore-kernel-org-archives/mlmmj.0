From: Baptiste Daroussin <bapt@nours.eu>
Date: Thu, 09 Nov 2023 10:26:15 +0000
Subject: Re: [mlmmj] Odd message truncation with 1.4.0-rc2
Message-Id: <e7ymobj2vu4q5y63oldtjfv5esfitexxqsgjku4ddgpwm5wvgw@pwdguoxofshv>
List-Id: <mlmmj.mlmmj.org>
References: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
In-Reply-To: <mg5alzflgvmkdvjy6sn3jpbnm5fcwy3bt4yx3ppccwlvmpwyq3@cb7xw4s4s64e>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Thu, Nov 09, 2023 at 08:40:07AM +0100, Baptiste Daroussin wrote:
> On Wed, Nov 08, 2023 at 04:58:49PM -0500, Konstantin Ryabitsev wrote:
> > Hi, all:
> > 
> > I had some bad corruption with 1.4.0-rc2 today -- I am trying to figure out
> > what happened, but I'm not sure I can easily narrow it down. Here's the
> > description, at least:
> > 
> > The same conversation was sent to 2 lists, both managed by rc2 (+1 commit in
> > the latest master):
> > 
> > - users@linux.kernel.org
> > - ksummit@lists.linux.dev
> > 
> > They are both configured to invoke /opt/mlmmj/bin/mlmmj* commands, which is
> > where the rc2 is installed: 
> > 
> >     ksummit.lists.linux.dev@localhost.mlmmj mlmmjopt:ksummit.lists.linux.dev
> >     users.linux.kernel.org@localhost.mlmmj mlmmjopt:users.linux.kernel.org
> > 
> > From master.cf:
> > 
> >     mlmmjopt  unix  -       n       n       -       -       pipe
> >         flags=Rhu user=mlmmj argv=/opt/mlmmj/bin/mlmmj-receive -F -L /var/spool/mlmmj/$nexthop
> > 
> > All other lists on that system still use mlmmj-1.3.0 that is in /usr/bin/*.
> > The only major difference between the two lists is that the users list is set
> > as "noarchive".
> > 
> > This is the thread in question:
> > https://lore.kernel.org/ksummit/CAL_Jsq+j1f_MkLaA3WBG-u1oA5gQra4PyoHmpta=gxB94Q1XrQ@mail.gmail.com/T/#m510ece017fcd0f5d413b5a2bb6ef054cede4a7c2
> > 
> > Note, that public-inbox reads the messages directly from the "archive"
> > directory, so you won't see problems in that thread, just Joe getting
> > progressively more frustrated because the messages he gets back from the list
> > are all truncated after this line:
> > 
> >     > BTW, you have joined some of the discussions to these patches in the past.
> > 
> > I can confirm that the same truncation was seen going out to the users@
> > mailing list, to which I am subscribed from a different address.
> > 
> > I also note that all 4 messages came out with the same ID (865) in the return path:
> > 
> >     Return-Path: <users+bounces-865-konstantin.ryabitsev=linux.dev@linux.kernel.org>
> > 
> > So, not only the truncation happened, but the index was not updated between
> > deliveries, suggesting that the process probably terminated incorrectly.
> > 
> > I attach msg1-msg4, which you can compare to what we have in public-inbox
> > (which reads directly from the disk in archive/, remember):
> > 
> > msg1.txt: https://lore.kernel.org/ksummit/fe239ff5c15403e418937cf23723017a803ec507.camel@perches.com/raw
> > msg2.txt: https://lore.kernel.org/ksummit/bc0462f8119f83495ad35b2efdfd818797effb32.camel@perches.com/raw
> > msg3.txt: https://lore.kernel.org/ksummit/3eee9b9494870c20e189133eeac6af100f591af7.camel@perches.com/raw
> > msg4.txt: https://lore.kernel.org/ksummit/88a5fb768bee48db508c366a0110e88b193d59a3.camel@perches.com/raw
> > 
> > I am happy to offer any further details or run any further tests, but at this
> > point I don't think rc2 is ready to go out.
> > 
> > -K
> 
> Thank you for the detailed report, I believe I have a pretty good
> hint, on what causes this issue, I will try to isolate, reproduce it and fix it!
> 
> Best regards,
> Bapt
> 

I think this should fix it:
https://codeberg.org/mlmmj/mlmmj/commit/b502a85f5bc6f12c24950e20f424e4be2b831dec

Best regards,
Bapt

