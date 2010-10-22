From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Fri, 22 Oct 2010 14:44:42 +0000
Subject: Re: [mlmmj] reply-to and reply-to-sender
Message-Id: <4CC1A35A.2040005@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <1287748105.2377.24.camel@mbs-laptop>
In-Reply-To: <1287748105.2377.24.camel@mbs-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 23/10/10 12:50 AM, Thomas Goirand wrote:
> On 10/22/2010 09:23 PM, Ben Schmidt wrote:
>> To get a reply-to-list behaviour, you should include a List-Post header
>> (and other List-* headers are also recommended).
>>
>> RFC2369, RFC2919.
>>
>> Ben.
>
> Can you elaborate? If my list is list@example.org, what should I set as
> header in MLMMJ, so that people don't reply to me by default?
>
> Thomas

When I say 'get a reply-to-list behaviour' I mean 'have that kind of
reply made available as an option', not that it will be the default.

And I believe if you actually follow the standards, that's all you can
do.

I believe the thinking behind the standards is that whether reply to
author or reply to list is the default should be dictated by the mail
client or user preference, not the mail/list.

There are heaps of people (myself included) who think this is something
that a list should be able to dictate. And some (myself included) do
abuse Reply-To in order to get that behaviour. When you do so, though,
you do lose the ability to reply to the author--particularly if the
author actually set a Reply-To header, as it will have been lost, and
mail sent to the From address might not go anywhere useful.

Of course the Sender header is typically abused by mailing lists, too.
Though the standards clearly say it should be the address of a real
person responsible for sending the mail, which, at a stretch, could be
the mailing list owner, more often than not, the mailing list posting
address is used, by my observation.

Unforunately email standards and email practice don't always have too
strong a connection. This is another good reason to try to document this
stuff, and/or provide reasonable defaults with Mlmmj, IMHO, as it is
pretty hard to sort this kind of stuff out since neither following the
spec nor doing 'what everyone else does' is necessarily best.

(Disclaimer: I'm far from an expert!)

Smiles,

Ben.





