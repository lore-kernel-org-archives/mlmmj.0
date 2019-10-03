From: Zhang Huangbin <zhb@iredmail.org>
Date: Thu, 03 Oct 2019 16:20:38 +0000
Subject: Re: [mlmmj] Not quite working
Message-Id: <F81094EA-18F5-495F-9D0C-99A583D5FB78@iredmail.org>
List-Id: <mlmmj.mlmmj.org>
References: <8db56057-d61f-56d7-4de2-4d70f3e18302@black-sheep-research.com>
In-Reply-To: <8db56057-d61f-56d7-4de2-4d70f3e18302@black-sheep-research.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



> On Oct 3, 2019, at 11:54 PM, Martin Brampton <martin@black-sheep-research.com> wrote:
> ...
> Oct  3 16:37:25 mx /usr/bin/mlmmj-receive[24159]: mlmmj-receive.c:122: Could not stat /var/spool/mlmmj/list-dir: No such file or directory
> ...
> What can I look at to figure out what's wrong? I'm not clear why there is a reference to /var/spool/mlmmj/list-dir when the list is test-list.

The log is pretty clear: your mlmmj setup is configured to use /var/spool/mlmmj/list-dir for mailing list "test-list@".
This is controlled by the part in /etc/postfix/master.cf, i think you have improper setting. It would be better if you post mlmmj related part here so that others can help troubleshoot.

----
Zhang Huangbin, founder of iRedMail project: https://www.iredmail.org/


