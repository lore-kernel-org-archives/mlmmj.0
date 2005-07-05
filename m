From: Casey Allen Shobe <lists@seattleserver.com>
Date: Tue, 05 Jul 2005 21:30:02 +0000
Subject: Re: footer isn't appended to multipart messages
Message-Id: <200507052130.02825.lists@seattleserver.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday 05 July 2005 15:10, Patrick Bennett wrote:
> Ahah!  You're right, the footer *is* there on the "Rich Text"
> formatted raw source, but is not appearing in the email viewer.
>  I assume this is because the footer is being appended in an
> inappropriate place/way for an HTML mail, so the email viewer is
> not interpretting the footer properly.  Will this be fixed?

Well, HTML mail is generally strongly discouraged on mailing lists.  
But it's not exactly "HTML mail", but any sort of MIME-compliant 
multipart message.  In multipart messages, the mail contains more 
than one part.  Typically that's one HTML version, and one text 
version of the message; but inconsiderate people send HTML-only 
messages, and multipart serves many other purposes.

> It isn't acceptable, IMHO, for a list recipient/subscriber to get 
> no ongoing notice of how to unsubscribe from the list... is
> there, perhaps, a subscription "reminder" function in mlmmj as
> there are in some other mailing list softwares?

There is only one thing more annoying on mailing lists than 
appending stupid user text to every single message, and that is the 
monthly password reminders that mailman sends out.  I get spammed 
with about 50 of them at about the same time every month, so I 
wrote a filter to automatically delete them to retain sanity.

(Exception:  your mailing lists are used for outgoing marketing 
purposes only, in which case you can add unsubscription 
instructions yourself since you're the only one sending mail.)

That being said, List-Subscribe, List-Unsubcribe, etc. headers 
should be present, and they don't appear to be on this list.  Does 
mlmmj support them yet?

(this is not to say that your feature request/bug report is invalid 
- it is in fact useful in some cases and should work as you expect, 
but the example you provided should be discouraged and it's also 
not the easiest thing to implement due to the varying nature of 
what the multipart messages might contain, how the HTML is 
structured, etc.)

Cheers,
-- 
Casey Allen Shobe | http://casey.shobe.info
cshobe@seattleserver.com | cell 425-443-4653
AIM & Yahoo:  SomeLinuxGuy | ICQ:  1494523
SeattleServer.com, Inc. | http://www.seattleserver.com
