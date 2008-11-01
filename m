From: Dave Taylor <ddt@davetaylor.name>
Date: Sat, 01 Nov 2008 19:50:56 +0000
Subject: Re: mlmmj-1.2.16-PRE1 released
Message-Id: <4918042F-7C67-48A6-98BB-3E3171A3D6C0@davetaylor.name>
List-Id: <mlmmj.mlmmj.org>
References: <1225491347.7486.22.camel@mopo-laptop>
In-Reply-To: <1225491347.7486.22.camel@mopo-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Not sure if this is the appropriate place to mention this, but I just  
built the PRE1 mlmmj-recieve-strip proggy, and I have a couple of  
pieces of feedback there.

One is that it doesn't build when you say "make".  You need to say  
"make mlmmj-recieve-strip".

The other is that what I'm really dying for is not a list of mime  
types to disallow, but a list of mime types to allow.  Specifically, I  
only want to allow text/plain.

But here's the last, annoying part.  :)

I want one user in particular to be able to bypass this stripping  
stage, because she attaches the valuable NUEA/UTA job list to her  
emails, and we're all agreed that it's worth an exception.

I have a mailing list of about 500 people, mostly entertainment  
industry people (producers, directors, writers, actors), and I use  
mlmmj for it.  One of the biggest headaches, besides moderation, a  
necessary evil to improve the signal-to-noise ratio, is dealing with  
users who don't know how to send plain text emails.

Most can be taught, but not all of them.  They all get incredibly  
frustrated when they can't send an email out, and sometimes they're  
dying to send emergency emails about how they need such and such a  
prop, location, or person to help with a shoot right away.

Is there a better way to handle this?

	=-ddt->

On Oct 31, 2008, at 3:15 PM, Morten K. Poulsen wrote:

> Hi list,
>
>
> After a huge delay, the next mlmmj release is just around the corner.
> This prerelease fixes some bugs, adds a few features and a  
> translation.
> Thanks a lot to all the contributers. Please download and test it.  
> If I
> haven't missed anything, a release candidate will follow soon.
>
>
> http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.16-PRE1.tar.bz2
> d0d4881f33e4d6379d363a01542c67ac
>
> http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.16-PRE1.tar.gz
> 019df5be4475408b26415f03e8cf2722
>
>
> The following changes have been made since mlmmj-1.2.15:
>
> o Added support for static bounce addresses (Thomas Jarosch)
> o Added a sanity check in mlmmj-receive-strip (Chris Webb)
> o Added miscellaneous sanity checks (Thomas Jarosch)
> o Disabled digest mails when 'noarchive' is set (Thomas Jarosch)
> o Added Russian listtexts (Nikolay Derkach)
> o Fixed mmap()ing of zero-sized files (Robin H. Johnson)
> o Fixed mlmmj-recieve [sic] for architectures where
>   sizeof(int) and sizeof(char *) differ
> o Added support for the 'originalmail' keyword (Sascha Sommer)
> o Merged various changes to the web interface from Franky Van
>   Liedekerke
>
> Have I missed any patches?
>
>
> The following listtext files are missing. Can somebody translate them?
>
> cz/listfaq
> cz/maxmailsize
> cz/sub-deny-digest
> cz/sub-deny-nomail
> cz/submod-moderator
> cz/submod-requester
> cz/sub-subscribed
> cz/unsub-notsubscribed
>
> de/listfaq
> de/sub-deny-digest
> de/sub-deny-nomail
>
> es/maxmailsize
> es/sub-deny-digest
> es/sub-deny-nomail
> es/submod-moderator
> es/submod-requester
>
> fr/listfaq
> fr/maxmailsize
> fr/sub-deny-digest
> fr/sub-deny-nomail
> fr/submod-moderator
> fr/submod-requester
>
> it/listfaq
> it/maxmailsize
> it/sub-deny-digest
> it/sub-deny-nomail
> it/submod-moderator
> it/submod-requester
>
> nl/maxmailsize
>
>
> In addition, the following is missing in the RU translation: "Below  
> this
> line are the first 100 lines of the message up for moderation"
>
> And this is missing in FR, IT, NL and RU: "Below this line are the  
> first
> 100 lines of the denied message"
>
> Can somebody translate it?
>
>
> Thanks for your patience,
> Morten
>
> -- 
> Morten K. Poulsen <mopo@fabletech.com>
> CTO, FableTech
> http://fabletech.com/
>
>
>

