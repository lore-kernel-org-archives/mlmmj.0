From: Steve Beattie <sbeattie@suse.de>
Date: Thu, 05 Jul 2007 19:57:19 +0000
Subject: [RFC] misc moderation patches
Message-Id: <20070705195719.GK5523@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vDEbda84Uy/oId5W"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--vDEbda84Uy/oId5W
Content-Type: multipart/mixed; boundary="3FyYKcuUbgqNYeqV"
Content-Disposition: inline


--3FyYKcuUbgqNYeqV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Here are some patches mostly related to moderating emails for
discussion. I currently admin some lists with mailman, but would like
to move to mlmmj.

mlmmj-X-List-Administrivia_header.patch

	This patch adds two headers, an "X-List_administrivia: Yes" header
	for a few of the administrative messages that mlmmj sends out, and
	a header "X-mlmmj-mod-msg-id:" with the random string that is used
	as the argument for the 'moderate' command. The former is used
	similarly by mailman, and I filter based on it; I don't strictly
	need it if I have the latter header. The latter is really useful
	for writing scripts to moderate multiple messages at a time,
	rather than requiring them to parse out the Reply-To: header.

	If it's deemed worthwhile to keep the administrivia header,
	there's likely more locations that could use it, or it should
	just be added automatically in prepstdreply(). Another
	alternative would be to add these headers in the listtexts.

mlmmj-multiple_moderation_args.patch

	This patch adds the ability to moderate multiple messages by
	sending mlmmj a single message with multiple cookies addressed
	in the form

	  	listname+moderate-COOKIE[-COOKIE...]@domain.tld

	(This is one of my gripes with mailman, that in order to reject
	multiple spam messages by email, my script has to send a message
	for each message to reject, rather than just one message per
	list.) I left the moderation of subscriptions alone.

mlmmj-reject_command.patch

	This adds a 'reject' command to support rejecting messages for
	moderation, rather than accepting them as the 'moderate' command
	does. It supports rejecting multiple messages by taking messages
	in the form

		listname+reject-COOKIE[-COOKIE...]@domain.tld

	I didn't add support for rejecting subscriptions; that should
	probably be fixed.

mlmmj-add_moderator_command.patch

	This patch converts the From: address (currently
	"listname-moderators") in moderation messages to be a real address
	supported by mlmmj and adds the corresponding 'moderators'
	command. I'm not sure proper envelope filtering is done here,
	though.

As these patches touch similar areas of code, they are expected to be
applied in the order above.

Thanks.
--=20
Steve Beattie
SUSE Labs, Novell Inc.=20
<sbeattie@suse.de>
http://NxNW.org/~steve/

--3FyYKcuUbgqNYeqV
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-X-List-Administrivia_header.patch"
Content-Transfer-Encoding: quoted-printable

---
 src/mlmmj-process.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

Index: b/src/mlmmj-process.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/src/mlmmj-process.c
+++ b/src/mlmmj-process.c
@@ -79,6 +79,7 @@ void newmoderated(const char *listdir, c
 	int queuefd, moderatorsfd, mailfd;
 	size_t count =3D 0;
 	char *maildata[4] =3D { "moderateaddr", NULL, "moderators", NULL };
+	char *adminhdrs =3D "X-List-Administrivia: Yes";
 #if 0
 	printf("mailfilename =3D [%s], mailbasename =3D [%s]\n", mailfilename,
 			                                     mailbasename);
@@ -114,6 +115,7 @@ void newmoderated(const char *listdir, c
=20
 	maildata[1] =3D replyto;
 	maildata[3] =3D moderators;
+	adminhdrs =3D concatstr(3, adminhdrs, "\nX-mlmmj-mod-msg-id: ", mailbasen=
ame);
=20
 	from =3D concatstr(4, listname, listdelim, "owner@", listfqdn);
 	to =3D concatstr(3, listname, "-moderators@", listfqdn); /* FIXME JFA: Sh=
ould this be converted? Why, why not? */
@@ -123,7 +125,7 @@ void newmoderated(const char *listdir, c
 	myfree(listfqdn);
=20
 	queuefilename =3D prepstdreply(listdir, "moderation", "$listowner$",
-				     to, replyto, 2, maildata, NULL);
+				     to, replyto, 2, maildata, adminhdrs);
=20
 	if((queuefd =3D open(queuefilename, O_WRONLY|O_APPEND)) < 0) {
 		log_error(LOG_ARGS, "Could not open '%s'", queuefilename);
@@ -347,6 +349,7 @@ int main(int argc, char **argv)
 	char *queuefilename, *recipextra =3D NULL, *owner =3D NULL;
 	char *maxmailsizestr;
 	char *maildata[4] =3D { "posteraddr", NULL, "maxmailsize", NULL };
+	char *adminhdr =3D "X-List-Administrivia: Yes";
 	char *envstr, *efrom;
 	struct stat st;
 	uid_t uid;
@@ -657,7 +660,7 @@ int main(int argc, char **argv)
 			queuefilename =3D prepstdreply(listdir,
 					"maxmailsize", "$listowner$",
 					fromemails.emaillist[0],
-					NULL, 2, maildata, NULL);
+					NULL, 2, maildata, adminhdr);
 			MY_ASSERT(queuefilename)
 			myfree(listdelim);
 			myfree(listname);
@@ -768,7 +771,7 @@ int main(int argc, char **argv)
 				     listfqdn);
 		queuefilename =3D prepstdreply(listdir, "notintocc",
 					"$listowner$", fromemails.emaillist[0],
-					     NULL, 0, NULL, NULL);
+					     NULL, 0, NULL, adminhdr);
 		MY_ASSERT(queuefilename)
 		myfree(listdelim);
 		myfree(listname);
@@ -829,7 +832,7 @@ int main(int argc, char **argv)
 					"bounces-help@", listfqdn);
 			queuefilename =3D prepstdreply(listdir, "subonlypost",
 					"$listowner$", fromemails.emaillist[0],
-						     NULL, 1, maildata, NULL);
+						     NULL, 1, maildata, adminhdr);
 			MY_ASSERT(queuefilename)
 			myfree(listaddr);
 			myfree(listdelim);

--3FyYKcuUbgqNYeqV
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-multiple_moderation_args.patch"
Content-Transfer-Encoding: quoted-printable


(Note: some mail clients like mutt have hard coded limits on the length
of a To: address; e.g. mutt has a limit of 256 characters which it will
truncate if the address is longer than that.)
---
 src/listcontrol.c |   95 +++++++++++++++++++++++++++++++++++++++----------=
-----
 1 file changed, 69 insertions(+), 26 deletions(-)

Index: b/src/listcontrol.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/src/listcontrol.c
+++ b/src/listcontrol.c
@@ -98,6 +98,34 @@ static struct ctrl_command ctrl_commands
 	{ "list",               0 }
 };
=20
+struct strlist *splitparam(const char *param, const char split)
+{
+	char *c;
+	struct strlist *params =3D mymalloc(sizeof(struct strlist));
+	size_t len;
+
+	params->count =3D 0;
+	params->strs =3D NULL;
+
+	if (!param)
+		return params;
+
+	while (*param && (c =3D strchr(param, split)) !=3D NULL) {
+		len =3D c - param;
+		params->strs =3D myrealloc(params->strs, sizeof(c) * (params->count + 1)=
);
+		params->strs[params->count] =3D mymalloc(len + 1);
+		strncpy(params->strs[params->count], param, len);
+		params->strs[params->count++][len] =3D '\0';
+		param =3D c + 1;
+	}
+
+	/* handle last param */
+	if (*param) {
+		params->strs =3D myrealloc(params->strs, sizeof(c) * (params->count + 1)=
);
+		params->strs[params->count++] =3D mystrdup(param);
+	}
+	return params;
+}
=20
 int listcontrol(struct email_container *fromemails, const char *listdir,
 		const char *controlstr, const char *mlmmjsub,
@@ -114,7 +142,9 @@ int listcontrol(struct email_container *
 	size_t cmdlen;
 	unsigned int ctrl;
 	struct strlist *owners;
-	int owner_idx;
+	struct strlist *params;
+	int owner_idx, rc;
+	pid_t childpid;
 =09
 	/* A closed list doesn't allow subscribtion and unsubscription */
 	closedlist =3D statctrl(listdir, "closedlist");
@@ -588,13 +618,13 @@ int listcontrol(struct email_container *
 		exit(EXIT_FAILURE);
 		break;
=20
-	/* listname+moderate-COOKIE@domain.tld */
+	/* listname+moderate-COOKIE[-COOKIE...]@domain.tld */
 	case CTRL_MODERATE:
 		/* TODO Add accept/reject parameter to moderate */
-		moderatefilename =3D concatstr(3, listdir, "/moderation/", param);
=20
 		/* Subscriber moderation */
 		if(strncmp(param, "subscribe", 9) =3D=3D 0) {
+			moderatefilename =3D concatstr(3, listdir, "/moderation/", param);
 			log_oper(listdir, OPLOGFNAME, "%s moderated %s",
 				fromemails->emaillist[0], moderatefilename);
 			execlp(mlmmjsub, mlmmjsub,
@@ -603,32 +633,45 @@ int listcontrol(struct email_container *
 					"-c", (char *)NULL);
 		}
=20
-		sendfilename =3D concatstr(2, moderatefilename, ".sending");
+		rc =3D EXIT_SUCCESS;
+		params =3D splitparam(param, '-');
+		for (i =3D 0; i < params->count; i++) {
+			moderatefilename =3D concatstr(3, listdir, "/moderation/", params->strs=
[i]);
+
+			sendfilename =3D concatstr(2, moderatefilename, ".sending");
+
+			if (stat(moderatefilename, &stbuf) < 0) {
+				myfree(moderatefilename);
+				/* no mail to moderate */
+				errno =3D 0;
+				log_error(LOG_ARGS, "A moderate request was"
+					" sent with a mismatching cookie."
+					" Ignoring mail");
+				continue;
+			}
+			/* Rename it to avoid mail being sent twice */
+			if (rename(moderatefilename, sendfilename) < 0) {
+				log_error(LOG_ARGS, "Could not rename to .sending");
+				rc =3D EXIT_FAILURE;
+			}
=20
-		if(stat(moderatefilename, &stbuf) < 0) {
+			log_oper(listdir, OPLOGFNAME, "%s moderated %s",
+				fromemails->emaillist[0], moderatefilename);
 			myfree(moderatefilename);
-			/* no mail to moderate */
-			errno =3D 0;
-			log_error(LOG_ARGS, "A moderate request was"
-				" sent with a mismatching cookie."
-				" Ignoring mail");
-			return -1;
-		}
-		/* Rename it to avoid mail being sent twice */
-		if(rename(moderatefilename, sendfilename) < 0) {
-			log_error(LOG_ARGS, "Could not rename to .sending");
-			exit(EXIT_FAILURE);
-		}
+			childpid =3D fork();
+			if (childpid < 0)
+				log_error(LOG_ARGS, "fork() failed!  Proceeding anyway");
=20
-		log_oper(listdir, OPLOGFNAME, "%s moderated %s",
-				fromemails->emaillist[0], moderatefilename);
-		myfree(moderatefilename);
-		execlp(mlmmjsend, mlmmjsend,
-				"-L", listdir,
-				"-m", sendfilename, (char *)NULL);
-		log_error(LOG_ARGS, "execlp() of '%s' failed",
-					mlmmjsend);
-		exit(EXIT_FAILURE);
+			if (!childpid) {
+				execlp(mlmmjsend, mlmmjsend,
+					"-L", listdir,
+					"-m", sendfilename, (char *)NULL);
+				log_error(LOG_ARGS, "execlp() of '%s' failed",
+						mlmmjsend);
+				exit(EXIT_FAILURE);
+			}
+		}
+		exit(rc);
 		break;
=20
 	/* listname+help@domain.tld */

--3FyYKcuUbgqNYeqV
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-reject_command.patch"
Content-Transfer-Encoding: quoted-printable

---
 src/listcontrol.c |   26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

Index: b/src/listcontrol.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/src/listcontrol.c
+++ b/src/listcontrol.c
@@ -62,6 +62,7 @@ enum ctrl_e {
 	CTRL_CONFUNSUB,
 	CTRL_BOUNCES,
 	CTRL_MODERATE,
+	CTRL_REJECT,
 	CTRL_HELP,
 	CTRL_FAQ,
 	CTRL_GET,
@@ -92,6 +93,7 @@ static struct ctrl_command ctrl_commands
 	{ "confunsub",          1 },
 	{ "bounces",            1 },
 	{ "moderate",           1 },
+	{ "reject",             1 },
 	{ "help",               0 },
 	{ "faq",                0 },
 	{ "get",                1 },
@@ -620,8 +622,6 @@ int listcontrol(struct email_container *
=20
 	/* listname+moderate-COOKIE[-COOKIE...]@domain.tld */
 	case CTRL_MODERATE:
-		/* TODO Add accept/reject parameter to moderate */
-
 		/* Subscriber moderation */
 		if(strncmp(param, "subscribe", 9) =3D=3D 0) {
 			moderatefilename =3D concatstr(3, listdir, "/moderation/", param);
@@ -674,6 +674,28 @@ int listcontrol(struct email_container *
 		exit(rc);
 		break;
=20
+	/* listname+reject-COOKIE[-COOKIE...]@domain.tld */
+	case CTRL_REJECT:
+		params =3D splitparam(param, '-');
+		for (i =3D 0; i < params->count; i++) {
+			moderatefilename =3D concatstr(3, listdir, "/moderation/", params->strs=
[i]);
+
+			if (stat(moderatefilename, &stbuf) < 0) {
+				/* no mail to moderate */
+				errno =3D 0;
+				log_error(LOG_ARGS, "A reject request was"
+					" sent with a mismatching cookie."
+					" Ignoring mail");
+			} else {
+				unlink(moderatefilename);
+				log_oper(listdir, OPLOGFNAME, "%s rejected %s",
+					fromemails->emaillist[0], moderatefilename);
+			}
+			myfree(moderatefilename);
+		}
+		exit(EXIT_SUCCESS);
+		break;
+
 	/* listname+help@domain.tld */
 	case CTRL_HELP:
 		if(!strchr(fromemails->emaillist[0], '@')) {

--3FyYKcuUbgqNYeqV
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-add_moderator_command.patch"
Content-Transfer-Encoding: quoted-printable

---
 src/listcontrol.c   |   29 +++++++++++++++++++++++++++--
 src/mlmmj-process.c |    2 +-
 src/mlmmj-sub.c     |    2 +-
 3 files changed, 29 insertions(+), 4 deletions(-)

Index: b/src/mlmmj-sub.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/src/mlmmj-sub.c
+++ b/src/mlmmj-sub.c
@@ -131,7 +131,7 @@ void moderate_sub(const char *listdir, c
 	modfilebase =3D mybasename(modfilename);
=20
 	from =3D concatstr(4, listname, listdelim, "owner@", listfqdn);
-	to =3D concatstr(3, listname, "-moderators@", listfqdn);
+	to =3D concatstr(4, listname, listdelim, "moderators@", listfqdn);
 	replyto =3D concatstr(6, listname, listdelim, "moderate-", modfilebase,
 			"@", listfqdn);
 	myfree(modfilebase);
Index: b/src/mlmmj-process.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/src/mlmmj-process.c
+++ b/src/mlmmj-process.c
@@ -118,7 +118,7 @@ void newmoderated(const char *listdir, c
 	adminhdrs =3D concatstr(3, adminhdrs, "\nX-mlmmj-mod-msg-id: ", mailbasen=
ame);
=20
 	from =3D concatstr(4, listname, listdelim, "owner@", listfqdn);
-	to =3D concatstr(3, listname, "-moderators@", listfqdn); /* FIXME JFA: Sh=
ould this be converted? Why, why not? */
+	to =3D concatstr(4, listname, listdelim, "moderators@", listfqdn); /* FIX=
ME JFA: Should this be converted? Why, why not? */
=20
 	myfree(listdelim);
 	myfree(listname);
Index: b/src/listcontrol.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/src/listcontrol.c
+++ b/src/listcontrol.c
@@ -35,6 +35,7 @@
 #include "listcontrol.h"
 #include "find_email_adr.h"
 #include "getlistdelim.h"
+#include "getlistaddr.h"
 #include "strgen.h"
 #include "send_help.h"
 #include "send_list.h"
@@ -62,6 +63,7 @@ enum ctrl_e {
 	CTRL_CONFUNSUB,
 	CTRL_BOUNCES,
 	CTRL_MODERATE,
+	CTRL_MODERATORS,
 	CTRL_REJECT,
 	CTRL_HELP,
 	CTRL_FAQ,
@@ -93,6 +95,7 @@ static struct ctrl_command ctrl_commands
 	{ "confunsub",          1 },
 	{ "bounces",            1 },
 	{ "moderate",           1 },
+	{ "moderators",         0 },
 	{ "reject",             1 },
 	{ "help",               0 },
 	{ "faq",                0 },
@@ -137,6 +140,7 @@ int listcontrol(struct email_container *
 	char *bouncenr, *tmpstr;
 	char *param =3D NULL, *conffilename, *moderatefilename;
 	char *c, *archivefilename, *sendfilename;
+	char *listfqdn, *listname, *listaddr =3D getlistaddr(listdir), *listdelim;
 	const char *subswitch;
 	struct stat stbuf;
 	int closedlist, nosubconfirm, tmpfd, noget, i, closedlistsub,
@@ -216,8 +220,9 @@ int listcontrol(struct email_container *
 		return -1;
 	}
=20
-	/* We only need the control mail when bouncing, to save bounced msg */
-	if(ctrl !=3D CTRL_BOUNCES)
+	/* We only need the control mail when bouncing, to save
+	   bounced msg, and when sending to moderators */
+	if(ctrl !=3D CTRL_BOUNCES && ctrl !=3D CTRL_MODERATORS)
 		unlink(mailname);
=20
 	switch (ctrl) {
@@ -696,6 +701,26 @@ int listcontrol(struct email_container *
 		exit(EXIT_SUCCESS);
 		break;
=20
+	/* listname+moderators@domain.tld */
+	case CTRL_MODERATORS:
+		listfqdn =3D genlistfqdn(listaddr);
+		listname =3D genlistname(listaddr);
+		listdelim =3D getlistdelim(listdir);
+		tmpstr =3D concatstr(4, listname, listdelim, "owner@", listfqdn);
+		log_oper(listdir, OPLOGFNAME, "mlmmj-recieve: sending"
+				" mail from %s to moderators",
+				fromemails->emaillist[0]);
+		execlp(mlmmjsend, mlmmjsend,
+				"-l", "2",
+				"-L", listdir,
+				"-m", mailname,
+				"-F", tmpstr,
+				"-a", (char *)NULL);
+		log_error(LOG_ARGS, "execlp() of '%s' failed",
+					mlmmjsend);
+		exit(EXIT_FAILURE);
+		break;
+
 	/* listname+help@domain.tld */
 	case CTRL_HELP:
 		if(!strchr(fromemails->emaillist[0], '@')) {

--3FyYKcuUbgqNYeqV--

--vDEbda84Uy/oId5W
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFGjU0fquBH+DuYavMRAj7eAKCX1Ff/SNw+LVAN6IevukZk93z0GgCfU6ur
yxebxcr8MkfE+EvCAlWKB0c=
=yG13
-----END PGP SIGNATURE-----

--vDEbda84Uy/oId5W--
