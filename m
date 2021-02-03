From: Chris Knadle <Chris.Knadle@coredump.us>
Date: Wed, 03 Feb 2021 21:02:36 +0000
Subject: Re: [mlmmj] distribution "dead upstream" discussion
Message-Id: <ab4827fa-27ca-5e1e-b770-00ffc414ff63@coredump.us>
List-Id: <mlmmj.mlmmj.org>
References: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
In-Reply-To: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thomas Goirand:
> On 1/27/21 4:58 PM, Chris Knadle wrote:
>>> MLMMJ is of very low need for maintenance, both upstream or in the
>>> Debian package. So much that our Debian source package is bit-rotting,
>>> and would need a real clean-up (to switch to the dh sequencer, for a
>>> start, and probably many other stuff...).
>>
>> Yes, the Debian mlmmj package is bit-rotting some, because there's no
>> new versions to upload nor new bugs to prompt making a new upload. I
>> don't see the point of updating the debian/rules file to dh unless MLMMJ
>> development is picked up again, but I am interested in doing that if
>> that happens.
> 
> The point is that it helps to keep your package up-to-date for new
> stuff. For example, the current version of the package doesn't call
> dh_strip_nondeterminism which is a new thing, and which dh calls.

I think this is a "red herring".

- The purpose of dh_strip_nondeterminism is to remove build-time changes
   that would cause the package not to be reproducible -- but the mlmmj
   package has been reproducible for a long time.

    https://tests.reproducible-builds.org/debian/rb-pkg/unstable/amd64/mlmmj.html

- dh_strip_nondeterminism could be called without switching to dh
- A switch to dh in debian/rules is an invasive change (i.e. it commonly
   causes some bugs to start with) and so it's not something I'd want to do
   close to freeze time, which is exactly where we are.



I haven't heard any reply about bug #622621 which is something that I think 
would be good to address before the Debian release. I'm making a second request: 
can you please look at that bug and discuss it?

    -- Chris

-- 
Chris Knadle
Chris.Knadle@coredump.us

