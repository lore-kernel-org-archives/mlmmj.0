From: Thomas Goirand <thomas@goirand.fr>
Date: Mon, 07 Mar 2011 08:18:16 +0000
Subject: Re: [mlmmj] Google Summer of Code
Message-Id: <4D7494C8.9020009@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
In-Reply-To: <AANLkTi=N6TUvhAPjxrR=iR3gJc_LQXCXR+kxSUqPL_bp@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 03/07/2011 12:31 AM, Moritz Wilhelmy wrote:
> Hi,
> 
> On Sun, Mar 06, 2011 at 11:32:09PM +0800, Thomas Goirand wrote:
>> IMHO, using C for writing web interfaces is both counter-productive and
>> a security risk. 
> 
> Not really any more than writing an MLM in C...
> IMHO, C is perfectly fine, as long as the programmers know what they're doing.
> A not-insignificant part of your operating system is written in C, and you
> don't consider that a security risk, do you?

That part isn't facing the web.

You write thing in C when you need things to be fast. Here, for just
browsing the archive, I don't see the point. It's using a carrier to
cross a river...

> I'd still prefer not to use a DB at all. The idea that everything needs to be 
> backed by a full-fledged database with access control and whatever is a common
> mistake in computing.> For something as simple as mlmmj, UNIX permissions should
> suffice.

Yes, I agree 100%.

Thomas

