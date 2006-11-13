From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Mon, 13 Nov 2006 21:30:24 +0000
Subject: Re: mlmmj-process dies with "free(): invalid next size"
Message-Id: <50234.192.168.2.9.1163453424.squirrel@192.168.2.4>
List-Id: <mlmmj.mlmmj.org>
References: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
In-Reply-To: <3629.130.83.236.83.1163172510.squirrel@130.83.185.210>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, November 13, 2006 16:00, Christoph Wilke wrote:
> On Sun, November 12, 2006 22:32, Morten K. Poulsen wrote:

[...]

>>
>>> I tested it with the attached mailfile -- error
>>> the same file, but without the equal signs -- no error

[...]

>>> the same file, but only an equal sign as subject -- error.
>>
>> There was a bug in cleanquotedp() that would cause it to read past
>> the
>> end of its buffer, if there was an equal sign within the last two
>> bytes of the subject.
>>
>> I have fixed that issue now:
>>
>> http://mlmmj.mmj.dk/~mortenp/patch-mlmmj-1.2.12_RC4-cleanquotedp.diff
>>
>> However, I belive that this is a seperate bug. Was the glibc error
>> message for this case the same as the error message for the first
>> case?
>
> I will test this later. Not much time at the moment...

With the full subject I get:

# /root/mlmmj/mlmmj-1.2.12-RC4/src/mlmmj-process -L
/var/spool/mlmmj/test -m
/var/spool/mlmmj/test/incoming/647f4170739768df
*** glibc detected *** free(): invalid next size (normal): 0x08055260 ***
Aborted
#

with the equal sign, it results in:

# /root/mlmmj/mlmmj-1.2.12-RC4/src/mlmmj-process -L
/var/spool/mlmmj/test -m
/var/spool/mlmmj/test/incoming/647f4170739768df
*** glibc detected *** free(): invalid next size (fast): 0x080551c8 ***
Aborted
#

Ciao
Chris
