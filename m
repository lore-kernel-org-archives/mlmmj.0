From: "B. Cook" <bcook@poklib.org>
Date: Mon, 06 Nov 2006 20:15:19 +0000
Subject: why isn't it sending?..
Message-Id: <454F97D7.9070200@poklib.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


   PID USERNAME       THR PRI NICE   SIZE    RES STATE  C   TIME   WCPU 
COMMAND
  5399 mailnull         1 115    0  1308K   788K CPU1   1   4:29 99.02% 
mlmmj-send


mailnull  5399 98.4  0.2  1308   788  ??  R     3:08PM   5:33.10 
/usr/local/bin/mlmmj-send -L /var/spool/mlmmj/listname -m 
/var/spool/mlmmj/newswire/moderation/5cf0db9911c1178c.sending

There are like 5k users in this testing set..

whats going on?

it's like 'hung' at the b's ..
