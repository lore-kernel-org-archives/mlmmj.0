From: Thomas Goirand <thomas@goirand.fr>
Date: Fri, 27 Jan 2012 04:47:53 +0000
Subject: Re: [mlmmj] [patch] man page fixes
Message-Id: <4F222C79.8040802@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BD224.40908@goirand.fr>
In-Reply-To: <4F1BD224.40908@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 01/24/2012 12:39 AM, Ben Schmidt wrote:
>>> It seems Debian is non-standard in requiring UTF-8 man pages, as Groff
>>> does not support UTF-8 input:
>>> http://www.gnu.org/software/groff/manual/html_node/Input-Encodings.html
>>
>> From the same page:
>> "By its very nature, -Tutf8 supports all input encodings"
>>
>> So it's absolutely standard (and recommended).
> 
> My interpretation of this is, "When the output/terminal encoding is
> UTF-8, naturally all supported input encodings can be accommodated,
> since Unicode is a superset of them all." (The paragraph then explains
> how other output encodings have restrictions on which input encodings
> they can accommodate.)
> 
> That doesn't by any means mean that UTF-8 is a supported input encoding.
> On the contrary, since it's not on the list of supported input
> encodings, and there is no documentation regarding how to instruct groff
> that its input is UTF-8, I believe it isn't. If Debian supports it, they
> must have patched groff, or just be happily sweeping the issue under the
> carpet (if groff thinks everything is Latin-1 I presume it will just
> handle text transparently, so it might not matter if it is actually fed
> and outputs UTF-8 rather than Latin-1--until complicated wrapping or
> collation gets involved).

This doesn't make sense at all. If there's a parameter to use UTF-8, how
could it be not supported?

Thomas

