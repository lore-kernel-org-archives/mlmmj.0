From: Neale Pickett <neale@woozle.org>
Date: Wed, 21 Sep 2005 13:34:31 +0000
Subject: alternate value for RECIPDELIM
Message-Id: <43316167.4010700@woozle.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030504000005090305010509"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------030504000005090305010509
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I've got a mail server that's been using '-' instead of '+' for a long, 
long time now, and I can't switch it over to '+' without breaking a 
billion email addresses.  I patched the source code (patch at bottom) to 
let me use '+', and let anyone else #define a new RECIPDELIM (and have 
it work), but I don't like the patch.

It seems like the *right* thing to do would be to use something like my 
patch, where people could configure it at compile-time, but to maybe 
read /etc/mlmmj/recipdelim (if it exists) to get the RECIPDELIM.  This 
would let me go back to using the debian package with its default '+'.

Something like:

char recipdelim = 's';

{
   int fd;

   fd = fopen("/etc/mlmmj/recipdelim", "r");
   if (fd) {
     int r;

     r = fgetc(fd);
     if (r != EOF) {
       recipdelim = r;
     }

     fclose(fd);
   }
}

If this seems like a good idea to mlmmj's author, I'd be happy to work 
on a new patch to implement things this way.  In the meantime, the 
following at least lets you modify it at compile time.  (It also uses 
RECIPDELIM for Postfix's VERP stuff, which seems to be the right thing, 
but I could be wildly wrong).


--------------030504000005090305010509
Content-Type: text/plain;
 name="10_sepchar.dpatch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="10_sepchar.dpatch"

diff -ur mlmmj-1.2.8/include/mlmmj.h mlmmj-1.2.8-local/include/mlmmj.h
--- mlmmj-1.2.8/include/mlmmj.h	2005-01-15 03:53:52.000000000 -0700
+++ mlmmj-1.2.8-local/include/mlmmj.h	2005-09-19 11:30:40.000000000 -0600
@@ -28,7 +28,8 @@
 
 #define RELAYHOST "127.0.0.1"
 #define READ_BUFSIZE 2048
-#define RECIPDELIM '+'  /* XXX Warning: not changable at the moment */
+#define RECIPDELIMS "+"  /* Recipient delimiter--may only be one character long */
+#define RECIPDELIM (RECIPDELIMS[0])
 #define MODREQLIFE 604800 /* How long time will moderation requests be kept?
 			   * 604800s is 7 days */
 #define DISCARDEDLIFE 604800 /* How long time will discarded mails be kept?
diff -ur mlmmj-1.2.8/src/mlmmj-bounce.c mlmmj-1.2.8-local/src/mlmmj-bounce.c
--- mlmmj-1.2.8/src/mlmmj-bounce.c	2005-05-02 11:39:10.000000000 -0600
+++ mlmmj-1.2.8-local/src/mlmmj-bounce.c	2005-09-19 11:30:40.000000000 -0600
@@ -112,7 +112,7 @@
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
 
-	from = concatstr(5, listname, "+bounces-probe-", myaddr, "@", listfqdn);
+	from = concatstr(5, listname, RECIPDELIMS "bounces-probe-", myaddr, "@", listfqdn);
 
 	myfree(listaddr);
 	myfree(listfqdn);
diff -ur mlmmj-1.2.8/src/mlmmj-process.c mlmmj-1.2.8-local/src/mlmmj-process.c
--- mlmmj-1.2.8/src/mlmmj-process.c	2005-05-02 11:41:01.000000000 -0600
+++ mlmmj-1.2.8-local/src/mlmmj-process.c	2005-09-19 11:30:40.000000000 -0600
@@ -106,13 +106,13 @@
 
 	close(moderatorsfd);
 
-	replyto = concatstr(5, listname, "+moderate-", mailbasename, "@",
+	replyto = concatstr(5, listname, RECIPDELIMS "moderate-", mailbasename, "@",
 			    listfqdn);
 
 	maildata[1] = replyto;
 	maildata[3] = moderators;
 
-	from = concatstr(3, listname, "+owner@", listfqdn);
+	from = concatstr(3, listname, RECIPDELIMS "owner@", listfqdn);
 	to = concatstr(3, listname, "-moderators@", listfqdn);
 
 	myfree(listname);
@@ -519,7 +519,7 @@
 
 	if(recipdelim) {
 		owner = concatstr(2, listdir, "/control/owner");
-		if(owner && strncmp(recipdelim, "+owner@", 7) == 0) {
+		if(owner && strncmp(recipdelim, RECIPDELIMS "owner@", 7) == 0) {
 			/* strip envelope from before resending */
 			delheaders->count = 0;
 			delheaders->strs = NULL;
@@ -645,7 +645,7 @@
 		}
 		listname = genlistname(listaddr);
 		listfqdn = genlistfqdn(listaddr);
-		fromaddr = concatstr(3, listname, "+bounces-help@", listfqdn);
+		fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@", listfqdn);
 		queuefilename = prepstdreply(listdir, "notintocc",
 					"$listowner$", fromemails.emaillist[0],
 					NULL, 0, NULL);
@@ -686,7 +686,7 @@
 			listname = genlistname(listaddr);
 			listfqdn = genlistfqdn(listaddr);
 			maildata[1] = fromemails.emaillist[0];
-			fromaddr = concatstr(3, listname, "+bounces-help@",
+			fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@",
 					listfqdn);
 			queuefilename = prepstdreply(listdir, "subonlypost",
 					"$listowner$", fromemails.emaillist[0],
@@ -726,7 +726,7 @@
 			}
 			listname = genlistname(listaddr);
 			listfqdn = genlistfqdn(listaddr);
-			fromaddr = concatstr(3, listname, "+bounces-help@",
+			fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@",
 					listfqdn);
 			queuefilename = prepstdreply(listdir, "access",
 							"$listowner$",
Only in mlmmj-1.2.8-local/src: mlmmj-process.c.orig
diff -ur mlmmj-1.2.8/src/mlmmj-send.c mlmmj-1.2.8-local/src/mlmmj-send.c
--- mlmmj-1.2.8/src/mlmmj-send.c	2005-06-20 06:40:39.000000000 -0600
+++ mlmmj-1.2.8-local/src/mlmmj-send.c	2005-09-19 11:30:40.000000000 -0600
@@ -1043,7 +1043,7 @@
 
 		listname = genlistname(listaddr);	
 		listfqdn = genlistfqdn(listaddr);	
-		verpfrom = concatstr(5, listname, "+bounces-", strindex, "@",
+		verpfrom = concatstr(5, listname, RECIPDELIMS "bounces-", strindex, "@",
 				listfqdn);
 		myfree(listname);
 		myfree(listfqdn);
@@ -1053,7 +1053,7 @@
 
 		if(verp && (strcmp(verp, "postfix") == 0)) {
 			myfree(verp);
-			verp = mystrdup("XVERP=-=");
+			verp = mystrdup("XVERP=" RECIPDELIMS "=");
 		}
 
 		if(addtohdr && verp) {
Only in mlmmj-1.2.8-local/src: mlmmj-send.c.orig
diff -ur mlmmj-1.2.8/src/mlmmj-sub.c mlmmj-1.2.8-local/src/mlmmj-sub.c
--- mlmmj-1.2.8/src/mlmmj-sub.c	2005-06-20 06:40:39.000000000 -0600
+++ mlmmj-1.2.8-local/src/mlmmj-sub.c	2005-09-19 11:31:20.000000000 -0600
@@ -55,7 +55,7 @@
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
 
-	fromaddr = concatstr(3, listname, "+bounces-help@", listfqdn);
+	fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@", listfqdn);
 
 	myfree(listname);
 	myfree(listfqdn);
@@ -100,8 +100,8 @@
 
 	maildata[1] = mystrdup(subaddr);
 	
-	fromaddr = concatstr(3, listname, "+bounces-help@", listfqdn);
-	tostr = concatstr(3, listname, "+owner@", listfqdn);
+	fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@", listfqdn);
+	tostr = concatstr(3, listname, RECIPDELIMS "owner@", listfqdn);
 	
 	myfree(listname);
 	myfree(listfqdn);
@@ -177,22 +177,22 @@
 
 	close(subconffd);
 
-	fromaddr = concatstr(5, listname, "+bounces-confsub-", randomstr,
+	fromaddr = concatstr(5, listname, RECIPDELIMS "bounces-confsub-", randomstr,
 				"@", listfqdn);
 	
 	switch(typesub) {
 		default:
 		case SUB_NORMAL:
 			listtext = mystrdup("sub-confirm");
-			tmpstr = mystrdup("+confsub-");
+			tmpstr = mystrdup(RECIPDELIMS "confsub-");
 			break;
 		case SUB_DIGEST:
 			listtext = mystrdup("sub-confirm-digest");
-			tmpstr = mystrdup("+confsub-digest-");
+			tmpstr = mystrdup(RECIPDELIMS "confsub-digest-");
 			break;
 		case SUB_NOMAIL:
 			listtext = mystrdup("sub-confirm-nomail");
-			tmpstr = mystrdup("+confsub-nomail-");
+			tmpstr = mystrdup(RECIPDELIMS "confsub-nomail-");
 			break;
 	}
 
@@ -250,7 +250,7 @@
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
 
-	fromaddr = concatstr(3, listname, "+bounces-help@", listfqdn);
+	fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@", listfqdn);
 
 	queuefilename = prepstdreply(listdir, "sub-subscribed", "$helpaddr$",
 				     subaddr, NULL, 0, NULL);
Only in mlmmj-1.2.8-local/src: mlmmj-sub.c~
diff -ur mlmmj-1.2.8/src/mlmmj-unsub.c mlmmj-1.2.8-local/src/mlmmj-unsub.c
--- mlmmj-1.2.8/src/mlmmj-unsub.c	2005-06-20 06:40:39.000000000 -0600
+++ mlmmj-1.2.8-local/src/mlmmj-unsub.c	2005-09-19 11:31:57.000000000 -0600
@@ -55,7 +55,7 @@
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
 
-	fromaddr = concatstr(3, listname, "+bounces-help@", listfqdn);
+	fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@", listfqdn);
 
 	myfree(listname);
 	myfree(listfqdn);
@@ -101,8 +101,8 @@
 
         maildata[1] = mystrdup(subaddr);
 
-        fromaddr = concatstr(3, listname, "+bounces-help@", listfqdn);
-	tostr = concatstr(3, listname, "+owner@", listfqdn);
+        fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@", listfqdn);
+	tostr = concatstr(3, listname, RECIPDELIMS "owner@", listfqdn);
 
 	myfree(listname);
 	myfree(listfqdn);
@@ -180,22 +180,22 @@
 
 	close(subconffd);
 
-	fromaddr = concatstr(5, listname, "+bounces-confunsub-", randomstr,
+	fromaddr = concatstr(5, listname, RECIPDELIMS "bounces-confunsub-", randomstr,
 				"@", listfqdn);
 
 	switch(typesub) {
 		default:
 		case SUB_NORMAL:
 			listtext = mystrdup("unsub-confirm");
-			tmpstr = mystrdup("+confunsub-");
+			tmpstr = mystrdup(RECIPDELIMS "confunsub-");
 			break;
 		case SUB_DIGEST:
 			listtext = mystrdup("unsub-confirm-digest");
-			tmpstr = mystrdup("+confunsub-digest-");
+			tmpstr = mystrdup(RECIPDELIMS "confunsub-digest-");
 			break;
 		case SUB_NOMAIL:
 			listtext = mystrdup("unsub-confirm-nomail");
-			tmpstr = mystrdup("+confunsub-nomail-");
+			tmpstr = mystrdup(RECIPDELIMS "confunsub-nomail-");
 			break;
 	}
 
@@ -294,7 +294,7 @@
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
 
-	fromaddr = concatstr(3, listname, "+bounces-help@", listfqdn);
+	fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@", listfqdn);
 
 	queuefilename = prepstdreply(listdir, "unsub-notsubscribed",
 				     "$helpaddr$", subaddr, NULL, 0, NULL);
Only in mlmmj-1.2.8-local/src: mlmmj-unsub.c~
diff -ur mlmmj-1.2.8/src/prepstdreply.c mlmmj-1.2.8-local/src/prepstdreply.c
--- mlmmj-1.2.8/src/prepstdreply.c	2005-01-15 03:46:24.000000000 -0700
+++ mlmmj-1.2.8-local/src/prepstdreply.c	2005-09-19 11:30:40.000000000 -0600
@@ -30,6 +30,7 @@
 #include <string.h>
 #include <errno.h>
 
+#include "mlmmj.h"
 #include "prepstdreply.h"
 #include "strgen.h"
 #include "chomp.h"
@@ -95,31 +96,31 @@
 		value = mystrdup(listaddr);
 		goto concatandreturn;
 	} else if(strcmp(token, "listowner") == 0) {
-		value = concatstr(3, listname, "+owner@", fqdn);
+		value = concatstr(3, listname, RECIPDELIMS "owner@", fqdn);
 		goto concatandreturn;
 	} else if(strcmp(token, "helpaddr") == 0) {
-		value = concatstr(3, listname, "+help@", fqdn);
+		value = concatstr(3, listname, RECIPDELIMS "help@", fqdn);
 		goto concatandreturn;
 	} else if(strcmp(token, "listgetN") == 0) {
-		value = concatstr(3, listname, "+get-N@", fqdn);
+		value = concatstr(3, listname, RECIPDELIMS "get-N@", fqdn);
 		goto concatandreturn;
 	} else if(strcmp(token, "listunsubaddr") == 0) {
-		value = concatstr(3, listname, "+unsubscribe@", fqdn);
+		value = concatstr(3, listname, RECIPDELIMS "unsubscribe@", fqdn);
 		goto concatandreturn;
 	} else if(strcmp(token, "digestunsubaddr") == 0) {
-		value = concatstr(3, listname, "+unsubscribe-digest@", fqdn);
+		value = concatstr(3, listname, RECIPDELIMS "unsubscribe-digest@", fqdn);
 		goto concatandreturn;
 	} else if(strcmp(token, "nomailunsubaddr") == 0) {
-		value = concatstr(3, listname, "+unsubscribe-nomail@", fqdn);
+		value = concatstr(3, listname, RECIPDELIMS "unsubscribe-nomail@", fqdn);
 		goto concatandreturn;
 	} else if(strcmp(token, "listsubaddr") == 0) {
-		value = concatstr(3, listname, "+subscribe@", fqdn);
+		value = concatstr(3, listname, RECIPDELIMS "subscribe@", fqdn);
 		goto concatandreturn;
 	} else if(strcmp(token, "digestsubaddr") == 0) {
-		value = concatstr(3, listname, "+subscribe-digest@", fqdn);
+		value = concatstr(3, listname, RECIPDELIMS "subscribe-digest@", fqdn);
 		goto concatandreturn;
 	} else if(strcmp(token, "nomailsubaddr") == 0) {
-		value = concatstr(3, listname, "+subscribe-nomail@", fqdn);
+		value = concatstr(3, listname, RECIPDELIMS "subscribe-nomail@", fqdn);
 		goto concatandreturn;
 	}
 	if(data) {
diff -ur mlmmj-1.2.8/src/send_digest.c mlmmj-1.2.8-local/src/send_digest.c
--- mlmmj-1.2.8/src/send_digest.c	2005-01-19 12:22:14.000000000 -0700
+++ mlmmj-1.2.8-local/src/send_digest.c	2005-09-19 11:30:40.000000000 -0600
@@ -90,7 +90,7 @@
 		snprintf(buf, sizeof(buf), " (%d-%d)", firstindex, lastindex);
 	}
 
-	fromstr = concatstr(5, "From: ", listname, "+help@", listfqdn, "\n");
+	fromstr = concatstr(5, "From: ", listname, RECIPDELIMS "help@", listfqdn, "\n");
 	tmp = concatstr(6, "MIME-Version: 1.0"
 			    "\nContent-Type: multipart/" DIGESTMIMETYPE "; "
 			    "boundary=", boundary,
diff -ur mlmmj-1.2.8/src/send_help.c mlmmj-1.2.8-local/src/send_help.c
--- mlmmj-1.2.8/src/send_help.c	2005-01-19 12:22:14.000000000 -0700
+++ mlmmj-1.2.8-local/src/send_help.c	2005-09-19 11:30:40.000000000 -0600
@@ -50,7 +50,7 @@
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
 
-	fromaddr = concatstr(3, listname, "+bounces-help@", listfqdn);
+	fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@", listfqdn);
 
 	queuefilename = prepstdreply(listdir, "listhelp", "$listowner$",
 					emailaddr, NULL, 0, NULL);
diff -ur mlmmj-1.2.8/src/send_list.c mlmmj-1.2.8-local/src/send_list.c
--- mlmmj-1.2.8/src/send_list.c	2005-04-26 04:24:18.000000000 -0600
+++ mlmmj-1.2.8-local/src/send_list.c	2005-09-19 11:30:40.000000000 -0600
@@ -55,7 +55,7 @@
 	listfqdn = genlistfqdn(listaddr);
 	subdir = concatstr(2, listdir, "/subscribers.d/");
 
-	fromaddr = concatstr(3, listname, "+bounces-help@", listfqdn);
+	fromaddr = concatstr(3, listname, RECIPDELIMS "bounces-help@", listfqdn);
 
 	queuefilename = prepstdreply(listdir, "listsubs", "$listowner$",
 					emailaddr, NULL, 0, NULL);

--------------030504000005090305010509--
