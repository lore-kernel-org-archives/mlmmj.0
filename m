From: Chris Webb <chris@arachsys.com>
Date: Sat, 02 Oct 2010 18:46:45 +0000
Subject: Re: [mlmmj] more than 100 lines for moderation
Message-Id: <20101002184644.GA13050@arachsys.com>
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
In-Reply-To: <AANLkTimcx6HcKrOwargzPTzzYdtdNq_-6CNxHYZR1ty0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Ben Schmidt <mail_ben_schmidt@yahoo.com.au> writes:

> I'd love one against the current state of the tree in version control, if
> you could manage it, Chris. Having the symlink in there is important for
> compatibility; I seem to remember you included that in the last version
> you emailed.

Sure, no problem. I think this is a reasonably complete rename/replace
against the hg tip.

Best wishes,

Chris.

-- >8 --
Subject: [PATCH] Spelling fixes for 'receive' and 'voodoo'

Correct all instances of 'recieve' and 'voodo' to 'receive' and 'voodoo'
throughout the code and documentation, leaving a symlink in place for the
old mlmmj-recieve binary name.

Signed-off-by: Chris Webb <chris@arachsys.com>
---
 ChangeLog                                  |   1 +
 Makefile.am                                |   2 +-
 README                                     |   6 +++---
 README.exim4                               |   4 ++--
 README.postfix                             |  10 +++++-----
 README.qmail                               |   4 ++--
 configure.ac                               |  12 ++++++------
 contrib/Makefile.am                        |   2 +-
 contrib/amime-receive/mlmmj-amime-receive  |   6 +++---
 contrib/recievestrip/Makefile.am           |   6 +++---
 contrib/recievestrip/README                |   6 +++---
 contrib/recievestrip/mlmmj-recieve-strip.c |  10 +++++-----
 include/do_all_the_voodo_here.h            |   8 ++++----
 include/mlmmj-recieve.h                    |   6 +++---
 man/mlmmj-bounce.1                         |   2 +-
 man/mlmmj-list.1                           |   2 +-
 man/mlmmj-process.1                        |   2 +-
 man/mlmmj-recieve.1                        |  10 +++++-----
 man/mlmmj-sub.1                            |   2 +-
 src/Makefile.am                            |   9 ++++++---
 src/do_all_the_voodo_here.c                |   4 ++--
 src/mlmmj-make-ml.sh.in                    |   8 ++++----
 src/mlmmj-process.c                        |  14 +++++++-------
 src/mlmmj-recieve.c                        |   6 +++---
 src/mlmmj-send.c                           |   4 ++--
 25 files changed, 75 insertions(+), 71 deletions(-)

diff --git a/ChangeLog b/ChangeLog
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,3 +1,4 @@
+ o Correct spelling of 'receive' and 'voodoo' throughout the code
  o Richer MIME list texts with inline messages (English only so far)
  o Add $random0$ through $random5$ substitutions
  o Add a $subject$ substitution for list texts
diff --git a/Makefile.am b/Makefile.am
--- a/Makefile.am
+++ b/Makefile.am
@@ -10,7 +10,7 @@
 dist-hook:
 	rm -rf `find $(distdir)/ -name CVS`
 
-man1_MANS = man/mlmmj-bounce.1 man/mlmmj-make-ml.sh.1 man/mlmmj-recieve.1 \
+man1_MANS = man/mlmmj-bounce.1 man/mlmmj-make-ml.sh.1 man/mlmmj-receive.1 \
 	    man/mlmmj-sub.1 man/mlmmj-maintd.1 man/mlmmj-process.1 \
 	    man/mlmmj-send.1 man/mlmmj-unsub.1 man/mlmmj-list.1
 
diff --git a/README b/README
--- a/README
+++ b/README
@@ -30,8 +30,8 @@
     $ ./configure && make && make install
 
 		If you want to filter multipart/mime messages, pass the option
-		--enable-recieve-strip to configure, and take a look at
-		contrib/recievestrip/README.
+		--enable-receive-strip to configure, and take a look at
+		contrib/receivestrip/README.
 
  1) Configure a recipient delimiter. The default is to use '+', and in
     Postfix it's done by adding
@@ -83,7 +83,7 @@
  3) Make the changes to your mailserver aliases that came as output from
     mlmmj-make-ml.sh. Following the example above they will look like this:
 
-    mlmmj-test:     "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test"
+    mlmmj-test:     "|/usr/bin/mlmmj-receive -L /var/spool/mlmmj/mlmmj-test"
 
     NOTE: Don't forget newaliases.
 
diff --git a/README.exim4 b/README.exim4
--- a/README.exim4
+++ b/README.exim4
@@ -76,7 +76,7 @@
   domains = !+mlmmj_domains : !+local_domains
 [...]
 
-5. Somewhere in the transports section. (Change the path of mlmmj-recieve if you
+5. Somewhere in the transports section. (Change the path of mlmmj-receive if you
 don't use the default location!):
 
 mlmmj_transport:
@@ -86,7 +86,7 @@
   group = mlmmj
   home_directory = MLMMJ_HOME
   current_directory = MLMMJ_HOME
-  command = /usr/local/bin/mlmmj-recieve -F -L MLMMJ_HOME/${lc:$local_part}
+  command = /usr/local/bin/mlmmj-receive -F -L MLMMJ_HOME/${lc:$local_part}
 
 If you want VERP to be done by your MTA, also add this:
 
diff --git a/README.postfix b/README.postfix
--- a/README.postfix
+++ b/README.postfix
@@ -92,22 +92,22 @@
     Now we setup the 'mlmmj' transport.  The 'mlmmj' in mlmmj:$1 above
     indicates a transport listed in the postfix master.cf file.  We are
     just going to create a transport called 'mlmmj' but it is nothing
-    more than a pipe(8) to the mlmmj-recieve program that is invoked as
+    more than a pipe(8) to the mlmmj-receive program that is invoked as
     the 'mlmmj' user.
 
         master.cf:
             # mlmmj mailing lists
             mlmmj   unix  -       n       n       -       -       pipe
-                flags=DORhu user=mlmmj argv=/usr/local/bin/mlmmj-recieve -F -L /var/spool/mlmmj/$nexthop/
+                flags=DORhu user=mlmmj argv=/usr/local/bin/mlmmj-receive -F -L /var/spool/mlmmj/$nexthop/
 
     This takes the pipe(8) postfix delivery agent and tells it to invoke
-    '/usr/local/bin/mlmmj-recieve' as the 'mlmmj' user and pipe the
+    '/usr/local/bin/mlmmj-receive' as the 'mlmmj' user and pipe the
     email to it on stdin.  This mode of transportation is given the name
     'mlmmj'.
 
     The 'flags' parameter to pipe(8) is pretty critical here. In
-    particular if the 'R' option is not used mlmmj-recieve fails to
-    recieve the mail correctly. The options mean:
+    particular if the 'R' option is not used mlmmj-receive fails to
+    receive the mail correctly. The options mean:
 
         D - Prepend a 'Delivered-To: recipient' header
         O - Prepend an 'X-Original-To: recipient' header
diff --git a/README.qmail b/README.qmail
--- a/README.qmail
+++ b/README.qmail
@@ -26,7 +26,7 @@
    # cd ${LISTDIR}/control/; echo '-' > delimiter
 - chown and chmod the file according to the mlmmj configuration
 - create dot-qmail files for the list to handle direct requests and extensions:
-   # echo -e "|${BINDIR}/mlmmj-recieve -L ${LISTDIR}" > ${DQFILE}
+   # echo -e "|${BINDIR}/mlmmj-receive -L ${LISTDIR}" > ${DQFILE}
 - chown and chmod the files according to the qmail (and vpopmail) configuration
 
 WARNING: REMEMBER that the delimiter is -, so do not use + when composing mail
@@ -53,7 +53,7 @@
 # echo '-' > delimiter
 # chown vpopmail:vchkpw delimiter
 # cd /home/vpopmail/domains/programmazione.it/
-# echo -e "|/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/ml/" > .qmail-ml
+# echo -e "|/usr/local/bin/mlmmj-receive -L /var/spool/mlmmj/ml/" > .qmail-ml
 # cp -a .qmail-ml .qmail-ml-default
 # cat *-default
 # chown vpopmail:vchkpw .qmail-ml .qmail-ml-default
diff --git a/configure.ac b/configure.ac
--- a/configure.ac
+++ b/configure.ac
@@ -5,7 +5,7 @@
 AC_SUBST(VERSION)
 
 AM_INIT_AUTOMAKE(mlmmj, $VERSION)
-AC_CONFIG_SRCDIR([src/mlmmj-recieve.c])
+AC_CONFIG_SRCDIR([src/mlmmj-receive.c])
 AM_CONFIG_HEADER([config.h])
 
 # Checks for programs.
@@ -33,10 +33,10 @@
 
 AC_SUBST(textlibdir)
 
-AC_ARG_ENABLE([recieve-strip],
-  AS_HELP_STRING([--enable-recieve-strip],
-                 [build mlmmj-recieve-strip (default is no)]))
-AM_CONDITIONAL(WANT_RECIEVESTRIP, test x"$enable_recieve_strip" = xyes)
+AC_ARG_ENABLE([receive-strip],
+  AS_HELP_STRING([--enable-receive-strip],
+                 [build mlmmj-receive-strip (default is no)]))
+AM_CONDITIONAL(WANT_RECEIVESTRIP, test x"$enable_receive_strip" = xyes)
 
 # Checks for library functions.
 AC_FUNC_MALLOC
@@ -48,5 +48,5 @@
 AC_CONFIG_FILES([src/mlmmj-make-ml.sh])
 AC_CONFIG_FILES([listtexts/Makefile])
 AC_CONFIG_FILES([contrib/Makefile])
-AC_CONFIG_FILES([contrib/recievestrip/Makefile])
+AC_CONFIG_FILES([contrib/receivestrip/Makefile])
 AC_OUTPUT
diff --git a/contrib/Makefile.am b/contrib/Makefile.am
--- a/contrib/Makefile.am
+++ b/contrib/Makefile.am
@@ -1,4 +1,4 @@
 ## Process this file with automake to produce Makefile.in
 
 EXTRA_DIST = web amime-receive
-SUBDIRS = recievestrip
+SUBDIRS = receivestrip
diff --git a/contrib/amime-receive/mlmmj-amime-receive b/contrib/amime-receive/mlmmj-amime-receive
--- a/contrib/amime-receive/mlmmj-amime-receive
+++ b/contrib/amime-receive/mlmmj-amime-receive
@@ -2,12 +2,12 @@
 # 
 # mlmmj-amime-receive
 #
-# Take mail from stdin, pipe it through altermime and then to mlmmj-recieve
+# Take mail from stdin, pipe it through altermime and then to mlmmj-receive
 # needed to add footers in a MIME-aware way
 #
 # requires altermime, see http://www.pldaniels.com/altermime/
 #
-# just replace mlmmj-recieve (sic) with mlmmj-amime-receive, e.g. in /etc/aliases:
+# just replace mlmmj-receive (sic) with mlmmj-amime-receive, e.g. in /etc/aliases:
 # myml:   "|/usr/bin/mlmmj-amime-receive -L /var/spool/mlmmj/myml/"
 #
 # put the footer-text for the different MIME-types into 
@@ -20,7 +20,7 @@
 # Licensed under MIT License, see LICENSE file coming with mlmmj
 #
 
-MLMMJRECIEVE=/usr/bin/mlmmj-recieve
+MLMMJRECIEVE=/usr/bin/mlmmj-receive
 ALTERMIME=/usr/bin/altermime
 
 # check executables
diff --git a/contrib/recievestrip/Makefile.am b/contrib/receivestrip/Makefile.am
rename from contrib/recievestrip/Makefile.am
rename to contrib/receivestrip/Makefile.am
--- a/contrib/recievestrip/Makefile.am
+++ b/contrib/receivestrip/Makefile.am
@@ -5,10 +5,10 @@
 AM_CFLAGS = -g -Wall -pedantic -Wsign-compare -DDEFAULTTEXTDIR='"@textlibdir@"'
 INCLUDES = -I$(srcdir)/../../include
 
-if WANT_RECIEVESTRIP
-  bin_PROGRAMS = mlmmj-recieve-strip
+if WANT_RECEIVESTRIP
+  bin_PROGRAMS = mlmmj-receive-strip
 endif
 
-mlmmj_recieve_strip_SOURCES = mlmmj-recieve-strip.c ../../src/mygetline.c ../../src/memory.c ../../src/readn.c  \
+mlmmj_receive_strip_SOURCES = mlmmj-receive-strip.c ../../src/mygetline.c ../../src/memory.c ../../src/readn.c  \
 				../../src/strgen.c ../../src/random-int.c  ../../src/log_error.c ../../src/print-version.c \
 				../../src/writen.c ../../src/dumpfd2fd.c ../../src/ctrlvalues.c ../../src/chomp.c
diff --git a/contrib/recievestrip/README b/contrib/receivestrip/README
rename from contrib/recievestrip/README
rename to contrib/receivestrip/README
--- a/contrib/recievestrip/README
+++ b/contrib/receivestrip/README
@@ -1,11 +1,11 @@
-mlmmj-recieve-strip is a replacement for mlmmj-recieve
+mlmmj-receive-strip is a replacement for mlmmj-receive
 
 It opens the files control/mimedeny and control/mimestrip to get a list of mimetypes
 for parts of multipart/mime messages that should be denied or stripped
 
-The parts then get stripped directly when the mail is recieved.
+The parts then get stripped directly when the mail is received.
 
-mlmmj-recieve-strip also appends an extra header
+mlmmj-receive-strip also appends an extra header
 
 X-ThisMailContainsUnwantedMimeParts: Y when the mail contains unwanted mime parts
 
diff --git a/contrib/recievestrip/mlmmj-recieve-strip.c b/contrib/receivestrip/mlmmj-receive-strip.c
rename from contrib/recievestrip/mlmmj-recieve-strip.c
rename to contrib/receivestrip/mlmmj-receive-strip.c
--- a/contrib/recievestrip/mlmmj-recieve-strip.c
+++ b/contrib/receivestrip/mlmmj-receive-strip.c
@@ -19,7 +19,7 @@
  * IN THE SOFTWARE.
  */
 
-/* a version of mlmmj-recieve that parses the mail on the fly and strips unwanted
+/* a version of mlmmj-receive that parses the mail on the fly and strips unwanted
    mime parts
    opens the files control/mimedeny and control/mimestrip for a list of mime
    types for body parts that should be denied or stripped.
@@ -361,7 +361,7 @@
 
 	/* dump rest of mail */
         if(dumpfd2fd(infd, outfd) != 0) {
-		log_error(LOG_ARGS, "Could not recieve mail");
+		log_error(LOG_ARGS, "Could not receive mail");
 		return -1;
         }
 
@@ -479,12 +479,12 @@
 	}
 
 	if(dump_mail(fileno(stdin), fd, listdir) != 0) {
-		log_error(LOG_ARGS, "Could not recieve mail");
+		log_error(LOG_ARGS, "Could not receive mail");
 		exit(EXIT_FAILURE);
 	}
 
 #if 0
-	log_oper(listdir, OPLOGFNAME, "mlmmj-recieve got %s", infilename);
+	log_oper(listdir, OPLOGFNAME, "mlmmj-receive got %s", infilename);
 #endif
 	fsync(fd);
 	close(fd);
@@ -498,7 +498,7 @@
 	 * Now we fork so we can exit with success since it could potentially
 	 * take a long time for mlmmj-send to finish delivering the mails and
 	 * returning, making it susceptible to getting a SIGKILL from the
-	 * mailserver invoking mlmmj-recieve.
+	 * mailserver invoking mlmmj-receive.
 	 */
 	if (!nofork) {
 		childpid = fork();
diff --git a/include/do_all_the_voodo_here.h b/include/do_all_the_voodoo_here.h
rename from include/do_all_the_voodo_here.h
rename to include/do_all_the_voodoo_here.h
--- a/include/do_all_the_voodo_here.h
+++ b/include/do_all_the_voodoo_here.h
@@ -21,15 +21,15 @@
  * IN THE SOFTWARE.
  */
 
-#ifndef DO_ALL_THE_VOODO_HERE_H
-#define DO_ALL_THE_VOODO_HERE_H
+#ifndef DO_ALL_THE_VOODOO_HERE_H
+#define DO_ALL_THE_VOODOO_HERE_H
 
 #include "mlmmj.h" /* For struct mailhdr and struct strlist */
 
 int findit(const char *line, const char **headers);
 void getinfo(const char *line, struct mailhdr *readhdrs);
-int do_all_the_voodo_here(int infd, int outfd, int hdrfd, int footfd,
+int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 	      const char **delhdrs, struct mailhdr *readhdrs,
 	      struct strlist *allhdrs, const char *subjectprefix);
 
-#endif /* DO_ALL_THE_VOODO_HERE_H */
+#endif /* DO_ALL_THE_VOODOO_HERE_H */
diff --git a/include/mlmmj-recieve.h b/include/mlmmj-receive.h
rename from include/mlmmj-recieve.h
rename to include/mlmmj-receive.h
--- a/include/mlmmj-recieve.h
+++ b/include/mlmmj-receive.h
@@ -21,10 +21,10 @@
  * IN THE SOFTWARE.
  */
 
-#ifndef MMJML_RECIEVE_H
-#define MMJML_RECIEVE_H
+#ifndef MMJML_RECEIVE_H
+#define MMJML_RECEIVE_H
 
 void free_str_array(char **to_free);
 
 
-#endif /* MMJML_RECIEVE_H */
+#endif /* MMJML_RECEIVE_H */
diff --git a/man/mlmmj-bounce.1 b/man/mlmmj-bounce.1
--- a/man/mlmmj-bounce.1
+++ b/man/mlmmj-bounce.1
@@ -29,7 +29,7 @@
 The above shows that message number 109 bounced 1094409801 seconds after epoch
 which is in human date stamps is Sunday September 5th 20:43:21 2004.
 
-The last bounce mail recieved to the address is saved in <listdir>/bounce/<addrstring>.lastmsg.
+The last bounce mail received to the address is saved in <listdir>/bounce/<addrstring>.lastmsg.
 
 When the \fB\-p\fR option is used it sends out a probe email including info
 that it's a bounce probe and a list of the bounced message numbers. The
diff --git a/man/mlmmj-list.1 b/man/mlmmj-list.1
--- a/man/mlmmj-list.1
+++ b/man/mlmmj-list.1
@@ -1,4 +1,4 @@
-.TH mlmmj-list "1" "November 2004" mlmmj-recieve
+.TH mlmmj-list "1" "November 2004" mlmmj-receive
 .SH NAME
 mlmmj-list \- list people / subscribers associated with a list
 .SH SYNOPSIS
diff --git a/man/mlmmj-process.1 b/man/mlmmj-process.1
--- a/man/mlmmj-process.1
+++ b/man/mlmmj-process.1
@@ -41,7 +41,7 @@
 List control
 
 In case there's a mail with a recipient delimiter it's not a regular list mail.
-Processing of these happens in mlmmj-recieve as well. Examples of such are
+Processing of these happens in mlmmj-receive as well. Examples of such are
 subscription requests, mails to owner etc.
 It will base it's recipient delimiter detection on the Delivered-To: header if
 present. If not, the To: header is used.
diff --git a/man/mlmmj-recieve.1 b/man/mlmmj-receive.1
rename from man/mlmmj-recieve.1
rename to man/mlmmj-receive.1
--- a/man/mlmmj-recieve.1
+++ b/man/mlmmj-receive.1
@@ -1,8 +1,8 @@
-.TH mlmmj-recieve "1" "September 2004" mlmmj-recieve
+.TH mlmmj-receive "1" "September 2004" mlmmj-receive
 .SH NAME
-mlmmj-recieve \- recieve mails for an mlmmj managed mailinglist
+mlmmj-receive \- receive mails for an mlmmj managed mailinglist
 .SH SYNOPSIS
-.B mlmmj-recieve
+.B mlmmj-receive
 \fI-L /path/to/listdir \fR[\fI-h\fR] [\fI-V\fR] [\fI-P\fR] [\fI-F\fR]
 .HP
 \fB\-h\fR: This help
@@ -15,13 +15,13 @@
 .HP
 \fB\-V\fR: Print version
 .SH DESCRIPTION
-The mlmmj-recieve binary is the one specified in the mailserver configuration
+The mlmmj-receive binary is the one specified in the mailserver configuration
 file (aliases file), which writes the mail to the <listdir>/incoming directory
 and invokes mlmmj-process unless the \fB\-P\fR option is specified. On systems
 using mailservers supporting the \fB/etc/aliases\fR file, a line to activate
 an mlmmj managed mailinglist would look like this:
 .LP
-list: "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/list/"
+list: "|/usr/bin/mlmmj-receive -L /var/spool/mlmmj/list/"
 
 It's very important to specify the full path to the binary, or the mailinglist
 will not function.
diff --git a/man/mlmmj-sub.1 b/man/mlmmj-sub.1
--- a/man/mlmmj-sub.1
+++ b/man/mlmmj-sub.1
@@ -39,7 +39,7 @@
 having correct permissions.
 
 The nomail version of the list is a list version where people are subscribed
-like usual, but they won't recieve any postings to the list. This is useful for
+like usual, but they won't receive any postings to the list. This is useful for
 people who read the mailinglist through a news gateway, but want to be able to
 post to the list.
 
diff --git a/src/Makefile.am b/src/Makefile.am
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -5,7 +5,7 @@
 AM_CFLAGS = -g -Wall -pedantic -Wsign-compare -DDEFAULTTEXTDIR='"@textlibdir@"'
 INCLUDES = -I$(srcdir)/../include
 
-bin_PROGRAMS = mlmmj-send mlmmj-recieve mlmmj-process mlmmj-sub \
+bin_PROGRAMS = mlmmj-send mlmmj-receive mlmmj-process mlmmj-sub \
                mlmmj-unsub mlmmj-bounce mlmmj-maintd mlmmj-list
 
 bin_SCRIPTS = mlmmj-make-ml.sh
@@ -19,7 +19,7 @@
 		     statctrl.c ctrlvalue.c getaddrsfromfd.c readn.c \
 		     getlistdelim.c
 
-mlmmj_recieve_SOURCES = mlmmj-recieve.c writen.c random-int.c strgen.c \
+mlmmj_receive_SOURCES = mlmmj-receive.c writen.c random-int.c strgen.c \
 			print-version.c log_error.c dumpfd2fd.c memory.c \
 			log_oper.c mylocking.c readn.c
 
@@ -27,7 +27,7 @@
 			incindexfile.c itoa.c getlistaddr.c chomp.c \
 			mylocking.c listcontrol.c random-int.c strgen.c \
 			print-version.c send_help.c prepstdreply.c \
-			do_all_the_voodo_here.c mygetline.c gethdrline.c \
+			do_all_the_voodoo_here.c mygetline.c gethdrline.c \
 			log_error.c statctrl.c ctrlvalue.c dumpfd2fd.c \
 			subscriberfuncs.c ctrlvalues.c memory.c log_oper.c \
 			send_list.c readn.c getlistdelim.c unistr.c
@@ -59,3 +59,6 @@
 
 mlmmj_list_SOURCES = mlmmj-list.c strgen.c writen.c print-version.c memory.c \
 		     log_error.c random-int.c readn.c
+
+install-exec-hook:
+	ln -f -s mlmmj-receive $(DESTDIR)$(bindir)/mlmmj-recieve
diff --git a/src/do_all_the_voodo_here.c b/src/do_all_the_voodoo_here.c
rename from src/do_all_the_voodo_here.c
rename to src/do_all_the_voodoo_here.c
--- a/src/do_all_the_voodo_here.c
+++ b/src/do_all_the_voodoo_here.c
@@ -31,7 +31,7 @@
 #include "strgen.h"
 #include "chomp.h"
 #include "ctrlvalue.h"
-#include "do_all_the_voodo_here.h"
+#include "do_all_the_voodoo_here.h"
 #include "log_error.h"
 #include "wrappers.h"
 #include "memory.h"
@@ -75,7 +75,7 @@
 	}
 }
 
-int do_all_the_voodo_here(int infd, int outfd, int hdrfd, int footfd,
+int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 		 const char **delhdrs, struct mailhdr *readhdrs,
 		 struct strlist *allhdrs, const char *prefix)
 {
diff --git a/src/mlmmj-make-ml.sh.in b/src/mlmmj-make-ml.sh.in
--- a/src/mlmmj-make-ml.sh.in
+++ b/src/mlmmj-make-ml.sh.in
@@ -120,9 +120,9 @@
 LISTADDRESS="$LISTNAME@$FQDN"
 echo "$LISTADDRESS" > "$LISTDIR"/control/"listaddress"
 
-MLMMJRECIEVE=`which mlmmj-recieve 2>/dev/null`
-if [ -z "$MLMMJRECIEVE" ]; then
-	MLMMJRECIEVE="/path/to/mlmmj-recieve"
+MLMMJRECEIVE=`which mlmmj-receive 2>/dev/null`
+if [ -z "$MLMMJRECEIVE" ]; then
+	MLMMJRECEIVE="/path/to/mlmmj-receive"
 fi
 
 MLMMJMAINTD=`which mlmmj-maintd 2>/dev/null`
@@ -130,7 +130,7 @@
 	MLMMJMAINTD="/path/to/mlmmj-maintd"
 fi
 
-ALIAS="$LISTNAME:  \"|$MLMMJRECIEVE -L $SPOOLDIR/$LISTNAME/\""
+ALIAS="$LISTNAME:  \"|$MLMMJRECEIVE -L $SPOOLDIR/$LISTNAME/\""
 CRONENTRY="0 */2 * * * \"$MLMMJMAINTD -F -L $SPOOLDIR/$LISTNAME/\""
 
 if [ -n "$A_CREATE" ]; then
diff --git a/src/mlmmj-process.c b/src/mlmmj-process.c
--- a/src/mlmmj-process.c
+++ b/src/mlmmj-process.c
@@ -40,7 +40,7 @@
 #include "getlistdelim.h"
 #include "listcontrol.h"
 #include "strgen.h"
-#include "do_all_the_voodo_here.h"
+#include "do_all_the_voodoo_here.h"
 #include "log_error.h"
 #include "mygetline.h"
 #include "statctrl.h"
@@ -501,13 +501,13 @@
 		exit(EXIT_FAILURE);
 	}
 
-    /* hdrfd is checked in do_all_the_voodo_here(), because the
+    /* hdrfd is checked in do_all_the_voodoo_here(), because the
      * customheaders file might not exist */
 	headerfilename = concatstr(2, listdir, "/control/customheaders");
 	hdrfd = open(headerfilename, O_RDONLY);
 	myfree(headerfilename);
 
-    /* footfd is checked in do_all_the_voodo_here(), see above */
+    /* footfd is checked in do_all_the_voodoo_here(), see above */
 	footerfilename = concatstr(2, listdir, "/control/footer");
 	footfd = open(footerfilename, O_RDONLY);
 	myfree(footerfilename);
@@ -527,10 +527,10 @@
 
 	subjectprefix = ctrlvalue(listdir, "prefix");
 
-	if(do_all_the_voodo_here(rawmailfd, donemailfd, hdrfd, footfd,
+	if(do_all_the_voodoo_here(rawmailfd, donemailfd, hdrfd, footfd,
 				(const char**)delheaders->strs, readhdrs,
 				&allheaders, subjectprefix) < 0) {
-		log_error(LOG_ARGS, "Error in do_all_the_voodo_here");
+		log_error(LOG_ARGS, "Error in do_all_the_voodoo_here");
 		exit(EXIT_FAILURE);
 	}
 
@@ -646,10 +646,10 @@
 						    "output mail file");
 				exit(EXIT_FAILURE);
 			}
-			if(do_all_the_voodo_here(rawmailfd, donemailfd, -1,
+			if(do_all_the_voodoo_here(rawmailfd, donemailfd, -1,
 					-1, (const char**)delheaders->strs,
 					NULL, &allheaders, NULL) < 0) {
-				log_error(LOG_ARGS, "do_all_the_voodo_here");
+				log_error(LOG_ARGS, "do_all_the_voodoo_here");
 				exit(EXIT_FAILURE);
 			}
 			close(rawmailfd);
diff --git a/src/mlmmj-recieve.c b/src/mlmmj-receive.c
rename from src/mlmmj-recieve.c
rename to src/mlmmj-receive.c
--- a/src/mlmmj-recieve.c
+++ b/src/mlmmj-receive.c
@@ -142,12 +142,12 @@
 	}
 	
 	if(dumpfd2fd(fileno(stdin), fd) != 0) {
-		log_error(LOG_ARGS, "Could not recieve mail");
+		log_error(LOG_ARGS, "Could not receive mail");
 		exit(EXIT_FAILURE);
 	}
 
 #if 0
-	log_oper(listdir, OPLOGFNAME, "mlmmj-recieve got %s", infilename);
+	log_oper(listdir, OPLOGFNAME, "mlmmj-receive got %s", infilename);
 #endif
 	fsync(fd);
 	close(fd);
@@ -161,7 +161,7 @@
 	 * Now we fork so we can exit with success since it could potentially
 	 * take a long time for mlmmj-send to finish delivering the mails and
 	 * returning, making it susceptible to getting a SIGKILL from the
-	 * mailserver invoking mlmmj-recieve.
+	 * mailserver invoking mlmmj-receive.
 	 */
 	if (!nofork) {
 		childpid = fork();
diff --git a/src/mlmmj-send.c b/src/mlmmj-send.c
--- a/src/mlmmj-send.c
+++ b/src/mlmmj-send.c
@@ -446,7 +446,7 @@
 	}
 	for(i = 0; i < addrs->count; i++) {
 		if(gotsigterm) {
-			log_error(LOG_ARGS, "TERM signal recieved, "
+			log_error(LOG_ARGS, "TERM signal received, "
 					"shutting down.");
 			return -1;
 		}
@@ -640,7 +640,7 @@
 		}
 		if(gotsigterm && listaddr && archivefilename) {
 			/* we got SIGTERM, so save the addresses and bail */
-			log_error(LOG_ARGS, "TERM signal recieved, "
+			log_error(LOG_ARGS, "TERM signal received, "
 						"shutting down.");
 			index = get_index_from_filename(archivefilename);
 			status = requeuemail(listdir, index, addrs, i);

