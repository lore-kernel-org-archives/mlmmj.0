From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Tue, 12 Oct 2010 07:29:04 +0000
Subject: Re: [mlmmj] mlmmj-maintd recursively
Message-Id: <4CB40E40.30208@oldelvet.org.uk>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
In-Reply-To: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



On 12/10/2010 04:35, Ben Schmidt wrote:
> On 12/10/10 1:33 PM, Thomas Goirand wrote:
>>
>> ----- Original message -----
>>>> find /var/spool/mlmmj/ -mindepth 1 -maxdepth 1 -type d \
>>>> -exec /usr/bin/mlmmj-maintd -F -d {} \;
>>>
>>> Actually, on my system it looks like the trailing slash should be
>>> omitted, too, or there is a double slash in the argument passed to
>>> mlmmj-maintd. Probably doesn't matter, but is a little unconventional,
>>> so I'll take the slash out of the docs.
>>>
>>> Ben.
>>
>> Using the shell, you add a \
>> to tell that you want to go to the line but \
>> you haven't finished your sentence... :)
>>
>> Thomas
>
> No, I meant the forward slash at the end of /var/spool/mlmmj/. With it,
> on my system, find gives things such as
>
> /var/spool/mlmmj//test-list
>
> to the command it executes. Note the double slash. It's arguably a bug
> in my find command, probably doesn't happen in other implementations,
> and doesn't affect the interpretation of the path, at least on my
> system, but it's more usual not to have the double, and removing the
> trailing slash and just using /var/spool/mlmmj achieves this.
>
> I left the backslash in. That's perfectly common shell syntax that
> anyone competent should recognise.
>

The trailing \; is generally required too. Without it the shell can/will 
treat the ; as a command separator rather than a command argument. Some 
versions of find may be happy without the ; at the end of exec but not 
all are.

Regards

Richard

