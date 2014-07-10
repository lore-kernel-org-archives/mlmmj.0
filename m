From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 10 Jul 2014 07:54:01 +0000
Subject: Re: [mlmmj] Allowing empty enevelope senders
Message-Id: <53BE4699.4000709@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <3154844.GYFGS8R0Q3@storm>
In-Reply-To: <3154844.GYFGS8R0Q3@storm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 8/07/14 6:59 PM, Thomas Jarosch wrote:
> I've found a good description why an empty envelope is a valid thing
> according to RFC 821, page 15:
> http://marc.merlins.org/netrants/nullenvelope.txt

That link correctly identifies empty envelope senders as used for bounce
messages.

Furthermore, as you've identified, the mails are being discarded by
Mlmmj, not the mail server. The mail server accepts them, meeting the
requirements of the RFC and the document above. Mlmmj discards them,
because they should not be delivered to the mailing list.

If they are getting to that point in Mlmmj, it probably means VERP is
not working/misconfigured, because bounce messages should come back to
listname+bounces and get handled by mlmmj-bounce so bouncing users are
automatically unsubscribed (which helps prevent your mail server getting
blacklisted, among other things).

Ben.




