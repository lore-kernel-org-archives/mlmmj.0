From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 08 Feb 2005 09:54:12 +0000
Subject: mlmmj-1.2.3 released. Features added and bugs squashed.
Message-Id: <20050208095412.GE56543@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

First, I want to express a big thank you to Andrea Barisani who once
again found a pretty hard to find bug, and also helped with a lot of
testing wrt. DSN support addition.

The ChangeLog has the glory details, I can recommend an upgrade:

1.2.3
 o Only allow subscription of addresses with '@' in them
 o Fix return value from unsubscribe function
 o Add extra lock layer when accessing subscribers files
 o In case of listname+bounces-INDEX use the DSN (RFC1891) report to
   extract the bouncing address
 o Fix usage of a zero sized control/verp string
 o Make the Date: header RFC2822 conformant

http://mlmmj.mmj.dk/files/mlmmj-1.2.3.tar.gz
http://mlmmj.mmj.dk/files/mlmmj-1.2.3.tar.bz2

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
