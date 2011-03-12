From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sat, 12 Mar 2011 03:43:25 +0000
Subject: Re: [mlmmj] hardcoded delimiter in mlmmj-process.c?
Message-Id: <4D7AEBDD.2050002@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <20110312000456.GM24920@barfooze.de>
In-Reply-To: <20110312000456.GM24920@barfooze.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 12/03/11 11:04 AM, Moritz Wilhelmy wrote:
> Dear list,
>
> Today, I found some references to listname-moderators@listdomain by
> accident, but the delimiter is +.
>> From mlmmj-1.2.17.1/src/mlmmj-process.c:127 (139 in tip), it seems this
> is hardcoded to -:
>
>> to = concatstr(3, listname, "-moderators@", listfqdn); /* FIXME JFA: Should this be converted? Why, why not? */
>
> This baffled me a bit. It says FIXME, but not what is subject to be
> fixed. Assuming that the FIXME is about the minus, I don't see why it
> should *not* be changed to use the same delimiter that's used everywhere
> else...

I haven't checked the sources, but I think this is one of those "doesn't
matter" situations, because +moderators (or -moderators for that matter)
doesn't actually do anything. I.e. there is no functionality in Mlmmj
that forwards a mail to list+moderators to the moderators of the list.
It's just used as a placeholder in the To: header of moderation messages
for the sake of having *something* there. It probably should be
something more like

listname moderators :;

i.e. use some text describing the group it's being sent to, but not list
any of the addresses, or anything that looks like an address but isn't,
explicitly.

Ben.




