From: Henne Vogelsang <hvogel@opensuse.org>
Date: Thu, 25 Jan 2007 13:53:42 +0000
Subject: [PATCH] access log handling
Message-Id: <20070125135342.GD20540@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi peepz,

i would like to move logging about access rules to the operation log.  I
think this is clearly mlm related and has nothing to do with the mail
setup. A usecase for me is that i can expose the operation log to
listowners via a webfrontend. I wouldnt be comfortable doing that with
the systems mail log.

Also i cleaned up my previous additions to the log string. There was a
bug so that it always printed rule #0 and the from was not included
(which makes it a pita to find out why a specific user/mail was denied
access).

Patch attached.

Henne

-- 
Henne Vogelsang, Teamlead Core Services
"Rules change. The Game remains the same."
			 - Omar (The Wire)

--7JfCtLOvnd9MIVvH
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-log.patch"

--- src/mlmmj-process.c
+++ src/mlmmj-process.c
@@ -64,6 +64,7 @@
 	regex_t regexp;
 	unsigned int not;
 	enum action act;
+	char* str;
 	struct rule_list *next;
 };
 
@@ -167,7 +168,7 @@
 }
 
 
-static enum action do_access(struct strlist *rule_strs, struct strlist *hdrs)
+static enum action do_access(struct strlist *rule_strs, struct strlist *hdrs, const char* from, const char *listdir)
 {
 	int i;
 	unsigned int match;
@@ -189,7 +190,7 @@
 		new_rule->next = head;
 		head = new_rule;
 
-		rule_ptr = rule_strs->strs[i];
+		new_rule->str = rule_ptr = rule_strs->strs[i];
 		if (strncmp(rule_ptr, "allow", 5) == 0) {
 			rule_ptr += 5;
 			new_rule->act = ALLOW;
@@ -284,8 +285,9 @@
 					break;
 			}
 
-			log_error(LOG_ARGS, "A mail was %s by rule #%d",
-					logstr, rule_nr);
+			log_oper(listdir, OPLOGFNAME, "mlmmj-process: access "
+					"A mail with header \"%s\" from %s was %s by rule #%d \"%s\"",
+					hdrs->strs[i], from, logstr, rule_nr, rule->str);
 			ret = rule->act;
 			free_rules(head);
 			return ret;
@@ -812,7 +814,7 @@
 		enum action accret;
 		/* Don't send a mail about denial to the list, but silently
 		 * discard and exit. Also do this in case it's turned off */
-		accret = do_access(access_rules, &allheaders);
+		accret = do_access(access_rules, &allheaders, fromemails.emaillist[0], listdir);
 		if (accret == DENY) {
 			if ((strcasecmp(listaddr, fromemails.emaillist[0]) ==
 						0) || noaccessdenymails) {

--7JfCtLOvnd9MIVvH--
