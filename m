From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Sun, 09 Apr 2006 18:27:47 +0000
Subject: [PATCH] qmail support
Message-Id: <20060409202747.fp833b4vk884c4w0@mail.n0rd.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_12kz0jhwx6ao"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This message is in MIME format.

--=_12kz0jhwx6ao
Content-Type: text/plain;
	charset=ISO-8859-1;
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hi,

Attached is the long promised patch for qmail support. It is a diff 
against mlmmj-1.2.11.

The changes are:

- listcontrol() is now passed the address extension, not the whole address.

- mlmmj-process now looks for the "envelope from" in
  - SENDER environment variable (set by qmail, postfix and exim)
  - Return-Path: header (RFC 822 section 4.3.1, set by sendmail and postfix)

- mlmmj-process now looks for the "address extension" in
  - EXT environment variable (set by qmail)
  - EXTENSION environment variable (set by postfix)
  - LOCAL_PART_SUFFIX environment variable (set by exim)
  - by parsing the first Delivered-To: header (set by sendmail and postfix)
  - by parsing the first To: header (set by most user agents)

This should remove the need for "headers_add = Delivered-To:..." and 
"return_path_add" for Exim 4.

I need feedback before committing the patch.

If you are running one of the following configurations, please test the 
patch and tell me about it:

- sendmail, vanilla
- sendmail, with the patch in mlmmj/README.sendmail
- qmail
- postfix (1.x and 2.x)
- exim3 (does mlmmj work here at all?)
- exim4, as described in mlmmj/README.exim4
- exim4, without headers_add and return_path_add

Morten

--=_12kz0jhwx6ao
Content-Type: text/plain;
	charset=ISO-8859-1;
	name="patch-mlmmj-listcontrol_env.diff"
Content-Disposition: attachment;
	filename="patch-mlmmj-listcontrol_env.diff"
Content-Transfer-Encoding: 7bit

diff -urN orig-mlmmj-1.2.11/include/listcontrol.h mlmmj-1.2.11/include/listcontrol.h
--- orig-mlmmj-1.2.11/include/listcontrol.h	2004-06-16 23:11:52.000000000 +0200
+++ mlmmj-1.2.11/include/listcontrol.h	2006-04-09 18:49:20.000000000 +0200
@@ -27,7 +27,7 @@
 #include "find_email_adr.h"
 
 int listcontrol(struct email_container *fromemails, const char *listdir,
-		const char *controladdr, const char *mlmmjsub,
+		const char *controlstr, const char *mlmmjsub,
 		const char *mlmmjunsub, const char *mlmmjsend,
 		const char *mlmmjbounce, const char *mailname);
 
diff -urN orig-mlmmj-1.2.11/src/listcontrol.c mlmmj-1.2.11/src/listcontrol.c
--- orig-mlmmj-1.2.11/src/listcontrol.c	2006-01-04 20:10:24.000000000 +0100
+++ mlmmj-1.2.11/src/listcontrol.c	2006-04-09 18:39:51.000000000 +0200
@@ -98,15 +98,14 @@
 
 
 int listcontrol(struct email_container *fromemails, const char *listdir,
-		const char *controladdr, const char *mlmmjsub,
+		const char *controlstr, const char *mlmmjsub,
 		const char *mlmmjunsub, const char *mlmmjsend,
 		const char *mlmmjbounce, const char *mailname)
 {
-	char *atsign, *recipdelimsign, *listdelim, *bouncenr, *tmpstr;
-	char *controlstr, *param = NULL, *conffilename, *moderatefilename;
+	char *bouncenr, *tmpstr;
+	char *param = NULL, *conffilename, *moderatefilename;
 	char *c, *archivefilename, *sendfilename;
 	const char *subswitch;
-	size_t len;
 	struct stat stbuf;
 	int closedlist, nosubconfirm, tmpfd, noget, i, closedlistsub,
 	    subonlyget = 0;
@@ -126,18 +125,6 @@
 	else
 		subswitch = "-C";
 	
-	listdelim = getlistdelim(listdir);
-	recipdelimsign = strstr(controladdr, listdelim);
-	MY_ASSERT(recipdelimsign);
-	atsign = index(controladdr, '@');
-	MY_ASSERT(atsign);
-	len = atsign - recipdelimsign;
-
-	controlstr = mymalloc(len);
-	MY_ASSERT(controlstr);
-	snprintf(controlstr, len, "%s", recipdelimsign + strlen(listdelim));
-	myfree(listdelim);
-
 #if 0
 	log_error(LOG_ARGS, "controlstr = [%s]\n", controlstr);
 	log_error(LOG_ARGS, "fromemails->emaillist[0] = [%s]\n",
@@ -168,7 +155,6 @@
 				exit(EXIT_SUCCESS);
 			}
 
-			myfree(controlstr);
 			break;
 
 		}
diff -urN orig-mlmmj-1.2.11/src/mlmmj-process.c mlmmj-1.2.11/src/mlmmj-process.c
--- orig-mlmmj-1.2.11/src/mlmmj-process.c	2006-01-23 18:44:53.000000000 +0100
+++ mlmmj-1.2.11/src/mlmmj-process.c	2006-04-09 18:39:51.000000000 +0200
@@ -299,6 +299,38 @@
 }
 
 
+static char *recipient_extra(const char *listdir, const char *addr)
+{
+	char *listdelim;
+	char *delim, *atsign, *ret;
+	size_t len;
+
+	if (!addr)
+		return NULL;
+
+	listdelim = getlistdelim(listdir);
+	
+	delim = strstr(addr, listdelim);
+	if (!delim) {
+		myfree(listdelim);
+		return NULL;
+	}
+	delim += strlen(listdelim);
+	myfree(listdelim);
+
+	atsign = strrchr(delim, '@');
+	if (!atsign)
+		return NULL;
+
+	len = atsign - delim;
+	ret = (char *)mymalloc(len + 1);
+	strncpy(ret, delim, len);
+	ret[len] = '\0';
+
+	return ret;
+}
+
+
 static void print_help(const char *prg)
 {
         printf("Usage: %s -L /path/to/list -m /path/to/mail [-h] [-P] [-V]\n"
@@ -323,16 +355,16 @@
 	char *mlmmjsend, *mlmmjsub, *mlmmjunsub, *mlmmjbounce;
 	char *bindir, *subjectprefix, *discardname, *listaddr, *listdelim;
 	char *listfqdn, *listname, *fromaddr;
-	char *queuefilename, *recipextra, *owner = NULL;
+	char *queuefilename, *recipextra = NULL, *owner = NULL;
 	char *maildata[2] = { "posteraddr", NULL };
+	char *envstr, *efrom;
 	struct stat st;
 	uid_t uid;
 	struct email_container fromemails = { 0, NULL };
 	struct email_container toemails = { 0, NULL };
 	struct email_container ccemails = { 0, NULL };
-	struct email_container efromemails = { 0, NULL };
-	struct email_container dtoemails = { 0, NULL };
-	struct email_container *whichto;
+	struct email_container rpemails = { 0, NULL };
+	struct email_container dtemails = { 0, NULL };
 	struct strlist *access_rules = NULL;
 	struct strlist *delheaders = NULL;
 	struct strlist allheaders;
@@ -473,60 +505,77 @@
 	if(footfd >= 0)
 		close(footfd);
 
-	if(readhdrs[0].token) { /* From: addresses */
-		for(i = 0; i < readhdrs[0].valuecount; i++) {
-			find_email_adr(readhdrs[0].values[i], &fromemails);
-		}
+	/* From: addresses */
+	for(i = 0; i < readhdrs[0].valuecount; i++) {
+		find_email_adr(readhdrs[0].values[i], &fromemails);
 	}
 
-	if(readhdrs[1].token) { /* To: addresses */
-		for(i = 0; i < readhdrs[1].valuecount; i++) {
-			find_email_adr(readhdrs[1].values[i], &toemails);
-		}
+	/* To: addresses */
+	for(i = 0; i < readhdrs[1].valuecount; i++) {
+		find_email_adr(readhdrs[1].values[i], &toemails);
 	}
 
-	if(readhdrs[2].token) { /* Cc: addresses */
-		for(i = 0; i < readhdrs[2].valuecount; i++) {
-			find_email_adr(readhdrs[2].values[i], &ccemails);
-		}
+	/* Cc: addresses */
+	for(i = 0; i < readhdrs[2].valuecount; i++) {
+		find_email_adr(readhdrs[2].values[i], &ccemails);
 	}
 
-	if(readhdrs[3].token) { /* Return-Path: (envelope from) */
-		for(i = 0; i < readhdrs[3].valuecount; i++) {
-			find_email_adr(readhdrs[3].values[i], &efromemails);
-		}
-		if(efromemails.emailcount == 0) {
-			efromemails.emaillist =
-				(char **)mymalloc(sizeof(char *));
-			efromemails.emaillist[0] = mystrdup("<>");
-		}
+	/* Return-Path: addresses */
+	for(i = 0; i < readhdrs[3].valuecount; i++) {
+		find_email_adr(readhdrs[3].values[i], &rpemails);
 	}
 
-	if(readhdrs[4].token) { /* Delivered-To: (envelope to) */
-		for(i = 0; i < readhdrs[4].valuecount; i++) {
-			find_email_adr(readhdrs[4].values[i], &dtoemails);
-		}
+	/* Delivered-To: addresses */
+	for(i = 0; i < readhdrs[4].valuecount; i++) {
+		find_email_adr(readhdrs[4].values[i], &dtemails);
 	}
 
-	if(dtoemails.emaillist)
-		whichto = &dtoemails;
-	else if(toemails.emaillist)
-		whichto = &toemails;
-	else
-		whichto = NULL;
+	/* envelope from */
+	if((envstr = getenv("SENDER")) != NULL) {
+		/* qmail, postfix, exim */
+		efrom = mystrdup(envstr);
+	} else if(rpemails.emailcount >= 1) {
+		/* the (first) Return-Path: header */
+		efrom = mystrdup(rpemails.emaillist[0]);
+	} else {
+		efrom = mystrdup("");
+	}
 
-	listdelim = getlistdelim(listdir);
-	if(whichto && whichto->emaillist && whichto->emaillist[0]){
-		recipextra = strstr(whichto->emaillist[0], listdelim);
-		if (recipextra)
-			recipextra += strlen(listdelim);
-	} else
+	/* address extension (the "foo" part of "user+foo@domain.tld") */
+	if((envstr = getenv("EXT")) != NULL) {
+		/* qmail */
+		recipextra = mystrdup(envstr);
+	} else if((envstr = getenv("EXTENSION")) != NULL) {
+		/* postfix */
+		recipextra = mystrdup(envstr);
+	} else if((envstr = getenv("LOCAL_PART_SUFFIX")) != NULL) {
+		/* exim */
+		listdelim = getlistdelim(listdir);
+		if (strncmp(envstr, listdelim, strlen(listdelim)) == 0) {
+			recipextra = mystrdup(envstr + strlen(listdelim));
+		} else {
+			recipextra = mystrdup(envstr);
+		}
+		myfree(listdelim);
+	} else if(dtemails.emailcount >= 1) {
+		/* parse the (first) Delivered-To: header */
+		recipextra = recipient_extra(listdir, dtemails.emaillist[0]);
+	} else if(toemails.emailcount >= 1) {
+		/* parse the (first) To: header */
+		recipextra = recipient_extra(listdir, toemails.emaillist[0]);
+	} else {
 		recipextra = NULL;
-	myfree(listdelim);
+	}
+
+	if(recipextra && (strlen(recipextra) == 0)) {
+		myfree(recipextra);
+		recipextra = NULL;
+	}
 
+	/* Why is this here, and not in listcontrol() ?  -- mortenp 20060409 */
 	if(recipextra) {
 		owner = concatstr(2, listdir, "/control/owner");
-		if(owner && strncmp(recipextra, "owner@", 6) == 0) {
+		if(owner && strcmp(recipextra, "owner") == 0) {
 			/* strip envelope from before resending */
 			delheaders->count = 0;
 			delheaders->strs = NULL;
@@ -559,11 +608,11 @@
 			unlink(mailfile);
 			log_oper(listdir, OPLOGFNAME, "mlmmj-recieve: sending"
 					" mail from %s to owner",
-					efromemails.emaillist[0]);
+					efrom);
 			execlp(mlmmjsend, mlmmjsend,
 					"-l", "4",
 					"-L", listdir,
-					"-F", efromemails.emaillist[0],
+					"-F", efrom,
 					"-s", owner,
 					"-a",
 					"-m", donemailname, (char *)NULL);
@@ -575,7 +624,7 @@
 		log_error(LOG_ARGS, "listcontrol(from, %s, %s, %s, %s, %s, %s)\n", listdir, toemails.emaillist[0], mlmmjsub, mlmmjunsub, mlmmjsend, mlmmjbounce);
 #endif
 		unlink(mailfile);
-		listcontrol(&fromemails, listdir, whichto->emaillist[0],
+		listcontrol(&fromemails, listdir, recipextra,
 			    mlmmjsub, mlmmjunsub, mlmmjsend, mlmmjbounce,
 			    donemailname);
 		return EXIT_SUCCESS;
@@ -604,14 +653,14 @@
 
 	myfree(delheaders);
 
-	if(efromemails.emailcount != 1) { /* don't send mails with <> in From
+	if(strcmp(efrom, "") == 0) { /* don't send mails with <> in From
 					     to the list */
 		discardname = concatstr(3, listdir,
 				"/queue/discarded/",
 				randomstr);
-		log_error(LOG_ARGS, "Discarding %s due to invalid envelope"
-				" from email count (was %d, must be 1)",
-				mailfile, efromemails.emailcount);
+		errno = 0;
+		log_error(LOG_ARGS, "Discarding %s due to missing envelope"
+				" from address", mailfile);
 		rename(mailfile, discardname);
 		unlink(donemailname);
 		myfree(donemailname);

--=_12kz0jhwx6ao--
