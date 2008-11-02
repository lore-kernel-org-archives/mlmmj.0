From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Sun, 02 Nov 2008 23:21:02 +0000
Subject: mlmmj-1.2.16-PRE2 released
Message-Id: <1225668062.14901.42.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi list,


I've gotten some reminders, and have committed the following since
mlmmj-1.2.16-PRE1:

 o Updated Italian listtexts (Fabio Busatto)
 o Added Postfix pipe backend support (Niki Guldbrand)
 o PHP admin interface bugfix (Niki Guldbrand)

plus a few minor changes.

Am I still missing something?


http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.16-PRE2.tar.bz2
e3dca1c735264baf977fe649574d00ca

http://mlmmj.mmj.dk/~mortenp/mlmmj-1.2.16-PRE2.tar.gz
d6c8113f5ad4616222e77fc0fd820370


The following changes have been made since mlmmj-1.2.15:

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
 o Merged various changes to the web interface from Franky Van
   Liedekerke


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

And this is missing in FR and RU: "Below this line are the first
100 lines of the denied message"

Can somebody translate it?


Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

