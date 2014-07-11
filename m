From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 11 Jul 2014 22:37:36 +0000
Subject: Re: [mlmmj] Allowing empty enevelope senders
Message-Id: <53C06730.6040301@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <3154844.GYFGS8R0Q3@storm>
In-Reply-To: <3154844.GYFGS8R0Q3@storm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 11/07/14 5:40 PM, Thomas Jarosch wrote:
> On Friday, 11. July 2014 06:55:39 Ben Schmidt wrote:
>>> the problem here is a bit more complex: The mlmmj managed mailinglist
>>> gets the replies from a separate newsletter that is not managed by
>>> mlmmj.
>>> So the return path of that newsletter is set to an address
>>> that is managed by mlmmj :)
>>>
>>> Would you be ok with if I develop a patch to make
>>> the "discard of empty envelope address" configurable?
>>> Default is to keep the current behavior.
>>
>> I'm not convinced yet. Why would you want these bounce messages
>> delivered to the mailing list? It seems to me that such a feature is
>> just asking for trouble on the whole.
>
> the list is read by a bunch of poor human souls that have to unsubscribe
> the bounced recipients manually from the newsletter system.
>
> But as this is asking probably for more trouble, we've now
> moved the recipients of the mlmmj list to a pure postfix based "list".
> That seems to do the job.

That seems like the right solution to me. It seems unlikely to me you
need a full-featured MLM in this scenario, as you shouldn't need
automatic bounce handling, subscription management, archives, etc. for
your 'bunch of poor human souls'.

Cheers,

Ben.




