From: Michael Erdely <merdely@gmail.com>
Date: Fri, 29 Jul 2005 17:46:46 +0000
Subject: mlmmj with OpenBSD's sendmail
Message-Id: <72aa2990507291046a93884d@mail.gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

I'm trying to get mlmmj running on OpenBSD 3.6 (and then, soon, OpenBSD 3.7).

I'm using a virtual users table in sendmail with the following entry:
mlmmj-test@mydomain.com  mlmmj-test-mydomain.com

I have an /etc/mail/aliases entry:
mlmmj-test-mydomain.com: "|/usr/local/bin/mlmmj-recieve -L
/var/spool/mlmmj/mlmmj-test/"

I've successfully subscribed to my test list.  When I try to send
email to it, it ends up in queue/discarded.

I used mlmmj-make-ml.sh to create the list.  Ran chown -R daemon
/var/spool/mlmmj.

Ideas?  Can I provide more useful info?

Thanks.

-- 
http://erdelynet.com/

Support OpenBSD! http://www.openbsd.org/orders.html
