From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Sat, 23 Jan 2010 19:42:12 +0000
Subject: mlmmj-1.2.17 released
Message-Id: <1264275732.3123.220.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi list,


I've just uploaded mlmmj-1-2-17. Thanks for all the patches and other
contributions. You guys make this happen.


http://mlmmj.mmj.dk/files/mlmmj-1.2.17.tar.bz2
bff8050f14f2084d661421135be685ad

http://mlmmj.mmj.dk/files/mlmmj-1.2.17.tar.gz
46af062a4249bcfbeb43be4485ebc7c3


The following changes have been made since 1.2.16:
 o Added ifmodsendonlymodmoderate tunable
 o Replaced class.FastTemplate.php with class.rFastTemplate.php in
   contrib/web/php-admin (Christoph Thiel)
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


Happy hacking,
Morten

-- 
Morten Kirkegaard Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/


