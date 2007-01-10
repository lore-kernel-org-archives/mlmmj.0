From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Wed, 10 Jan 2007 19:59:50 +0000
Subject: Re: Round robin relayhost
Message-Id: <Pine.LNX.4.64.0701101453220.5861@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
In-Reply-To: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Wed, 10 Jan 2007, Jesper Lund wrote:

>>> With the tunable, "relayhost", I can set a relayhost. I would
>>> like to be able to specify multiple relayhosts, and round robin
>>> between them. Just put 2 or more adresses in the "relayhost" file.
>>>
>>> Is this possible ? Otherwise, this is a feature request :-)
>>
>> Is it not possible for you to set up relayhost.your.domain with
>> multiple A records in DNS?
>
> Been there, done that. But when I do that, it seems that mlmmj uses
> the same relayhost to deliver all messages pr. posting, via the same
> relayhost.

Perhaps mlmmj should use a list of addresses if gethostbyname returns more 
than one.

But are you sure that using multiple relayhosts will actually get your 
messages out any quicker?
