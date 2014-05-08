From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 08 May 2014 08:53:06 +0000
Subject: Re: [mlmmj] Using mlmmj with Postfix using non-virtual aliases ERROR: unknown user
Message-Id: <536B45F2.9070408@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <53663582.4080307@gmail.com>
In-Reply-To: <53663582.4080307@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

OK, cool.

Just be aware of the possible security problems detailed in README.postfix if you 
don't use a transport or similarly secure mechanism with Postfix. They might not 
matter in your setup, but you should at least be aware of them.

Smiles,

Ben.



On 8/05/14 4:25 PM, Emil Hemdal wrote:
> Hello,
>
> I followed the README instead of the README.postfix and it solved my problem!
>
> Thanks for the help!
>
> /Emil
>
>
> 2014-05-07 23:34 GMT+02:00 Ben Schmidt <mail_ben_schmidt@yahoo.com.au
> <mailto:mail_ben_schmidt@yahoo.com.au>>:
>
>         May  4 13:37:19 mydomain postfix/local[7254]: EED2181041:
>         to=<list_info+subscribe@__localhost.mlmmj>,
>         orig_to=<list_info+subscribe@__mydomain.tld>, relay=local, delay=0.14,
>         delays=0.08/0.02/0/0.04, dsn=5.1.1, status=bounced (unknown user:
>         "list_info+subscribe")
>
>     ...
>
>         My transport file contains:
>         mydomain.tld--list_info@__localhost.mlmmj mlmmj:mydomain.tld/list_info
>
>         My aliases file contains:
>         list_info:              list_info@localhost.mlmmj
>
>
>     After a very quick look, I think the transport file should read:
>
>     list_info@localhost.mlmmj mlmmj:list_info
>
>     I.e. if you're not using virtual domains, no need to include
>     mydomain.tld. The important thing is that the left hand side of
>     transport matches the right hand side of aliases
>     (list_info@loclahost.mlmmj) and the part after mlmmj: matches the name
>     of the list directory (relative to the list spool directory).
>
>     Ben.
>
>
>
>

