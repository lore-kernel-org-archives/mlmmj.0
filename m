From: Henne Vogelsang <hvogel@opensuse.org>
Date: Fri, 08 Sep 2006 13:29:22 +0000
Subject: default listtext dir
Message-Id: <20060908132922.GS24085@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="k+G3HLlWI7eRTl+h"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--k+G3HLlWI7eRTl+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

i frequently run into the problem that i update mlmmj and have to wade
trough all my lists and update the listtexts because some new one got
added (e.g. submod-moderator) or something is modified. 

I would like to propose a default listtext directory (like there already
is in datadir/mlmmj/text.skel). So listtexts would be searched

1. in spool/list/text/file and if not there
2. in default/file

This would mean that spool/list/text/file is just an overwrite and you
can operate lists just with default texts (no text/ dir at all). Also
comes in handy if the translations are behind etc.

The following patch implements this in prestdreply.c. The only part that
is missing is making configure setting the dir in config.h instead of
hardcoding it. What do you think?

Henne

-- 
Henne Vogelsang, Core Services
"Rules change. The Game remains the same."
			 - Omar (The Wire)

--k+G3HLlWI7eRTl+h
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-defaulttextdir.patch"

--- config.h.in
+++ config.h.in
@@ -129,3 +129,6 @@
 
 /* Define to `unsigned' if <sys/types.h> does not define. */
 #undef size_t
+
+/* Define to the location of the default listext directory */
+#define DEFAULTTEXTDIR  "/usr/share/mlmmj/text.skel/"
--- src/prepstdreply.c
+++ src/prepstdreply.c
@@ -166,8 +166,13 @@
 	infd = open(tmp, O_RDONLY);
 	myfree(tmp);
 	if(infd < 0) {
-		log_error(LOG_ARGS, "Could not open std mail %s", filename);
-		return NULL;
+		tmp = concatstr(2, DEFAULTTEXTDIR, filename);
+		infd = open(tmp, O_RDONLY);
+		myfree(tmp);
+		if(infd < 0) {
+			log_error(LOG_ARGS, "Could not open std mail %s", filename);
+			return NULL;
+		}	
 	}
 
 	listaddr = getlistaddr(listdir);

--k+G3HLlWI7eRTl+h--
