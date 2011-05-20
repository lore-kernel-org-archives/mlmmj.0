From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Fri, 20 May 2011 09:24:37 +0000
Subject: Re: [mlmmj] Mail loss on failed mmap
Message-Id: <201105201124.38181.thomas.jarosch@intra2net.com>
List-Id: <mlmmj.mlmmj.org>
References: <201105131519.27505.thomas.jarosch@intra2net.com>
In-Reply-To: <201105131519.27505.thomas.jarosch@intra2net.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello Mads,

On Friday, 13. May 2011 19:31:17 you wrote:
> > Do I guess correctly that getaddrsfromfd() returns -1 and then
> > the mail is silently discarded?
> 
> No, it's wrong.

Thanks for your reply.

I tested some more things:
- Torture mlmmj with valgrind -> No errors found. Perfect :)

  Hint: If you ever want to run mlmmj inside valgrind,
        you have to use the "-F (no fork)" option of mlmmj-receieve.

- Pipe a big email through it -> Works fine

- Modify getaddrsfromfd() to always return -1
  like when the mmap call fails -> Mail is discarded

The "subscribers" file gets written/updated in our environment by an 
automatic system that first writes to a temporary file and then 
atomically replaces the target with a rename() on the same partition.

While writing this email, it occurred to me what happened:
mlmmj was perfectly configured, there just weren't any recipients
in the subscribers file yet (=empty mailing list). That would
also explain the mmap() error message from mlmmj 1.2.15.

I can catch this users error on my side by not redirecting
email to mlmmj until at least one recipient is configured.


Postfix reacts to exit codes from /usr/include/sysexits.h
when passing email to external programs.

How about returning "EX_TEMPFAIL" in mlmmj-send
if no recipients were found?

That would also protect us from mail loss
if the mmap() call should ever fail.

Cheers,
Thomas

