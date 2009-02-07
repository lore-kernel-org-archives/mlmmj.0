From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 07 Feb 2009 13:34:04 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <20090207133404.GK4240@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Thomas Goirand <thomas@goirand.fr> [Feb 07. 2009 14:10]:
> Anyway, my question remains... Is the procedure like this:
> 
> - rename moderated with:
> mv hash hash.sending

That mv is done by mlmmj-send while sending, you should never have to do
that.

I would suggest you send a mail to a moderated list, go to the LISTDIR
and see what it looks like while it's waiting for the moderator to
reply.

You need exectly the same, but just not send a mail to moderators, but
leave the moderation action for the webinterface...

> - call the following:
> mlmmjsend -L listdir -m hash.sending
> 
> Also, pops to my mind: why should I rename the moderated message? Is it
> mandatory? Should the moderation web interface delete the moderated
> message with unlink after the call to mlmmjsend?

... and when the webinterface clicks moderate you do the same as if the
moderator replied to the mail. Just send a mail to the reply-to address
from your webserver. You know how to construct the correct reply-to when
you have access to the moderation/ directory.

And if you send the mail, then you don't have to do anything else, since
that's not needed with mail moderation either.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
