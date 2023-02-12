From: Baptiste Daroussin <bapt@nours.eu>
Date: Sun, 12 Feb 2023 08:59:27 +0000
Subject: Re: [mlmmj] Pointer-flakiness
Message-Id: <20230212085927.rzvwyykiy3hl4kue@aniel.nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <20230212073422.GA5474@povariello>
In-Reply-To: <20230212073422.GA5474@povariello>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Sun, Feb 12, 2023 at 08:34:22AM +0100, Carlo E. Prelz wrote:
> Dear all,
> 
> I have been subscribed to this list for many years even if I had
> stopped using the software. The traffic is small enough that I did not
> feel like canceling the subscription.
> 
> I recently had the need to set up a small mailing list for
> family-related business, so I went to get file
> mlmmj-RELEASE_1_4_0_a2.tar.gz, expecting I'd be quickly up and running
> with my new list.
> 
> The result was one sunday morning spent in debugging mode, hunting
> segmentation faults. I eventually corrected two bugs:
> 
> 1) In file utils.c, function strtoim, line 46, you have
> 
> *errpp = NULL;
> 
> but the function parameter **errpp can be passed as null - this
> happens in mlmmj-send.c. In that case, you have a segfault. I modified
> the line to
> 
> if(errpp)
>   *errpp=NULL;
> 
> but I cannot say whether this is the correct fix.

This is now fixed.
> 
> 2) In file mlmmj-maintd.c, in function resend_queue, line 152, you
> have
> 
> char *mailname, *fromname, *toname, *reptoname, *from, *to, *repto;
> 
> I have found that at least one of the above variables (I cannot
> remember which one - this happened a couple of weekends ago) had to be
> initialized, otherwise I'd have another segfault. I changed the line
> to
> 
> char *mailname=NULL,*fromname=NULL,*toname=NULL,*reptoname=NULL,*from=NULL,*to=NULL,*repto=NULL;
> 
> just to make sure. Sadly, even after that, I could not manage to have
> my simple list running - another segfault popped up.
> 
> I was about to run out of time, so I decided to go back to the old
> source I had (1.2.15, from 2012), freshly compiled it and quickly had
> my list up and running.
> 
> This message is intended as a good old-fashioned bug-report, but also
> as a warning light about some sort of pointer-flakiness that seems to
> have percolated into the source code. Sadly, I suffer from terminal
> time scarcity, so I am not able to do further debugging. But I am
> surprised at how the code in the current state is able to run at
> all. Trying to write something to address 0 should always have the
> effect of killing any healthy process...
> 

Note that I am in the middle in the huge refactoring (hence the alpha states)
and I won't make a release before having a complete enough test suite (there
wasn't any before).

To give you a taste of the refactoring, this is the current comparison of 1.3
and 1.4:

43 files changed, 4357 insertions(+), 5806 deletions(-)

Note that this does not include the test suite.

The current test coverage is:

Overall coverage rate:
  lines......: 54.3% (3841 of 7068 lines)
  functions..: 80.1% (165 of 206 functions)
  branches...: 49.0% (1779 of 3632 branches)

wich is way better than alpha2.

also nothing will be released without a full run of the test suite with asan and
ubsan (asan catches the issues like both the one you reported provided the test
suite is complete enough which is not the case yet.)

Alpha are not good for production at all, rc will be. Alpha has been mostly
there, to tell people: hey we are working again on the code base, this is not a
dead project and also get people reporing early stage issues if they are brave
enough.

Best regards,
Bapt

