From: Sebastian Lipp <bacuh@riseup.net>
Date: Fri, 15 Mar 2013 15:54:18 +0000
Subject: Re: [mlmmj] feature: resending capability
Message-Id: <20130315155418.GA20269@eee.fritz.box>
List-Id: <mlmmj.mlmmj.org>
References: <20130304142712.GA19707@eee.fritz.box>
In-Reply-To: <20130304142712.GA19707@eee.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 2013-03-16 01:47, Ben Schmidt wrote:
> However, doesn't your solution also require subscribers to take manual
> action? They would need to add the
> 
>     X-RESEND-TO: $external_recipient
> 
> directive to the mail body.

It would. But that way every subscriber is able to instantly see the mistake
and step in.

> It's also not completely easy to parse mail bodies. They can be base64
> encoded, etc., have multiple MIME alternatives (e.g. plain text and
> HTML, and the order isn't always the same), and it all depends on the
> user's MUA.

Didn't think about that...

> I wonder if we can think of a better solution.
> 
> One thought I have is this: Make Mlmmj, for *non-subscribers only* set a
> variable Reply-To header including the extra recipient. So the external
> sender would send a message to Mlmmj, and Mlmmj would send that message
> to all list subscribers with a header something like
> 
>     Reply-To: mylist+cc-external_address=theirdomain.tld@mydomain.tld
> 
> so when someone replies, it would go to the list address with additional
> information after the delimiter. Mlmmj would receive the reply along
> with the additional information, and include the extra address in the
> recipient list when distributing the post.

Nice idea. But I want the possibility to discuss stuff from external
people to find an appropriate answer and afterwards send out the reply
on request. Your solution is only half way by having several people
being able to reply and seeing each other's reply.

As I understand your suggestion any reply to such a mail from outside
would also go outside.

-- 
basti

