From: "Magnus Naeslund(k)" <mag@kite.se>
Date: Mon, 25 Sep 2006 21:33:06 +0000
Subject: Re: mlmmj on Solaris
Message-Id: <45184B12.7010506@kite.se>
List-Id: <mlmmj.mlmmj.org>
References: <977bf0eb5c4db442b2e7aeeecd3afec8@mail.n0rd.dk>
In-Reply-To: <977bf0eb5c4db442b2e7aeeecd3afec8@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Morten K. Poulsen wrote:
>>>> 2.
>>>> 	/bin/sh in Solaris is Posix shell and is much more strict than /bin/sh
>>>> on linux (which i think is just bash). mlmmj-make-ml.sh needs..
>>>>
>>>> 	#!/bin/bash
>>> Which features of bash are needed in the script now? Would it be
>> possible to change it to not use those features?
>>
>> it fails first with 'let', don't know after that. I switched to bash.
> 
> Ok, any shell scripting gurus on the list? :)
> 

Well, I don't want to claim such a title...
But does 

	/bin/sh -c "echo $((1+1))"

result in "2" for you, Rob?
If it does we could switch to using that syntax, since we're only using "let" in one place.
It works with zsh, tcsh, ksh and bash on my box.

Regards,
Magnus
