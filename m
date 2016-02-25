From: "Steffen (Daode) Nurpmeso" <steffen@sdaoden.eu>
Date: Thu, 25 Feb 2016 15:38:26 +0000
Subject: [mlmmj] [PATCH 1/6] mlmmj-send.c:main(): reject empty messages (early)
Message-Id: <8310fc8d58075fe1b55c043277e9c4865c08411d.1456413512.git.steffen@sdaoden.eu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

---
 src/mlmmj-send.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/src/mlmmj-send.c b/src/mlmmj-send.c
index 17e8efe..c4165ca 100644
--- a/src/mlmmj-send.c
+++ b/src/mlmmj-send.c
@@ -986,6 +986,12 @@ int main(int argc, char **argv)
 		exit(EXIT_FAILURE);
 	}

+	if(st.st_size = 0) {
+		log_error(LOG_ARGS, "Ignoring empty mail '%s'",
+			mailfilename);
+		exit(EXIT_FAILURE);
+	}
+
 	memmailsizestr = ctrlvalue(listdir, "memorymailsize");
 	ctrlarchive = statctrl(listdir, "noarchive");
 	if(memmailsizestr) {
--
2.7.1

