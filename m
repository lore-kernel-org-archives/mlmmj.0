From: "Cameron B. Prince" <cplists@princeservices.com>
Date: Tue, 23 Jan 2007 06:14:17 +0000
Subject: Additional Information for FC6/Sendmail problem
Message-Id: <00b101c73eb5$b69c0770$0401a8c0@PSLAPTOP1>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello again,

Since my attempts to get mlmmj going last night, I have been receiving an
email from cron which lists this error:

/bin/sh: /usr/bin/mlmmj-maintd -F -L /var/spool/mlmmj/tesla/: No such file
or directory

I ran the command at the console and this is being reported in the log:

Jan 23 00:09:04 p2 /usr/bin/mlmmj-send[11378]: mlmmj-send.c:243: Error in
MAIL FROM. Reply = [553 5.3.0
<test+bounces-confsub-770e4345edd654b-cameron=mydomain.com@domain.com>...
User Unknown^M ]: No such file or directory


Any thoughts as to what may be going wrong?

Thanks,
Cameron

