From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 11 Oct 2010 11:21:48 +0000
Subject: Re: [mlmmj] mlmmj-maintd recursively
Message-Id: <4CB2F34C.9030802@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
In-Reply-To: <AANLkTi=7mc394VyH4j19zW_+jzpiCH7UXShb3supRJS9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 11/10/10 9:35 PM, Florian Effenberger wrote:
> Hi,
>
> 2010/10/6 Ben Schmidt<mail_ben_schmidt@yahoo.com.au>:
>
>>> Use the -maxdepth option then!
>>>
>>> find /var/spool/mlmmj/ -mindepth 1 -maxdepth 1 -type d \
>>>         /usr/bin/mlmmj-maintd -F -d {} \;
>>>
>>> the -mindepth 1 will remove /var/spool/mlmmj/ itself that would be
>>> otherwise listed...
>>
>> Wonderful! I should work on my find(1) voodoo.
>>
>> I have integrated this into the README for future releases. It will show
>> up in version control once I get around to pushing it.
>
> at least on Ubuntu, it has to read
>
> find /var/spool/mlmmj/ -mindepth 1 -maxdepth 1 -type d -exec
> /usr/bin/mlmmj-maintd -F -d {} \;
>
> (you were missing the -exec)

Oops! Thanks. Fixed.

Ben.





