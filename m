From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 14 Feb 2005 23:19:03 +0000
Subject: mlmmj-1.2.4 - small features and a valgrind round
Message-Id: <20050214231903.GO59254@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

Ok, so Andrea encouraged me to go through a complete valgrind house
keeping round. And since we had a couple of requested features, now
gotten extra testing, I thought it was time to roll 1.2.4:

1.2.4
 o Spend some time making valgrind completely happy
 o Unlink totally harmless .lock files in subscribers dir
 o Make it possible to specify more than one listaddress in
   LISTDIR/control/listaddress. The first one is the "real" one.
 o Make the port to connect to controlable with LISTDIR/control/smtpport

(Yes, I know mlmmj was littering lock files in the listdir, and the
subscribers dir. It's totally harmless, and won't happen anymore.)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
