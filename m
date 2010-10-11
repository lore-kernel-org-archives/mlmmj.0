From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 11 Oct 2010 22:13:35 +0000
Subject: Re: [mlmmj] mlmmj-maintd recursively
Message-Id: <4CB38C0F.6080909@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
In-Reply-To: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 12/10/10 12:59 AM, Thomas Goirand wrote:
>>> at least on Ubuntu, it has to read
>>>
>>> find /var/spool/mlmmj/ -mindepth 1 -maxdepth 1 -type d -exec
>>> /usr/bin/mlmmj-maintd -F -d {} \;
>>>
>>> (you were missing the -exec)
>>
>> Oops! Thanks. Fixed.
>>
>> Ben.
>
> When I wrote "hint", in meant:
>
> "I'm using something unchecked from the top of my head, please test
> anything before writing a doc, or using it in production"
>
> :)

Yeah, I did try it out; you actually got it right the first time anyway,
IIRC. The -exec just got lost when the -m..depth options were added and
I didn't notice. So it tested fine, but when I copy/pasted for the docs,
it wasn't. My oops, not yours!

:-)

> So yes, the correct way was:
>
> find /var/spool/mlmmj/ -mindepth 1 -maxdepth 1 -type d \
> 	-exec /usr/bin/mlmmj-maintd -F -d {} \;

Actually, on my system it looks like the trailing slash should be
omitted, too, or there is a double slash in the argument passed to
mlmmj-maintd. Probably doesn't matter, but is a little unconventional,
so I'll take the slash out of the docs.

Ben.





