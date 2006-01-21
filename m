From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 19:10:50 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone	using
Message-Id: <Pine.LNX.4.61.0601211403280.26660@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sat, 21 Jan 2006, Mads Martin Joergensen wrote:

> * Charlie Brady <charlieb@budge.apana.org.au> [Jan 21. 2006 03:58]:
>>>> Would it be possible that mlmmj discrads the message because of the
>>>> Delivered-To:?
>>>
>>> Yes.
>>
>> Why would it do that? Is mlmmj-recieve's full behaviour documented
>> anywhere other than in the code?
>
> It's never mlmmj-recieve that does it, but mlmmj-process. All
> mlmmj-recieve does, is just writing the mail raw to the incoming/
> directory.

OK.

> And no, documentation is missing. I never said we were all done
> everywhere, there's stuff missing in places. But this is a sparetime
> project, and so far no time was found for this.

I'm not meaning to sound critical, and especially not personally critical. 
Software is always a "work in progress".  My reason for asking about the 
documentation is that it would be simpler to correct whatever was causing 
the discarding of messages on Thomas's system if it could be determined by 
reading the documentation about what the exact requirements are.

>>> It will find the delimiter "-" and try to use the rest
>>> ("gplhost-com-test-subscribe") as a command, where it should only have
>>> used "subscribe".
>>
>> It seems to me that you are assigning semantics to the content of
>> Delivered-To headers which are not warranted. What you really should be
>> looking at is the original envelope recipient address. Where qmail is the
>> MTA, that address (in both raw and parsed form) is available in
>> environment variables, so there should be no need to parse Delivered-To
>> headers. Does any other MTA provide a Delivered-To header?
>
> Postfix does pr. default, and the rest of them can be configured to put
> the envelope to, in that header. If we don't get that header, mlmmj is
> using the To: header.

I'm sure that you know this, but the To: header can't be relied upon to 
have any correlation with the envelope recipient address.

