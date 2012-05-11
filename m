From: theo borm <theo_mlmmj@borm.org>
Date: Fri, 11 May 2012 12:42:38 +0000
Subject: Re: [mlmmj] mlmmj and spf
Message-Id: <4FAD093E.8010207@borm.org>
List-Id: <mlmmj.mlmmj.org>
References: <4FACFAE7.60904@borm.org>
In-Reply-To: <4FACFAE7.60904@borm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Thanks

I already contacted the organization and they replied: your server is 
not under our control, so therefore we will not put it in our SPF 
records (...). Check of the actual spf records reveals that microsoft, 2 
/16 subnets, a few ISPs and a couple of others are already in there. 
Must be a very powerful organization to control all these.

Mlmmj as-is doesn't appear to have a way to *rewrite* headers. I can 
delete and insert headers no problem, but nothing in the way of 
rewriting or variable substitution on headers.

I just had a look at the sources. Hacking support for this into 
mlmmj-process.c/do_all_the_voodoo_here.c looks doable.

regards, Theo



do_all_the_voodoo_here

On 05/11/2012 01:46 PM, Marc MAURICE wrote:
> Hello Theo,
>
> The facts that the organization put this SPF means that the 
> organization doesn't want to allow mail comming from @organization.org 
> to be sent by external, non whitelisted servers.
>
> Either ask the organization to add your server to the SPF, if possible.
> Or install the mlmmj on a server already whitelisted (probably not 
> possible).
>
> Otherwise the only solution I see is rewriting the From header as you 
> said. You can always add the original sender in a header, or in the 
> mail body (is it possible to add the sender in the body with mlmmj?)
>
> From my little knowledge...
>
> Regards,
> Marc
>
>
>
>
>
> On 11/05/2012 13:41, theo borm wrote:
>> Dear list members,
>>
>> We operate a small, closed, moderated mailing list that recently 
>> stopped working for a large part of its subscribers. The organization 
>> of which these subscribers are a member maintains an SPF record which 
>> denies access to all servers except a named few, which seems to be 
>> the cause of these problems.
>>
>> As a work-around I set mlmmj to use a different from address in the 
>> "From:" header. This solution is, however, plainly bad as it removes 
>> the original sender from the headers. I have seen other lists use 
>> "Sender:" header, but results are a mixed bag. With strict SPF 
>> checking of the "From:" header in place these mails also don't pass.
>>
>> What would be the correct solution?
>>
>> any help, pointers greatly appreciated.
>>
>> regards, Theo
>>
>>
>>
>>
>




