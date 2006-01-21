From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 02:58:06 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone	using
Message-Id: <Pine.LNX.4.61.0601202149470.6540@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Fri, 20 Jan 2006, Morten K. Poulsen wrote:

> (now also sent to the list)
>
> Quoting Thomas Goirand <thomas@goirand.fr>:
>> Delivered-To: xen010503-gplhost-com-test-subscribe@xen010503.gplhost.com
> [snip]
>> Would it be possible that mlmmj discrads the message because of the 
>> Delivered-To:?
>
> Yes.

Why would it do that? Is mlmmj-recieve's full behaviour documented 
anywhere other than in the code?

> It will find the delimiter "-" and try to use the rest 
> ("gplhost-com-test-subscribe") as a command, where it should only have used 
> "subscribe".

It seems to me that you are assigning semantics to the content of 
Delivered-To headers which are not warranted. What you really should be 
looking at is the original envelope recipient address. Where qmail is the 
MTA, that address (in both raw and parsed form) is available in 
environment variables, so there should be no need to parse Delivered-To 
headers. Does any other MTA provide a Delivered-To header?

> I cannot see how we can change this in mlmmj. You should change 
> your mail server configuration.

Do you have specific suggestions as to what to change?

