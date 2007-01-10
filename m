From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Wed, 10 Jan 2007 20:52:59 +0000
Subject: Re: Round robin relayhost
Message-Id: <Pine.LNX.4.64.0701101538170.5861@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
In-Reply-To: <20070110195425.e60da9a4.jesper@ballbreaker.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Wed, 10 Jan 2007, Sven 'Darkman' Michels wrote:

> Jesper Lund wrote:
> > Been there, done that. But when I do that, it seems that mlmmj uses
>> the same relayhost to deliver all messages pr. posting, via the same
>> relayhost. I believe that from posting to posting, it will use
>> different relayhosts.
>
> If the host ttl is low enough, this may be right.

mlmmj shouldn't be looking at ttl.

> I guess that it will
> use the "first" reply from dns as long as its valid. Then it *may*
> switch...

It's best not to guess, but to "use the source, Luke".

mlmmj-send creates only a single socket, and sends all messages over that 
socket. It only calls gethostbyname once, and uses the first address 
returned (which will have been randomly chosen form a list if multiple A 
records exist). There is no reuse, switching or expiry of addresses.

Jesper, it's not just a matter of changing the format or interpretation of 
the relayhost configuration item, you'd need to substantially redesign 
mlmmj-send.
