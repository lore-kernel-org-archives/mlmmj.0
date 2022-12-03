From: Baptiste Daroussin <bapt@nours.eu>
Date: Sat, 03 Dec 2022 10:35:34 +0000
Subject: Re: [mlmmj] Candidate for an 1.4.0.a1
Message-Id: <6DE3CFE8-AC1A-447E-9145-A59E042F79A1@nours.eu>
List-Id: <mlmmj.mlmmj.org>
References: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
In-Reply-To: <20221202145108.m3vw6f73ppyhvygm@aniel.nours.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org



Le 3 décembre 2022 10:00:00 GMT+01:00, Franky Van Liedekerke <liedekef@telenet.be> a écrit :
>On 12/2/22 15:51, Baptiste Daroussin wrote:
>
>> Hello everyone,
>> 
>> A 1.5 years ago, I migrated FreeBSD's mailing list to mlmmj. So far so good we
>> are very happy with it.
>> 
>> Since that date I have been working on modernizing mlmmj codebase, integrate our
>> patches etc. While the work is clearly not done, I think it is advanced enough
>> for it to be shared.
>> 
>> Disclaimer: this is a very early alpha, mostly tested under FreeBSD! While I tried
>> (and intend) to keep using only portable things, their maybe issues, the main goal
>> is to open the gate to contributors, testers and open discussions.
>> 
>> https://codeberg.org/mlmmj/mlmmj/releases
>> 
>> The working has been ongoing here: https://codeberg.org/mlmmj/mlmmj
>> 
>> The changelog is the following:
>>   * Add a test suite
>>   * Modernize code (dprintf, posix_spawn, asprintf, getline, daemon, ...)
>>   * Supporting passing email to a mta over ipv6
>>   * Fix relaying in IPV6-only systems
>>   * Fix decode quoted printable subject
>>   * Fix parsing RFC1891
>>   * Fix a crash if no owner has been defined
>>   * Validate ranges of all integers conversion
>>   * New 'nobounceprobe' tunable for debugging purpose
>>   * New 'send' tunable to allow email passthrough
>>   * Add support for 'X-Original-From'
>>   * Reduce subscription confirmation address length to fit RFC 5321
>>   * Use arc4random is available
>>   * Reduce memory manipulation
>>   * When unsubscribing bouncers, keep the bounce file if something went
>>   * wrong and report in syslog what went wrong
>>   * Remove the -b option from mlmmj-unsub, it is not used anymore
>>   * simplify the locking mechanism
>> 
>> My plans before a full 1.4.0:
>>   * Remove the php part
>>   * Merge interesting parts of mlmmj-receive-strip into mlmmj-receive
>> 
>> Note that one thing I didn't do is merge the mungefrom patches. So far I consider
>> mailing list should not be altering parts of the email that are part of the dkim
>> signatures aka:
>> - Should not modify the subject
>> - Should not strip any part of the emial
>> - Should not add a footer
>> 
>> If so, emails going through a mailing list respects dkim/dmarc expectations.
>> Note that I don't have strong feelings about this, so I can be convince to merge
>> those patches.
>> 
>> Open question:
>> - should this still be mlmmj? (aka the continuation of the project?) if most do
>>    not like the approach, I will of course fork and rename, otherwise I will be
>>    happy to make it a continuation of the project.
>> 
>> Best regards,
>> Bapt
>
>feedback: autoreconfigure, configure, make, make check: all works ok on fedora (although you'd need to include some extra docu concerning install libaft-c-devel, libatf-sh-devel and kyua)
>
Yes it needs documenting for sure. Thank you for the feedback.

>During make, some warnings popped up (unused params mostly), see the make output in attach. Some calls to "free" are being done when the variable was already freed, those should certainly be fixed. And then the warnings about possibile usage of uninitialized variables.

Yes the unused parameter are already fixed, mlmmj-unsub.c did not yet get all the love it needs

Best regards,
Bapt

