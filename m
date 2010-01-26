From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 26 Jan 2010 12:47:42 +0000
Subject: Implementing real names
Message-Id: <4B5EE46E.3080504@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

I'd like to test the water regarding this one.

A feature that I would find useful is having a membership list that includes real 
names. Likewise, it would be helpful having real names included in subscription 
and unsubscription notification emails (and subscription moderation emails) and 
possibly post moderation emails, too. This should initially come from the From: 
header of mail sent to +subscribe addresses, but should be able to be changed by 
the list owner as desired, also.

Particularly given our conservative maintainer :-) and that this could be a fair 
amount of work, and have some implementation subtleties, I think this is worth a 
bit of discussion before I dive in and try anything.

So, I'm wondering what people think of this, and how it might be implemented.

The information could be stored in subscribers.d, etc. files, but I think this is 
probably a bad idea, as all the code that uses those files would need to be 
changed to parse them.

Perhaps it would make sense to have a realnames.d? Files under that directory 
could contain email address and realname separated on a line by a tab. Searches 
similar to the search that's done for a subscriber-only list could then be done to 
look up the real name for any subscriber. The membership list could be constructed 
by carefully traversing both subscribers.d and realnames.d in step. Lookups of 
real names and the membership list could become a bit more expensive, but posting 
messages would be unaffected, and not so much code would need changing (and 
testing, etc.).

Another possibility would be to keep the data in some kind of simple database file 
that facilitated quick lookup and update. This seems a bit out-of-style with how 
mlmmj works, though.

Thoughs?

Ben.




