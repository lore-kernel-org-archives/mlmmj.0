From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 18 Jan 2005 13:32:20 +0000
Subject: mlmmj-1.2.0-RC2
Message-Id: <20050118133220.GM59584@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey list,

There's a couple of hard to track down bugs fixed. Bugs introduced when
the new sending scheme to support VERP was introduced.

There's also much improved logging (did it even exist before? :) of
normal list operation.

1.2.0-RC2
 o Fix uninitialized strlist
 o Add logging regular operation to mlmmj.operation.log
 o Fix the sending loop by not sending the rest of the batch in every
   iteration

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
