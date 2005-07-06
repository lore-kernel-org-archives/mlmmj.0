From: Casey Allen Shobe <lists@seattleserver.com>
Date: Wed, 06 Jul 2005 02:38:58 +0000
Subject: Re: footer isn't appended to multipart messages (part II: reality check!)
Message-Id: <200507060238.58342.lists@seattleserver.com>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday 05 July 2005 23:32, you wrote:
> This is absolutely true- you (that is to say, *we*, that is to
> say techie/programmer types) find this stuff very annoying. 
> However, mailing lists are used by knitting clubs too, and I, for
> one, DO NOT want the nightmare of administrating a knitting club
> mailing list that has absolutely no dependable notification of
> "how to do it yourself".

Reality check indeed:  knitting club members aren't going to have a 
clue wtf the reminder mail or appended text means.  They don't 
understand what "unsubscribing from a mailing list" is, they just 
use a particular address to talk to other club members.  If they 
want off the list, no matter how much you spam them with 
instructions, they will ask the head of the knitting club to do it.  
I'm on some lists which append unsubscription messages to every 
mail, and guess what I see posted there all the time?  empty 
messages with "unsubscribe" subjects (often with unsubscribe 
misspelled, not that it matters since that's not how the lists 
work).

Reality is, nontechy users have no interest in doing it themselves, 
and techy users know right well how to find out.  Most anyone in 
between will look up the website where they signed up to try to 
figure it out.

Also, even though Outhouse Express is not yet one of them, many mail 
clients have built-in support for List-Unsubscribe header which 
enables a button for unsubscribing from the list.

> not sure which "example" you mean

The example you asked about:  appending footers with 
subscribe/unsubscribe information.

> For other lists, on the contrary, it should be *encouraged* (see
> above)! 

I could not disagree with this statement more.  You really think 
that when I (the idiot user in this example) feel like 
unsubscribing that I'm going to wait around for the next monthly 
mail or go digging around for an old one?  No, I'm going to whine 
to the list owner or whomever I think is in charge if I can't 
figure things out, and probably just the whole list to make sure 
somebody hears me.

> 1)  I haven't found the documentation on how to enforce text-only
> mailing lists

You could filter incoming messages with something like maildrop or 
your own script.  Not sure how you'd go about mingling this with 
mlmmj, perhaps somebody else can answer that.

> 2) not sure what happens on a text-only mlmmj list when a
> multi-part msg is sent, but [it] has to handle the
> default settings of widespread [...] email clients [...].

Short answer, if you want HTML mail to reach the list, then don't 
block it.  If you care about people seeing signatures on every 
single mail (even the HTML ones), then don't allow HTML.  You can't 
(easily) have your cake and eat it too.

Long answer, you *can* have your cake and eat it too, but it will 
require substantial work on your part to reduce the messages (which 
I don't think you're actually willing to do or you might have just 
implemented multipart footer appending yourself):

* Outlook Express sends HTML and text multipart messages by default 
I believe.  You could reduce this to plain text with some parsing, 
removing the HTML part and leaving the plain text.

* At least Thunderbird sends HTML-only mail by default.  It's not 
that hard to go through and strip out HTML tags, since 99.9% of the 
time, end users never use any custom HTML anyways, and if they do, 
it's just a font or color and doesn't affect the legibility of the 
message (except for the worse).

* You will run into messages with lots of parts, where people think 
it's a good idea to tack on a VCF, HTML message, text message, 
separate parts for their spam filtering mechanism's signature, one 
for saying the mail passed their lame virus scan, and an image of 
the company's logo.  Good luck with those.

Realistic answer, chances are you will never make your knitting club 
members happy, because the majority of them cannot and will not 
understand what a mailing list even is.  You might come closest 
with the least effort by just going and signing up for yahoogroups, 
which even gives you the option to convert all incoming messages to 
HTML (*shudder*) and appends the dummy footer to every message, and 
gives them an ad-filled web-interface that they can use instead of 
email if they want to boot.

Another answer, if you just want a monthly/weekly/whatever reminder, 
just mail the list from a cron job.

Cheers,
-- 
Casey Allen Shobe | http://casey.shobe.info
cshobe@seattleserver.com | cell 425-443-4653
AIM & Yahoo:  SomeLinuxGuy | ICQ:  1494523
SeattleServer.com, Inc. | http://www.seattleserver.com
