From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Fri, 11 Jul 2014 07:40:16 +0000
Subject: Re: Re: [mlmmj] Allowing empty enevelope senders
Message-Id: <3326490.5MRc325DfY@storm>
List-Id: <mlmmj.mlmmj.org>
References: <3154844.GYFGS8R0Q3@storm>
In-Reply-To: <3154844.GYFGS8R0Q3@storm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Friday, 11. July 2014 06:55:39 Ben Schmidt wrote:
> > the problem here is a bit more complex: The mlmmj managed mailinglist
> > gets the replies from a separate newsletter that is not managed by
> > mlmmj.
> > So the return path of that newsletter is set to an address
> > that is managed by mlmmj :)
> > 
> > Would you be ok with if I develop a patch to make
> > the "discard of empty envelope address" configurable?
> > Default is to keep the current behavior.
> 
> I'm not convinced yet. Why would you want these bounce messages
> delivered to the mailing list? It seems to me that such a feature is
> just asking for trouble on the whole.

the list is read by a bunch of poor human souls that have to unsubscribe
the bounced recipients manually from the newsletter system.

But as this is asking probably for more trouble, we've now
moved the recipients of the mlmmj list to a pure postfix based "list".
That seems to do the job.

Thanks for your time.

Cheers,
Thomas


