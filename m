From: "Steffen (Daode) Nurpmeso" <steffen@sdaoden.eu>
Date: Thu, 25 Feb 2016 15:38:27 +0000
Subject: [mlmmj] [PATCH 2/6] mlmmj-send.c:main():memorymailsize: handle sizeof(long)!=sizeof(ssize_t) cases
Message-Id: <58d6176c10815a534c71dc7c7447ed192bed79b4.1456413512.git.steffen@sdaoden.eu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

---
 src/mlmmj-send.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/src/mlmmj-send.c b/src/mlmmj-send.c
index c4165ca..38c3a83 100644
--- a/src/mlmmj-send.c
+++ b/src/mlmmj-send.c
@@ -995,8 +995,12 @@ int main(int argc, char **argv)
 	memmailsizestr = ctrlvalue(listdir, "memorymailsize");
 	ctrlarchive = statctrl(listdir, "noarchive");
 	if(memmailsizestr) {
-		memmailsize = strtol(memmailsizestr, NULL, 10);
+		long mmsi = strtol(memmailsizestr, NULL, 10);
+
 		myfree(memmailsizestr);
+
+		if ((memmailsize = (ssize_t)mmsi) != mmsi)
+			memmailsize = -1;
 	}

 	if(memmailsize = 0)
--
2.7.1

