From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 01 Sep 2004 08:59:24 +0000
Subject: mlmmj-1.0.0-RC3
Message-Id: <20040901085924.GA68017@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

Thanks to Luca Mercuri and Allan Joergensen for help with testing this
one. The ChangeLog has it as usual:

1.0.0-RC3
 o NULL and 0 are not the same on 64-bit platforms, so fix execlp(..., 0); to
   be execlp(..., NULL);
 o Add web-interface (PHP). Thank you Christoph Thiel
 o Have the random numbers be somewhat longer everywhere and not just somewhere
 o Move free() to where it belongs fixing problems with mlmmj-process some
   people have been seen
 o Fix printing of cron entry in mlmmj-make-ml.sh

I urge people to upgrade from mlmmj-1.0.0-RC{1,2} ASAP allthough they've
not seen any problems.

http://mlmmj.mmj.dk/files/mlmmj-1.0.0-RC3.tar.gz
http://mlmmj.mmj.dk/files/mlmmj-1.0.0-RC3.tar.bz2

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
