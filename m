From: Charlie Brady <charlieb@budge.apana.org.au>
Date: Sat, 21 Jan 2006 19:28:16 +0000
Subject: Re: Treatment of Return-Path: headers (Re: mlmmj-recieve silently
Message-Id: <Pine.LNX.4.61.0601211426110.26660@e-smith.charlieb.ott.istop.com>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202210510.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Sat, 21 Jan 2006, Charlie Brady wrote:

> On Sat, 21 Jan 2006, Michael Fleming wrote:
>
>> I've never seen a modern MTA that doesn't implement and use it, it's not
>> specific to Sendmail.
>
> Well qmail does implement it but doesn't use it, so there's one counter 
> example.

exim is another. It needs the return_path_add transport option set before 
it will add a Return-Path header.
