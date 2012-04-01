From: Dave Taylor <ddt@davetaylor.name>
Date: Sun, 01 Apr 2012 23:41:07 +0000
Subject: [mlmmj] upgrade woes
Message-Id: <DC64AAAA-8FD5-4479-B1C8-8CF117922EE5@davetaylor.name>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi folks,

I run two mlmmj mailing lists.  One of them called "table" is moderated, one isn't.  In upgrading my Debian Linux box, I forgot that upgrading mlmmj would happen automatically, and it upgraded to Debian package 1.2.17-2 (on squeeze).  Whoops.  Whatever happened in the upgrade, the unmoderated list still seems to work, but the moderated "table" list now sends emails to the moderator with blank payloads:

> From: table_owner@thetable.biz
> To: table-moderators@thetable.biz
> ReplyTo: table_moderate-40f76e2c40f76e2c@thetable.biz
> Subject: mlmmj administrativa
> Sent: Mar 30, 2012 10:48 AM
> 
> 
> To accept, send a message to:
> table_moderate-40f76e2c40f76e2c@thetable.biz
> 
> The following moderators have received this mail:
> geoffreybryan@gmail.com
> 
> 
> --- below this line the first 100 lines of the message up for moderation --->

If the moderator approves the post as a test, then the unmolested email will go out to the mailing list, but he can't see what he's moderating.

Any thoughts on what it might be?  I searched for subjects with "blank" and "empty" in them in the mailing list, but I couldn't find any likely hits.

Thanks so much for your help!

	=-ddt->


