From: Christian Laursen <xi@borderworlds.dk>
Date: Thu, 01 Feb 2007 14:57:33 +0000
Subject: Patch to ignore empty lines in files under /control/
Message-Id: <ygfk5z23oyq.fsf@dominion.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Since empty lines in some of the files in the control dir can result in
suprising behaviour I have made a small patch that makes mlmmj ignore
those.

As far as I can see empty lines doesn't make any sense in any of the
existing tunables, so it should be safe to ignore them.

Unless there are any protests I will probably commit this change
sometime tomorrow.

Index: src/ctrlvalues.c
=================================RCS file: /home/mmj/MMJCVS/mlmmj/src/ctrlvalues.c,v
retrieving revision 1.2
diff -u -w -r1.2 ctrlvalues.c
--- src/ctrlvalues.c	19 Jun 2004 03:44:47 -0000	1.2
+++ src/ctrlvalues.c	1 Feb 2007 10:52:35 -0000
@@ -52,6 +52,8 @@
 	ret->strs = NULL;
 	while((value = mygetline(ctrlfd)) != NULL) {
 		chomp(value);
+		if (*value = '\0')
+			continue;
 		ret->count++;
 		ret->strs = (char **) myrealloc(ret->strs, sizeof(char *) *
 					(ret->count + 1));



-- 
Christian Laursen
