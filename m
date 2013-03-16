From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sat, 16 Mar 2013 23:05:13 +0000
Subject: Re: [mlmmj] feature: resending capability
Message-Id: <5144FAA9.3040804@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20130304142712.GA19707@eee.fritz.box>
In-Reply-To: <20130304142712.GA19707@eee.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 16/03/13 2:54 AM, Sebastian Lipp wrote:
> On 2013-03-16 01:47, Ben Schmidt wrote:
>> However, doesn't your solution also require subscribers to take manual
>> action? They would need to add the
>>
>>      X-RESEND-TO: $external_recipient
>>
>> directive to the mail body.
>
> It would. But that way every subscriber is able to instantly see the mistake
> and step in.
>
>> It's also not completely easy to parse mail bodies. They can be base64
>> encoded, etc., have multiple MIME alternatives (e.g. plain text and
>> HTML, and the order isn't always the same), and it all depends on the
>> user's MUA.
>
> Didn't think about that...
>
>> I wonder if we can think of a better solution.
>>
>> One thought I have is this: Make Mlmmj, for *non-subscribers only* set a
>> variable Reply-To header including the extra recipient. So the external
>> sender would send a message to Mlmmj, and Mlmmj would send that message
>> to all list subscribers with a header something like
>>
>>      Reply-To: mylist+cc-external_address=theirdomain.tld@mydomain.tld
>>
>> so when someone replies, it would go to the list address with additional
>> information after the delimiter. Mlmmj would receive the reply along
>> with the additional information, and include the extra address in the
>> recipient list when distributing the post.
>
> Nice idea. But I want the possibility to discuss stuff from external
> people to find an appropriate answer and afterwards send out the reply
> on request. Your solution is only half way by having several people
> being able to reply and seeing each other's reply.
>
> As I understand your suggestion any reply to such a mail from outside
> would also go outside.

Yes, that's correct.

I suggest that if you want to have a separate discussion without the
external user, though, the correct thing to do would be to forward their
message to the mailing list, discuss it on-list, and then have someone
reply to the *original message* when the discussion is complete. If the
external user is not actually involved in the discussion, they won't be
replying all that often, so it shouldn't be a big hassle if they reply
to an individual rather than to the list address; but the internal
replyer can always set a Reply-To header to ensure subsequent replies go
to the list if they want to. By replying to the external user's original
message, you also ensure it appears in the correct thread/conversation
from their point of view. Most MUAs these days have separate 'Reply
List', 'Reply' and 'Reply All' buttons, so this is fairly easy for
internal users--you can hand out the list address to external users who
may have questions, and the internal users can discuss by using 'Reply
List' or give the final response using 'Reply' or 'Reply All'. The only
thing they need to do is remember to set the Reply-To header when
sending the final response, if necessary.

This is less problematic than other alternatives. Requiring internal
users to add a directive to the mail body is error prone: they could
easily get the syntax or the address wrong, particularly if they are
looking up the address from an earlier message. They will not have any
support from their MUA, such as address autocompletion. Errors will
sometimes be silently ignored, and other times result in bounce
messages, but delivery to the list will succeed in both cases. That
means to fix the problem, an additional message will need to be sent to
the list, clogging people's inboxes. And that's if the problem is even
noticed, rather than the external user simply never receiving anything.
To fix this, Mlmmj would need to be able to detect errors, which is
difficult, since Mlmmj wouldn't know whether the user intended the first
line of the body to be a directive or not. Even if it could detect
errors reliably, it would still need logic added to send bounce messages
to the user in error. To be able to do any of this, it needs to parse
mail bodies, which is not trivial either.

It would be possible to get both behaviours if the solution I suggested
were implemented, but internal users would need to change the address if
they wanted to discuss the issue internally, removing the local part of
the address from the '+' delimiter. To deliver the final response, they
could just reply as normal to the original message. If that solution is
any good, we can explore it further.

But that's all I can really think of for now.

Ben.




