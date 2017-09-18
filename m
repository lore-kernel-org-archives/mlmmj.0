From: Zhang Huangbin <zhb@iredmail.org>
Date: Mon, 18 Sep 2017 07:02:43 +0000
Subject: [mlmmj] Ideas to improve mlmmj
Message-Id: <1599BD67-6339-45B6-A33D-B1D9E3279D3A@iredmail.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Dear all,

i’d like to share my few ideas to improve mlmmj.

1) LMTP support (for cluster setup)

mlmmj should be able to run as a LMTP server and accept emails sent
from (LAN) network. This should be useful for running mlmmj in a cluster
setup: Run mlmmj on the same server as the LDA/LMTP servers, and store
mailing list data (and mailboxes) on remote/shared storage.

With current mlmmj document, we can only run mlmmj on MTA server
(for example, mlmmj is called by Postfix as a piped program which cannot
be a script on another server). Run mlmmj as LMTP server should fix this.

2) Hook support to interactive SQL/LDAP/... database.

Many sysadmins setup mail servers with virtual mail accounts stored in
SQL/LDAP databases, below 2 ideas should be very helpful to make mlmmj
working very well with existing mail servers with any SQL table structure
or LDAP schema.

- `mlmmj-make-ml`: Add a hook to run external command/script, so that sysadmin
  can add mailing list account in SQL/LDAP/... database.

  For example, after `mlmmj-make-ml` finishes its own tasks, executes script
  `/etc/mlmmj/hook-make-ml`, and sysadmin can use this script to sync mailing
  list accounts to SQL/LDAP.

- `mlmmj-sub` and `mlmmj-unsub`: Add a hook to run external command/script, so
  that sysadmin can add or remove the mailing list member in the SQL/LDAP/…
  databases.
  data. For example, storing mailing list accounts in SQL db, and sync list
  members.

  For example, after `mlmmj-sub` finishes its own tasks, executes script
  `/etc/mlmmj/hook-sub`, and sysadmin can use this script to sync new mailing
  list members to SQL/LDAP.

- `mlmmj-bounce`: Add a hook to run external command/script to handle
  non-existing/invalid member email addresses.

----
Zhang Huangbin, founder of iRedMail project: http://www.iredmail.org/
Time zone: GMT+8 (China/Beijing).
Available on Telegram: https://t.me/iredmail


