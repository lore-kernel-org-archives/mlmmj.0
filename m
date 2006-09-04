From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 04 Sep 2006 19:42:08 +0000
Subject: mlmmj-1.2.12-RC1 released
Message-Id: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi list,

I am proud to present the first release candidate with me as maintainer.

It can be downloaded from:

e6abe5c31c811ba67d335f870066c834
http://mlmmj.mmj.dk/files/mlmmj-1.2.12-RC1.tar.bz2

47d56f5e6fb500a5fc56ee4b5dfbd000
http://mlmmj.mmj.dk/files/mlmmj-1.2.12-RC1.tar.gz


There has been a lot of bug fixes and enhancements since mlmmj-1.2.11. All of
the changes have been tested, and some of them have been tested for months in
production environments. This is the ChangeLog:

1.2.12-RC1
 o Update web interface with new tunables
 o Add support for qmail (envelope from address in environment variable)
 o Add digest text part
 o Add subscriber moderation
 o Fix default subject in administrative mails
 o Add French listtexts (Christophe Gallienne)
 o Add search and pagination functionality to the perl-admin web interface
 o Only add To: header when sending out actual list mail
 o Close stdin, stdout and stderr in the child of mlmmj-receive after
   forking. This is neccesary on FreeBSD.
 o No need to check for subscribers in 0-sized files
 o Make sure chomp works with empty strings (Frank Denis)

If your patch is not included, please re-send it.


The following tunables have been added:

 - submod                       (list)

   If this file is present, subscription will be moderated by owner(s).
   If there are emailaddresses in this file, then these will be used
   instead of owner.

 - nodigesttext                 (boolean)

   If this file exists, digest mails won't have a text part with a thread
   summary.


The following text files have not yet been translated, they are just English
stub files. Some are new, some have been missing for some time. If you are
maintaining a translation, please send me the translated files. I do not
consider the translated text files a show-stopper, so I will go ahead and
release mlmmj-1.2.12 without them.

cz
- digest
- sub-subscribed
- submod-moderator
- submod-requester
- unsub-notsubscribed

da
- digest
- submod-moderator
- submod-requester

de
- bounce-probe
- digest
- submod-moderator
- submod-requester

es
- digest
- submod-moderator
- submod-requester

fr
- digest
- submod-moderator
- submod-requester
- unsub-confirm-digest

it
- digest
- submod-moderator
- submod-requester


Have fun,
 Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

