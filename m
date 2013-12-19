From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 19 Dec 2013 07:01:05 +0000
Subject: Re: [mlmmj] Problems with microsoft
Message-Id: <52B299B1.3000601@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <90126ceb66d472c9ae7d603e72640bfb@swn.nu>
In-Reply-To: <90126ceb66d472c9ae7d603e72640bfb@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 19/12/13 5:32 AM, Christian Gleerup wrote:
> Hi Ben and list,
>
> I was wondering, what if I used the -B option to simulate a confirmed
> unsubscription, would that do the trick, or would this problem need a
> code patch to be solved?

I'm not sure what -B option you're talking about. The option that seems
most relevant would be the -R option to mlmmj-unsub, but I'm not sure
that it would work without a confirmation request first having been
sent. It might, though. It's certainly not intended to be used manually,
though. You can always unconditionally unsubscribe the user, without
notifying anybody, with -q -s on the commandline.

> I was thinking that, at the place where the unsubscription is finally
> effectuated. The function should do a quick cleanup in the bounce
> folder for the particullar email adress being unsubscribed.

It certainly wouldn't hurt for bounces, etc. to be cleaned up when users
are unsubscribed, if this isn't already done.

> I looked a bit at the code, but erhm, it is a  bit hard to read for
> me, if someone can point me in the right direction, I can spare some
> time to try to fix this.

The code does have some quirks, but once you get a feel for it, it's
quite straightforward.

The place to look for unsubscription logic and action, I believe, is in
the main() function for mlmmj-unsub, which you will find at the end of
mlmmj-unsub.c.

Cheers,

Ben.




