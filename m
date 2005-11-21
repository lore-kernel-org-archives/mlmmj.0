From: Christian Lackas <c.lackas@fz-juelich.de>
Date: Mon, 21 Nov 2005 14:43:59 +0000
Subject: mails silently discarded
Message-Id: <20051121144359.GD95376@zel726.zel.kfa-juelich.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello list,

I have just installed mlmmj-1.2.8 on a FreeBSD 6.0 using sendmail
8.13.4. By means of mlmmj-make-ml.sh, I created directories for a test
mailinglist under /var/spool/mlmmj and changed the owner of these files
to mailnull:mailnull (which is the id my sendmail uses to access those
files). Subsequently, I added an alias entry:

    mlmmj-test:  "|/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"

In mlmmj-test/control I have only two files:

    listaddress:    mlmmj-test@mydomain.de
    owner:          christian@mydomain.de

In general I followed the track of the README file.

However, all mails send to the list (even from subscribed users) are
silently moved to queue/discarded. Control mails (like help/subscribe)
work fine.

What may be the reason for the rejection? Is there a logfile that could
give me a clue?


Cheers
 Christian

-- 
Forschungszentrum Juelich       Central Institute For Electronics (ZEL)
Leo-Brandt-Strasse              52425 Juelich, Germany
Tel: +49-2461-61 2425           Fax: +49-2461-61 3990
