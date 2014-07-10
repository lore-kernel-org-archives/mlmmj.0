From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Thu, 10 Jul 2014 13:50:34 +0000
Subject: Re: Re: [mlmmj] Allowing empty enevelope senders
Message-Id: <2861823.GP7UN3AmiU@storm>
List-Id: <mlmmj.mlmmj.org>
References: <3154844.GYFGS8R0Q3@storm>
In-Reply-To: <3154844.GYFGS8R0Q3@storm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Ben,

On Thursday, 10. July 2014 17:54:01 Ben Schmidt wrote:
> On 8/07/14 6:59 PM, Thomas Jarosch wrote:
> > I've found a good description why an empty envelope is a valid thing
> > according to RFC 821, page 15:
> > http://marc.merlins.org/netrants/nullenvelope.txt
> 
> That link correctly identifies empty envelope senders as used for bounce
> messages.
> 
> Furthermore, as you've identified, the mails are being discarded by
> Mlmmj, not the mail server. The mail server accepts them, meeting the
> requirements of the RFC and the document above. Mlmmj discards them,
> because they should not be delivered to the mailing list.
> 
> If they are getting to that point in Mlmmj, it probably means VERP is
> not working/misconfigured, because bounce messages should come back to
> listname+bounces and get handled by mlmmj-bounce so bouncing users are
> automatically unsubscribed (which helps prevent your mail server getting
> blacklisted, among other things).

the problem here is a bit more complex: The mlmmj managed mailinglist
gets the replies from a separate newsletter that is not managed by mlmmj.
So the return path of that newsletter is set to an address
that is managed by mlmmj :)

Would you be ok with if I develop a patch to make
the "discard of empty envelope address" configurable?
Default is to keep the current behavior.

Thomas


