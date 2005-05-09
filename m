From: Jakob Hirsch <jh@plonk.de>
Date: Mon, 09 May 2005 16:25:53 +0000
Subject: Re: 1.2.6.1 (Was Re: 1.2.6 released. No more queue littering ...)
Message-Id: <427F8F11.5090801@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <20050509074717.GJ87309@mmj.dk>
In-Reply-To: <20050509074717.GJ87309@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:

>>You mean it's possible that listaddr is not set (or not correct) when 
>>generate_subscribed in mlmmj-sub.c is called? I don't see that right 
>>now. What am I missing?
> It was unsub-notsubscribed, sorry. Anyway; Here's an excerpt from
> mlmmj-unsub.c (1.2.6 one) line 432:

The change is in both mlmmj-unsub.c and mlmmj-unsub.c.

>  if(is_subbed_in(subddirname, address)) {
>          /* Address is not subscribed */
>          myfree(subddirname);
>          myfree(listaddr);
> 
>          printf("%s is not subscribed to %s.\n", address, listaddr);
>          generate_notsubscribed(listdir, listaddr, address, mlmmjsend);

Because of myfree(listaddr) and using listaddr after that, right? Then 
using listaddr in printf is also not ok.
Wouldn't it be easier to move to myfree(listaddr) below the printf and 
generate_notsubscribed?

And in mlmmj-sub.c listaddr is not freed in the block where 
generate_subscribed is called.
