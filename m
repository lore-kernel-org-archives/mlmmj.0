From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Fri, 25 Jun 2004 08:29:42 +0000
Subject: mlmmj-0.8.1
Message-Id: <20040625082942.GG10372@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey people,

It's time for another version, since we cannot be nesting bugfixes and
nice features :)

The ChangeLog has it:

0.8.1
 o Go through all open() calls and retry in case we (allthough it's extremely
   unlikely) did get EEXIST
 o Add the option to add a To: header including the recipient emailaddress.
   NOTE that this does not remove any existing To: headers, they should be
   removed in control/delheaders
 o Optimize mlmmj-send by preparing the mail in memory to reduce the amount of
   write syscalls. control/memmailsize (size in bytes) controls how big it can
   be. Default is 16k before it's send line by line.
 o Make sure we check if the Subject: prefix might be present in the
   de-quoted printable version of the Subject. If so, don't add it.
 o Fix bug with queuefilename not being correctly initialized when generating
   standard mails
 o Let mlmmj-send be capable of handling relayhost local users bounce probes
   bouncing.
 o Don't litter the queuedirectory with files when rejecting mails (the
   maintenance daemon would take care of it, but lets be nice)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
