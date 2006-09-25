From: "Magnus Naeslund(k)" <mag@kite.se>
Date: Mon, 25 Sep 2006 20:05:10 +0000
Subject: [PATCH] Subscriber other (was: Moderator subscription)
Message-Id: <45183676.9010702@kite.se>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: mlmmj@mlmmj.org

Mads Martin Joergensen wrote:
>=20
> Absolutely they will. Patches are ALWAYS more than welcome :)
>

I'll make you eat those words :)

This is an initial patch for the functionality that I was asking about.
This adds an "subscribe other emailadress" option ala ezmlm using this synt=
ax:
list-subscribe-user=3Dhost.com@listhost.com (i added unsubscribe too).
As you can see the @ in user@host.com is replaced with an =3D to make it pa=
ssable to the mailing list manager.

Later I plan to add something like this: if a moderator does the same thing=
, the user@host.com will not be sent an confirmation mail. I think the mode=
rator will have to get it, otherwise you can forge From:, right?

So if this patch is near lift off, I'll patch up the -help text to display =
help for this command.

Regards,
Magnus N=E4slund

P.S. I noticed that the "param" variable is sometimes freed, but sometimes =
not. What is the rule here?





diff -urx '*~' mlmmj-1.2.12-RC3-vanilla/src/listcontrol.c mlmmj-1.2.12-RC3/=
src/listcontrol.c
--- mlmmj-1.2.12-RC3-vanilla/src/listcontrol.c	2006-09-04 00:04:11.00000000=
0 +0200
+++ mlmmj-1.2.12-RC3/src/listcontrol.c	2006-09-25 21:34:08.000000000 +0200
@@ -68,32 +68,39 @@
 	CTRL_END  /* end marker, must be last */
 };
=20
+enum param_type {
+        PARAM_NONE =3D 0,
+        PARAM_MANDATORY,
+        PARAM_OPTIONAL
+};
+
+
 struct ctrl_command {
 	char *command;
-	unsigned int accepts_parameter;
+	enum param_type accepts_parameter;
 };
=20
 /* Must match the enum. CAREFUL when using commands that are substrings
  * of other commands. In that case the longest one have to be listed
  * first to match correctly. */
 static struct ctrl_command ctrl_commands[] =3D {
-	{ "subscribe-digest",   0 },
-	{ "subscribe-nomail",   0 },
-	{ "subscribe",          0 },
-	{ "confsub-digest",     1 },
-	{ "confsub-nomail",     1 },
-	{ "confsub",            1 },
-	{ "unsubscribe-digest", 0 },
-	{ "unsubscribe-nomail", 0 },
-	{ "unsubscribe",        0 },
-	{ "confunsub-digest",   1 },
-	{ "confunsub-nomail",   1 },
-	{ "confunsub",          1 },
-	{ "bounces",            1 },
-	{ "moderate",           1 },
-	{ "help",               0 },
-	{ "get",                1 },
-	{ "list",               0 }
+	{ "subscribe-digest",   PARAM_NONE },
+	{ "subscribe-nomail",   PARAM_NONE },
+	{ "subscribe",          PARAM_OPTIONAL },
+	{ "confsub-digest",     PARAM_MANDATORY },
+	{ "confsub-nomail",     PARAM_MANDATORY },
+	{ "confsub",            PARAM_MANDATORY },
+	{ "unsubscribe-digest", PARAM_NONE },
+	{ "unsubscribe-nomail", PARAM_NONE },
+	{ "unsubscribe",        PARAM_OPTIONAL },
+	{ "confunsub-digest",   PARAM_MANDATORY },
+	{ "confunsub-nomail",   PARAM_MANDATORY },
+	{ "confunsub",          PARAM_MANDATORY },
+	{ "bounces",            PARAM_MANDATORY },
+	{ "moderate",           PARAM_MANDATORY },
+	{ "help",               PARAM_NONE },
+	{ "get",                PARAM_MANDATORY },
+	{ "list",               PARAM_NONE }
 };
=20
=20
@@ -136,26 +143,26 @@
 		if (strncmp(controlstr, ctrl_commands[ctrl].command, cmdlen)
 				=3D 0) {
=20
-			if (ctrl_commands[ctrl].accepts_parameter) {
-				if (controlstr[cmdlen] !=3D '-') {
-					errno =3D 0;
-					log_error(LOG_ARGS, "Command \"%s\""
-						" requires a parameter, but no"
-						" parameter was given."
-						" Ignoring mail",
-						ctrl_commands[ctrl].command);
-					return -1;
+			if (ctrl_commands[ctrl].accepts_parameter !=3D PARAM_NONE) {
+                                if (controlstr[cmdlen] =3D '-') {
+                                        param =3D mystrdup(controlstr + cm=
dlen + 1);
+                                        MY_ASSERT(param);
+                                        if (strchr(param, '/')) {
+                                                errno =3D 0;
+                                                log_error(LOG_ARGS, "Slash=
 (/) in"
+                                                          " list control r=
equest,"
+                                                          " discarding mai=
l");
+                                                return -1;
+                                        }
+                                } else if (ctrl_commands[ctrl].accepts_par=
ameter !=3D PARAM_OPTIONAL){
+                                        errno =3D 0;
+                                        log_error(LOG_ARGS, "Command \"%s\=
""
+                                                  " requires a parameter, =
but no"
+                                                  " parameter was given."
+                                                  " Ignoring mail",
+                                                  ctrl_commands[ctrl].comm=
and);
+                                        return -1;
                                 }
-				param =3D mystrdup(controlstr + cmdlen + 1);
-				MY_ASSERT(param);
-				if (strchr(param, '/')) {
-					errno =3D 0;
-					log_error(LOG_ARGS, "Slash (/) in"
-						" list control request,"
-						" discarding mail");
-					return -1;
-				}
-
 			} else {
 				if (controlstr[cmdlen] !=3D '\0') {
 					errno =3D 0;
@@ -254,7 +261,15 @@
 				" sent to a closed list. Ignoring mail");
 			return -1;
 		}
-		if (!strchr(fromemails->emaillist[0], '@')) {
+
+	        if (param && (c =3D strchr(param, '=3D')) !=3D NULL){
+                        /* Replace =3D with @, if no =3D is found it'll ge=
t caught later on*/
+                        *c =3D '@';
+		}
+                   =20
+                c =3D param ? param : fromemails->emaillist[0];
+                   =20
+		if (!strchr(c, '@')) {
 			/* Not a valid From: address */
 			errno =3D 0;
 			log_error(LOG_ARGS, "A subscribe request was"
@@ -264,10 +279,10 @@
 		}
 		log_oper(listdir, OPLOGFNAME, "mlmmj-sub: request for regular"
 					" subscription from %s",
-					fromemails->emaillist[0]);
+					c);
 		execlp(mlmmjsub, mlmmjsub,
 				"-L", listdir,
-				"-a", fromemails->emaillist[0],
+				"-a", c,
 				subswitch, (char *)NULL);
 		log_error(LOG_ARGS, "execlp() of '%s' failed",
 					mlmmjsub);
@@ -424,7 +439,15 @@
 				" sent to a closed list. Ignoring mail");
 			return -1;
 		}
-		if (!strchr(fromemails->emaillist[0], '@')) {
+                   =20
+	        if (param && (c =3D strchr(param, '=3D')) !=3D NULL){
+                        /* Replace =3D with @, if no =3D is found it'll ge=
t caught later on*/
+                        *c =3D '@';
+		}
+                   =20
+                c =3D param ? param : fromemails->emaillist[0];
+                   =20
+		if (!strchr(c, '@')) {
 			/* Not a valid From: address */
 			errno =3D 0;
 			log_error(LOG_ARGS, "An unsubscribe request was"
@@ -434,10 +457,10 @@
 		}
 		log_oper(listdir, OPLOGFNAME, "mlmmj-unsub: %s requests"
 					" unsubscribe from regular list",
-					fromemails->emaillist[0]);
+					c);
 		execlp(mlmmjunsub, mlmmjunsub,
 				"-L", listdir,
-				"-a", fromemails->emaillist[0],
+				"-a", c,
 				subswitch, (char *)NULL);
 		log_error(LOG_ARGS, "execlp() of '%s' failed",
 				mlmmjunsub);
