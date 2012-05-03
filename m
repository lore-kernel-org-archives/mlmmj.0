From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 03 May 2012 00:37:23 +0000
Subject: [mlmmj] Mlmmj 1.2.18rc1 published
Message-Id: <4FA1D343.9080001@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi, everybody!

A release candidate for Mlmmj 1.2.18.0 has been published. Find it on
the downloads page[1]. Please test it as much and as soon as possible
and report bugs using our bug tracker[2] or here on the discussion
mailing list. Also please report successes to help gain confidence in
the quality of the code. I anticipate publishing a release in a couple
of weeks if no major bugs are found.

This version contains a number of important new features:

- Richer list texts (including a new naming scheme, conditionals,
   automatic wrapping and true UTF-8 support).
- Notifying posters when their posts are being moderated.
- Not-me-too feature to avoid having the poster receiving their own
   messages.
- Ability to explicitly reject posts.
- Ability to explicitly obstruct subscriptions.
- Unsubscribe from all versions of a list at once.
- Ability to switch between different versions of a list by using
   +subscribe[-{digest|nomail|both}] ('both' means normal and digest, and
   is a 'hidden feature').
- A number of bug fixes (including fixing some bugs which could cause
   mail to be lost).
- Improved documentation.

(See the ChangeLog[3] for a more detailed list of changes.)

It is almost entirely backward-compatible. For instance, old list texts
should continue to work. The main backward-incompatible change is that
unsubscribe will now remove a user from all versions of the list, not
just one (no matter which unsubscribe address is used). Users of the
php-admin interface will also need to modify their configuration files
to define $confdir.

All code changes have been reviewed and undergone a fair amount of
testing, however the program could do with some more testing before
release. Any help with this, and all reports of success or failure, will
be greatly appreciated.

Ben.



[1] http://mlmmj.org/downloads
[2] http://mlmmj.org/bugs
[3] http://mlmmj.org/hg/mlmmj/file/RELEASE_1_2_18rc1/ChangeLog

