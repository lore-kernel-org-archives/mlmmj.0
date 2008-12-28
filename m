From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Sun, 28 Dec 2008 23:27:12 +0000
Subject: mlmmj-1.2.16 released
Message-Id: <1230506832.4226.46.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi list,


I've just uploaded the mlmmj-1.2.16 release. There is only one change
since mlmmj-1.2.16-RC1, which is a fix for a vulnerability in
contrib/web/perl-user discovered by Gerd von Egidy. Exploitation allows
an attacker to control headers and the body of mails sent by mlmmj.cgi,
enabling him to deliver spam. Thanks for the fix.

http://mlmmj.mmj.dk/files/mlmmj-1.2.16.tar.bz2
9ea7ba91ccb55b9edf3e5148537364e3

http://mlmmj.mmj.dk/files/mlmmj-1.2.16.tar.gz
2e113f5571c6f00de18b8dc1777abc4e


The following changes have been made since mlmmj-1.2.15:

 o Fixed injection in contrib/web/perl-user (Gerd von Egidy)
 o Updated Dutch listtexts (Franky Van Liedekerke)
 o Updated Italian listtexts (Fabio Busatto)
 o Added Postfix pipe backend support (Niki Guldbrand)
 o PHP admin interface bugfix (Niki Guldbrand)
 o Added support for static bounce addresses (Thomas Jarosch)
 o Added a sanity check in mlmmj-receive-strip (Chris Webb)
 o Added miscellaneous sanity checks (Thomas Jarosch)
 o Disabled digest mails when 'noarchive' is set (Thomas Jarosch)
 o Added Russian listtexts (Nikolay Derkach)
 o Fixed mmap()ing of zero-sized files (Robin H. Johnson)
 o Fixed mlmmj-recieve [sic] for architectures where
   sizeof(int) and sizeof(char *) differ
 o Added support for the 'originalmail' keyword (Sascha Sommer)
 o Merged various changes to the web interface from Franky Van Liedekerke


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


In addition, the following is missing in the RU translation: "Below this
line are the first 100 lines of the message up for moderation"

And this is missing in ES, FR and RU: "Below this line are the first
100 lines of the denied message"

Can somebody translate it?


I hope that I can manage to speed up the release cycle, so mlmmj-1.2.17
will be out in about half a year.


Have fun,
Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

