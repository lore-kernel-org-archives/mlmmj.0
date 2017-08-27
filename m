From: Zhang Huangbin <zhb@iredmail.org>
Date: Sun, 27 Aug 2017 03:53:52 +0000
Subject: [mlmmj] Patch: Add new option '-d' for mlmmj-make-ml to specify FQDN domain name
Message-Id: <1C002620-E45A-48BB-B7D5-2D510B33A230@iredmail.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Dear all,

I created a tiny patch to add new option '-d' for mlmmj-make-ml to specify FQDN domain name, so that we can create mailing list account without interactive. Please help review, if further modification is required, please let me know.

Note: only '-d' is not enough to get rid of interactive operation, more tiny patches are coming, but i want to make sure upstream is willing to merge the patch.

Further new options:

-o: email address of the list owner (default 'postmaster')
-l: language of this mailing list (default 'en')

----
Zhang Huangbin, founder of iRedMail project: http://www.iredmail.org/
Time zone: GMT+8 (China/Beijing).
Available on Telegram: https://t.me/iredmail


