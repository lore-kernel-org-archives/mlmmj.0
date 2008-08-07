From: Christian Laursen <xi@borderworlds.dk>
Date: Thu, 07 Aug 2008 13:34:05 +0000
Subject: Re: Quick hack to get mlmmj to work in PHP 5
Message-Id: <ygfod45q78y.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <45CB89DA-8EDA-4BB9-B500-967D0245BB71@phporaclehosting.com>
In-Reply-To: <45CB89DA-8EDA-4BB9-B500-967D0245BB71@phporaclehosting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Gareth Fiford <gareth@phporaclehosting.com> writes:

> On 7 Aug 2008, at 08:38, Christian Laursen <xi@borderworlds.dk> wrote:
>
>> Gareth Fiford <gareth@phporaclehosting.com> writes:
>>
>>> Quick hack to get php user and admin to work in PHP5
>>
>> [snip]
>>
>> Or you could probably just enable register_globals in your virtual
>> host configuration.
>
> Register globals is a security no no

Yes, but disabling register_globals and implementing the same thing
yourself is just as bad (Actually I think it is worse).

-- 
Christian Laursen
