From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Sat, 10 Sep 2011 03:26:46 +0000
Subject: [mlmmj] Fwd: [mlmmj commits] Implement new list text naming scheme
Message-Id: <4E6AD8F6.2070408@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Could a C coder please review this changeset for me? There's nothing too
technical in it so any proficient C coder should be able to review it
adequately. It's only had a very small amount of testing so far, but
seems to work.

http://mlmmj.org/hg/mlmmj/rev/c3ee2bfaeb02

(After this, the substitution mechanism needs to be reworked, which will
need a code review, and then the new list texts can be tested. Then I
will just fix a few easy and high priority bugs before releasing a beta.
Other bug fixes and enhancements can wait for another release which I
expect will follow much more quickly.)

Ben.



-------- Original Message --------
Subject: [mlmmj commits] Implement new list text naming scheme
Date: Sat, 10 Sep 2011 06:03:15 +0300
From: mlmmj hg <noreply@mlmmj.org>
Reply-To: <noreply@mlmmj.org>
To: commits@mlmmj.org

o  changeset:   http://mlmmj.org/hg/mlmmj/rev/c3ee2bfaeb02
|  tag:         tip
|  user:        Ben Schmidt
|  date:        Sat Sep 10 12:23:40 2011 +1000
|  description:
|  Implement new list text naming scheme
|
|  Also fix a bug where the normal list text would be sent when unsubscribing
|  from the nomail version of the list
|
|  Also fix some minor documentation bugs
|
|
o  changeset:   http://mlmmj.org/hg/mlmmj/rev/9f503b69a55d
|  user:        Ben Schmidt
|  date:        Mon Mar 07 01:30:02 2011 +1100
|  description:
|  Update documentation to reflect intended changes to list text naming
|
|
o  changeset:   http://mlmmj.org/hg/mlmmj/rev/8c4064ce228e
|  user:        Ben Schmidt
|  date:        Tue Feb 22 10:16:40 2011 +1100
|  description:
|  Mark a bunch of stuff as deprecated.
|
|  Replacing some generic stuff with even more generic stuff, looking forward to
|  the day when we will do things like http://$www$.$domain$/$list$/archive.
|
|
o  changeset:   http://mlmmj.org/hg/mlmmj/rev/6f8df4842d91
|  user:        Ben Schmidt
|  date:        Tue Feb 22 10:12:42 2011 +1100
|  description:
|  Add a space to $controlN$ substitution and improve documentation.
|
|
o  changeset:   http://mlmmj.org/hg/mlmmj/rev/21265d660d19
|  user:        Ben Schmidt
|  date:        Mon Mar 07 00:30:58 2011 +1100
|  description:
|  Added forgotten ChangeLog entry
|
|




