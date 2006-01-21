From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 19:15:12 +0000
Subject: Re: Treatment of Return-Path: headers (Re: mlmmj-recieve silently
Message-Id: <Pine.LNX.4.61.0601211411140.26660@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sat, 21 Jan 2006, Mads Martin Joergensen wrote:

> * Charlie Brady <charlieb@budge.apana.org.au> [Jan 21. 2006 20:03]:
>>> I've never seen a modern MTA that doesn't implement and use it, it's not
>>> specific to Sendmail.
>>
>> Well qmail does implement it but doesn't use it, so there's one counter
>> example. But since the header isn't mandated, it's not safe to assume that
>> will exist for every MTA. One of the stated goals of mlmmj is mail server
>> independence, so it should be very careful about strict RFC compliance.
>
> Sure, but it's possible for every MTA to be configured to add it, ..

You can't say that, because you can't possibly know about all MTAs which 
currently exist or which might exist in the future. But you are right, it 
will usually be possible to find a way to provide it. In qmail, for 
example, it can be provided by using the command "preline", albiet at the 
cost of running an extra process.

> and I'd much rather use that one than To: in the mail message.

I presume you mean From:.
