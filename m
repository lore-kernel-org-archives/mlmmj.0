From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 18 Jan 2006 10:19:10 +0000
Subject: mlmmj-1.2.10 bugfix release
Message-Id: <20060118101910.GS87652@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

This release wasn't scheduled already, but due to a pretty nasty bug in
the new find_email_adr() function in 1.2.9, it's going out now. There's
also a little extra than just this bugfix:

1.2.10
 o Fix nasty bug in the new 1.2.9 find_email_adr() making comma in
   quoted text in From: being discarded as invalid
 o Simply make all addresses lowercase before doing anything else
   wrt. sub/unsub and bounce
 o Add czech listtexts (Lukas Hluze)
 o Make non list emails (subconf, moderation etc.) also honor relayhost
   and smtpport
 o Add tunable to be able to close for subscription only (closedlistsub)

Enjoy, and upgrade those 1.2.9 boxes. http://mlmmj.mmj.dk/files

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
