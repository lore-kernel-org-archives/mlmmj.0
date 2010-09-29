From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 29 Sep 2010 06:38:36 +0000
Subject: Re: [mlmmj] stripping HTML and attachments
Message-Id: <4CA2DEEC.2080801@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTi=KdahgYbnTd2oqH-qvondgrr4CG=kdnVrS_77e@mail.gmail.com>
In-Reply-To: <AANLkTi=KdahgYbnTd2oqH-qvondgrr4CG=kdnVrS_77e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mlmmj doesn't directly support content filtering such as this, nor does it yet 
have any dedicated way to 'plug in' an external content filter.

However, by piping the mail through a filter before it reaches Mlmmj, this kind of 
thing can be done. Have a look at this:

http://mlmmj.org/archive/mlmmj/2010-01/1635.html

The patch made it into the 1.2.17.1 Mlmmj tarball, so you can easily download it 
if you want to give it a try. It uses altermime to add a footer. I believe 
altermime can also be used to do other MIME-related tasks such as stripping 
html/attachments, so you can probably modify the script slightly to get it to do 
what you want. If you manage it, please write back and let us know how you did it!

(Someone else may yet have a different/better solution, so perhaps it's worth 
waiting a while before trying.)

Smiles,

Ben.



On 29/09/10 12:17 AM, Florian Effenberger wrote:
> Hi,
>
> is there an easy way of stripping HTML and attachments from incoming posts?
>
> Thanks,
> Florian
>
>
>


