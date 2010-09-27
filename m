From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 27 Sep 2010 01:00:48 +0000
Subject: Re: [mlmmj] transport maps and virtual domains
Message-Id: <4C9FECC0.7030800@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTinTwTDb9=Ok_vTxO6fatc3zAan1gy3CeTQNCskC@mail.gmail.com>
In-Reply-To: <AANLkTinTwTDb9=Ok_vTxO6fatc3zAan1gy3CeTQNCskC@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Cool. I've integrated the info into the README.postfix file for future releases.

Ben.



On 27/09/10 12:01 AM, Florian Effenberger wrote:
> Hi Ben,
>
> 2010/9/25 Ben Schmidt<mail_ben_schmidt@yahoo.com.au>:
>
>> It should be a piece of cake. Follow the instructions that you
>> referenced at http://mlmmj.org/docs/readme-postfix/ but in
>> virtual.regexp use a formula something like
>>
>> /^(list-name.*)@(domain\.com)$/    domain--${1}
>>
>> and in transport use a formula something like
>>
>> /^(domain--list-name).*$/          mlmmj:domain/list-name
>>
>> Then you put listdir in /var/spool/mlmmj/domain/list-name
>>
>> Does that make sense?
>
> you're the man, thanks a lot! Works like a charm! Has an ugly
> Delivered-To header, but these are cosmetics. :)
>
> Thanks!
> Florian
>
>
>


