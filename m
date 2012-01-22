From: Thomas Goirand <thomas@goirand.fr>
Date: Sun, 22 Jan 2012 18:56:34 +0000
Subject: Re: [mlmmj] [patch] Remove bashism from src/mlmmj-make-ml.sh.in
Message-Id: <4F1C5BE2.7070503@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <4F1BC034.5060304@goirand.fr>
In-Reply-To: <4F1BC034.5060304@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 01/22/2012 09:27 PM, Ben Schmidt wrote:
> On 22/01/12 11:23 PM, Mark Alan wrote:
>> On Sun, 22 Jan 2012 15:52:20 +0800, Thomas Goirand<thomas@goirand.fr>
>> wrote:
>>
>>> -    echo -e "$0: invalid option\nTry $0 -h for more information."
>>> +    echo "$0: invalid option"
>>> +    echo "Try $0 -h for more information."
>>
>> Better yet, use a single command:
>> -    echo -e "$0: invalid option\nTry $0 -h for more information."
>> +    printf "$0: invalid option\nTry $0 -h for more information.\n"
> 
> Are you sure this is sh compatible?

The Debian "checkbashisms" script doesn't report any error with it.

> I wonder if the echo version is perhaps more readable, and thus
> preferable anyway, rather than single-command wizardry. What do you
> think?

I agree.

Thomas

