From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Tue, 28 Sep 2010 23:21:18 +0000
Subject: [mlmmj] Potential mail loss in postfix?
Message-Id: <robbat2-20100928T230341-934503680Z@orbis-terrarum.net>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi

Noticed something, and I don't have a testcase for it yet unfortunately
or a suitable setup to re-test on. Instead I've got my analysis of the
problem how it's occurred twice now.

- Using verp and postfix together first of all (string 'postfix' in the
  verp file, '100' in maxverprecips).
- Pick a list with a lot of subscribers.
  - This leads to a case where the mlmmj-send invocation takes several
	minutes to complete for a normal list mail.
- (optional) set postfix to hold incoming mail, and you can release it
  just at the right moment to see it be mlmmj-recieve.
- The postfix log will show delivery to mlmmj-recieve.
- mlmmj.operation.log will contain a line from mlmmj-process stating
  that the message was allowed (by your access rules).
- Now, while mlmmj-send is running, you're going to execute a normal
  shutdown of postfix: 'postfix stop' [1]
- The mail will be lost completely now. There is no record of it in
  archive, or any of the queues :-(.

[1] The description for 'postfix stop': Stop the Postfix mail system in
an orderly fashion. If possible, running processes are allowed to
terminate at their earliest convenience.

-- 
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

