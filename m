From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Thu, 09 Sep 2004 10:19:03 +0000
Subject: mlmmj-1.0.0 is out
Message-Id: <20040909101902.GA32501@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

After a few more bugs were squished, lots of code were stared at
and a lot of testing it's no point to not get it out there.

 http://mlmmj.mmj.dk/files/mlmmj-1.0.0.tar.gz
 http://mlmmj.mmj.dk/files/mlmmj-1.0.0.tar.bz2

The ChangeLog has it as usual--it might seem like a lot of changes for a
final release, but it's not. It only looks like a lot because the
ChangeLog is a lot more fine grained.

1.0.0
 o Replace index() with strchr()
 o Add parenthesis around realloc call to make sure we alloc correctly
 o Make header matching case insensitive
 o Fix dumping of addresses to requeue
 o Make the time an address can bounce before unsubscribed configurable with
   listdir/control/bouncelife
 o Correct mlmmj-make-ml.sh cronentry line to include -F
 o Add manual pages. Thanks Soeren Boll for the initial ones
 o Make random numbers lowercase hex since gmail is lowercasing the address
   it replies to.
 o Also make sanity check in mlmmj-maintd to ensure it's invoke either
   as root or as listdir owner

BTW: If anyone is interested in using digests with their lists, there's going
to be a patch out the coming days--just need some more testing, but it's
written already.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
