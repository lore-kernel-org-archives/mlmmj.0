From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Fri, 12 Nov 2004 01:42:30 +0000
Subject: mlmmj-1.1.0-RC1 released
Message-Id: <20041112014230.GA96456@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

After quite some hacking and a bit of procrastination, here's the first
release candidate of mlmmj-1.1.0.

http://mlmmj.mmj.dk/files/mlmmj-1.1.0-RC1.tar.bz2
http://mlmmj.mmj.dk/files/mlmmj-1.1.0-RC1.tar.gz

Highlights (details below):

 o -d switch for mlmmj-maintd for specifying a directory containing
   several lists that needs maintenance.
 o digests
 o 'nomail' lists where subscribers recieve no emails
 o listtexts can now be completely translated, since the subject now is
   in the files in listdir/text
 o a lot of bugfixes

Now since the listtext handling have changed, and there's a couple of
new directories and tunables, please be careful when upgrading from 1.0!

I can recommend creating a fresh temp list for comparing directory
content.

Here's the complete snippet of changes from the changelog:

1.1.0-RC1
 o Rewrite the way listtexts are managed, and in the process move the Subject:
   out into the listtext file making mlmmj completely translateable
 o Enhance perl webinterface - including group writable patch
 o Add option control/nosubconfirm which makes it possible to subscribe
   without confirmation by just sending the mail. USE WITH CARE!
 o Make files discarded by maintd end in .by-maintd to make them distinct
 o Fix off-by-one error in the function cleaning quoted printable chars
 o Close the correct fd's in mlmmj-process
 o Be consistent when using To: or Delivered-To:
 o mlmmj-unsub should also change user id to the listdir owner
 o Add support for not archiving the list by touching listdir/control/noarchive
 o Add 'nomail' version of lists. Subscribers to the nomail version are
   subscribed, but does not get any mail
 o Don't talk about changing uid in mlmmj-sub when we're not really doing it
 o Add sanity checks to disallow denial mails going to the list
 o Add digest functionality
 o Implement -d option for mlmmj-maintd to be able to supply it with a directory
   containing several listdirs, where mlmmj-maintd then will run maintenance
 o Chown option and a fix for mlmmj-make-ml.sh. Thanks Ingo Lameter

Thanks to everyone who contributed.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
