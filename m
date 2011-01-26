From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Wed, 26 Jan 2011 14:32:21 +0000
Subject: Re: [mlmmj] New mlmmj website and development
Message-Id: <4D403075.6070105@oldelvet.org.uk>
List-Id: <mlmmj.mlmmj.org>
References: <4C680191.506@yahoo.com.au>
In-Reply-To: <4C680191.506@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 15/08/2010 16:02, Ben Schmidt wrote:
> Hi, everybody,
>
> I'm pleased to announce that the new mlmmj website is up and running! I
> encourage you to have a look at it. Anyone interested in having an
> account to be able to help maintain it, please let me know! It's where
> it's always been: http://mlmmj.org/
>
> This includes a bug tracker. I will be adding bugs and feature requests
> that I know about over the next few days, and I encourage others to do
> so also. My next priority is working towards a release that includes
> recently-implemented features as well as minor bug fixes, so I'm
> interested in hearing about as many bugs as we know about. The tracker
> is here: http://mlmmj.org/bugs

Hi Ben,

Thanks for your efforts. I've been using mlmmj for a while now and it 
works pretty well. I have noticed a few little annoyances that I haven't 
really followed up until now but I'd like to change that and help where 
I can.

For instance yesterday I was trying to find an issue where I was not 
getting notified of unsubscriptions due to bouncing. In the end it 
turned out to be me having the wrong list control directory settings for 
one of my lists. I'll try to take a look through my notebook and see if 
I can come up with a list of these "annoyances".

However whilst I was looking for the cause of my problem I spent a bit 
of time looking through mlmmj-maintd.c to trace what it was supposed to 
be doing at each step. Whilst doing this I spotted a number of minor 
issues in the mlmmj-maintd.c code.

With that in mind I would be grateful if you could let me know your 
preferred way of working/review. I could just post the patches to the 
mailing list (in hg email format). I'm a little concerned that testing 
some of these changes is going to be difficult because they do involve a 
number of corner cases that shouldn't happen in normal operation. Most 
changes are fairly small however and IMHO they will add value to the 
long term stability of mlmmj.

If patches are of interest and do prove useful I'll see if I can find 
some time to review other parts of mlmmj over the next month or two.

Let me know your preferred way of working because I'm wary of sending a 
chunk of patches to a mailing list unannounced.

Regards

Richard

