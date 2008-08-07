From: Gareth Fiford <gareth@phporaclehosting.com>
Date: Thu, 07 Aug 2008 14:40:31 +0000
Subject: Re: Quick hack to get mlmmj to work in PHP 5
Message-Id: <CAF0CE39-03B0-4613-BCE8-E5F2875F9BFD@phporaclehosting.com>
List-Id: <mlmmj.mlmmj.org>
References: <45CB89DA-8EDA-4BB9-B500-967D0245BB71@phporaclehosting.com>
In-Reply-To: <45CB89DA-8EDA-4BB9-B500-967D0245BB71@phporaclehosting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

You don't need to disable globals for this to work

No one is going to enable globals on any of my servers

As mentioned this is a complete hack

The front ends need rewriting in more modern OO php5 with may be a  
library do people can extend it

At least with my hack the evil of globals is limited to the specific  
scripts where it is implemented

Sent from my iPhone

On 7 Aug 2008, at 14:34, Christian Laursen <xi@borderworlds.dk> wrote:

> Gareth Fiford <gareth@phporaclehosting.com> writes:
>
>> On 7 Aug 2008, at 08:38, Christian Laursen <xi@borderworlds.dk>  
>> wrote:
>>
>>> Gareth Fiford <gareth@phporaclehosting.com> writes:
>>>
>>>> Quick hack to get php user and admin to work in PHP5
>>>
>>> [snip]
>>>
>>> Or you could probably just enable register_globals in your virtual
>>> host configuration.
>>
>> Register globals is a security no no
>
> Yes, but disabling register_globals and implementing the same thing
> yourself is just as bad (Actually I think it is worse).
>
> -- 
> Christian Laursen
>
