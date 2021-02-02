From: Thomas Goirand <thomas@goirand.fr>
Date: Tue, 02 Feb 2021 17:14:21 +0000
Subject: Re: [mlmmj] distribution "dead upstream" discussion
Message-Id: <c5ba7335-440e-ac03-2a09-fc684e61fd87@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
In-Reply-To: <b6763fd2-a7ca-1c16-b304-43d1ce0b09da@coredump.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 1/27/21 4:58 PM, Chris Knadle wrote:
>> MLMMJ is of very low need for maintenance, both upstream or in the
>> Debian package. So much that our Debian source package is bit-rotting,
>> and would need a real clean-up (to switch to the dh sequencer, for a
>> start, and probably many other stuff...).
> 
> Yes, the Debian mlmmj package is bit-rotting some, because there's no
> new versions to upload nor new bugs to prompt making a new upload. I
> don't see the point of updating the debian/rules file to dh unless MLMMJ
> development is picked up again, but I am interested in doing that if
> that happens.

The point is that it helps to keep your package up-to-date for new
stuff. For example, the current version of the package doesn't call
dh_strip_nondeterminism which is a new thing, and which dh calls.

Cheers,

Thomas Goirand (zigo)

