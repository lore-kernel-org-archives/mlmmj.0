From: Henne Vogelsang <hvogel@opensuse.org>
Date: Wed, 06 Sep 2006 16:38:33 +0000
Subject: Re: mlmmj-1.2.12-RC1 released
Message-Id: <20060906163833.GA24085@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="iAL9S67WQOXgEPD9"
List-Id: <mlmmj.mlmmj.org>
References: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
In-Reply-To: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
To: mlmmj@mlmmj.org


--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Monday, September 04, 2006 at 21:42:08, Morten K.Poulsen wrote:

> If your patch is not included, please re-send it.

As mm"the king of slack"j did not add my patches from the openSUSE
package i re-send them. 8)

mlmmj-log.patch:

This patch logs the header if a deny rule matches in access control.
So you can actually tell users what they are doing wrong.

mlmmj-send_help-generic.patch

This patch makes send_help more generic. It adds 2 new parameters to
send_help (name/textfile). So you can send other texts than listhelp
with it. 

mlmmj-faq.patch 

This patch adds the possiblity to send a FAQ of the list. It can be
requested via listname+faq@fqdn. This uses the more generic send_help
function.

mlmmj-nodigestsub.patch

This patch adds a control file to deny digest subscription. Usefull if
you dont want digests and tell users about it. Uses the more generic
send_help.

mlmmj-nonomailsub.patch

This patch adds a control file to deny nomail subscription. Usefull if
you dont want nomail and tell users about it. Uses the more generic
send_help.

Henne

BTW: All lists.opensuse.org lists run on mlmmj since a month or so and
all lists.suse.com lists will follow later this year.

-- 
Henne Vogelsang, Core Services
"Rules change. The Game remains the same."
			 - Omar (The Wire)

--iAL9S67WQOXgEPD9
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-log.patch"

--- src/mlmmj-process.c
+++ src/mlmmj-process.c
@@ -284,8 +284,8 @@
 					break;
 			}
 
-			log_error(LOG_ARGS, "A mail was %s by rule #%d",
-					logstr, rule_nr);
+			log_error(LOG_ARGS, "A mail with header \"%s\" was %s by rule #%d \"%s\"",
+				hdrs->strs[i], logstr, rule_nr, rule_ptr);
 			ret = rule->act;
 			free_rules(head);
 			return ret;

--iAL9S67WQOXgEPD9
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-faq.patch"

--- listtexts/Makefile.am
+++ listtexts/Makefile.am
@@ -1,6 +1,6 @@
 ## Process this file with automake to produce Makefile.in
 
-dist_textlib_DATA = access bounce-probe listhelp moderation notifysub \
+dist_textlib_DATA = access bounce-probe listhelp listfaq moderation notifysub \
 	notifysub-digest notifysub-nomail notifyunsub notifyunsub-digest \
 	notifyunsub-nomail notintocc sub-confirm sub-confirm-digest \
 	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail subonlypost \
--- listtexts/Makefile.in
+++ listtexts/Makefile.in
@@ -105,7 +105,7 @@
 target_alias = @target_alias@
 textlibdir = @textlibdir@
 
-dist_textlib_DATA = access bounce-probe listhelp moderation notifysub \
+dist_textlib_DATA = access bounce-probe listhelp listfaq moderation notifysub \
 	notifysub-digest notifysub-nomail notifyunsub notifyunsub-digest \
 	notifyunsub-nomail notintocc sub-confirm sub-confirm-digest \
 	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail subonlypost \
--- listtexts/listfaq
+++ listtexts/listfaq
@@ -0,0 +1,4 @@
+Subject: FAQ - Frequently asked questions of the $listaddr$ list.
+
+Sorry no FAQ available yet.
+
--- src/listcontrol.c
+++ src/listcontrol.c
@@ -63,6 +63,7 @@
 	CTRL_BOUNCES,
 	CTRL_MODERATE,
 	CTRL_HELP,
+	CTRL_FAQ,
 	CTRL_GET,
 	CTRL_LIST,
 	CTRL_END  /* end marker, must be last */
@@ -92,6 +93,7 @@
 	{ "bounces",            1 },
 	{ "moderate",           1 },
 	{ "help",               0 },
+	{ "faq",                0 },
 	{ "get",                1 },
 	{ "list",               0 }
 };
@@ -628,6 +630,21 @@
 		send_help(listdir, fromemails->emaillist[0], mlmmjsend, "help", "listhelp");
 		break;
 
+       /* listname+faq@domain.tld */
+        case CTRL_FAQ:
+               if(!strchr(fromemails->emaillist[0], '@')) {
+                       /* Not a valid From: address */
+                       errno = 0;
+                       log_error(LOG_ARGS, "A faq request was"
+                               " sent with an invalid From: header."
+                               " Ignoring mail");
+                       return -1;
+               }
+               log_oper(listdir, OPLOGFNAME, "%s requested faq",
+                               fromemails->emaillist[0]);
+               send_help(listdir, fromemails->emaillist[0], mlmmjsend, "faq", "listfaq");
+               break;
+
 	/* listname+get-INDEX@domain.tld */
 	case CTRL_GET:
 		noget = statctrl(listdir, "noget");
--- src/prepstdreply.c
+++ src/prepstdreply.c
@@ -102,6 +102,9 @@
 	} else if(strcmp(token, "helpaddr") == 0) {
 		value = concatstr(4, listname, listdelim, "help@", fqdn);
 		goto concatandreturn;
+	} else if(strcmp(token, "faqaddr") == 0) {
+		value = concatstr(4, listname, listdelim, "faq@", fqdn);
+		goto concatandreturn;
 	} else if(strcmp(token, "listgetN") == 0) {
 		value = concatstr(4, listname, listdelim, "get-N@", fqdn);
 		goto concatandreturn;

--iAL9S67WQOXgEPD9
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-send_help-generic.patch"

--- include/send_help.h
+++ include/send_help.h
@@ -25,6 +25,6 @@
 #define SEND_HELP_H
 
 void send_help(const char *listdir, const char *emailaddr,
-	       const char *mlmmjsend);
+	       const char *mlmmjsend, const char *name, const char *textfile);
 
 #endif
--- src/listcontrol.c
+++ src/listcontrol.c
@@ -625,7 +625,7 @@
 		}
 		log_oper(listdir, OPLOGFNAME, "%s requested help",
 				fromemails->emaillist[0]);
-		send_help(listdir, fromemails->emaillist[0], mlmmjsend);
+		send_help(listdir, fromemails->emaillist[0], mlmmjsend, "help", "listhelp");
 		break;
 
 	/* listname+get-INDEX@domain.tld */
--- src/send_help.c
+++ src/send_help.c
@@ -43,7 +43,7 @@
 #include "memory.h"
 
 void send_help(const char *listdir, const char *emailaddr,
-	       const char *mlmmjsend)
+	       const char *mlmmjsend, const char *name, const char *textfile)
 {
 	char *queuefilename, *listaddr, *listdelim, *listname, *listfqdn;
 	char *fromaddr;
@@ -56,10 +56,10 @@
 	fromaddr = concatstr(4, listname, listdelim, "bounces-help@", listfqdn);
 	myfree(listdelim);
 
-	queuefilename = prepstdreply(listdir, "listhelp", "$listowner$",
+	queuefilename = prepstdreply(listdir, textfile, "$listowner$",
 					emailaddr, NULL, 0, NULL, NULL);
 	if(queuefilename == NULL) {
-		log_error(LOG_ARGS, "Could not prepare help mail");
+		log_error(LOG_ARGS, "Could not prepare %s mail", name);
 		exit(EXIT_FAILURE);
 	}
 	

--iAL9S67WQOXgEPD9
Content-Type: text/x-patch; charset="utf-8"
Content-Disposition: attachment; filename="mlmmj-nodigestsub.patch"
Content-Transfer-Encoding: 8bit

--- TUNABLES
+++ TUNABLES
@@ -166,3 +166,9 @@
 
    If this file exists, digest mails won't have a text part with a thread
    summary.
+ 
+ � nodigestsub			(boolean)
+
+   If this file exists, subscription to the digest version of the mailinglist
+   will be denied. (Usefull if you dont want to allow digests and notify users 
+   about it).
--- listtexts/Makefile.am
+++ listtexts/Makefile.am
@@ -3,7 +3,7 @@
 dist_textlib_DATA = access bounce-probe listhelp listfaq moderation notifysub \
 	notifysub-digest notifysub-nomail notifyunsub notifyunsub-digest \
 	notifyunsub-nomail notintocc sub-confirm sub-confirm-digest \
-	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail subonlypost \
+	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail sub-deny-digest subonlypost \
 	unsub-confirm unsub-confirm-digest unsub-confirm-nomail unsub-ok \
 	unsub-ok-digest unsub-ok-nomail listsubs sub-subscribed \
 	unsub-notsubscribed digest submod-moderator submod-requester
--- listtexts/Makefile.in
+++ listtexts/Makefile.in
@@ -108,7 +108,7 @@
 dist_textlib_DATA = access bounce-probe listhelp listfaq moderation notifysub \
 	notifysub-digest notifysub-nomail notifyunsub notifyunsub-digest \
 	notifyunsub-nomail notintocc sub-confirm sub-confirm-digest \
-	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail subonlypost \
+	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail sub-deny-digest subonlypost \
 	unsub-confirm unsub-confirm-digest unsub-confirm-nomail unsub-ok \
 	unsub-ok-digest unsub-ok-nomail listsubs sub-subscribed \
 	unsub-notsubscribed digest submod-moderator submod-requester
--- listtexts/sub-deny-digest
+++ listtexts/sub-deny-digest
@@ -0,0 +1,9 @@
+Subject: Denied subscription to the digest of $listaddr$
+
+Your request to subscribe to the digest of the mailinglist
+
+$listaddr$
+
+has been denied. Digests are turned off for this
+mailinglist.
+
--- src/listcontrol.c
+++ src/listcontrol.c
@@ -206,6 +206,13 @@
 				" Ignoring mail");
 			return -1;
 		}
+                if (statctrl(listdir, "nodigestsub")) {
+                        errno = 0;
+                        log_error(LOG_ARGS,  "A subcribe-digest request was denied");
+                               send_help(listdir, fromemails->emaillist[0],
+                                               mlmmjsend, "nodigest", "sub-deny-digest");
+                        return -1;
+                }
 		log_oper(listdir, OPLOGFNAME, "mlmmj-sub: request for digest"
 					" subscription from %s",
 					fromemails->emaillist[0]);

--iAL9S67WQOXgEPD9
Content-Type: text/x-patch; charset="utf-8"
Content-Disposition: attachment; filename="mlmmj-nonomailsub.patch"
Content-Transfer-Encoding: 8bit

--- TUNABLES
+++ TUNABLES
@@ -172,3 +172,9 @@
    If this file exists, subscription to the digest version of the mailinglist
    will be denied. (Usefull if you dont want to allow digests and notify users 
    about it).
+   
+  � nonomailsub			(boolean)
+
+   If this file exists, subscription to the nomail version of the mailinglist
+   will be denied. (Usefull if you dont want to allow nomail and notify users 
+   about it).  
--- listtexts/Makefile.am
+++ listtexts/Makefile.am
@@ -3,7 +3,7 @@
 dist_textlib_DATA = access bounce-probe listhelp listfaq moderation notifysub \
 	notifysub-digest notifysub-nomail notifyunsub notifyunsub-digest \
 	notifyunsub-nomail notintocc sub-confirm sub-confirm-digest \
-	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail sub-deny-digest subonlypost \
+	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail sub-deny-digest sub-deny-nomail subonlypost \
 	unsub-confirm unsub-confirm-digest unsub-confirm-nomail unsub-ok \
 	unsub-ok-digest unsub-ok-nomail listsubs sub-subscribed \
 	unsub-notsubscribed digest submod-moderator submod-requester
--- listtexts/Makefile.in
+++ listtexts/Makefile.in
@@ -108,7 +108,7 @@
 dist_textlib_DATA = access bounce-probe listhelp listfaq moderation notifysub \
 	notifysub-digest notifysub-nomail notifyunsub notifyunsub-digest \
 	notifyunsub-nomail notintocc sub-confirm sub-confirm-digest \
-	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail sub-deny-digest subonlypost \
+	sub-confirm-nomail sub-ok sub-ok-digest sub-ok-nomail sub-deny-digest sub-deny-nomail subonlypost \
 	unsub-confirm unsub-confirm-digest unsub-confirm-nomail unsub-ok \
 	unsub-ok-digest unsub-ok-nomail listsubs sub-subscribed \
 	unsub-notsubscribed digest submod-moderator submod-requester
--- listtexts/sub-deny-nomail
+++ listtexts/sub-deny-nomail
@@ -0,0 +1,9 @@
+Subject: Denied subscription to the nomail version of $listaddr$
+
+Your request to subscribe to the nomail version of the mailinglist
+
+$listaddr$
+
+has been denied. The nomail version is turned off for this
+mailinglist.
+
--- src/listcontrol.c
+++ src/listcontrol.c
@@ -242,6 +242,13 @@
 				" Ignoring mail");
 			return -1;
 		}
+                if (statctrl(listdir, "nonomailsub")) {
+                        errno = 0;
+                        log_error(LOG_ARGS,  "A subcribe-nomail request was denied");
+                               send_help(listdir, fromemails->emaillist[0],
+                                               mlmmjsend, "nonomail", "sub-deny-nomail");
+                        return -1;
+                }
 		log_oper(listdir, OPLOGFNAME, "mlmmj-sub: request for nomail"
 					" subscription from %s",
 					fromemails->emaillist[0]);

--iAL9S67WQOXgEPD9--
