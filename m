From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 17 May 2009 21:31:47 +0000
Subject: Re: Responsed to moderation
Message-Id: <4A108243.10803@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <505cc59ce7Lists@Torrens.org.uk>
In-Reply-To: <505cc59ce7Lists@Torrens.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Morten K. Poulsen wrote:
> Hi Richard,
> 
> On Sun, 2009-05-17 at 09:39 +0100, Torrens (lists) wrote:
>> Is is possible to make MLMMJ send an ack to any email referred for
>> moderation?
> 
> No, there is currently no support for notifying a sender about the fact
> that his mail is awaiting moderation.
> 
> Such a notification is sent if a person tries to subscribe to a list
> with subscription moderation, and something similar would be useful for
> regular moderation as well. If you could make a patch, I will be happy
> to include it in mlmmj.
> 
> Morten

If that is to be added, then a tunable should enable/disable it, and it
should be disabled by default.

I know this is quite obvious, but better be safe than sorry. I am
already seeing the danger of backscraters sending to moderated lists
with that option... I would NEVER enable this. This is a way too
dangerous to me.

Thomas

