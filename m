From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 27 Jan 2012 05:37:54 +0000
Subject: Re: [mlmmj] [patch] man page fixes
Message-Id: <4F223832.3050201@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BD224.40908@goirand.fr>
In-Reply-To: <4F1BD224.40908@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

On 27/01/12 3:47 PM, Thomas Goirand wrote:
> On 01/24/2012 12:39 AM, Ben Schmidt wrote:
>>>> It seems Debian is non-standard in requiring UTF-8 man pages, as Groff
>>>> does not support UTF-8 input:
>>>> http://www.gnu.org/software/groff/manual/html_node/Input-Encodings.html
>>>
>>>  From the same page:
>>> "By its very nature, -Tutf8 supports all input encodings"
>>>
>>> So it's absolutely standard (and recommended).
>>
>> My interpretation of this is, "When the output/terminal encoding is
>> UTF-8, naturally all supported input encodings can be accommodated,
>> since Unicode is a superset of them all." (The paragraph then explains
>> how other output encodings have restrictions on which input encodings
>> they can accommodate.)
>>
>> That doesn't by any means mean that UTF-8 is a supported input encoding.
>> On the contrary, since it's not on the list of supported input
>> encodings, and there is no documentation regarding how to instruct groff
>> that its input is UTF-8, I believe it isn't. If Debian supports it, they
>> must have patched groff, or just be happily sweeping the issue under the
>> carpet (if groff thinks everything is Latin-1 I presume it will just
>> handle text transparently, so it might not matter if it is actually fed
>> and outputs UTF-8 rather than Latin-1--until complicated wrapping or
>> collation gets involved).
>
> This doesn't make sense at all. If there's a parameter to use UTF-8, how
> could it be not supported?

The parameter is to *output* UTF-8 not *input* UTF-8.

http://www.gnu.org/software/groff/manual/html_node/Groff-Options.html

=91-Tdev=92
     Prepare output for device dev. The default device is =91ps=92, unless
     changed when groff was configured and built. The following are the
     output devices currently available:
...
     utf8
	For typewriter-like devices which use the Unicode (ISO 10646)
	character set with UTF-8 encoding.

Input encodings are supported via a hack abusing the more generic macro
functionality which powers a lot of groff, I believe:

=91-mname=92 [e.g. -mlatin2]
     Read in the file name.tmac. Normally groff searches for this in its
     macro directories. If it isn't found, it tries tmac.name (searching
     in the same directories).

Output is much easier to implement than input (you just change what
bytes you stuff into the stream to represent a given character, rather
than needing to implement some kind of parser or state machine that can
recognise multi-byte character sequences, normalise text, etc.). It's
also a much higher priority as man pages are viewed much more frequently
than they are written or edited. So it's no surprise to me that groff
only supports UTF-8 output, not input.

Cheers,

Ben.




