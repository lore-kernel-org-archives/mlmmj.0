From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sun, 03 Feb 2008 10:43:49 +0000
Subject: Re: bouncelife and notifysub
Message-Id: <20080203104349.GH84525@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Thomas Goirand <thomas@goirand.fr> [Jan 26. 2008 19:39]:
> Hi,
> 
> I have setup a list to use notifysub. I was quite surprise to see that
> at the end of the default bouncelife, 5 of the subscribers to my list
> were removed at the same minute. In fact, it seems that there was some
> problem in some mail server with the email not reaching the destination.
> That is no problem but ... no reason is given for the unsubscribtion.

Yeah, I admit the message is the same, which is an issue.

> In fact, I was not aware of the bouncelife tunable, that I immediately
> added to our control panel. Is there a way to remove the fact that it
> will unsubscribe users of the list after the bouncelife time? Or can I
> set this value to very high like 60 days? If I do that, how often will
> MLMMJ try to send messages to these users?

Every time mlmmj-maintd is run, mlmmj tries to send mail to bouncing
users, and will do so for 60 days if you set it to that.

$ echo "60*24*60*60" | bc
5184000

Just set it to 5184000 seconds and it's 60 days. I know of people having
it on 3 months.

> I would have greatly appreciated that MLMMJ could say "I have
> unsubscribe this email address because the bouncelife is reached". Would
> it be possible to add this feature?

Yes it's possible for anyone with the time and skills to do so :-)
Patches are more than welcome.

> Thomas Goirand
> 
> P.S: I still support and love MLMMJ, and it seems that all our users at
> GPLHost do as well. It's a great software. We will continue to update
> our control panel if new option come.

Very nice to hear :)

> P.S2: when will there be AT LEAST a link from mlmmj.mmj.dk to the new
> sites that some did?

No, even better yet. We should move mlmmj.org to the new page, but the
author of the new page haven't mentioned he was ready yet.

Then mlmmj.mmj.dk will be set to redirect to mlmmj.org.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
