From: Neale Pickett <neale@woozle.org>
Date: Mon, 14 Nov 2005 15:21:41 +0000
Subject: Re: recipient delimiter bug with RC1
Message-Id: <200511140821.42769.neale@woozle.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_GuKeDbtxIPsNf4a"
List-Id: <mlmmj.mlmmj.org>
References: <20051113034740.GF4414@hinegardner.org>
In-Reply-To: <20051113034740.GF4414@hinegardner.org>
To: mlmmj@mlmmj.org

--Boundary-00=_GuKeDbtxIPsNf4a
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 12 November 2005 08:47 pm, Jeremy Hinegardner wrote:
> I was looking forward recipient delimiter to be configurable.  But it
> just so happens that on postfix with virtual domains and postfix's
> recipient delimiter set to '-' it doesn't quite work.  The bug manifests
> itself if you have a mailing list that has a name containing the
> recipient delimiter.

I noticed the same thing.  My patch is attached, it does a bit less work than 
Jeremy's.

My patch also fixes what I suspect (but have not verified) to be another bug: 
if the list is not the first address in the header (ie. Cc: neale@woozle.org, 
mlmmj@mmj.dk), it doesn't see itself as being in the tocc.  I fixed this by 
iterating over every address in the header, and not just looking at the 
first.

I've been running this on my lists for a while and it seems to be working 
fine.

Neale

PS: Jeremy, how did you set up your postfix's aliases table to deal with the 
list name with the - in it?  I had to create two entries: "pajarito" and 
"pajarito-riders" that both pipe to mlmmj-recieve with the same directory.

--Boundary-00=_GuKeDbtxIPsNf4a
Content-Type: text/x-diff;
  charset="utf-8";
  name="d"
Content-Transfer-Encoding: 7bit
Content-Description: Handle when recip_delim occurs >1 time
Content-Disposition: attachment;
	filename="d"

Mon Nov  7 23:44:04 MST 2005  Neale Pickett <neale@woozle.org>
  * Handle when recip_delim occurs >1 time
Sun Oct 30 20:00:38 MST 2005  Neale Pickett <neale@woozle.org>
  * strgen malloc fix
diff -rN -u old-mlmmj-darcs/include/strrstr.h new-mlmmj-darcs/include/strrstr.h
--- old-mlmmj-darcs/include/strrstr.h	1969-12-31 17:00:00.000000000 -0700
+++ new-mlmmj-darcs/include/strrstr.h	2005-11-07 13:17:30.000000000 -0700
@@ -0,0 +1,6 @@
+#ifndef MLMMJ_STRRSTR__H
+#define MLMMJ_STRRSTR__H
+
+char *strrstr(const char *haystack, const char *needle);
+
+#endif /* MLMMJ_STRRSTR__H */
diff -rN -u old-mlmmj-darcs/src/listcontrol.c new-mlmmj-darcs/src/listcontrol.c
--- old-mlmmj-darcs/src/listcontrol.c	2005-11-14 08:12:52.000000000 -0700
+++ new-mlmmj-darcs/src/listcontrol.c	2005-11-07 13:00:23.000000000 -0700
@@ -42,6 +42,7 @@
 #include "statctrl.h"
 #include "mygetline.h"
 #include "chomp.h"
+#include "strrstr.h"
 #include "memory.h"
 #include "log_oper.h"
 #include "ctrlvalues.h"
@@ -123,7 +124,7 @@
 		subswitch = "-C";
 	
 	listdelim = getlistdelim(listdir);
-	recipdelimsign = strstr(controladdr, listdelim);
+	recipdelimsign = strrstr(controladdr, listdelim);
 	MY_ASSERT(recipdelimsign);
 	atsign = index(controladdr, '@');
 	MY_ASSERT(atsign);
diff -rN -u old-mlmmj-darcs/src/Makefile.am new-mlmmj-darcs/src/Makefile.am
--- old-mlmmj-darcs/src/Makefile.am	2005-11-14 08:12:52.000000000 -0700
+++ new-mlmmj-darcs/src/Makefile.am	2005-11-07 13:06:50.000000000 -0700
@@ -12,7 +12,7 @@
 
 EXTRA_DIST = mlmmj-make-ml.sh
 
-mlmmj_send_SOURCES = mlmmj-send.c writen.c mail-functions.c itoa.c chomp.c \
+mlmmj_send_SOURCES = mlmmj-send.c writen.c mail-functions.c itoa.c chomp.c strrstr.c \
                      incindexfile.c checkwait_smtpreply.c getlistaddr.c \
 		     mylocking.c init_sockfd.c strgen.c random-int.c \
 		     print-version.c log_error.c mygetline.c memory.c \
@@ -24,7 +24,7 @@
 			log_oper.c mylocking.c readn.c
 
 mlmmj_process_SOURCES = mlmmj-process.c writen.c find_email_adr.c \
-			incindexfile.c itoa.c getlistaddr.c chomp.c \
+			incindexfile.c itoa.c getlistaddr.c chomp.c strrstr.c \
 			mylocking.c listcontrol.c random-int.c strgen.c \
 			print-version.c send_help.c prepstdreply.c \
 			do_all_the_voodo_here.c mygetline.c gethdrline.c \
@@ -33,25 +33,25 @@
 			send_list.c readn.c getlistdelim.c
 
 mlmmj_sub_SOURCES = mlmmj-sub.c writen.c mylocking.c \
-			getlistaddr.c chomp.c random-int.c strgen.c \
+			getlistaddr.c chomp.c strrstr.c random-int.c strgen.c \
 			subscriberfuncs.c print-version.c \
 			log_error.c mygetline.c prepstdreply.c memory.c \
 			statctrl.c readn.c getlistdelim.c
 
 mlmmj_unsub_SOURCES = mlmmj-unsub.c writen.c mylocking.c \
-			getlistaddr.c chomp.c subscriberfuncs.c random-int.c \
+			getlistaddr.c chomp.c strrstr.c subscriberfuncs.c random-int.c \
 			strgen.c print-version.c log_error.c mygetline.c \
 			prepstdreply.c memory.c statctrl.c readn.c \
 			getlistdelim.c
 			
 mlmmj_bounce_SOURCES = mlmmj-bounce.c print-version.c log_error.c \
 		       subscriberfuncs.c strgen.c random-int.c writen.c \
-		       prepstdreply.c mygetline.c chomp.c getlistaddr.c \
+		       prepstdreply.c mygetline.c chomp.c strrstr.c getlistaddr.c \
 		       memory.c find_email_adr.c gethdrline.c readn.c \
 		       getlistdelim.c
 
 mlmmj_maintd_SOURCES = mlmmj-maintd.c print-version.c log_error.c mygetline.c \
-		       strgen.c random-int.c chomp.c writen.c memory.c \
+		       strgen.c random-int.c chomp.c strrstr.c writen.c memory.c \
 		       ctrlvalue.c send_digest.c getlistaddr.c dumpfd2fd.c \
 		       mylocking.c log_oper.c readn.c getlistdelim.c
 
diff -rN -u old-mlmmj-darcs/src/Makefile.in new-mlmmj-darcs/src/Makefile.in
--- old-mlmmj-darcs/src/Makefile.in	2005-11-14 08:12:52.000000000 -0700
+++ new-mlmmj-darcs/src/Makefile.in	2005-11-07 13:16:08.000000000 -0700
@@ -58,9 +58,10 @@
 	print-version.$(OBJEXT) log_error.$(OBJEXT) \
 	subscriberfuncs.$(OBJEXT) strgen.$(OBJEXT) \
 	random-int.$(OBJEXT) writen.$(OBJEXT) prepstdreply.$(OBJEXT) \
-	mygetline.$(OBJEXT) chomp.$(OBJEXT) getlistaddr.$(OBJEXT) \
-	memory.$(OBJEXT) find_email_adr.$(OBJEXT) gethdrline.$(OBJEXT) \
-	readn.$(OBJEXT) getlistdelim.$(OBJEXT)
+	mygetline.$(OBJEXT) chomp.$(OBJEXT) strrstr.$(OBJEXT) \
+	getlistaddr.$(OBJEXT) memory.$(OBJEXT) \
+	find_email_adr.$(OBJEXT) gethdrline.$(OBJEXT) readn.$(OBJEXT) \
+	getlistdelim.$(OBJEXT)
 mlmmj_bounce_OBJECTS = $(am_mlmmj_bounce_OBJECTS)
 mlmmj_bounce_LDADD = $(LDADD)
 am_mlmmj_list_OBJECTS = mlmmj-list.$(OBJEXT) strgen.$(OBJEXT) \
@@ -71,17 +72,17 @@
 am_mlmmj_maintd_OBJECTS = mlmmj-maintd.$(OBJEXT) \
 	print-version.$(OBJEXT) log_error.$(OBJEXT) \
 	mygetline.$(OBJEXT) strgen.$(OBJEXT) random-int.$(OBJEXT) \
-	chomp.$(OBJEXT) writen.$(OBJEXT) memory.$(OBJEXT) \
-	ctrlvalue.$(OBJEXT) send_digest.$(OBJEXT) \
+	chomp.$(OBJEXT) strrstr.$(OBJEXT) writen.$(OBJEXT) \
+	memory.$(OBJEXT) ctrlvalue.$(OBJEXT) send_digest.$(OBJEXT) \
 	getlistaddr.$(OBJEXT) dumpfd2fd.$(OBJEXT) mylocking.$(OBJEXT) \
 	log_oper.$(OBJEXT) readn.$(OBJEXT) getlistdelim.$(OBJEXT)
 mlmmj_maintd_OBJECTS = $(am_mlmmj_maintd_OBJECTS)
 mlmmj_maintd_LDADD = $(LDADD)
 am_mlmmj_process_OBJECTS = mlmmj-process.$(OBJEXT) writen.$(OBJEXT) \
 	find_email_adr.$(OBJEXT) incindexfile.$(OBJEXT) itoa.$(OBJEXT) \
-	getlistaddr.$(OBJEXT) chomp.$(OBJEXT) mylocking.$(OBJEXT) \
-	listcontrol.$(OBJEXT) random-int.$(OBJEXT) strgen.$(OBJEXT) \
-	print-version.$(OBJEXT) send_help.$(OBJEXT) \
+	getlistaddr.$(OBJEXT) chomp.$(OBJEXT) strrstr.$(OBJEXT) \
+	mylocking.$(OBJEXT) listcontrol.$(OBJEXT) random-int.$(OBJEXT) \
+	strgen.$(OBJEXT) print-version.$(OBJEXT) send_help.$(OBJEXT) \
 	prepstdreply.$(OBJEXT) do_all_the_voodo_here.$(OBJEXT) \
 	mygetline.$(OBJEXT) gethdrline.$(OBJEXT) log_error.$(OBJEXT) \
 	statctrl.$(OBJEXT) ctrlvalue.$(OBJEXT) dumpfd2fd.$(OBJEXT) \
@@ -98,18 +99,19 @@
 mlmmj_recieve_LDADD = $(LDADD)
 am_mlmmj_send_OBJECTS = mlmmj-send.$(OBJEXT) writen.$(OBJEXT) \
 	mail-functions.$(OBJEXT) itoa.$(OBJEXT) chomp.$(OBJEXT) \
-	incindexfile.$(OBJEXT) checkwait_smtpreply.$(OBJEXT) \
-	getlistaddr.$(OBJEXT) mylocking.$(OBJEXT) \
-	init_sockfd.$(OBJEXT) strgen.$(OBJEXT) random-int.$(OBJEXT) \
-	print-version.$(OBJEXT) log_error.$(OBJEXT) \
-	mygetline.$(OBJEXT) memory.$(OBJEXT) statctrl.$(OBJEXT) \
-	ctrlvalue.$(OBJEXT) getaddrsfromfd.$(OBJEXT) readn.$(OBJEXT) \
+	strrstr.$(OBJEXT) incindexfile.$(OBJEXT) \
+	checkwait_smtpreply.$(OBJEXT) getlistaddr.$(OBJEXT) \
+	mylocking.$(OBJEXT) init_sockfd.$(OBJEXT) strgen.$(OBJEXT) \
+	random-int.$(OBJEXT) print-version.$(OBJEXT) \
+	log_error.$(OBJEXT) mygetline.$(OBJEXT) memory.$(OBJEXT) \
+	statctrl.$(OBJEXT) ctrlvalue.$(OBJEXT) \
+	getaddrsfromfd.$(OBJEXT) readn.$(OBJEXT) \
 	getlistdelim.$(OBJEXT)
 mlmmj_send_OBJECTS = $(am_mlmmj_send_OBJECTS)
 mlmmj_send_LDADD = $(LDADD)
 am_mlmmj_sub_OBJECTS = mlmmj-sub.$(OBJEXT) writen.$(OBJEXT) \
 	mylocking.$(OBJEXT) getlistaddr.$(OBJEXT) chomp.$(OBJEXT) \
-	random-int.$(OBJEXT) strgen.$(OBJEXT) \
+	strrstr.$(OBJEXT) random-int.$(OBJEXT) strgen.$(OBJEXT) \
 	subscriberfuncs.$(OBJEXT) print-version.$(OBJEXT) \
 	log_error.$(OBJEXT) mygetline.$(OBJEXT) prepstdreply.$(OBJEXT) \
 	memory.$(OBJEXT) statctrl.$(OBJEXT) readn.$(OBJEXT) \
@@ -118,10 +120,11 @@
 mlmmj_sub_LDADD = $(LDADD)
 am_mlmmj_unsub_OBJECTS = mlmmj-unsub.$(OBJEXT) writen.$(OBJEXT) \
 	mylocking.$(OBJEXT) getlistaddr.$(OBJEXT) chomp.$(OBJEXT) \
-	subscriberfuncs.$(OBJEXT) random-int.$(OBJEXT) \
-	strgen.$(OBJEXT) print-version.$(OBJEXT) log_error.$(OBJEXT) \
-	mygetline.$(OBJEXT) prepstdreply.$(OBJEXT) memory.$(OBJEXT) \
-	statctrl.$(OBJEXT) readn.$(OBJEXT) getlistdelim.$(OBJEXT)
+	strrstr.$(OBJEXT) subscriberfuncs.$(OBJEXT) \
+	random-int.$(OBJEXT) strgen.$(OBJEXT) print-version.$(OBJEXT) \
+	log_error.$(OBJEXT) mygetline.$(OBJEXT) prepstdreply.$(OBJEXT) \
+	memory.$(OBJEXT) statctrl.$(OBJEXT) readn.$(OBJEXT) \
+	getlistdelim.$(OBJEXT)
 mlmmj_unsub_OBJECTS = $(am_mlmmj_unsub_OBJECTS)
 mlmmj_unsub_LDADD = $(LDADD)
 binSCRIPT_INSTALL = $(INSTALL_SCRIPT)
@@ -221,7 +224,7 @@
 INCLUDES = -I$(srcdir)/../include
 bin_SCRIPTS = mlmmj-make-ml.sh
 EXTRA_DIST = mlmmj-make-ml.sh
-mlmmj_send_SOURCES = mlmmj-send.c writen.c mail-functions.c itoa.c chomp.c \
+mlmmj_send_SOURCES = mlmmj-send.c writen.c mail-functions.c itoa.c chomp.c strrstr.c \
                      incindexfile.c checkwait_smtpreply.c getlistaddr.c \
 		     mylocking.c init_sockfd.c strgen.c random-int.c \
 		     print-version.c log_error.c mygetline.c memory.c \
@@ -233,7 +236,7 @@
 			log_oper.c mylocking.c readn.c
 
 mlmmj_process_SOURCES = mlmmj-process.c writen.c find_email_adr.c \
-			incindexfile.c itoa.c getlistaddr.c chomp.c \
+			incindexfile.c itoa.c getlistaddr.c chomp.c strrstr.c \
 			mylocking.c listcontrol.c random-int.c strgen.c \
 			print-version.c send_help.c prepstdreply.c \
 			do_all_the_voodo_here.c mygetline.c gethdrline.c \
@@ -242,25 +245,25 @@
 			send_list.c readn.c getlistdelim.c
 
 mlmmj_sub_SOURCES = mlmmj-sub.c writen.c mylocking.c \
-			getlistaddr.c chomp.c random-int.c strgen.c \
+			getlistaddr.c chomp.c strrstr.c random-int.c strgen.c \
 			subscriberfuncs.c print-version.c \
 			log_error.c mygetline.c prepstdreply.c memory.c \
 			statctrl.c readn.c getlistdelim.c
 
 mlmmj_unsub_SOURCES = mlmmj-unsub.c writen.c mylocking.c \
-			getlistaddr.c chomp.c subscriberfuncs.c random-int.c \
+			getlistaddr.c chomp.c strrstr.c subscriberfuncs.c random-int.c \
 			strgen.c print-version.c log_error.c mygetline.c \
 			prepstdreply.c memory.c statctrl.c readn.c \
 			getlistdelim.c
 
 mlmmj_bounce_SOURCES = mlmmj-bounce.c print-version.c log_error.c \
 		       subscriberfuncs.c strgen.c random-int.c writen.c \
-		       prepstdreply.c mygetline.c chomp.c getlistaddr.c \
+		       prepstdreply.c mygetline.c chomp.c strrstr.c getlistaddr.c \
 		       memory.c find_email_adr.c gethdrline.c readn.c \
 		       getlistdelim.c
 
 mlmmj_maintd_SOURCES = mlmmj-maintd.c print-version.c log_error.c mygetline.c \
-		       strgen.c random-int.c chomp.c writen.c memory.c \
+		       strgen.c random-int.c chomp.c strrstr.c writen.c memory.c \
 		       ctrlvalue.c send_digest.c getlistaddr.c dumpfd2fd.c \
 		       mylocking.c log_oper.c readn.c getlistdelim.c
 
@@ -413,6 +416,7 @@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/send_list.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/statctrl.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/strgen.Po@am__quote@
+@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/strrstr.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/subscriberfuncs.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/writen.Po@am__quote@
 
diff -rN -u old-mlmmj-darcs/src/mlmmj-process.c new-mlmmj-darcs/src/mlmmj-process.c
--- old-mlmmj-darcs/src/mlmmj-process.c	2005-11-14 08:12:52.000000000 -0700
+++ new-mlmmj-darcs/src/mlmmj-process.c	2005-11-07 23:43:18.000000000 -0700
@@ -52,6 +52,7 @@
 #include "memory.h"
 #include "log_oper.h"
 #include "chomp.h"
+#include "strrstr.h"
 
 enum action {
 	ALLOW,
@@ -515,13 +516,33 @@
 	else
 		whichto = NULL;
 
+	listaddr = getlistaddr(listdir);
+	alternates = ctrlvalues(listdir, "listaddress");
+
 	listdelim = getlistdelim(listdir);
-	if(whichto && whichto->emaillist && whichto->emaillist[0]){
-		recipextra = strstr(whichto->emaillist[0], listdelim);
-		if (recipextra)
-			recipextra += strlen(listdelim);
-	} else
-		recipextra = NULL;
+        recipextra = NULL;
+	if(whichto){
+		for(i = 0; i < alternates->count; i += 1){
+			int locallen;
+			char *at;
+
+			at = strchr(alternates->strs[i], '@');
+			if (NULL == at) {
+				continue;
+			}
+			locallen = at - alternates->strs[i];
+
+			for(j = 0; j < whichto->emailcount; j += 1){
+				if((0 == strncmp(alternates->strs[i],
+                                                 whichto->emaillist[j],
+                                                 locallen)) &&
+                                   ('@' != whichto->emaillist[j][locallen])){
+                                        recipextra = whichto->emaillist[j] + locallen;
+                                }
+                        }
+
+		}
+        }
 	myfree(listdelim);
 
 	if(recipextra) {
@@ -611,9 +632,6 @@
 
 	unlink(mailfile);
 
-	listaddr = getlistaddr(listdir);
-	alternates = ctrlvalues(listdir, "listaddress");
-
 	addrtocc = !(statctrl(listdir, "tocc"));
 	if(addrtocc) {
 		for(i = 0; i < toemails.emailcount; i++) {
diff -rN -u old-mlmmj-darcs/src/mlmmj-send.c new-mlmmj-darcs/src/mlmmj-send.c
--- old-mlmmj-darcs/src/mlmmj-send.c	2005-11-14 08:12:52.000000000 -0700
+++ new-mlmmj-darcs/src/mlmmj-send.c	2005-11-07 23:43:35.000000000 -0700
@@ -49,6 +49,7 @@
 #include "itoa.h"
 #include "incindexfile.h"
 #include "chomp.h"
+#include "strrstr.h"
 #include "checkwait_smtpreply.h"
 #include "getlistaddr.h"
 #include "getlistdelim.h"
@@ -163,7 +164,7 @@
 	*c = '\0';
 	num = strrchr(myfrom, '-');
 	num++;
-	c = strstr(myfrom, listdelim);
+	c = strrstr(myfrom, listdelim);
 	myfrom = strchr(c, '-');
 	myfrom++;
 	len = num - myfrom - 1;
diff -rN -u old-mlmmj-darcs/src/strgen.c new-mlmmj-darcs/src/strgen.c
--- old-mlmmj-darcs/src/strgen.c	2005-11-14 08:12:52.000000000 -0700
+++ new-mlmmj-darcs/src/strgen.c	2005-10-30 19:58:40.000000000 -0700
@@ -245,7 +245,7 @@
 	const char *weekday = NULL, *month = NULL;
 
 	/* 6 + 26 + ' ' + timezone which is 5 + '\n\0' == 40 */
-	timestr = (char *)malloc(40);
+	timestr = (char *)mymalloc(40);
 	t = time(NULL);
 
 	localtime_r(&t, &lttm);
diff -rN -u old-mlmmj-darcs/src/strrstr.c new-mlmmj-darcs/src/strrstr.c
--- old-mlmmj-darcs/src/strrstr.c	1969-12-31 17:00:00.000000000 -0700
+++ new-mlmmj-darcs/src/strrstr.c	2005-11-07 13:17:17.000000000 -0700
@@ -0,0 +1,17 @@
+#include <string.h>
+#include "strrstr.h"
+
+char *strrstr(const char *haystack, const char *needle)
+{
+	char *result;
+	char *p;
+
+	result = NULL;
+	p = strstr(haystack, needle);
+	while (NULL != p) {
+		result = p;
+		p = strstr(result + strlen(needle), needle);
+	}
+
+	return result;
+}


--Boundary-00=_GuKeDbtxIPsNf4a--
