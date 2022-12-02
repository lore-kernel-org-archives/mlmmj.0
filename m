From: Rongxing Liu <motion@liurongxing.com>
Date: Fri, 02 Dec 2022 15:53:03 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <23f78f3b-5651-8250-80f8-84ea44af327a@liurongxing.com>
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hi Bapt,

nice job

it's look very good and i will try test and use.

在 2022/12/2 22:51, Baptiste Daroussin 写道:
> Hello everyone,
> 
> A 1.5 years ago, I migrated FreeBSD's mailing list to mlmmj. So far so good we
> are very happy with it.
> 
> Since that date I have been working on modernizing mlmmj codebase, integrate our
> patches etc. While the work is clearly not done, I think it is advanced enough
> for it to be shared.
> 
> Disclaimer: this is a very early alpha, mostly tested under FreeBSD! While I tried
> (and intend) to keep using only portable things, their maybe issues, the main goal
> is to open the gate to contributors, testers and open discussions.
> 
> https://codeberg.org/mlmmj/mlmmj/releases
> 
> The working has been ongoing here: https://codeberg.org/mlmmj/mlmmj
> 
> The changelog is the following:
>   * Add a test suite
>   * Modernize code (dprintf, posix_spawn, asprintf, getline, daemon, ...)
>   * Supporting passing email to a mta over ipv6
>   * Fix relaying in IPV6-only systems
>   * Fix decode quoted printable subject
>   * Fix parsing RFC1891
>   * Fix a crash if no owner has been defined
>   * Validate ranges of all integers conversion
>   * New 'nobounceprobe' tunable for debugging purpose
>   * New 'send' tunable to allow email passthrough
>   * Add support for 'X-Original-From'
>   * Reduce subscription confirmation address length to fit RFC 5321
>   * Use arc4random is available
>   * Reduce memory manipulation
>   * When unsubscribing bouncers, keep the bounce file if something went
>   * wrong and report in syslog what went wrong
>   * Remove the -b option from mlmmj-unsub, it is not used anymore
>   * simplify the locking mechanism
> 
> My plans before a full 1.4.0:
>   * Remove the php part
>   * Merge interesting parts of mlmmj-receive-strip into mlmmj-receive
> 
> Note that one thing I didn't do is merge the mungefrom patches. So far I consider
> mailing list should not be altering parts of the email that are part of the dkim
> signatures aka:
> - Should not modify the subject
> - Should not strip any part of the emial
> - Should not add a footer
> 
> If so, emails going through a mailing list respects dkim/dmarc expectations.
> Note that I don't have strong feelings about this, so I can be convince to merge
> those patches.
> 
> Open question:
> - should this still be mlmmj? (aka the continuation of the project?) if most do
>    not like the approach, I will of course fork and rename, otherwise I will be
>    happy to make it a continuation of the project.
> 
> Best regards,
> Bapt
> 
> 

