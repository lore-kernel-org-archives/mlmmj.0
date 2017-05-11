From: Geert Stappers <stappers@stappers.nl>
Date: Thu, 11 May 2017 16:22:43 +0000
Subject: [mlmmj] [PATCH 2/2] src/mlmmj-make-ml.in: use the YES from -a
Message-Id: <1494519763-1307-2-git-send-email-stappers@stappers.nl>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Replaced the test on non-zero lenght string
with an actual string compare.
---
 src/mlmmj-make-ml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/mlmmj-make-ml.in b/src/mlmmj-make-ml.in
index c93084f..58fba8d 100755
--- a/src/mlmmj-make-ml.in
+++ b/src/mlmmj-make-ml.in
@@ -135,7 +135,7 @@ fi
 ALIAS="$LISTNAME:  \"|$MLMMJRECEIVE -L $SPOOLDIR/$LISTNAME/\""
 CRONENTRY="0 */2 * * * \"$MLMMJMAINTD -F -L $SPOOLDIR/$LISTNAME/\""
 
-if [ -n "$A_CREATE" ]; then
+if [ "$A_CREATE" = "YES" ]; then
 	echo "I want to add the following to your $ALIASFILE file:"
 	echo "$ALIAS"
 
-- 
2.11.0


