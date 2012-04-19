From: Christoph Wilke <chris@filmkreis.tu-darmstadt.de>
Date: Thu, 19 Apr 2012 13:33:10 +0000
Subject: Re: [mlmmj] <listname>+get-<N>@<host>: index from most recent message?
Message-Id: <4F901416.7050303@filmkreis.tu-darmstadt.de>
List-Id: <mlmmj.mlmmj.org>
References: <20120417185446.GA4566@odin.tremily.us>
In-Reply-To: <20120417185446.GA4566@odin.tremily.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi,

the ID of every list mail can be found in the Return-Path header.
Just grab the latest eMail from that list (supposed you are subscribed to
it) and look it up.

Regards
Christoph Wilke

On 04/17/2012 08:54 PM, W. Trevor King wrote:
> Hi,
>
> The<listname>+get-<N>@<host>  syntax allows you to retrieve messages
> from the archives.  However, lists are indexed in the order they were
> received, so message 1 is the oldest.  I joined another mailing list
> recently where I wanted to respond to a message posted to the list
> earlier that day.  If it had been a mlmmj list, how would I retrieve
> that message to reply?  I think there should either be a new command
> (<listname>+total@<host>  ?) that returns the index of the most recent
> message, or an alternate syntax (<listname>+get+<N>@<host>  ?) that
> returns messages indexed from the most recent.
>
> On the other hand, perhaps I'm just not thinking of this the right way
> ;).
>
> Thanks,
> Trevor
>

