From: Jeremy Hinegardner <jeremy@hinegardner.org>
Date: Sun, 13 Nov 2005 03:47:40 +0000
Subject: recipient delimiter bug with RC1
Message-Id: <20051113034740.GF4414@hinegardner.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I was looking forward recipient delimiter to be configurable.  But it
just so happens that on postfix with virtual domains and postfix's
recipient delimiter set to '-' it doesn't quite work.  The bug manifests
itself if you have a mailing list that has a name containing the
recipient delimiter.  

In other words, if both postfix and mlmmj have their recipient
delimiters set to '-' and you create a mailing list named 'mlmmj-test'
then your subscribes, unsubscribes are mishandled by 'mlmmj' when it
attempts to parse the email address for control commands.

For example:
    postfix recipient delimiter = -
    mlmmj recipient delimiter   = -
    list name                   = mlmmj-test

When mlmmj-test-subscribe@example.com gets to mlmmj it parse the command
as being 'test-subscribe' which doesn't match so it exits.  Even if it
was just a regular post to mlmmj-test@example.com then mlmmj assumes
that it has a command since the recipient delimiter is present.

I'm not sure if I explained the problem very well, but the attached
patch fixes it for me.

enjoy,

-jeremy

--
========================================================================
Jeremy Hinegardner                              jeremy@hinegardner.org 


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-1.2.9-RC1.patch"

diff -r -u ./mlmmj-1.2.9-RC1-orig/include/listcontrol.h ./mlmmj-1.2.9-RC1/include/listcontrol.h
--- ./mlmmj-1.2.9-RC1-orig/include/listcontrol.h	Wed Jun 16 15:11:52 2004
+++ ./mlmmj-1.2.9-RC1/include/listcontrol.h	Sat Nov 12 16:49:08 2005
@@ -25,7 +25,7 @@
 #define LISTCONTROL_H
 
 #include "find_email_adr.h"
-
+char* getdelimlocation(const char* emailaddress, const char *listdelim);
 int listcontrol(struct email_container *fromemails, const char *listdir,
 		const char *controladdr, const char *mlmmjsub,
 		const char *mlmmjunsub, const char *mlmmjsend,
diff -r -u ./mlmmj-1.2.9-RC1-orig/src/listcontrol.c ./mlmmj-1.2.9-RC1/src/listcontrol.c
--- ./mlmmj-1.2.9-RC1-orig/src/listcontrol.c	Sun Oct  9 08:17:52 2005
+++ ./mlmmj-1.2.9-RC1/src/listcontrol.c	Sat Nov 12 16:59:32 2005
@@ -65,6 +65,7 @@
 	CTRL_HELP,
 	CTRL_GET,
 	CTRL_LIST,
+    CTRL_OWNER,
 	CTRL_END  /* end marker, must be last */
 };
 
@@ -93,23 +94,122 @@
 	{ "moderate",           1 },
 	{ "help",               0 },
 	{ "get",                1 },
-	{ "list",               0 }
+	{ "list",               0 },
+    { "owner",              0 },
 };
 
+/*
+ * with listdelim configurable, the listdelim could possibly appear in
+ * the list name and we need to be able to test if it is just appearing
+ * in the email address or if it actually in the email address
+ */
+char* getdelimlocation(const char* emailaddress, const char *listdelim)
+{
+    int i;
+    char buf[BUFSIZE];
+    char* delimpos = NULL;
+    
+    for (i = CTRL_SUBSCRIBE_DIGEST ; (i < CTRL_END) && (NULL == delimpos) ; i++) {
+        memset(buf,'\0',BUFSIZE);
+        strncat(buf,listdelim,strlen(listdelim));
+        strncat(buf,ctrl_commands[i].command,strlen(ctrl_commands[i].command));
+        delimpos = strstr(emailaddress,(const char*)buf);
+    }
 
+    return delimpos;
+}
+
+/*
+ * now with the listdelim configurable, it it possible for the listdelim 
+ * character to be in the email address ahead of where it needs to be
+ * processed.  
+ *
+ * This function attempts to parse the control address and pull out the
+ * command and parameters.
+ *
+ * a ctrl_e value is returned, and **param will contain the param value
+ * if there is one.  the calling function must remember to free
+ * param.
+ */
+int getcontrolcommand(const char *listdir, const char *listdelim, const char *controladdr, char **param)
+{
+    char *atsign, *controlbuf, *controlstr, *ctrlptr;
+    size_t len,cmdlen;
+    unsigned int ctrl = CTRL_END ;
+    int ctrl_found = 0;
+    int buflen;
+
+	atsign = strchr(controladdr, '@');
+	MY_ASSERT(atsign);
+    buflen     = atsign - controladdr + 1; 
+    controlbuf = mymalloc(buflen);
+    MY_ASSERT(controlbuf);
+    memset(controlbuf,'\0',buflen);
+    strncpy(controlbuf,controladdr,buflen -1);
+
+#if 0
+    log_oper(listdir, OPLOGFNAME, "controladdr   = [%s]", controladdr);
+    log_oper(listdir, OPLOGFNAME, "atsign        = [%s]", atsign);
+    log_oper(listdir, OPLOGFNAME, "controlbuffer = [%s]", controlbuf);
+#endif
+
+    ctrlptr = strstr(controlbuf,listdelim);
+    while (!ctrl_found && (NULL != ctrlptr)) {
+        len = strlen(ctrlptr);
+        controlstr = mymalloc(len) ;
+        MY_ASSERT(controlstr);
+	    snprintf(controlstr, len, "%s", ctrlptr + strlen(listdelim));
+#if 0
+        log_oper(listdir,OPLOGFNAME,"ctrlptr     = [%s]",ctrlptr);
+        log_oper(listdir,OPLOGFNAME,"controladdr = [%s]",controladdr);
+        log_oper(listdir,OPLOGFNAME,"controlstr  = [%s]",controlstr);
+#endif
+        /* loop over the valid commands looking for a match */
+        for (ctrl=0; ctrl<CTRL_END; ctrl++) {
+            cmdlen = strlen(ctrl_commands[ctrl].command);
+            if (strncmp(controlstr, ctrl_commands[ctrl].command, cmdlen) == 0) {
+                
+                /* if this is a valid command, and it has parameters,
+                 * then get the parameters
+                 */
+                if (ctrl_commands[ctrl].accepts_parameter && (controlstr[cmdlen] == '-')) {
+                    *param = mystrdup(controlstr + cmdlen + 1);
+                    MY_ASSERT(*param);
+                    if (strchr(*param, '/')) {
+                        errno = 0;
+                        log_error(LOG_ARGS, "Slash (/) in"
+                            " list control request,"
+                            " discarding mail");
+                        exit(EXIT_SUCCESS);
+                    }
+                    ctrl_found = 1;
+                } else if (!ctrl_commands[ctrl].accepts_parameter && (controlstr[cmdlen] == '\0')) {
+                    *param = NULL;
+                    ctrl_found = 1;
+                } else {
+                    log_oper(listdir, OPLOGFNAME, "invalid command [%s]",controlstr);
+                }
+                myfree(controlstr);
+                break;
+            }
+        }
+
+        ctrlptr = strstr(ctrlptr+1,listdelim);
+    }
+    return ctrl;	
+}
+
 int listcontrol(struct email_container *fromemails, const char *listdir,
 		const char *controladdr, const char *mlmmjsub,
 		const char *mlmmjunsub, const char *mlmmjsend,
 		const char *mlmmjbounce, const char *mailname)
 {
-	char *atsign, *recipdelimsign, *listdelim, *bouncenr, *tmpstr;
-	char *controlstr, *param = NULL, *conffilename, *moderatefilename;
+	char *listdelim, *bouncenr, *tmpstr;
+	char *param = NULL, *conffilename, *moderatefilename;
 	char *c, *archivefilename, *sendfilename;
 	const char *subswitch;
-	size_t len;
 	struct stat stbuf;
 	int closedlist, nosubconfirm, tmpfd, noget, i, subonlyget = 0;
-	size_t cmdlen;
 	unsigned int ctrl;
 	struct strlist *owners;
 	
@@ -123,53 +223,12 @@
 		subswitch = "-C";
 	
 	listdelim = getlistdelim(listdir);
-	recipdelimsign = strstr(controladdr, listdelim);
-	MY_ASSERT(recipdelimsign);
-	atsign = index(controladdr, '@');
-	MY_ASSERT(atsign);
-	len = atsign - recipdelimsign;
+    ctrl = getcontrolcommand(listdir,listdelim,controladdr,&param); 
 
-	controlstr = mymalloc(len);
-	MY_ASSERT(controlstr);
-	snprintf(controlstr, len, "%s", recipdelimsign + strlen(listdelim));
-	myfree(listdelim);
-
 #if 0
-	log_error(LOG_ARGS, "controlstr = [%s]\n", controlstr);
 	log_error(LOG_ARGS, "fromemails->emaillist[0] = [%s]\n",
 			fromemails->emaillist[0]);
 #endif
-	for (ctrl=0; ctrl<CTRL_END; ctrl++) {
-		cmdlen = strlen(ctrl_commands[ctrl].command);
-		if (strncmp(controlstr, ctrl_commands[ctrl].command, cmdlen)
-				== 0) {
-
-			if (ctrl_commands[ctrl].accepts_parameter &&
-					(controlstr[cmdlen] == '-')) {
-				param = mystrdup(controlstr + cmdlen + 1);
-				MY_ASSERT(param);
-				if (strchr(param, '/')) {
-					errno = 0;
-					log_error(LOG_ARGS, "Slash (/) in"
-						" list control request,"
-						" discarding mail");
-					exit(EXIT_SUCCESS);
-				}
-			} else if (!ctrl_commands[ctrl].accepts_parameter &&
-					(controlstr[cmdlen] == '\0')) {
-				param = NULL;
-			} else {
-				/* malformed request, ignore and clean up */
-				unlink(mailname);
-				exit(EXIT_SUCCESS);
-			}
-
-			myfree(controlstr);
-			break;
-
-		}
-	}
-	
 	/* Only allow mails with bad From: header to be bounce mails */
 	if(fromemails->emailcount != 1 && ctrl != CTRL_BOUNCES) {
 		log_error(LOG_ARGS, "Discarding mail with invalid From: "
@@ -570,6 +629,13 @@
 			}
 		}
 		break;
+
+    default: 
+        ;;
+#if 0
+        log_oper(listdir,OPLOGFNAME,"Unknown control [%d] from control address [%s]",ctrl,controladdr);
+#endif
+
 	}
 
 	unlink(mailname);
Only in ./mlmmj-1.2.9-RC1-orig/src: mlmmj-make-ml.sh
diff -r -u ./mlmmj-1.2.9-RC1-orig/src/mlmmj-process.c ./mlmmj-1.2.9-RC1/src/mlmmj-process.c
--- ./mlmmj-1.2.9-RC1-orig/src/mlmmj-process.c	Sun Oct  9 08:17:52 2005
+++ ./mlmmj-1.2.9-RC1/src/mlmmj-process.c	Sat Nov 12 19:02:24 2005
@@ -517,7 +517,7 @@
 
 	listdelim = getlistdelim(listdir);
 	if(whichto && whichto->emaillist && whichto->emaillist[0]){
-		recipextra = strstr(whichto->emaillist[0], listdelim);
+		recipextra = getdelimlocation(whichto->emaillist[0], listdelim);
 		if (recipextra)
 			recipextra += strlen(listdelim);
 	} else
@@ -571,7 +571,7 @@
 			exit(EXIT_FAILURE);
 		}
 #if 0
-		log_error(LOG_ARGS, "listcontrol(from, %s, %s, %s, %s, %s, %s)\n", listdir, toemails.emaillist[0], mlmmjsub, mlmmjunsub, mlmmjsend, mlmmjbounce);
+		log_error(LOG_ARGS, "listcontrol(from, %s, %s, %s, %s, %s, %s)\n", listdir, whichto->emaillist[0], mlmmjsub, mlmmjunsub, mlmmjsend, mlmmjbounce);
 #endif
 		unlink(mailfile);
 		listcontrol(&fromemails, listdir, whichto->emaillist[0],

--OXfL5xGRrasGEqWY--
