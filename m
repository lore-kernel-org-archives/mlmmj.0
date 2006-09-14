From: Sven 'Darkman' Michels <sven@darkman.de>
Date: Thu, 14 Sep 2006 17:59:11 +0000
Subject: Mails in incoming cause of "invalid from"
Message-Id: <4509986F.7040802@darkman.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi there,

i've a box running 1.2.11 for some time now. Today after someone asked
me if everything is okay, because his mail disappeared i found his mail
along with another one from him in incoming. Any idea how to find out
whats wrong with the mails? operations log didn't show anything, but
i found this in my mail logs:
Sep  9 17:35:04 pamphlet /usr/bin/mlmmj-process[22106]: 
mlmmj-process.c:591: Discarding 
/var/spool/mlmmj/ccc-ffm//incoming/5dc2658876e70a91 due to invalid 
From:: No such fil
e or directory
Sep  9 17:35:04 pamphlet /usr/bin/mlmmj-process[22106]: 
mlmmj-process.c:594: fromemails.emaillist[0] = my@benjamin-oette.de : No 
such file or directory
Sep  9 17:35:04 pamphlet /usr/bin/mlmmj-process[22106]: 
mlmmj-process.c:594: fromemails.emaillist[1] = Adnan Vatandas 
[mailto:vatandas@rz.uni-frankfurt.de]  : No such file
  or directory

The "wrong" from is in the mail, not in the header, which makes me
wondering... (its a forwarded message in the original message..)

Regards,
Sven
