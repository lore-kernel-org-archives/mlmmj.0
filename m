From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Fri, 31 Oct 2008 22:15:47 +0000
Subject: mlmmj-1.2.16-PRE1 released
Message-Id: <1225491347.7486.22.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi list,


After a huge delay, the next mlmmj release is just around the corner.
This prerelease fixes some bugs, adds a few features and a translation.
Thanks a lot to all the contributers. Please download and test it. If I
haven't missed anything, a release candidate will follow soon.


http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.16-PRE1.tar.bz2
d0d4881f33e4d6379d363a01542c67ac

http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.16-PRE1.tar.gz
019df5be4475408b26415f03e8cf2722


The following changes have been made since mlmmj-1.2.15:

 o Added support for static bounce addresses (Thomas Jarosch)
 o Added a sanity check in mlmmj-receive-strip (Chris Webb)
 o Added miscellaneous sanity checks (Thomas Jarosch)
 o Disabled digest mails when 'noarchive' is set (Thomas Jarosch)
 o Added Russian listtexts (Nikolay Derkach)
 o Fixed mmap()ing of zero-sized files (Robin H. Johnson)
 o Fixed mlmmj-recieve [sic] for architectures where
   sizeof(int) and sizeof(char *) differ
 o Added support for the 'originalmail' keyword (Sascha Sommer)
 o Merged various changes to the web interface from Franky Van
   Liedekerke

Have I missed any patches?


The following listtext files are missing. Can somebody translate them?

cz/listfaq
cz/maxmailsize
cz/sub-deny-digest
cz/sub-deny-nomail
cz/submod-moderator
cz/submod-requester
cz/sub-subscribed
cz/unsub-notsubscribed

de/listfaq
de/sub-deny-digest
de/sub-deny-nomail

es/maxmailsize
es/sub-deny-digest
es/sub-deny-nomail
es/submod-moderator
es/submod-requester

fr/listfaq
fr/maxmailsize
fr/sub-deny-digest
fr/sub-deny-nomail
fr/submod-moderator
fr/submod-requester

it/listfaq
it/maxmailsize
it/sub-deny-digest
it/sub-deny-nomail
it/submod-moderator
it/submod-requester

nl/maxmailsize


In addition, the following is missing in the RU translation: "Below this
line are the first 100 lines of the message up for moderation"

And this is missing in FR, IT, NL and RU: "Below this line are the first
100 lines of the denied message"

Can somebody translate it?


Thanks for your patience,
Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

