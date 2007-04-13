From: Sascha Sommer <ssommer@suse.de>
Date: Fri, 13 Apr 2007 09:25:30 +0000
Subject: [PATCH] access rule to discard mails
Message-Id: <200704131125.30815.ssommer@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_Ky0HGyzdLVohIet"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

--Boundary-00=_Ky0HGyzdLVohIet
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

attached patch adds support for discard access rules.

Regards

Sascha

--Boundary-00=_Ky0HGyzdLVohIet
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mlmmj-1.2.14-discard.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mlmmj-1.2.14-discard.patch"

--- mlmmj-1.2.14.org/src/mlmmj-process.c	2007-04-13 10:00:24.000000000 +0200
+++ mlmmj-1.2.14/src/mlmmj-process.c	2007-04-13 10:44:23.000000000 +0200
@@ -56,14 +56,16 @@
 enum action {
 	ALLOW,
 	DENY,
-	MODERATE
+	MODERATE,
+	DISCARD
 };
 
 
 static char *action_strs[] = {
 	"allowed",
 	"denied",
-	"moderated"
+	"moderated",
+	"discarded",
 };
 
 
@@ -179,6 +181,9 @@
 		} else if (strncmp(rule_ptr, "moderate", 8) == 0) {
 			rule_ptr += 8;
 			act = MODERATE;
+		} else if (strncmp(rule_ptr, "discard", 7) == 0) {
+			rule_ptr += 7;
+			act = DISCARD;
 		} else {
 			errno = 0;
 			log_error(LOG_ARGS, "Unable to parse rule #%d \"%s\":"
@@ -896,6 +901,20 @@
 			exit(EXIT_FAILURE);
 		} else if (accret == MODERATE) {
 			moderated = 1;
+		} else if (accret == DISCARD) {
+	                discardname = concatstr(3, listdir,
+                                "/queue/discarded/", randomstr);
+			myfree(randomstr);
+                	if(rename(donemailname, discardname) < 0) {
+				log_error(LOG_ARGS, "could not rename(%s,%s)",
+					    donemailname, discardname);
+				myfree(donemailname);
+				myfree(discardname);
+				exit(EXIT_FAILURE);
+			}
+			myfree(donemailname);
+			myfree(discardname);
+                	exit(EXIT_SUCCESS);
 		}
 	}
 	
--- mlmmj-1.2.14.org/README.access	2007-04-13 10:00:24.000000000 +0200
+++ mlmmj-1.2.14/README.access	2007-04-13 11:00:29.000000000 +0200
@@ -13,11 +13,11 @@
 all headers are first tested against the first rule, then all headers are
 tested against the second rule, and so on.
 
-The first rule to match a header decides which action to take - allow, deny
-or moderate the post.
+The first rule to match a header decides which action to take - allow, deny,
+discard or moderate the post.
 
 The syntax is quite simple: action[ [!]regexp]
-- "Action" can be "allow", "deny" or "moderate".
+- "Action" can be "allow", "deny", "discard" or "moderate".
 - The optional "!" makes the rule a match, if NO header matches the regular
   expression.
 - "Regexp" is a POSIX.2 extended regular expression. Matching is done case

--Boundary-00=_Ky0HGyzdLVohIet--
