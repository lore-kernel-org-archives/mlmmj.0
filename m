From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 08 Feb 2005 12:17:49 +0000
Subject: Re: mlmmj-1.2.3 released. Features added and bugs squashed.
Message-Id: <20050208121749.GC67839@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050208095412.GE56543@mmj.dk>
In-Reply-To: <20050208095412.GE56543@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Wolf Bergenheim <wolf+mlmmj@bergenheim.net> [Feb 08. 2005 12:45]:
> > > So no support for multiple list addresses ):
> >
> > It's coming, but I wanted to get this bugfix out first. Next version :)
> 
> Great!
> 
> I'm just impatient, because I've been asked to support 2 new parallel domains, 
> and would like the mailinglists to work with the new domains too.

This is completely untested, I only made sure it compiles. So try it out
and let me know if it works, then I'll commit it to CVS.

--- src/mlmmj-process.c
+++ src/mlmmj-process.c
@@ -50,6 +50,7 @@
 #include "subscriberfuncs.h"
 #include "memory.h"
 #include "log_oper.h"
+#include "chomp.h"
 
 enum action {
 	ALLOW,
@@ -309,7 +310,7 @@
 
 int main(int argc, char **argv)
 {
-	int i, opt, noprocess = 0, moderated = 0;
+	int i, j, opt, noprocess = 0, moderated = 0;
 	int hdrfd, footfd, rawmailfd, donemailfd;
 	int subonlypost = 0, addrtocc = 1, intocc = 0;
 	int notoccdenymails = 0, noaccessdenymails = 0, nosubonlydenymails = 0;
@@ -332,6 +333,7 @@
 	struct strlist *access_rules = NULL;
 	struct strlist *delheaders = NULL;
 	struct strlist allheaders;
+	struct strlist *alternates = NULL;
 	struct mailhdr readhdrs[] = {
 		{ "From:", 0, NULL },
 		{ "To:", 0, NULL },
@@ -601,17 +603,31 @@
 	unlink(mailfile);
 
 	listaddr = getlistaddr(listdir);
+	alternates = ctrlvalues(listdir, "listaddress");
 
 	addrtocc = !(statctrl(listdir, "tocc"));
 	if(addrtocc) {
-		for(i = 0; i < toemails.emailcount; i++)
-			if(strcmp(listaddr, toemails.emaillist[i]) = 0)
-				intocc = 1;
-		for(i = 0; i < ccemails.emailcount; i++)
-			if(strcmp(listaddr, ccemails.emaillist[i]) = 0)
-				intocc = 1;
+		for(i = 0; i < toemails.emailcount; i++) {
+			for(j = 0; j < alternates->count; j++) {
+				chomp(alternates->strs[j]);
+				if(strcmp(alternates->strs[j],
+					toemails.emaillist[i]) = 0)
+					intocc = 1;
+			}
+		}
+		for(i = 0; i < ccemails.emailcount; i++) {
+			for(j = 0; j < alternates->count; j++) {
+				chomp(alternates->strs[j]);
+				if(strcmp(alternates->strs[j],
+					ccemails.emaillist[i]) = 0)
+					intocc = 1;
+			}
+		}
 	}
 
+	for(i = 0; i < alternates->count; i++)
+		myfree(alternates->strs[i];
+
 	notoccdenymails = statctrl(listdir, "notoccdenymails");
 	
 	if(addrtocc && !intocc) {

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
