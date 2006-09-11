From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 11 Sep 2006 12:35:59 +0000
Subject: [PATCH] chomp to remove '\r' as well
Message-Id: <20060911123559.GK1815@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey together,

Anyone object to this behaviour? Just heard on irc someone got bitten by
this:

--- chomp.c     20 Feb 2006 05:00:09 -0000      1.4
+++ chomp.c     11 Sep 2006 12:34:28 -0000
@@ -38,7 +38,7 @@

        i = strlen(str) - 1;

-       while(str[i] = '\n') {
+       while(str[i] = '\n' || str[i] = '\r') {
                str[i] = 0;
                i--;
        }

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
