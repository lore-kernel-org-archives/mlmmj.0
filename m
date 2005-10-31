From: Neale Pickett <neale@woozle.org>
Date: Mon, 31 Oct 2005 03:19:51 +0000
Subject: new find_email_adr.c
Message-Id: <200510302019.51940.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

This patch to my previous post removes two debugging statements, and fixes a 
bug that showed up when people used bare email addresses in the headers.  For 
instance:

  To: neale@woozle.org

instead of

  To: Neale Pickett <neale@woozle.org>

would trigger the bug (and bounce email).

I don't know if anybody's even tried my new find_email_adr.c, I haven't gotten 
any feedback on it yet.  It works for me, so far.  You can find the whole 
file--which fixes email-parsing problems (I think), and which may be dropped 
into src/--at http://woozle.org/~neale/repos/mlmmj/src/find_email_adr.c (part 
of a darcs repository).

Neale

--- find_email_adr.c	2005-10-10 13:14:54.000000000 -0600
+++ /home/neale/src/import/mlmmj/src/find_email_adr.c	2005-10-30 
20:07:40.000000000 -0700
@@ -83,12 +83,16 @@
 
 	if (name = NULL)
 		return (NULL);
-	if (strchr(name, '(') = NULL && strchr(name, '<') = NULL
-	    && strchr(name, ' ') = NULL)
-		return (name);
 
 	/* We assume that length(input) <= length(output) */
 	nbuf = mymalloc(strlen(name) + 1);
+
+	if (strchr(name, '(') = NULL && strchr(name, '<') = NULL
+	    && strchr(name, ' ') = NULL) {
+		strcpy(nbuf, name);
+		return (nbuf);
+	}
+
 	gotlt = 0;
 	lastsp = 0;
 	bufend = nbuf;
@@ -200,7 +204,6 @@
 			p += 1;
 		}
 
-		printf("cur: %s\n", cur);
 		while(cur && ((' ' = *cur) ||
 			    ('\t' = *cur) ||
 			    ('\r' = *cur) ||
@@ -213,7 +216,6 @@
 
 		adr = skin(cur);
 		if (adr) {
-			printf("adr: %s\n", adr);
 			retstruct->emailcount++;
 			retstruct->emaillist = (char **)myrealloc(retstruct->emaillist,
 					  sizeof(char *) * retstruct->emailcount);
