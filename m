From: Martin Brampton <martin@black-sheep-research.com>
Date: Fri, 04 Oct 2019 09:39:59 +0000
Subject: Re: [mlmmj] List server DKIM
Message-Id: <992004bd-8f54-a462-2be5-9514ceae2cbc@black-sheep-research.com>
List-Id: <mlmmj.mlmmj.org>
References: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
In-Reply-To: <ab83734c-5acc-529a-2234-a36e4599c0bc@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 03/10/2019 22:32, A. Schulze wrote:
> 
> 
> Am 03.10.19 um 21:57 schrieb Geert Stappers:
>> MTA MLMMJ (or MLMMJ itself) should remove incoming DKIM headers,
>> and add outgoing DKIM headers  to make MTA Bob happy.
> 
> Sorry, but this seem not be the correct solution.
> 
> The simple solution to "make Bob happy" is to configure MLMML to not modify message content.
> 
> -> no ~list/control/prefix
> -> no ~list/control/footer
> 
> The complex solution is ARC
> - do DKIM validation
> - modify a message
> - DKIM sign the message as MLMMJ entity
> - ARC seal these data
> - hope, Bob trust your ARC seal
> 
> Andreas

Not sure about a solution that relies on hope :)

Prefix is clearly valuable (this list uses it) but it breaks DKIM for 
the first message of a thread). The prefix is often used to filter 
messages into a folder, or such like.

A footer is also valuable as without it lists often contain messages 
asking how to unsubscribe.

Maybe that was just stating the obvious, but it is a pity if these 
useful features have to be abandoned.

Not easy to configure DKIM signing when from address is not a managed 
domain (for me anyway). This looks helpful: 
https://serverfault.com/questions/52830/dkim-sign-outgoing-mail-from-any-domain-with-postfix-and-ubuntu

I wonder if deliverability would be helped if all mail had a DKIM header 
for the list server domain, irrespective of use of prefix and footer?

Martin

