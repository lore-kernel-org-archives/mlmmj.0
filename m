From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 12 Mar 2012 17:30:33 +0000
Subject: [mlmmj] Mlmmj 1.2.18a1 released
Message-Id: <4F5E32B9.6090908@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

An alpha release for the upcoming Mlmmj 1.2.18 has been published. Find
it on the downloads page[1]. Please help test it if you can and report
bugs using our bug tracker[2] or here on the discussion mailing list.
Also please report successes to help gain confidence in the quality of
the code. Please also contact me (the maintainer, Ben Schmidt) if you
can help with code review.

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
just one (no matter which unsubscribe address is used).

It has only been minimally tested and not all changes have been reviewed
yet, so there will probably be some bugs, possibly some nasty ones,
waiting to be found. Any and all help with code review and testing will
be greatly appreciated.

Following further code review and testing, a beta version and/or release
candidate will be published.

Ben.



[1] http://mlmmj.org/downloads
[2] http://mlmmj.org/bugs
[3] mlmmj.org/hg/mlmmj/file/RELEASE_1_2_18a1/ChangeLog




