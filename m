From: "Mehul N. Sanghvi" <mehul.sanghvi@gmail.com>
Date: Thu, 31 May 2007 04:15:41 +0000
Subject: Re: virtual domain support
Message-Id: <465E4BED.9020700@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <464DAF4C.1030800@gmail.com>
In-Reply-To: <464DAF4C.1030800@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Christian Laursen said the following on 5/18/2007 10:07 AM:
> "Mehul N. Sanghvi" <mehul.sanghvi@gmail.com> writes:
> 
>>      How does mlmmj work with virtual domains ?   Is there a document
>> that someone can point me to that has guidelines for it ?
> 
> It's actually quite simple. In your virtual file you make an entry for
> each list like this:
> 
> listname@virtualdomain.example.com      mlmmj-virtualdomain.example.com-listname
> 
> 
> And then, also for each list, make an entry in your aliases file like this:
> 
> mlmmj-virtualdomain.example.com-listname:     "/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/virtualdomain.example.com/listname"
> 
> 
> Of course you can choose your directory layout and alias names any way
> you like, but this should give you the general idea.
> 

I have the following setup:

---- /etc/postfix/virtual ----

# mlmmj mailing lists
mlmmj-test@VHOST.TLD          mlmmj-test

---- /etc/postfix/virtual ----


---- /etc/aliases ----

mlmmj-test:  "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/"

---- /etc/aliases ----


In trying to send a message to the list I get the following entries in the
/var/log/mail.log file:

May 30 23:54:51 REAL_HOST postfix/pickup[17476]: 1E1AD51BB7: uid00 
from=<USER@VHOST.TLD>
May 30 23:54:51 REAL_HOST postfix/cleanup[17674]: 1E1AD51BB7: 
message-id=<20070531035451.GA17663@VHOST.TLD>
May 30 23:54:51 REAL_HOST postfix/qmgr[2870]: 1E1AD51BB7: 
from=<USER@VHOST.TLD>, sizeT6, nrcpt=1 (queue active)
May 30 23:54:51 REAL_HOST postfix/smtpd[17679]: connect from 
localhost.localdomain[127.0.0.1]
May 30 23:54:51 REAL_HOST postfix/smtpd[17679]: NOQUEUE: reject: RCPT from 
localhost.localdomain[127.0.0.1]: 504 5.5.2 <REAL_HOST>: Helo command rejected: 
need fully-qualified hostname; from=<mlmmj-test+bounces-help@VHOST.TLD> 
to=<USER@VHOST.TLD> proto=SMTP helo=<REAL_HOST>
May 30 23:54:51 REAL_HOST /usr/bin/mlmmj-send[17678]: mlmmj-send.c:241: Error 
in RCPT TO. Reply = [504 5.5.2 <REAL_HOST>: Helo command rejected: need 
fully-qualified hostname^M ]: Success
May 30 23:54:51 REAL_HOST postfix/smtpd[17679]: disconnect from 
localhost.localdomain[127.0.0.1]
May 30 23:54:51 REAL_HOST postfix/local[17676]: 1E1AD51BB7: 
to=<mlmmj-test@ISP-SIDE.DNS-NAME.DOMAIN.TLD>, orig_to=<mlmmj-test@VHOST.TLD>, 
relay=local, delay=0.34, delays=0.09/0.03/0/0.23, dsn=2.0.0, status=sent 
(delivered to command: /usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test/)
May 30 23:54:51 REAL_HOST postfix/qmgr[2870]: 1E1AD51BB7: removed



Why is getting rejected ? I would like mlmmj to use the VHOST.TLD in the HELO 
rather then the REAL_HOST, is that possible ?  How so ?


cheers,

      mehul

-- 
Mehul N. Sanghvi
email: mehul.sanghvi@gmail.com
