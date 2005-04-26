From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 26 Apr 2005 10:31:52 +0000
Subject: mlmmj-1.2.5 released
Message-Id: <20050426103152.GC97827@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

So here we go:

1.2.5
 o Make listname+list send the list of regular subscribers to the owner
   who requested it.
 o Michael Fleming corrected some spelling / grammatical errors and made
   occasional minor clarifications in the english list texts.
 o Add README.sendmail from Andrea Barisani
 o Add README.exim4 from Jakob Hirsch
 o Skip addresses without a @ when sending
 o Set SO_KEEPALIVE for our connection socket

Most important here is to remember to copy the 'listsubs' file to
DIR/text, otherwise listname+list@domain.tld will not work.

As usual--feedback etc. is very welcome.

Enjoy,
-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
