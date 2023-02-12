From: "Carlo E. Prelz" <fluido@fluido.as>
Date: Sun, 12 Feb 2023 07:34:22 +0000
Subject: [mlmmj] Pointer-flakiness
Message-Id: <20230212073422.GA5474@povariello>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Dear all,

I have been subscribed to this list for many years even if I had
stopped using the software. The traffic is small enough that I did not
feel like canceling the subscription.

I recently had the need to set up a small mailing list for
family-related business, so I went to get file
mlmmj-RELEASE_1_4_0_a2.tar.gz, expecting I'd be quickly up and running
with my new list.

The result was one sunday morning spent in debugging mode, hunting
segmentation faults. I eventually corrected two bugs:

1) In file utils.c, function strtoim, line 46, you have

*errpp = NULL;

but the function parameter **errpp can be passed as null - this
happens in mlmmj-send.c. In that case, you have a segfault. I modified
the line to

if(errpp)
  *errpp=NULL;

but I cannot say whether this is the correct fix.

2) In file mlmmj-maintd.c, in function resend_queue, line 152, you
have

char *mailname, *fromname, *toname, *reptoname, *from, *to, *repto;

I have found that at least one of the above variables (I cannot
remember which one - this happened a couple of weekends ago) had to be
initialized, otherwise I'd have another segfault. I changed the line
to

char *mailname=NULL,*fromname=NULL,*toname=NULL,*reptoname=NULL,*from=NULL,*to=NULL,*repto=NULL;

just to make sure. Sadly, even after that, I could not manage to have
my simple list running - another segfault popped up.

I was about to run out of time, so I decided to go back to the old
source I had (1.2.15, from 2012), freshly compiled it and quickly had
my list up and running.

This message is intended as a good old-fashioned bug-report, but also
as a warning light about some sort of pointer-flakiness that seems to
have percolated into the source code. Sadly, I suffer from terminal
time scarcity, so I am not able to do further debugging. But I am
surprised at how the code in the current state is able to run at
all. Trying to write something to address 0 should always have the
effect of killing any healthy process...

Best

Carlo

-- 
  *         Se la Strada e la sua Virtu' non fossero state messe da parte,
* K * Carlo E. Prelz - fluido@fluido.as             che bisogno ci sarebbe
  *               di parlare tanto di amore e di rettitudine? (Chuang-Tzu)

