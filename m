From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 27 Jan 2011 03:52:39 +0000
Subject: Re: [mlmmj] New mlmmj website and development
Message-Id: <4D40EC07.30503@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4C680191.506@yahoo.com.au>
In-Reply-To: <4C680191.506@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

> Hi Ben,
>
> Thanks for your efforts. I've been using mlmmj for a while now and it
> works pretty well. I have noticed a few little annoyances that I
> haven't really followed up until now but I'd like to change that and
> help where I can.

Help is always welcome.

> For instance yesterday I was trying to find an issue where I was not
> getting notified of unsubscriptions due to bouncing. In the end it
> turned out to be me having the wrong list control directory settings
> for one of my lists. I'll try to take a look through my notebook and
> see if I can come up with a list of these "annoyances".

Great. After I get 1.2.18 out the door, hopefully before much longer, I
want to focus on 'annoyances' for a bit, such as improving the error
reporting and logging, including reasons for unsubscriptions when
notification emails are sent, etc..

> However whilst I was looking for the cause of my problem I spent a bit
> of time looking through mlmmj-maintd.c to trace what it was supposed
> to be doing at each step. Whilst doing this I spotted a number of
> minor issues in the mlmmj-maintd.c code.
>
> With that in mind I would be grateful if you could let me know your
> preferred way of working/review. I could just post the patches to the
> mailing list (in hg email format).

Yep, just email them to the list or to me personally; just use your
judgement regarding which you think is best. If they are small changes,
I'm likely to whack them in the repo almost straight away, as I like to
get things into version control quickly. I just try to ensure that each
change has been looked at by two competent people and given at least
some amount of testing before it goes into a release candidate. If a
review requires changes to be made, which has to be in a new changeset,
it's no big deal!

I would recommend that any change which might be 'controversial' you
discuss on the mailing list. Or any change which will take you a lot of
time and effort. I don't want to waste your time by having you work on a
change that I don't want to commit for some reason.

> I'm a little concerned that testing
> some of these changes is going to be difficult because they do involve
> a number of corner cases that shouldn't happen in normal operation.

Another thing I will be doing after 1.2.18 is trying to set up some
automated testing. This will pave the way for making larger changes to
Mlmmj's architecture with more confidence that things aren't being
broken. Hopefully I will be able to simulate a lot of these corner
canses when I do that. So, even if we can't easily test them yet, let's
make a list of them, so we can write tests for them later without having
to remember what they are.

> Most changes are fairly small however and IMHO they will add value to
> the long term stability of mlmmj.

No bug is too small to fix. And to my mind, a program isn't stable if it
works most of the time. Most programs work most of the time. It's how
well a program works under pressure, when things around it start
breaking, and in the corner cases, that differentiates a stable program
from an unstable one.

> If patches are of interest and do prove useful I'll see if I can find
> some time to review other parts of mlmmj over the next month or two.

Thanks.

> Let me know your preferred way of working because I'm wary of sending
> a chunk of patches to a mailing list unannounced.
>
> Regards
>
> Richard

Smiles,

Ben.




