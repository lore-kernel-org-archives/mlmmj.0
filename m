From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Fri, 22 Jan 2021 03:57:25 +0000
Subject: Re: [mlmmj] distribution "dead upstream" discussion
Message-Id: <9cb7668c-c404-b58c-a382-cb367cd76978@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
In-Reply-To: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Eric Wong:
> Chris Knadle <Chris.Knadle@coredump.us> wrote:
[...]
>>  From the distribution point of view this appears to be "dead upstream" and
>> is a reason for package removal. Debian is about to do a "soft freeze" for
>> preparation for the next release whereby packages in the archive will need
>> bug support for 3 years.
> 
> As a mere user of Debian who doesn't care for popcon, I find
> the "dead upstream" reason annoying.  Sometimes software is just
> "done" and good :)  New features generally leads to more bugs,
> which can penalize existing users.

Debian Developers are intended to remain in contact with upstream developers for 
a number of reasons; DDs are not expected to fix non-Debian related bugs, for 
instance.

https://www.debian.org/doc/manuals/developers-reference/developer-duties.en.html#coordination-with-upstream-developers

And yes, the "dead upstream" reason for package removal is annoying, but it's 
one of the most common reasons I see cited for package removal when there's also 
bugs that upstream would normally be the one to handle handle.

> I've already lost "iprint" and "mp3gain" so just end up copying
> binaries from old installs, now.

Debian has quite a number of packages (1189) that are "orphaned" and still in 
the archive.

https://www.debian.org/devel/wnpp/orphaned

    -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

