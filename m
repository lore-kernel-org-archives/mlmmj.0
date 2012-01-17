From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Tue, 17 Jan 2012 18:06:59 +0000
Subject: Re: [mlmmj] [PATCH 00 of 10] mlmmj-maintd.c tweaks
Message-Id: <4F15B8C3.8010806@oldelvet.org.uk>
List-Id: <mlmmj.mlmmj.org>
References: <patchbomb.1296169158@duncow>
In-Reply-To: <patchbomb.1296169158@duncow>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Ben,

On 17/01/2012 14:08, Ben Schmidt wrote:
> Thanks again for this, Richard, and sorry for taking so long to get
> around to looking at it. The work is great, and you made my life really
> easy by writing clear patches and log messages, and ensuring each
> changeset dealt with a single bug.
>
> I have applied patches 01 and 04 through 10 as is, though I have removed
> your email address from the author field of the changeset, just so that
> it doesn't get exposed to the world unobfuscated through our hg web
> interface, and in case it changes. One day I might keep a list of
> contributors' contact details in a file in the distribution, but that
> can wait.
Sure. Sounds good.

>
> Regarding patches 02 and 03, I love this work, but I will leave applying
> it until we can do it throughout the codebase rather than just in
> mlmmj-maintd. The 'wait for child' function should go in a separate file
> and be linked into and called by all the executables that fork.
Sure. That makes sense.

> If you'd
> like to make a more comprehensive patch to do this, I would be very
> grateful.
I'm pretty busy with other things right now but I'll keep it on my TODO 
list unless someone else beats me to it!

Regards

Richard


>
> Thanks once again.
>
> Smiles,
>
> Ben.
>
>
>
> On 28/01/11 9:59 AM, Richard Mortimer wrote:
>> All,
>>
>> As mentioned the other day here are a number of patches against
>> mlmmj-maintd.c that fix relatively minor issues. I haven't attempted
>> to make any changes outside of this one file but intend to look at those
>> over the coming month or two as time allows.
>>
>> I have also spotted a couple of other issues that I haven't addressed
>> yet.
>> The first is the fact that unlink calls never have their error status
>> checked. I was thinking about introducing a myunlink() method that does
>> the unlink and reports any error. That would help catch any permissions
>> problems. There is a potential that some of the files might not exist
>> in all situations (the -probe files for example) so it might not be
>> appropriate to log an error in all circumstances.
>>
>> Also there are a couple of places in mlmmj-maintd.c where it doesn't find
>> the contents of the files that it expects. It just carries onto the next
>> file without logging an error.
>>
>> Review comments most welcome.
>>
>> Regards
>>
>> Richard
>>
>>
>>

