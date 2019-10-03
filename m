From: Martin Brampton <martin@black-sheep-research.com>
Date: Thu, 03 Oct 2019 15:54:32 +0000
Subject: [mlmmj] Not quite working
Message-Id: <8db56057-d61f-56d7-4de2-4d70f3e18302@black-sheep-research.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi

Is this list active? I'm hoping so.

I've added mlmmj to my Postfix based mail server. Seem to have got at 
least some of the way. Created a list test-list@yorkshiremail.com.

But sending mail to the test list results in a bounce with the message:


<yorkshiremail.com--test-list@localhost.mlmmj> (expanded from
     <test-list@yorkshiremail.com>): Command died with status 1:
     "/usr/bin/mlmmj-receive"


Mail log has:
Oct  3 16:37:25 mx /usr/bin/mlmmj-receive[24159]: mlmmj-receive.c:122: 
Could not stat /var/spool/mlmmj/list-dir: No such file or directory
Oct  3 16:37:25 mx postfix/pipe[24158]: EFA709E271: 
to=<yorkshiremail.com--test-list@localhost.mlmmj>, 
orig_to=<test-list@yorkshiremail.com>, relay=mlmmj, delay=1.1, 
delays=1.1/0.01/0/0.02, dsn=5.3.0, status=bounced (Command died with 
status 1: "/usr/bin/mlmmj-receive")


What can I look at to figure out what's wrong? I'm not clear why there 
is a reference to /var/spool/mlmmj/list-dir when the list is test-list.

Best regards, Martin


-- 
Martin Brampton, Black Sheep Research
martin@black-sheep-research.com
http://black-sheep-research.com
Tel: +44 1653 696210 or +1 585 939 7885
Mobile: +44 7771 787010
Office: 4 York Road, Malton, North Yorkshire, YO17 6AX, UK.

