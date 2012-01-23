From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 23 Jan 2012 00:18:57 +0000
Subject: Re: [mlmmj] [patch] Remove bashism from src/mlmmj-make-ml.sh.in
Message-Id: <4F1CA771.70909@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BC034.5060304@goirand.fr>
In-Reply-To: <4F1BC034.5060304@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

>>> Better yet, use a single command:
>>> -    echo -e "$0: invalid option\nTry $0 -h for more information."
>>> +    printf "$0: invalid option\nTry $0 -h for more information.\n"
>>
>> Are you sure this is sh compatible?
>
> The Debian "checkbashisms" script doesn't report any error with it.

Thanks to you and everyone else who confirmed this for me. It is greatly
appreciated.

>> I wonder if the echo version is perhaps more readable, and thus
>> preferable anyway, rather than single-command wizardry. What do you
>> think?
>
> I agree.

I think the majority has this view.

I'm pushing the change out now.

Ben.




