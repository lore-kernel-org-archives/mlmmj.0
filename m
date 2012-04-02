From: MERIGHI Marcus <mcmer-mlmmj@tor.at>
Date: Mon, 02 Apr 2012 10:28:08 +0000
Subject: Re: [mlmmj] upgrade woes
Message-Id: <20120402102808.GB3839@tor.at>
List-Id: <mlmmj.mlmmj.org>
References: <DC64AAAA-8FD5-4479-B1C8-8CF117922EE5@davetaylor.name>
In-Reply-To: <DC64AAAA-8FD5-4479-B1C8-8CF117922EE5@davetaylor.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

ddt@davetaylor.name (Dave Taylor), 2012.04.02 (Mon) 01:41 (CEST):
> I run two mlmmj mailing lists.  One of them called "table" is
> moderated, one isn't.  In upgrading my Debian Linux box, I forgot that
> upgrading mlmmj would happen automatically, and it upgraded to Debian
> package 1.2.17-2 (on squeeze).  Whoops.  Whatever happened in the
> upgrade, the unmoderated list still seems to work, but the moderated
> "table" list now sends emails to the moderator with blank payloads:

I once had a case where this was just an spelling error in the german
template files. In my case this was in
``share/mlmmj/text.skel/de/moderation'', watch out for $originalmail$
(I do not remember, what the spelling error was, sorry)

Bye, Marcus

> > From: table_owner@thetable.biz
> > To: table-moderators@thetable.biz
> > ReplyTo: table_moderate-40f76e2c40f76e2c@thetable.biz
> > Subject: mlmmj administrativa
> > Sent: Mar 30, 2012 10:48 AM
> > 
> > 
> > To accept, send a message to:
> > table_moderate-40f76e2c40f76e2c@thetable.biz
> > 
> > The following moderators have received this mail:
> > geoffreybryan@gmail.com
> > 
> > 
> > --- below this line the first 100 lines of the message up for moderation --->
> 
> If the moderator approves the post as a test, then the unmolested email will go out to the mailing list, but he can't see what he's moderating.
> 
> Any thoughts on what it might be?  I searched for subjects with "blank" and "empty" in them in the mailing list, but I couldn't find any likely hits.
> 
> Thanks so much for your help!
> 
> 	=-ddt->

