From: "Steffen (Daode) Nurpmeso" <steffen@sdaoden.eu>
Date: Thu, 25 Feb 2016 15:38:29 +0000
Subject: [mlmmj] [PATCH 4/6] listcontrol(): be aware that ctrlvalues() can return NULL
Message-Id: <66f489ac3caecbe06fff91d6b1389e98db05272b.1456413512.git.steffen@sdaoden.eu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

---
 src/listcontrol.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/src/listcontrol.c b/src/listcontrol.c
index d0c2e14..0885573 100644
--- a/src/listcontrol.c
+++ b/src/listcontrol.c
@@ -886,15 +886,16 @@ permit:
 		if(statctrl(listdir, "nolistsubsemail"))
 			return -1;
 		owner_idx = -1;
-		owners = ctrlvalues(listdir, "owner");
-		for(i = 0; i < owners->count; i++) {
-			if(strcasecmp(fromemails->emaillist[0],
-						owners->strs[i]) = 0) {
-				log_oper(listdir, OPLOGFNAME,
-						"%s requested sub list",
-				fromemails->emaillist[0]);
-				owner_idx = i;
-				break;
+		if((owners = ctrlvalues(listdir, "owner")) != NULL){
+			for(i = 0; i < owners->count; i++) {
+				if(strcasecmp(fromemails->emaillist[0],
+							owners->strs[i]) = 0) {
+					log_oper(listdir, OPLOGFNAME,
+							"%s requested sub list",
+					fromemails->emaillist[0]);
+					owner_idx = i;
+					break;
+				}
 			}
 		}
 		if (owner_idx = -1) {
--
2.7.1

