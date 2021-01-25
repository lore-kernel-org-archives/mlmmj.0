From: Thomas Goirand <thomas@goirand.fr>
Date: Mon, 25 Jan 2021 17:20:16 +0000
Subject: Re: [mlmmj] distribution "dead upstream" discussion
Message-Id: <308e26b6-6d27-4220-9b14-30cae940151a@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
In-Reply-To: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

On 1/22/21 4:50 AM, Chris Knadle wrote:
> Thomas Goirand:
>> There's currently no RC bug against the Debian package, so there's no
>> reason to remove it because of that.
> 
> Library and compiler changes commonly cause new build bugs if nothing
> else, and it's very common for unmaintained software to eventually get
> removed because of that kind of breakage.  As such it makes sense to
> contact upstream to discuss the situation now.

It's been years this didn't happen to MLMMJ, because it's using a very
clean C code, which doesn't involve lots of moving parts. Have you
notice how much the MLMMJ Build-Depends: is empty? How much MLMMJ only
relies on the standard C libs? That's also one very strong point of
MLMMJ and why I like it so much.

MLMMJ is of very low need for maintenance, both upstream or in the
Debian package. So much that our Debian source package is bit-rotting,
and would need a real clean-up (to switch to the dh sequencer, for a
start, and probably many other stuff...).

>> What's the numerous problems you've found against MLMMJ that you're
>> discussing here? I see MLMMJ as a package with really minimum issue.
> 
> I've already explained my concerns in the email I sent to the list. 
> What about what I said wasn't clear?  All MLMMJ development has stopped,
> the mailing list archives stopped working in 2017, there's a repo fork
> that isn't listed anywhere on the site, and I wanted to know how to
> report bugs upstream because that was up in the air.  Are you saying you
> consider all of that as being "just fine"?

It's not fine, it's best when the site is well maintained, I agree. But
I do not consider MLMMJ itself unmaintained like you thought. At least,
the currently situation isn't as bad as enough to remove MLMMJ from Debian.

My reasoning is also triggered by the fact I would trust Martin to help
in case there's nobody else available. Martin, can you confirm that?

Cheers,

Thomas Goirand (zigo)

