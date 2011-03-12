From: Moritz Wilhelmy <ml+mmj@wzff.de>
Date: Sat, 12 Mar 2011 00:04:56 +0000
Subject: [mlmmj] hardcoded delimiter in mlmmj-process.c?
Message-Id: <20110312000456.GM24920@barfooze.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Dear list,

Today, I found some references to listname-moderators@listdomain by
accident, but the delimiter is +.
From mlmmj-1.2.17.1/src/mlmmj-process.c:127 (139 in tip), it seems this
is hardcoded to -:

> to = concatstr(3, listname, "-moderators@", listfqdn); /* FIXME JFA: Should this be converted? Why, why not? */

This baffled me a bit. It says FIXME, but not what is subject to be
fixed. Assuming that the FIXME is about the minus, I don't see why it
should *not* be changed to use the same delimiter that's used everywhere
else...

Best regards,

Moritz

