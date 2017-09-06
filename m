From: Zhang Huangbin <zhb@iredmail.org>
Date: Wed, 06 Sep 2017 15:20:49 +0000
Subject: [mlmmj] ANN: mlmmj-admin: a RESTful API server used to manage mlmmj mailing list accounts
Message-Id: <A1C5CC73-7B43-4599-BC27-23F8EFF6BBA1@iredmail.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Dear all,

As promised, we’re working on a RESTful API server used to manage mlmmj mailing list accounts. And we decide to release the source code (GPL v3) today, if you’re interested in such project, join us.
https://bitbucket.org/iredmail/mlmmj-admin/src

Summary:

* Works with Python (2.6, 2.7).
* API endpoints and parameters:
   https://bitbucket.org/iredmail/mlmmj-admin/src/default/docs/API.md

* SQL/LDAP integration

If you store mail domains/users in SQL/LDAP database, you can write your
own Python module to interactive with your SQL/LDAP database. Document:
https://bitbucket.org/iredmail/mlmmj-admin/src/default/docs/backends.md

* For iRedMail users

Please follow document `integration-iredmail-*.md` to integrate mlmmj
(WARNING: still in beta state, don’t try it on production server):
https://bitbucket.org/iredmail/mlmmj-admin/src/default/docs/

Notes:

*) Most mlmmj parameters are supported, but we try to make the parameter
   names easy to understand, so we use long (custom) parameter names in
   API requests. For example:

modonlypost (mlmmj) -> only_moderator_can_post (API)
subonlyget -> only_subscriber_can_get_old_posts
nosubconfirm -> disable_subscription_confirm
nonomailsub -> disable_nomail_subscription
notifymod -> notify_poster_when_moderated
notifysub -> notify_owner_when_sub_unsub
notmetoo -> disable_send_copy_to_sender

Like it or hate it, let us know.

Feedback, contributions are always welcome. :)

----
Zhang Huangbin, founder of iRedMail project: http://www.iredmail.org/
Time zone: GMT+8 (China/Beijing).
Available on Telegram: https://t.me/iredmail


