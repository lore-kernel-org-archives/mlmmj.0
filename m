From: "Marcelo E. Magallon" <marcelo.magallon@gmail.com>
Date: Tue, 19 Jul 2005 12:09:43 +0000
Subject: Re: recipdelim patch
Message-Id: <20050719120940.GA6432@jacinta.casa>
List-Id: <mlmmj.mlmmj.org>
References: <42D3CDD00000B1FA@ims3a.cp.tin.it>
In-Reply-To: <42D3CDD00000B1FA@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tue, Jul 19, 2005 at 12:43:04AM +0200, fifadd@tin.it wrote:
 > I have removed the FFF comments. I have corrected the memory leak. Here you
 > can find the recipdelim patch.

 Please don't change the default:

diff -urpN mlmmj-1.2.8/include/delimiter.h mlmmj-1.2.9/include/delimiter.h
--- mlmmj-1.2.8/include/delimiter.h	1970-01-01 01:00:00.000000000 +0100
+++ mlmmj-1.2.9/include/delimiter.h	2005-07-14 17:32:00.000000000 +0200
@@ -0,0 +1,25 @@
+/* Copyright (C) 2002, 2003, 2004 Mads Martin Joergensen <mmj at mmj.dk>
+ * Created by Filippo Fadda <filippo at fadda.ws>
+ *
+ * $Id: mlmmj.h,v 1.31 2005/01/15 10:53:52 mmj Exp $
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#define RECIPDELIM "-"  /* Change this value to modify delimiter */
diff -urpN mlmmj-1.2.8/include/mlmmj.h mlmmj-1.2.9/include/mlmmj.h
--- mlmmj-1.2.8/include/mlmmj.h	2005-01-15 11:53:52.000000000 +0100
+++ mlmmj-1.2.9/include/mlmmj.h	2005-07-14 17:32:53.000000000 +0200
@@ -25,10 +25,10 @@
 #define MLMMJ_GENERIC_INCLUDES
 
 #include "../config.h"
+#include "delimiter.h"
 
 #define RELAYHOST "127.0.0.1"
 #define READ_BUFSIZE 2048
-#define RECIPDELIM '+'  /* XXX Warning: not changable at the moment */
 #define MODREQLIFE 604800 /* How long time will moderation requests be kept?
 			   * 604800s is 7 days */
 #define DISCARDEDLIFE 604800 /* How long time will discarded mails be kept?

 Also, note that it needs to read "Subject:", e.g.:

diff -urpN mlmmj-1.2.8/listtexts/it/access mlmmj-1.2.9/listtexts/it/access
--- mlmmj-1.2.8/listtexts/it/access	1970-01-01 01:00:00.000000000 +0100
+++ mlmmj-1.2.9/listtexts/it/access	2005-07-18 16:43:42.000000000 +0200
@@ -0,0 +1,12 @@
+Subject: messaggio alla lista $listaddr$ non inoltrato
+
+Ciao, sono mlmmj, il programma che gestisce la mailing list
+
+$listaddr$
+
+Sono spiacente di informarti che il tuo messaggio non puo' essere mandato
+alla lista. La tua mail e' stata rifiutata perche' non segue le regole
+impostate dall'amministratore della lista.
+
+Grazie.
+

 and I must be missing something, but this:

diff -urpN mlmmj-1.2.8/src/mlmmj-bounce.c mlmmj-1.2.9/src/mlmmj-bounce.c
--- mlmmj-1.2.8/src/mlmmj-bounce.c	2005-05-02 19:39:10.000000000 +0200
+++ mlmmj-1.2.9/src/mlmmj-bounce.c	2005-07-14 17:34:19.000000000 +0200
@@ -112,7 +112,7 @@ void do_probe(const char *listdir, const
 	listname = genlistname(listaddr);
 	listfqdn = genlistfqdn(listaddr);
 
-	from = concatstr(5, listname, "+bounces-probe-", myaddr, "@", listfqdn);
+    from = concatstr(6, listname, RECIPDELIM, "bounces-probe-", myaddr, "@", listfqdn);
 
 	myfree(listaddr);
 	myfree(listfqdn);

 doesn't make it configurable at runtime, does it?  I notice some
 RECIPDELIMs have been changed to recipdelim but other haven't.  This
 one looks funny to me:

@@ -512,14 +512,17 @@ int main(int argc, char **argv)
 	else
 		whichto = NULL;
 
-	if(whichto && whichto->emaillist && whichto->emaillist[0])
-		recipdelim = strchr(whichto->emaillist[0], RECIPDELIM);
-	else
-		recipdelim = NULL;
+        if(toemails.emaillist && toemails.emaillist[0])
+                recipdelim = strstr(toemails.emaillist[0], RECIPDELIM);
+        else
+                recipdelim = NULL;
+
 
 	if(recipdelim) {
 		owner = concatstr(2, listdir, "/control/owner");
-		if(owner && strncmp(recipdelim, "+owner@", 7) = 0) {
+                char *temp =  concatstr(2, RECIPDELIM, "owner@");
+
+                if(owner && strncmp(recipdelim, temp, 7) = 0) {
 			/* strip envelope from before resending */
 			delheaders->count = 0;
 			delheaders->strs = NULL;

 notice how it's using RECIPDELIM on one line and recipdelim on the
 next.  Is that really ok that way?

 Cheers,

 Marcelo
