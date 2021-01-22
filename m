From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Fri, 22 Jan 2021 03:50:15 +0000
Subject: Re: [mlmmj] distribution "dead upstream" discussion
Message-Id: <578c0ddd-1247-7ba1-1c4b-e3803ea1140b@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
In-Reply-To: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Thomas Goirand:
> On 1/21/21 11:35 AM, Chris Knadle wrote:
>> Today I was contacted and asked about the status of mlmmj upstream
>> because from the point of view of the outside world it looks dead; the
>> mailing list archive stopped working in Dec 2017, there's no new commits
>> to the Mercurial or Git repositories since 2017, and thus no indication
>> that MLMMJ is "alive".
>>
>> I happen to be on the mlmmj "discussion" mailing list because I maintain
>> the 'mlmmj' package in Debian, so I took the time to read through the
>> "Is this list active? Where is "upstream"??" and similar threads, and I
>> see that there's a Git repo fork at  https://gitlab.com/mlmmj/mlmmj and
>> had a look at it ... but nobody from the outside world can see that this
>> exists, because that repo is not mentioned on the website nor the
>> mailing list archives.
>>
>>  From the distribution point of view this appears to be "dead upstream"
>> and is a reason for package removal. Debian is about to do a "soft
>> freeze" for preparation for the next release whereby packages in the
>> archive will need bug support for 3 years.
>>
>> The main thing I want to know is "what should I do about the release?"
>> I'm considering the following choices:
>>    a) release 'mlmmj' as before, with myself as maintainer of the package.
>>    b) orphan the package so that there is no listed maintainer, where the
>> package
>>       might be released with Debian 11 or might get dropped, depending on
>> what
>>       the Release Team decides about the package themselves
>>    c) request removal of the package from the archive
> 
> Hi Chris,
> 
> Before doing that, you may consider asking your co-maintainers about it,
> aka: myself. I still want to see MLMMJ in Debian, and I see no reason to
> remove it.

Yes, before actually doing it I would have checked with you -- yes
But being that I had serious concerns about things upstream, it made sense to 
contact upstream about that.  Unless you're saying you're part of upstream?

> MLMMJ is a mature software, with no new feature being added, simply
> because it's feature complete. So it's kind of normal not to see so much
> activity.
> 
> There's currently no RC bug against the Debian package, so there's no
> reason to remove it because of that.

Library and compiler changes commonly cause new build bugs if nothing else, and 
it's very common for unmaintained software to eventually get removed because of 
that kind of breakage.  As such it makes sense to contact upstream to discuss 
the situation now.

>> Choice "a)" only fits if someone in "upstream" is willing to try to fix
>> bugs that get reported. Are there others helping with this at present?
>> Right now I'm uncomfortable about this because the GitLab repo can't be
>> found from the mlmmj.org web page, and that repo seems to be where bugs
>> are reported and handled lately, as best I can tell. Is that correct?
> 
> What's the numerous problems you've found against MLMMJ that you're
> discussing here? I see MLMMJ as a package with really minimum issue.

I've already explained my concerns in the email I sent to the list.  What about 
what I said wasn't clear?  All MLMMJ development has stopped, the mailing list 
archives stopped working in 2017, there's a repo fork that isn't listed anywhere 
on the site, and I wanted to know how to report bugs upstream because that was 
up in the air.  Are you saying you consider all of that as being "just fine"?

    -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

