From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 15 Mar 2013 14:47:53 +0000
Subject: Re: [mlmmj] feature: resending capability
Message-Id: <51433499.1000605@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20130304142712.GA19707@eee.fritz.box>
In-Reply-To: <20130304142712.GA19707@eee.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 16/03/13 12:13 AM, Sebastian Lipp wrote:
> On 2013-03-15 10:37, Ben Schmidt wrote:
>> I don't think I fully understand the problem.
>>
>> Wouldn't a traditional mailing list with a Reply-To header be sufficient for
>> your needs? Those on the mailing list would know to use the Reply-All button
>> to reply to both the list and the external sender, and the external sender
>> could just use Reply to reply to the list.
>>
>> Is there something I am missing?
>
> Yes. I already thought about that setup. The Problem here is that the
> external sender will get a mail that never went to the mailing list and
> thus won't have the Reply-To header unless all subscribers set it
> manually. I suspect that this will work without problems. So the reply
> of the external guy will not reach the list.

Ah, yes. That is a problem.

This is an interesting use case indeed.

However, doesn't your solution also require subscribers to take manual
action? They would need to add the

     X-RESEND-TO: $external_recipient

directive to the mail body.

It's also not completely easy to parse mail bodies. They can be base64
encoded, etc., have multiple MIME alternatives (e.g. plain text and
HTML, and the order isn't always the same), and it all depends on the
user's MUA.

I wonder if we can think of a better solution.

One thought I have is this: Make Mlmmj, for *non-subscribers only* set a
variable Reply-To header including the extra recipient. So the external
sender would send a message to Mlmmj, and Mlmmj would send that message
to all list subscribers with a header something like

     Reply-To: mylist+cc-external_address=theirdomain.tld@mydomain.tld

so when someone replies, it would go to the list address with additional
information after the delimiter. Mlmmj would receive the reply along
with the additional information, and include the extra address in the
recipient list when distributing the post.

Mlmmj already has the ability to check for non-subscribers for the
subonlypost and modnonsubposts options, manages the '+' delimiter in
many scenarios, and can 'escape' and 'unescape' addresses for VERP
bounce processing, so I don't suppose adding a CC ability would be too
hard; might just need some fancy listcontrol logic and extra commandline
switches for passing the extra recipient along.

How does this idea sound to you (and others)?

Ben.




