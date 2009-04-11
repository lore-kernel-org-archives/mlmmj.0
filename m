From: =?UTF-8?B?UGF2ZWwgS29sw6HFmQ==?= <kolar@fzu.cz>
Date: Sat, 11 Apr 2009 08:11:22 +0000
Subject: listcontrol.c
Message-Id: <20090411101122.fd24714d.kolar@fzu.cz>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


The line 719 in listcontrol.c (version 1.2.16) contains strcmp.
Is it really the author intention (security?)? Otherwise, I would
suggest to use strcasecmp instead. (i.e. to allow the mixed case
in the owner addresss for the message to listname+list@...) 

Regards
-- 
Pavel Kolar
