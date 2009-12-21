From: Morten Kirkegaard Poulsen <mopo@fabletech.com>
Date: Mon, 21 Dec 2009 07:18:19 +0000
Subject: mlmmj-1.2.17-RC1 released
Message-Id: <1261379899.2091.22.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi list,


I've just uploaded mlmmj-1-2-17-RC1. Please test it, and send feedback
to the list. The sooner it's tested, the sooner it will be released.


http://mlmmj.mmj.dk/files/mlmmj-1.2.17-RC1.tar.bz2
c48c75a944292b4f8fdb20ba69ad280c

http://mlmmj.mmj.dk/files/mlmmj-1.2.17-RC1.tar.gz
5fc55a72b83e9aeca488539f96288ddf


The following changes have been made since 1.2.16:

 o Added information about digest and nomail to listhelp
   (Robin H. Johnson)
 o Fixed bug in mlmmj-maintd which caused loss of archive files in
   some requeue cases (Robin H. Johnson)
 o Added README.postfix (Jeremy Hinegardner, Andreas Schneider)
 o Added support for digest and nomail to +list (Christoph Wilke)
 o Caseinsensitive string compare for owner addr when +list is
   invoked. Spotted by Pavel Kolar.
 o Added contrib/web/php-moderation (Thomas Goirand)


The following listtexts are missing. Could somebody translate them?

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


Also, the following changes were made to the English texts. Could you
translate them to all the other languages?

listtexts/en/listhelp
+To unsubscribe from the digest of this list send a message to:
+
+$digestunsubaddr$
+
+To unsubscribe from the "nomail" version this list send a message to:
+
+$nomailunsubaddr$

listtexts/en/sub-subscribed     
+To unsubscribe from the digest of this list send a message to:
+
+$digestunsubaddr$
+
+To unsubscribe from the "nomail" version this list send a message to:
+
+$nomailunsubaddr$

listtexts/en/unsub-notsubscribed        
+To unsubscribe from the digest of this list send a message to:
+
+$digestunsubaddr$


Enjoy,
Morten

-- 
Morten Kirkegaard Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


