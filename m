From: "Steffen (Daode) Nurpmeso" <steffen@sdaoden.eu>
Date: Thu, 25 Feb 2016 15:38:30 +0000
Subject: [mlmmj] [PATCH 5/6] mlmmj-sub.c:moderate_sub(): be aware that ctrlvalues() can return NULL
Message-Id: <9c51c3591fd33a492c1589aba68dea3bdd70b13d.1456413512.git.steffen@sdaoden.eu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

---
 src/mlmmj-sub.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/src/mlmmj-sub.c b/src/mlmmj-sub.c
index 3335817..ea10632 100644
--- a/src/mlmmj-sub.c
+++ b/src/mlmmj-sub.c
@@ -108,19 +108,21 @@ static void moderate_sub(const char *listdir, const char *listaddr,

 	myfree(str);

-	submods = ctrlvalues(listdir, "submod");
 	mods = concatstr(2, listdir, "/control/submod");
 	/* check to see if there's adresses in the submod control file */
-	for(i = 0; i < submods->count; i++)
-		a = strchr(submods->strs[i], '@');
+	if((submods = ctrlvalues(listdir, "submod")) != NULL)
+		for(i = 0; i < submods->count; i++)
+			a = strchr(submods->strs[i], '@');

 	/* no addresses in submod control file, use owner */
 	if(a = NULL) {
 		/* free the submods struct from above */
-		for(i = 0; i < submods->count; i++)
-			myfree(submods->strs[i]);
-		myfree(submods->strs);
-		myfree(submods);
+		if(submods != NULL){
+			for(i = 0; i < submods->count; i++)
+				myfree(submods->strs[i]);
+			myfree(submods->strs);
+			myfree(submods);
+		}
 		submods = ctrlvalues(listdir, "owner");
 		myfree(mods);
 		mods = concatstr(2, listdir, "/control/owner");
--
2.7.1

