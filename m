From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sun, 20 Mar 2016 12:26:55 +0000
Subject: Re: [mlmmj] Poster message's Message-ID in References of List's message
Message-Id: <56EE970F.2020402@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <ccdc0ac0-7d7b-492a-a83f-7845f33e2d3b@equaeghe.nospammail.net>
In-Reply-To: <ccdc0ac0-7d7b-492a-a83f-7845f33e2d3b@equaeghe.nospammail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 20/03/2016 9:46 pm, Erik Quaeghebeur wrote:
> On zaterdag 19 maart 2016 06:13:07 CET, Ben Schmidt wrote:
>>
>> I don't think Mlmmj discards the message ID. For instance, your mail
>> arrived in my inbox via Mlmmj with:
>>
>> Message-ID: <ccdc0ac0-7d7b-492a-a83f-7845f33e2d3b@equaeghe.nospammail.net>
>>
>> So if the message ID is disappearing for you, it's either a bug
>> somewhere, or the administrator has requested it be done (e.g. via
>> Mlmmj's delheaders tunable). "Message ID" is used as an example of the
>> delheaders tunable, so I guess some people do see this as a good idea
>> and/or decide it must be a good idea if its in the docs.
>
> In case this is intentional, is there a way to add the original Message-ID to the
> References?

Not in Mlmmj itself. It could potentially be done with a script, much
like how custom footers are generally implemented (see README.footers).

Ben




