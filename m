From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 29 May 2012 14:14:38 +0000
Subject: [mlmmj] Mlmmj 1.2.18.0 released
Message-Id: <4FC4D9CE.3010906@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, everybody!

I am pleased to announce that Mlmmj 1.2.18.0 has been released. Find it
on the downloads page[1].

This version contains a number of important new features:

- Richer list texts (including a new naming scheme, conditionals,
   automatic wrapping and true UTF-8 support). See README.listtexts for
   more details.
- Notifying posters when their posts are being moderated (notifymod
   tunable).
- Not-me-too feature to avoid having the poster receiving their own
   messages (notmetoo tunable).
- Ability to explicitly reject posts (exposed in new list texts).
- Ability to explicitly obstruct subscriptions (exposed in new list
   texts).
- Unsubscribe from all versions of a list at once (changed behaviour of
   +unsubscribe[-{digest|nomail}]; they now all remove the subscriber
   from all versions of the list).
- Ability to switch between different versions of a list by using
   +subscribe[-{digest|nomail|both}] ('both' means normal and digest, and
   is a 'hidden feature' not mentioned in the supplied list texts).
- Subscription ability in php-admin.

There have also been a number of bug fixes (including fixing some bugs
which could cause mail to be lost), so everybody is encouraged to
upgrade.

The documentation has also been improved.

It is almost entirely backward-compatible. For instance, old list texts
should continue to work (though upgrading them is highly recommended, as
they have been vastly improved for this version). The main
backward-incompatible change is that unsubscribe will now remove a user
from all versions of the list, not just one (no matter which unsubscribe
address is used). Users of the php-admin interface will also need to
modify their configuration files to define $confdir.

(See the ChangeLog[2] for a more detailed list of changes.)

I hope you enjoy the new version.

Ben.



[1] http://mlmmj.org/downloads
[2] http://mlmmj.org/hg/mlmmj/file/RELEASE_1_2_18_0/ChangeLog




