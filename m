From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 27 Jan 2021 15:58:38 +0000
Subject: Re: [mlmmj] distribution "dead upstream" discussion
Message-Id: <88bb23c3-e8dc-14d6-d86f-fdde0c808e6b@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
In-Reply-To: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Thomas Goirand:
> On 1/22/21 4:50 AM, Chris Knadle wrote:
>> Thomas Goirand:
>>> There's currently no RC bug against the Debian package, so there's no
>>> reason to remove it because of that.
>>
>> Library and compiler changes commonly cause new build bugs if nothing
>> else, and it's very common for unmaintained software to eventually get
>> removed because of that kind of breakage.  As such it makes sense to
>> contact upstream to discuss the situation now.
> 
> It's been years this didn't happen to MLMMJ, because it's using a very
> clean C code, which doesn't involve lots of moving parts. Have you
> notice how much the MLMMJ Build-Depends: is empty? How much MLMMJ only
> relies on the standard C libs? That's also one very strong point of
> MLMMJ and why I like it so much.

If mlmmj were to become orphaned then this would become an important factor as 
to how long the software would survive in distributions, but other than that I 
don't see the above as relevant at the moment.

> MLMMJ is of very low need for maintenance, both upstream or in the
> Debian package. So much that our Debian source package is bit-rotting,
> and would need a real clean-up (to switch to the dh sequencer, for a
> start, and probably many other stuff...).

Yes, the Debian mlmmj package is bit-rotting some, because there's no new 
versions to upload nor new bugs to prompt making a new upload. I don't see the 
point of updating the debian/rules file to dh unless MLMMJ development is picked 
up again, but I am interested in doing that if that happens.

Speaking of bit-rotting, I'd appreciate it if you could look at bug #622621, 
because I've looked at that bug several times over several years and I don't 
know how to complete the documentation updates that the user was told you'd do. 
As it's documentation updates this is also something upstream would normally 
need to be involved in.

https://bugs.debian.org/622621

>>> What's the numerous problems you've found against MLMMJ that you're
>>> discussing here? I see MLMMJ as a package with really minimum issue.
>>
>> I've already explained my concerns in the email I sent to the list.
>> What about what I said wasn't clear?  All MLMMJ development has stopped,
>> the mailing list archives stopped working in 2017, there's a repo fork
>> that isn't listed anywhere on the site, and I wanted to know how to
>> report bugs upstream because that was up in the air.  Are you saying you
>> consider all of that as being "just fine"?
> 
> It's not fine, it's best when the site is well maintained, I agree. But
> I do not consider MLMMJ itself unmaintained like you thought. At least,
> the currently situation isn't as bad as enough to remove MLMMJ from Debian.

I don't agree that MLMMJ is maintained -- for the moment it isn't, but there's 
some hope that that may change soon, or at least that's what I'm hoping for.

> My reasoning is also triggered by the fact I would trust Martin to help
> in case there's nobody else available. Martin, can you confirm that?

Nope. I appreciate that we got the answer to that though, as it helps plan what 
to try to do next.

    -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

