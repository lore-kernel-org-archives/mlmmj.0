From: Mark Alan <varia@e-healthexpert.org>
Date: Fri, 21 Jan 2011 21:08:42 +0000
Subject: [mlmmj] ezmlm-like single command to subscribe an user?
Message-Id: <4d39f5ea.47f3d80a.0fcc.fffff1c2@mx.google.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hello list,

I am not being able to find info about the proper command to
subscribe an user like ezmlm does:
listname+subscribe-some.user=example.com@domain.tld

Meaning: subscribe user some.user@example.com to list
listname@domain.tld

We would like to migrate from ezmlm to mlmmj, but keeping in place the
Drupal ezmlm module <http://drupal.org/project/ezmlm> to let our users
subscribe to our mailing lists.
Given an user email address that module changes the @ in the user's
address into a = , then adds prefix 'listname+subscribe-' and then
adds a trailing '@domain.tld', producing the canonical ezmlm/qmail format:
listname+subscribe-some.user=example.com@domain.tld


Regards,

M.

