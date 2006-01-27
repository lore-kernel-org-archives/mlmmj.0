From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Fri, 27 Jan 2006 00:42:58 +0000
Subject: Re: mlmmj-recieve silently discarding messages (Re: Is anyone
Message-Id: <20060127014258.455a0ybg0s0ogos4@mail.n0rd.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_2riiil1rb82s"
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601161200120.26234@e-smith.charlieb.ott.istop.com>
To: mlmmj@mlmmj.org

This message is in MIME format.

--=_2riiil1rb82s
Content-Type: text/plain;
	charset=ISO-8859-1;
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Quoting "Morten K. Poulsen" <morten@afdelingp.dk>:
> I will cook up a patch that logs the reason later.

Attached is a patch which adds logging at every condition where we 
ignore a list control request (subscribe, bounce, get, ...). The patch 
will not resolve your qmail issue, but it should add a log entry when 
it happens.

Morten

--=_2riiil1rb82s
Content-Type: text/plain;
	charset=ISO-8859-1;
	name="patch-mlmmj-listcontrol_logmsgs.diff"
Content-Disposition: attachment;
	filename="patch-mlmmj-listcontrol_logmsgs.diff"
Content-Transfer-Encoding: 7bit

Index: mlmmj-process.c
===================================================================
RCS file: /home/mmj/MMJCVS/mlmmj/src/mlmmj-process.c,v
retrieving revision 1.74
retrieving revision 1.75
diff -u -r1.74 -r1.75
--- mlmmj-process.c	18 Jan 2006 23:37:58 -0000	1.74
+++ mlmmj-process.c	27 Jan 2006 00:33:03 -0000	1.75
@@ -1,6 +1,6 @@
 /* Copyright (C) 2003, 2003, 2004 Mads Martin Joergensen <mmj at mmj.dk>
  *
- * $Id: mlmmj-process.c,v 1.74 2006/01/18 23:37:58 mortenp Exp $
+ * $Id: mlmmj-process.c,v 1.75 2006/01/27 00:33:03 mortenp Exp $
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to
@@ -578,6 +578,8 @@
 		listcontrol(&fromemails, listdir, whichto->emaillist[0],
 			    mlmmjsub, mlmmjunsub, mlmmjsend, mlmmjbounce,
 			    donemailname);
+		unlink(donemailname);
+
 		return EXIT_SUCCESS;
 	}
 
Index: listcontrol.c
===================================================================
RCS file: /home/mmj/MMJCVS/mlmmj/src/listcontrol.c,v
retrieving revision 1.43
retrieving revision 1.44
diff -u -r1.43 -r1.44
--- listcontrol.c	4 Jan 2006 19:10:24 -0000	1.43
+++ listcontrol.c	27 Jan 2006 00:33:48 -0000	1.44
@@ -1,6 +1,6 @@
 /* Copyright (C) 2003 Mads Martin Joergensen <mmj at mmj.dk>
  *
- * $Id: listcontrol.c,v 1.43 2006/01/04 19:10:24 mmj Exp $
+ * $Id: listcontrol.c,v 1.44 2006/01/27 00:33:48 mortenp Exp $
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to
@@ -113,6 +113,7 @@
 	size_t cmdlen;
 	unsigned int ctrl;
 	struct strlist *owners;
+	int owner_idx;
 	
 	/* A closed list doesn't allow subscribtion and unsubscription */
 	closedlist = statctrl(listdir, "closedlist");
@@ -148,8 +149,16 @@
 		if (strncmp(controlstr, ctrl_commands[ctrl].command, cmdlen)
 				== 0) {
 
-			if (ctrl_commands[ctrl].accepts_parameter &&
-					(controlstr[cmdlen] == '-')) {
+			if (ctrl_commands[ctrl].accepts_parameter) {
+				if (controlstr[cmdlen] != '-') {
+					errno = 0;
+					log_error(LOG_ARGS, "Command \"%s\""
+						" requires a parameter, but no"
+						" parameter was given."
+						" Ignoring mail",
+						ctrl_commands[ctrl].command);
+					return -1;
+                                }
 				param = mystrdup(controlstr + cmdlen + 1);
 				MY_ASSERT(param);
 				if (strchr(param, '/')) {
@@ -157,15 +166,20 @@
 					log_error(LOG_ARGS, "Slash (/) in"
 						" list control request,"
 						" discarding mail");
-					exit(EXIT_SUCCESS);
+					return -1;
 				}
-			} else if (!ctrl_commands[ctrl].accepts_parameter &&
-					(controlstr[cmdlen] == '\0')) {
-				param = NULL;
+
 			} else {
-				/* malformed request, ignore and clean up */
-				unlink(mailname);
-				exit(EXIT_SUCCESS);
+				if (controlstr[cmdlen] != '\0') {
+					errno = 0;
+					log_error(LOG_ARGS, "Command \"%s\""
+						" does not accept a parameter,"
+						" but a parameter was given."
+						" Ignoring mail",
+						ctrl_commands[ctrl].command);
+					return -1;
+				}
+				param = NULL;
 			}
 
 			myfree(controlstr);
@@ -176,22 +190,30 @@
 	
 	/* Only allow mails with bad From: header to be bounce mails */
 	if(fromemails->emailcount != 1 && ctrl != CTRL_BOUNCES) {
-		log_error(LOG_ARGS, "Discarding mail with invalid From: "
+		errno = 0;
+		log_error(LOG_ARGS, "Ignoring mail with invalid From: "
 				"which was not a bounce");
-		unlink(mailname);
-		exit(EXIT_SUCCESS);
+		return -1;
 	}
 
 	switch (ctrl) {
 
 	/* listname+subscribe-digest@domain.tld */
 	case CTRL_SUBSCRIBE_DIGEST:
-		unlink(mailname);
-		if (closedlist || closedlistsub)
-			exit(EXIT_SUCCESS);
-		if (!strchr(fromemails->emaillist[0], '@'))
-			/* Not a valid From: address, silently ignore */
-			exit(EXIT_SUCCESS);
+		if (closedlist || closedlistsub) {
+			errno = 0;
+			log_error(LOG_ARGS, "A subscribe-digest request was"
+				" sent to a closed list. Ignoring mail");
+			return -1;
+		}
+		if (!strchr(fromemails->emaillist[0], '@')) {
+			/* Not a valid From: address */
+			errno = 0;
+			log_error(LOG_ARGS, "A subscribe-digest request was"
+				" sent with an invalid From: header."
+				" Ignoring mail");
+			return -1;
+		}
 		log_oper(listdir, OPLOGFNAME, "mlmmj-sub: request for digest"
 					" subscription from %s",
 					fromemails->emaillist[0]);
@@ -207,12 +229,20 @@
 
 	/* listname+subscribe-nomail@domain.tld */
 	case CTRL_SUBSCRIBE_NOMAIL:
-		unlink(mailname);
-		if (closedlist || closedlistsub)
-			exit(EXIT_SUCCESS);
-		if (!strchr(fromemails->emaillist[0], '@'))
-			/* Not a valid From: address, silently ignore */
-			exit(EXIT_SUCCESS);
+		if (closedlist || closedlistsub) {
+			errno = 0;
+			log_error(LOG_ARGS, "A subscribe-nomail request was"
+				" sent to a closed list. Ignoring mail");
+			return -1;
+		}
+		if (!strchr(fromemails->emaillist[0], '@')) {
+			/* Not a valid From: address */
+			errno = 0;
+			log_error(LOG_ARGS, "A subscribe-nomail request was"
+				" sent with an invalid From: header."
+				" Ignoring mail");
+			return -1;
+		}
 		log_oper(listdir, OPLOGFNAME, "mlmmj-sub: request for nomail"
 					" subscription from %s",
 					fromemails->emaillist[0]);
@@ -228,12 +258,20 @@
 
 	/* listname+subscribe@domain.tld */
 	case CTRL_SUBSCRIBE:
-		unlink(mailname);
-		if (closedlist || closedlistsub)
-			exit(EXIT_SUCCESS);
-		if (!strchr(fromemails->emaillist[0], '@'))
-			/* Not a valid From: address, silently ignore */
-			exit(EXIT_SUCCESS);
+		if (closedlist || closedlistsub) {
+			errno = 0;
+			log_error(LOG_ARGS, "A subscribe request was"
+				" sent to a closed list. Ignoring mail");
+			return -1;
+		}
+		if (!strchr(fromemails->emaillist[0], '@')) {
+			/* Not a valid From: address */
+			errno = 0;
+			log_error(LOG_ARGS, "A subscribe request was"
+				" sent with an invalid From: header."
+				" Ignoring mail");
+			return -1;
+		}
 		log_oper(listdir, OPLOGFNAME, "mlmmj-sub: request for regular"
 					" subscription from %s",
 					fromemails->emaillist[0]);
@@ -248,12 +286,15 @@
 
 	/* listname+subconf-digest-COOKIE@domain.tld */
 	case CTRL_CONFSUB_DIGEST:
-		unlink(mailname);
 		conffilename = concatstr(3, listdir, "/subconf/", param);
 		myfree(param);
 		if((tmpfd = open(conffilename, O_RDONLY)) < 0) {
-			/* invalid COOKIE, silently ignore */
-			exit(EXIT_SUCCESS);
+			/* invalid COOKIE */
+			errno = 0;
+			log_error(LOG_ARGS, "A subconf-digest request was"
+				" sent with a mismatching cookie."
+				" Ignoring mail");
+			return -1;
 		}
 		tmpstr = mygetline(tmpfd);
 		chomp(tmpstr);
@@ -273,12 +314,15 @@
 
 	/* listname+subconf-nomail-COOKIE@domain.tld */
 	case CTRL_CONFSUB_NOMAIL:
-		unlink(mailname);
 		conffilename = concatstr(3, listdir, "/subconf/", param);
 		myfree(param);
 		if((tmpfd = open(conffilename, O_RDONLY)) < 0) {
-			/* invalid COOKIE, silently ignore */
-			exit(EXIT_SUCCESS);
+			/* invalid COOKIE */
+			errno = 0;
+			log_error(LOG_ARGS, "A subconf-nomail request was"
+				" sent with a mismatching cookie."
+				" Ignoring mail");
+			return -1;
 		}
 		tmpstr = mygetline(tmpfd);
 		chomp(tmpstr);
@@ -298,12 +342,15 @@
 
 	/* listname+subconf-COOKIE@domain.tld */
 	case CTRL_CONFSUB:
-		unlink(mailname);
 		conffilename = concatstr(3, listdir, "/subconf/", param);
 		myfree(param);
 		if((tmpfd = open(conffilename, O_RDONLY)) < 0) {
-			/* invalid COOKIE, silently ignore */
-			exit(EXIT_SUCCESS);
+			/* invalid COOKIE */
+			errno = 0;
+			log_error(LOG_ARGS, "A subconf request was"
+				" sent with a mismatching cookie."
+				" Ignoring mail");
+			return -1;
 		}
 		tmpstr = mygetline(tmpfd);
 		chomp(tmpstr);
@@ -323,12 +370,20 @@
 
 	/* listname+unsubscribe-digest@domain.tld */
 	case CTRL_UNSUBSCRIBE_DIGEST:
-		unlink(mailname);
-		if (closedlist)
-			exit(EXIT_SUCCESS);
-		if (!strchr(fromemails->emaillist[0], '@'))
-			/* Not a valid From: address, silently ignore */
-			exit(EXIT_SUCCESS);
+		if (closedlist) {
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubscribe-digest request was"
+				" sent to a closed list. Ignoring mail");
+			return -1;
+		}
+		if (!strchr(fromemails->emaillist[0], '@')) {
+			/* Not a valid From: address */
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubscribe-digest request was"
+				" sent with an invalid From: header."
+				" Ignoring mail");
+			return -1;
+		}
 		log_oper(listdir, OPLOGFNAME, "mlmmj-unsub: %s requests"
 					" unsubscribe from digest",
 					fromemails->emaillist[0]);
@@ -344,12 +399,20 @@
 
 	/* listname+unsubscribe-nomail@domain.tld */
 	case CTRL_UNSUBSCRIBE_NOMAIL:
-		unlink(mailname);
-		if (closedlist)
-			exit(EXIT_SUCCESS);
-		if (!strchr(fromemails->emaillist[0], '@'))
-			/* Not a valid From: address, silently ignore */
-			exit(EXIT_SUCCESS);
+		if (closedlist) {
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubscribe-nomail request was"
+				" sent to a closed list. Ignoring mail");
+			return -1;
+		}
+		if (!strchr(fromemails->emaillist[0], '@')) {
+			/* Not a valid From: address */
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubscribe-nomail request was"
+				" sent with an invalid From: header."
+				" Ignoring mail");
+			return -1;
+		}
 		log_oper(listdir, OPLOGFNAME, "mlmmj-unsub: %s requests"
 					" unsubscribe from nomail",
 					fromemails->emaillist[0]);
@@ -365,12 +428,20 @@
 
 	/* listname+unsubscribe@domain.tld */
 	case CTRL_UNSUBSCRIBE:
-		unlink(mailname);
-		if (closedlist)
-			exit(EXIT_SUCCESS);
-		if (!strchr(fromemails->emaillist[0], '@'))
-			/* Not a valid From: address, silently ignore */
-			exit(EXIT_SUCCESS);
+		if (closedlist) {
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubscribe request was"
+				" sent to a closed list. Ignoring mail");
+			return -1;
+		}
+		if (!strchr(fromemails->emaillist[0], '@')) {
+			/* Not a valid From: address */
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubscribe request was"
+				" sent with an invalid From: header."
+				" Ignoring mail");
+			return -1;
+		}
 		log_oper(listdir, OPLOGFNAME, "mlmmj-unsub: %s requests"
 					" unsubscribe from regular list",
 					fromemails->emaillist[0]);
@@ -385,14 +456,21 @@
 
 	/* listname+unsubconf-digest-COOKIE@domain.tld */
 	case CTRL_CONFUNSUB_DIGEST:
-		unlink(mailname);
-		if (closedlist)
-			exit(EXIT_SUCCESS);
+		if (closedlist) {
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubconf-digest request was"
+				" sent to a closed list. Ignoring mail");
+			return -1;
+		}
 		conffilename = concatstr(3, listdir, "/unsubconf/", param);
 		myfree(param);
 		if((tmpfd = open(conffilename, O_RDONLY)) < 0) {
-			/* invalid COOKIE, silently ignore */
-			exit(EXIT_SUCCESS);
+			/* invalid COOKIE */
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubconf-digest request was"
+				" sent with a mismatching cookie."
+				" Ignoring mail");
+			return -1;
 		}
 		tmpstr = mygetline(tmpfd);
 		close(tmpfd);
@@ -412,14 +490,21 @@
 
 	/* listname+unsubconf-nomail-COOKIE@domain.tld */
 	case CTRL_CONFUNSUB_NOMAIL:
-		unlink(mailname);
-		if (closedlist)
-			exit(EXIT_SUCCESS);
+		if (closedlist) {
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubconf-nomail request was"
+				" sent to a closed list. Ignoring mail");
+			return -1;
+		}
 		conffilename = concatstr(3, listdir, "/unsubconf/", param);
 		myfree(param);
 		if((tmpfd = open(conffilename, O_RDONLY)) < 0) {
-			/* invalid COOKIE, silently ignore */
-			exit(EXIT_SUCCESS);
+			/* invalid COOKIE */
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubconf-nomail request was"
+				" sent with a mismatching cookie."
+				" Ignoring mail");
+			return -1;
 		}
 		tmpstr = mygetline(tmpfd);
 		close(tmpfd);
@@ -439,14 +524,21 @@
 
 	/* listname+unsubconf-COOKIE@domain.tld */
 	case CTRL_CONFUNSUB:
-		unlink(mailname);
-		if (closedlist)
-			exit(EXIT_SUCCESS);
+		if (closedlist) {
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubconf request was"
+				" sent to a closed list. Ignoring mail");
+			return -1;
+		}
 		conffilename = concatstr(3, listdir, "/unsubconf/", param);
 		myfree(param);
 		if((tmpfd = open(conffilename, O_RDONLY)) < 0) {
-			/* invalid COOKIE, silently ignore */
-			exit(EXIT_SUCCESS);
+			/* invalid COOKIE */
+			errno = 0;
+			log_error(LOG_ARGS, "An unsubconf request was"
+				" sent with a mismatching cookie."
+				" Ignoring mail");
+			return -1;
 		}
 		tmpstr = mygetline(tmpfd);
 		close(tmpfd);
@@ -491,14 +583,18 @@
 	/* listname+moderate-COOKIE@domain.tld */
 	case CTRL_MODERATE:
 		/* TODO Add accept/reject parameter to moderate */
-		unlink(mailname);
 		moderatefilename = concatstr(3, listdir, "/moderation/", param);
 		sendfilename = concatstr(2, moderatefilename, ".sending");
 		myfree(param);
 
 		if(stat(moderatefilename, &stbuf) < 0) {
 			myfree(moderatefilename);
-			exit(EXIT_SUCCESS); /* just exit, no mail to moderate */
+			/* no mail to moderate */
+			errno = 0;
+			log_error(LOG_ARGS, "A moderate request was"
+				" sent with a mismatching cookie."
+				" Ignoring mail");
+			return -1;
 		}
 		/* Rename it to avoid mail being sent twice */
 		if(rename(moderatefilename, sendfilename) < 0) {
@@ -519,34 +615,54 @@
 
 	/* listname+help@domain.tld */
 	case CTRL_HELP:
-		unlink(mailname);
-		if(strchr(fromemails->emaillist[0], '@')) {
-			log_oper(listdir, OPLOGFNAME, "%s requested help",
-				fromemails->emaillist[0]);
-			send_help(listdir, fromemails->emaillist[0],
-				  mlmmjsend);
+		if(!strchr(fromemails->emaillist[0], '@')) {
+			/* Not a valid From: address */
+			errno = 0;
+			log_error(LOG_ARGS, "A help request was"
+				" sent with an invalid From: header."
+				" Ignoring mail");
+			return -1;
 		}
+		log_oper(listdir, OPLOGFNAME, "%s requested help",
+				fromemails->emaillist[0]);
+		send_help(listdir, fromemails->emaillist[0], mlmmjsend);
 		break;
 
 	/* listname+get-INDEX@domain.tld */
 	case CTRL_GET:
-		unlink(mailname);
 		noget = statctrl(listdir, "noget");
-		if(noget)
-			exit(EXIT_SUCCESS);
+		if(noget) {
+			errno = 0;
+			log_error(LOG_ARGS, "A get request was sent to a list"
+				" with the noget option set. Ignoring mail");
+			return -1;
+		}
 		subonlyget = statctrl(listdir, "subonlyget");
-		if(subonlyget)
-			if(is_subbed(listdir, fromemails->emaillist[0]) != 0)
-				exit(EXIT_SUCCESS);
+		if(subonlyget) {
+			if(is_subbed(listdir, fromemails->emaillist[0]) != 0) {
+				errno = 0;
+				log_error(LOG_ARGS, "A get request was sent"
+					" from a non-subscribed address to a"
+					" list with the subonlyget option set."
+					" Ignoring mail");
+				return -1;
+			}
+		}
 		/* sanity check--is it all digits? */
 		for(c = param; *c != '\0'; c++) {
-			if(!isdigit((int)*c))
-				exit(EXIT_SUCCESS);
+			if(!isdigit((int)*c)) {
+				errno = 0;
+				log_error(LOG_ARGS, "The get request contained"
+					" non-digits in index. Ignoring mail");
+				return -1;
+			}
 		}
 		archivefilename = concatstr(3, listdir, "/archive/",
 						param);
-		if(stat(archivefilename, &stbuf) < 0)
-			exit(EXIT_SUCCESS);
+		if(stat(archivefilename, &stbuf) < 0) {
+			log_error(LOG_ARGS, "Unable to open archive file");
+			exit(EXIT_FAILURE);
+		}
 		log_oper(listdir, OPLOGFNAME, "%s got archive/%s",
 				fromemails->emaillist[0], archivefilename);
 		execlp(mlmmjsend, mlmmjsend,
@@ -562,7 +678,7 @@
 
 	/* listname+list@domain.tld */
 	case CTRL_LIST:
-		unlink(mailname);
+		owner_idx = -1;
 		owners = ctrlvalues(listdir, "owner");
 		for(i = 0; i < owners->count; i++) {
 			if(strcmp(fromemails->emaillist[0],
@@ -570,13 +686,29 @@
 				log_oper(listdir, OPLOGFNAME,
 						"%s requested sub list",
 				fromemails->emaillist[0]);
-				send_list(listdir, owners->strs[i], mlmmjsend);
+				owner_idx = i;
+				break;
 			}
 		}
+		if (owner_idx == -1) {
+			errno = 0;
+			log_error(LOG_ARGS, "A list request was sent to the"
+				" list from a non-owner address."
+				" Ignoring mail");
+			return -1;
+		} else {
+			send_list(listdir, owners->strs[owner_idx], mlmmjsend);
+		}
 		break;
-	}
 
-	unlink(mailname);
+	/* listname+???@domain.tld */
+	default:
+		errno = 0;
+		log_error(LOG_ARGS, "Unknown command \"%s\". Ignoring mail",
+								controlstr);
+		return -1;
+
+	}
 
 	return 0;
 }

--=_2riiil1rb82s--
