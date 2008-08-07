From: Gareth Fiford <gareth@phporaclehosting.com>
Date: Thu, 07 Aug 2008 08:31:12 +0000
Subject: Re: Quick hack to get mlmmj to work in PHP 5
Message-Id: <290C8450-9556-40DF-B6EA-07EE9B3F81AC@phporaclehosting.com>
List-Id: <mlmmj.mlmmj.org>
References: <45CB89DA-8EDA-4BB9-B500-967D0245BB71@phporaclehosting.com>
In-Reply-To: <45CB89DA-8EDA-4BB9-B500-967D0245BB71@phporaclehosting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Register globals is a security no no

Http_post_vars depricated on favour of _POST

Same for get

Sent from my iPhone

On 7 Aug 2008, at 08:38, Christian Laursen <xi@borderworlds.dk> wrote:

> Gareth Fiford <gareth@phporaclehosting.com> writes:
>
>> Quick hack to get php user and admin to work in PHP5
>
> [snip]
>
> Or you could probably just enable register_globals in your virtual
> host configuration.
>
> -- 
> Christian Laursen
>
