From: Fabio Busatto <fabio.busatto@programmazione.it>
Date: Wed, 03 May 2006 13:46:28 +0000
Subject: qmail+vpopmail support
Message-Id: <20060503134628.GG5327@nachos.phaseit.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nFreZHaLTZJo0R7j"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, I've tested patch-mlmmj-listcontrol_env with qmail, and
I wrote a supplementary patch for it.

The problem is that the patch works with the qmail standard
installation, but quite all installations use vpopmail as
virtual domain manager, and the patch doesn't work with it.

The EXT environment variable infact contains the username
section after the first delimiter, but with vpopmail we have
a rewrite of the address like this:

user@domain.tld -> domain.tld-user@domain.tld

So, EXT contains the username (and not the extension).
The real extension is stored in the DEFAULT environment
variable, in both qmail and vpopmail scenarios.
But the problem is that DEFAULT is too common name to
be sure that it contains really an extension, so the
solution is to check for the value in DEFAULT, and to
compare it with the value in the EXT environment
variabile (qmail), or in the EXT2 environment variable
(qmail+vpopmail). If it matches, we can assume that it
contains an extension.

The patch also includes README.qmail, with explaination
of how mlmmj should be configured with qmail and a short
configuration example for vpopmail users.

This code has been tested in production environment
(so I can say that it works for me), but should not to be
marked stable until it will be applied in the mlmmj
official release.

Bye
Fabio

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="patch-mlmmj-listcontrol_env_vpopmail.diff"

diff -uNr mlmmj-1.2.11-orig/README.qmail mlmmj-1.2.11/README.qmail
--- mlmmj-1.2.11-orig/README.qmail	1970-01-01 01:00:00.000000000 +0100
+++ mlmmj-1.2.11/README.qmail	2006-05-03 14:30:00.000000000 +0200
@@ -0,0 +1,64 @@
+|------------------------------------------------------------------------------|
+|                     Using mlmmj with qmail (and vpopmail)                    |
+|------------------------------------------------------------------------------|
+|--------------- Fabio Busatto <fabio.busatto@programmazione.it> --------------|
+|------------------------------------------------------------------------------|
+
+This mini-HOWTO is a step-by-step guide for using mlmmj with qmail MTA
+(http://www.qmail.org/), and it has been successfully tested also with vpopmail
+virtual domains (http://www.inter7.com/vpopmail/).
+
+Prerequisites:
+- qmail (and vpopmail) correctly installed
+- mlmmj correctly installed
+
+Conventions:
+- ${BINDIR}: directory with mlmmj binary files (/usr/local/bin/)
+- ${LISTDIR}: directory with list configuration files
+              (/var/spool/mlmmj/listname)
+- ${DQFILE}: dot-qmail file (see below)
+
+Configuration:
+- the first thing you've to do is to create the list, using the
+  mlmmj-make-ml.sh script (follow the classic procedure to do this step)
+- enter the control directory for the list (${LISTDIR}/control/), and execute
+  the following command:
+   # cd ${LISTDIR}/control/; echo '-' > delimiter
+- chown and chmod the file according to the mlmmj configuration
+- create dot-qmail files for the list to handle direct requests and extensions:
+   # echo -e "|${BINDIR}/mlmmj-recieve -L ${LISTDIR}" > ${DQFILE}
+- chown and chmod the files according to the qmail (and vpopmail) configuration
+
+WARNING: REMEMBER that the delimiter is -, so do not use + when composing mail
+addresses for extensions!!!
+
+WARNING: DO NOT USE 'preline' command in dot-qmail files, it will result in
+mlmmj to not work properly!!!
+
+|------------------------------------------------------------------------------|
+
+Example:
+
+- Configuring mlmmj to handle ml@programmazione.it mailing list using qmail as
+  MTA and vpopmail for virtual domain support:
+
+# mlmmj-make-ml.sh -c vpopmail:vchkpw -L ml
+Creating Directorys below /var/spool/mlmmj. Use '-s spooldir' to change
+The Domain for the List? [] : programmazione.it
+The emailaddress of the list owner? [postmaster] : postmaster@programmazione.it
+The path to texts for the list? [/usr/local/share/mlmmj/text.skel] :
+chown -R vpopmail:vchkpw /var/spool/mlmmj/ml? [y/n]: y
+
+# cd /var/spool/mlmmj/ml/control/
+# echo '-' > delimiter
+# chown vpopmail:vchkpw delimiter
+# cd /home/vpopmail/domains/programmazione.it/
+# echo -e "|/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/ml/" > .qmail-ml
+# cp -a .qmail-ml .qmail-ml-default
+# cat *-default
+# chown vpopmail:vchkpw .qmail-ml .qmail-ml-default
+# chmod 600 .qmail-ml .qmail-ml-default
+
+|------------------------------------------------------------------------------|
+|--------------- Fabio Busatto <fabio.busatto@programmazione.it> --------------|
+|------------------------------------------------------------------------------|
diff -uNr mlmmj-1.2.11-orig/src/mlmmj-process.c mlmmj-1.2.11/src/mlmmj-process.c
--- mlmmj-1.2.11-orig/src/mlmmj-process.c	2006-05-03 14:39:21.000000000 +0200
+++ mlmmj-1.2.11/src/mlmmj-process.c	2006-05-03 14:37:02.000000000 +0200
@@ -542,7 +542,10 @@
 	}
 
 	/* address extension (the "foo" part of "user+foo@domain.tld") */
-	if((envstr = getenv("EXT")) != NULL) {
+	if(((envstr = getenv("DEFAULT")) != NULL) && (getenv("EXT2") != NULL) && (strcmp(envstr, getenv("EXT2")) == 0)) {
+		/* qmail+vpopmail */
+		recipextra = mystrdup(envstr);
+	} else if(((envstr = getenv("DEFAULT")) != NULL) && (getenv("EXT") != NULL) && (strcmp(envstr, getenv("EXT")) == 0)) {
 		/* qmail */
 		recipextra = mystrdup(envstr);
 	} else if((envstr = getenv("EXTENSION")) != NULL) {


--nFreZHaLTZJo0R7j--
