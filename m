From: "Steffen (Daode) Nurpmeso" <steffen@sdaoden.eu>
Date: Thu, 25 Feb 2016 15:38:31 +0000
Subject: [mlmmj] [PATCH 6/6] mlmmj-process.c:newmoderated: do not crash for empty "moderators"
Message-Id: <ff8a02d627511e7d5f7796a99f661af148e70b00.1456413512.git.steffen@sdaoden.eu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

---
 src/mlmmj-process.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/src/mlmmj-process.c b/src/mlmmj-process.c
index 4c8e959..b9bb3b9 100644
--- a/src/mlmmj-process.c
+++ b/src/mlmmj-process.c
@@ -112,7 +112,6 @@ static void newmoderated(const char *listdir, const char *mailfilename,
 		myfree(moderatorsfilename);
 		exit(EXIT_FAILURE);
 	}
-	myfree(moderatorsfilename);

 	if(statctrl(listdir, "ifmodsendonlymodmoderate"))
 		efromismod = concatstr(2, efromsender, "\n");
@@ -131,6 +130,15 @@ static void newmoderated(const char *listdir, const char *mailfilename,
 		efromismod = NULL;
 	}

+	/* no addresses in moderators control file TODO use owner? */
+	if(moderators = NULL){
+		errno = ENOMSG /*EINVAL*/;
+		log_error(LOG_ARGS, "'%s'", moderatorsfilename);
+		exit(EXIT_FAILURE);
+	}
+
+	myfree(moderatorsfilename);
+
 	if(efromismod) mls = init_memory_lines(efromismod);
 	else mls = init_memory_lines(moderators);

--
2.7.1

