From: Chris Webb <chris@arachsys.com>
Date: Thu, 15 Apr 2010 09:49:38 +0000
Subject: Re: [mlmmj] More Nits
Message-Id: <20100415094937.GA12277@arachsys.com>
List-Id: <mlmmj.mlmmj.org>
References: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
In-Reply-To: <4917C91D-7A19-4BF2-A179-E3061BC3524E@sabahattin-gucukoglu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Sabahattin Gucukoglu <mail@sabahattin-gucukoglu.com> writes:

> BTW: Will there ever be a transition period to mlmmj-receive?  Yes, I know. :-)

You could use the following patch which corrects the two systematic spelling
errors globally throughout the code. [Patch in git format because of the
file renames.]

--->8
From 392d029757ef05f1d14d5bf8cf483b08b4a97292 Mon Sep 17 00:00:00 2001
Message-Id: <392d029757ef05f1d14d5bf8cf483b08b4a97292.1271323931.git.chris@arachsys.com>
From: Chris Webb <chris@arachsys.com>
Date: Thu, 15 Apr 2010 10:20:24 +0100
Subject: [PATCH] Spelling fixes for 'receive' and 'voodoo'

Correct all instances of 'recieve' and 'voodo' to 'receive' and 'voodoo'
throughout the code and documentation.
---
 ChangeLog                                          |    1 +
 Makefile.am                                        |    2 +-
 Makefile.in                                        |    2 +-
 README                                             |    6 ++--
 README.exim4                                       |    4 +-
 README.qmail                                       |    4 +-
 configure                                          |   34 ++++++++++----------
 configure.ac                                       |   12 +++---
 contrib/Makefile.am                                |    2 +-
 contrib/Makefile.in                                |    2 +-
 contrib/{recievestrip => receivestrip}/Makefile.am |    6 ++--
 contrib/{recievestrip => receivestrip}/Makefile.in |   28 ++++++++--------
 contrib/{recievestrip => receivestrip}/README      |    6 ++--
 .../mlmmj-receive-strip.c}                         |   10 +++---
 ...l_the_voodo_here.h => do_all_the_voodoo_here.h} |   10 +++---
 include/{mlmmj-recieve.h => mlmmj-receive.h}       |    8 ++--
 man/mlmmj-bounce.1                                 |    2 +-
 man/mlmmj-list.1                                   |    2 +-
 man/mlmmj-process.1                                |    2 +-
 man/{mlmmj-recieve.1 => mlmmj-receive.1}           |   10 +++---
 man/mlmmj-sub.1                                    |    2 +-
 src/Makefile.am                                    |    6 ++--
 src/Makefile.in                                    |   28 ++++++++--------
 ...l_the_voodo_here.c => do_all_the_voodoo_here.c} |    6 ++--
 src/mlmmj-make-ml.sh                               |    8 ++--
 src/mlmmj-make-ml.sh.in                            |    8 ++--
 src/mlmmj-process.c                                |   16 +++++-----
 src/{mlmmj-recieve.c => mlmmj-receive.c}           |    8 ++--
 src/mlmmj-send.c                                   |    4 +-
 29 files changed, 120 insertions(+), 119 deletions(-)
 rename contrib/{recievestrip => receivestrip}/Makefile.am (76%)
 rename contrib/{recievestrip => receivestrip}/Makefile.in (97%)
 rename contrib/{recievestrip => receivestrip}/README (86%)
 rename contrib/{recievestrip/mlmmj-recieve-strip.c => receivestrip/mlmmj-receive-strip.c} (98%)
 rename include/{do_all_the_voodo_here.h => do_all_the_voodoo_here.h} (85%)
 rename include/{mlmmj-recieve.h => mlmmj-receive.h} (89%)
 rename man/{mlmmj-recieve.1 => mlmmj-receive.1} (82%)
 rename src/{do_all_the_voodo_here.c => do_all_the_voodoo_here.c} (96%)
 rename src/{mlmmj-recieve.c => mlmmj-receive.c} (95%)

diff --git a/ChangeLog b/ChangeLog
index cda2b5d..e9265df 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,3 +1,4 @@
+ o Correct spelling of 'receive' and 'voodoo' throughout the code
 1.2.17
  o Added ifmodsendonlymodmoderate tunable
  o Replaced class.FastTemplate.php with class.rFastTemplate.php in
diff --git a/Makefile.am b/Makefile.am
index 54c08da..28450d8 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -9,7 +9,7 @@ CLEANFILES = *~ mlmmj-*.tar.*
 dist-hook:
 	rm -rf `find $(distdir)/ -name CVS`
 
-man1_MANS = man/mlmmj-bounce.1 man/mlmmj-make-ml.sh.1 man/mlmmj-recieve.1 \
+man1_MANS = man/mlmmj-bounce.1 man/mlmmj-make-ml.sh.1 man/mlmmj-receive.1 \
 	    man/mlmmj-sub.1 man/mlmmj-maintd.1 man/mlmmj-process.1 \
 	    man/mlmmj-send.1 man/mlmmj-unsub.1 man/mlmmj-list.1
 
diff --git a/Makefile.in b/Makefile.in
index abb796e..4aa9e3d 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -217,7 +217,7 @@ EXTRA_DIST = include VERSION LICENSE UPGRADE src/log_error.c FAQ \
 	     README.exim4 README.sendmail README.security README.qmail
 
 CLEANFILES = *~ mlmmj-*.tar.*
-man1_MANS = man/mlmmj-bounce.1 man/mlmmj-make-ml.sh.1 man/mlmmj-recieve.1 \
+man1_MANS = man/mlmmj-bounce.1 man/mlmmj-make-ml.sh.1 man/mlmmj-receive.1 \
 	    man/mlmmj-sub.1 man/mlmmj-maintd.1 man/mlmmj-process.1 \
 	    man/mlmmj-send.1 man/mlmmj-unsub.1 man/mlmmj-list.1
 
diff --git a/README b/README
index 14be43a..45416b7 100644
--- a/README
+++ b/README
@@ -30,8 +30,8 @@ To use mlmmj, do the following:
     $ ./configure && make && make install
 
 		If you want to filter multipart/mime messages, pass the option
-		--enable-recieve-strip to configure, and take a look at
-		contrib/recievestrip/README.
+		--enable-receive-strip to configure, and take a look at
+		contrib/receivestrip/README.
 
  1) Configure a recipient delimiter. The default is to use '+', and in
     Postfix it's done by adding
@@ -83,7 +83,7 @@ To use mlmmj, do the following:
  3) Make the changes to your mailserver aliases that came as output from
     mlmmj-make-ml.sh. Following the example above they will look like this:
 
-    mlmmj-test:     "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/mlmmj-test"
+    mlmmj-test:     "|/usr/bin/mlmmj-receive -L /var/spool/mlmmj/mlmmj-test"
 
     NOTE: Don't forget newaliases.
 
diff --git a/README.exim4 b/README.exim4
index 7ec05cc..715e5bf 100644
--- a/README.exim4
+++ b/README.exim4
@@ -76,7 +76,7 @@ dnslookup:
   domains = !+mlmmj_domains : !+local_domains
 [...]
 
-5. Somewhere in the transports section. (Change the path of mlmmj-recieve if you
+5. Somewhere in the transports section. (Change the path of mlmmj-receive if you
 don't use the default location!):
 
 mlmmj_transport:
@@ -86,7 +86,7 @@ mlmmj_transport:
   group = mlmmj
   home_directory = MLMMJ_HOME
   current_directory = MLMMJ_HOME
-  command = /usr/local/bin/mlmmj-recieve -F -L MLMMJ_HOME/${lc:$local_part}
+  command = /usr/local/bin/mlmmj-receive -F -L MLMMJ_HOME/${lc:$local_part}
 
 If you want VERP to be done by your MTA, also add this:
 
diff --git a/README.qmail b/README.qmail
index e40facc..45d0821 100644
--- a/README.qmail
+++ b/README.qmail
@@ -26,7 +26,7 @@ Configuration:
    # cd ${LISTDIR}/control/; echo '-' > delimiter
 - chown and chmod the file according to the mlmmj configuration
 - create dot-qmail files for the list to handle direct requests and extensions:
-   # echo -e "|${BINDIR}/mlmmj-recieve -L ${LISTDIR}" > ${DQFILE}
+   # echo -e "|${BINDIR}/mlmmj-receive -L ${LISTDIR}" > ${DQFILE}
 - chown and chmod the files according to the qmail (and vpopmail) configuration
 
 WARNING: REMEMBER that the delimiter is -, so do not use + when composing mail
@@ -53,7 +53,7 @@ chown -R vpopmail:vchkpw /var/spool/mlmmj/ml? [y/n]: y
 # echo '-' > delimiter
 # chown vpopmail:vchkpw delimiter
 # cd /home/vpopmail/domains/programmazione.it/
-# echo -e "|/usr/local/bin/mlmmj-recieve -L /var/spool/mlmmj/ml/" > .qmail-ml
+# echo -e "|/usr/local/bin/mlmmj-receive -L /var/spool/mlmmj/ml/" > .qmail-ml
 # cp -a .qmail-ml .qmail-ml-default
 # cat *-default
 # chown vpopmail:vchkpw .qmail-ml .qmail-ml-default
diff --git a/configure b/configure
index 222ee50..95b4d3a 100755
--- a/configure
+++ b/configure
@@ -553,7 +553,7 @@ PACKAGE_STRING='mlmmj 1.2.17'
 PACKAGE_BUGREPORT='mmj@mmj.dk'
 PACKAGE_URL=''
 
-ac_unique_file="src/mlmmj-recieve.c"
+ac_unique_file="src/mlmmj-receive.c"
 # Factoring default headers for most tests.
 ac_includes_default="\
 #include <stdio.h>
@@ -594,8 +594,8 @@ ac_subst_vars='am__EXEEXT_FALSE
 am__EXEEXT_TRUE
 LTLIBOBJS
 LIBOBJS
-WANT_RECIEVESTRIP_FALSE
-WANT_RECIEVESTRIP_TRUE
+WANT_RECEIVESTRIP_FALSE
+WANT_RECEIVESTRIP_TRUE
 textlibdir
 EGREP
 GREP
@@ -681,7 +681,7 @@ ac_subst_files=''
 ac_user_opts='
 enable_option_checking
 enable_dependency_tracking
-enable_recieve_strip
+enable_receive_strip
 '
       ac_precious_vars='build_alias
 host_alias
@@ -1309,7 +1309,7 @@ Optional Features:
   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
   --disable-dependency-tracking  speeds up one-time build
   --enable-dependency-tracking   do not reject slow dependency extractors
-  --enable-recieve-strip  build mlmmj-recieve-strip (default is no)
+  --enable-receive-strip  build mlmmj-receive-strip (default is no)
 
 Some influential environment variables:
   CC          C compiler command
@@ -4249,17 +4249,17 @@ exec_prefix=$savex
 
 
 
-# Check whether --enable-recieve-strip was given.
-if test "${enable_recieve_strip+set}" = set; then :
-  enableval=$enable_recieve_strip;
+# Check whether --enable-receive-strip was given.
+if test "${enable_receive_strip+set}" = set; then :
+  enableval=$enable_receive_strip;
 fi
 
- if test x"$enable_recieve_strip" = xyes; then
-  WANT_RECIEVESTRIP_TRUE-  WANT_RECIEVESTRIP_FALSE='#'
+ if test x"$enable_receive_strip" = xyes; then
+  WANT_RECEIVESTRIP_TRUE+  WANT_RECEIVESTRIP_FALSE='#'
 else
-  WANT_RECIEVESTRIP_TRUE='#'
-  WANT_RECIEVESTRIP_FALSE+  WANT_RECEIVESTRIP_TRUE='#'
+  WANT_RECEIVESTRIP_FALSE fi
 
 
@@ -4368,7 +4368,7 @@ ac_config_files="$ac_config_files listtexts/Makefile"
 
 ac_config_files="$ac_config_files contrib/Makefile"
 
-ac_config_files="$ac_config_files contrib/recievestrip/Makefile"
+ac_config_files="$ac_config_files contrib/receivestrip/Makefile"
 
 cat >confcache <<\_ACEOF
 # This file is a shell script that caches the results of configure
@@ -4483,8 +4483,8 @@ if test -z "${am__fastdepCC_TRUE}" && test -z "${am__fastdepCC_FALSE}"; then
   as_fn_error "conditional \"am__fastdepCC\" was never defined.
 Usually this means the macro was only invoked conditionally." "$LINENO" 5
 fi
-if test -z "${WANT_RECIEVESTRIP_TRUE}" && test -z "${WANT_RECIEVESTRIP_FALSE}"; then
-  as_fn_error "conditional \"WANT_RECIEVESTRIP\" was never defined.
+if test -z "${WANT_RECEIVESTRIP_TRUE}" && test -z "${WANT_RECEIVESTRIP_FALSE}"; then
+  as_fn_error "conditional \"WANT_RECEIVESTRIP\" was never defined.
 Usually this means the macro was only invoked conditionally." "$LINENO" 5
 fi
 
@@ -5087,7 +5087,7 @@ do
     "src/mlmmj-make-ml.sh") CONFIG_FILES="$CONFIG_FILES src/mlmmj-make-ml.sh" ;;
     "listtexts/Makefile") CONFIG_FILES="$CONFIG_FILES listtexts/Makefile" ;;
     "contrib/Makefile") CONFIG_FILES="$CONFIG_FILES contrib/Makefile" ;;
-    "contrib/recievestrip/Makefile") CONFIG_FILES="$CONFIG_FILES contrib/recievestrip/Makefile" ;;
+    "contrib/receivestrip/Makefile") CONFIG_FILES="$CONFIG_FILES contrib/receivestrip/Makefile" ;;
 
   *) as_fn_error "invalid argument: \`$ac_config_target'" "$LINENO" 5;;
   esac
diff --git a/configure.ac b/configure.ac
index 289648d..0f604d9 100644
--- a/configure.ac
+++ b/configure.ac
@@ -5,7 +5,7 @@ VERSION=$PACKAGE_VERSION
 AC_SUBST(VERSION)
 
 AM_INIT_AUTOMAKE(mlmmj, $VERSION)
-AC_CONFIG_SRCDIR([src/mlmmj-recieve.c])
+AC_CONFIG_SRCDIR([src/mlmmj-receive.c])
 AM_CONFIG_HEADER([config.h])
 
 # Checks for programs.
@@ -33,10 +33,10 @@ exec_prefix=$savex
 
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
@@ -48,5 +48,5 @@ AC_CONFIG_FILES([src/Makefile])
 AC_CONFIG_FILES([src/mlmmj-make-ml.sh])
 AC_CONFIG_FILES([listtexts/Makefile])
 AC_CONFIG_FILES([contrib/Makefile])
-AC_CONFIG_FILES([contrib/recievestrip/Makefile])
+AC_CONFIG_FILES([contrib/receivestrip/Makefile])
 AC_OUTPUT
diff --git a/contrib/Makefile.am b/contrib/Makefile.am
index dc4c348..6453855 100644
--- a/contrib/Makefile.am
+++ b/contrib/Makefile.am
@@ -1,4 +1,4 @@
 ## Process this file with automake to produce Makefile.in
 
 EXTRA_DIST = web
-SUBDIRS = recievestrip
+SUBDIRS = receivestrip
diff --git a/contrib/Makefile.in b/contrib/Makefile.in
index 77952d6..b0eb269 100644
--- a/contrib/Makefile.in
+++ b/contrib/Makefile.in
@@ -172,7 +172,7 @@ top_build_prefix = @top_build_prefix@
 top_builddir = @top_builddir@
 top_srcdir = @top_srcdir@
 EXTRA_DIST = web
-SUBDIRS = recievestrip
+SUBDIRS = receivestrip
 all: all-recursive
 
 .SUFFIXES:
diff --git a/contrib/recievestrip/Makefile.am b/contrib/receivestrip/Makefile.am
similarity index 76%
rename from contrib/recievestrip/Makefile.am
rename to contrib/receivestrip/Makefile.am
index e672edb..fa52bf3 100644
--- a/contrib/recievestrip/Makefile.am
+++ b/contrib/receivestrip/Makefile.am
@@ -5,10 +5,10 @@ AUTOMAKE_OPTIONS = foreign
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
diff --git a/contrib/recievestrip/Makefile.in b/contrib/receivestrip/Makefile.in
similarity index 97%
rename from contrib/recievestrip/Makefile.in
rename to contrib/receivestrip/Makefile.in
index f5d1f70..2c13f70 100644
--- a/contrib/recievestrip/Makefile.in
+++ b/contrib/receivestrip/Makefile.in
@@ -34,8 +34,8 @@ POST_INSTALL = :
 NORMAL_UNINSTALL = :
 PRE_UNINSTALL = :
 POST_UNINSTALL = :
-@WANT_RECIEVESTRIP_TRUE@bin_PROGRAMS = mlmmj-recieve-strip$(EXEEXT)
-subdir = contrib/recievestrip
+@WANT_RECEIVESTRIP_TRUE@bin_PROGRAMS = mlmmj-receive-strip$(EXEEXT)
+subdir = contrib/receivestrip
 DIST_COMMON = README $(srcdir)/Makefile.am $(srcdir)/Makefile.in
 ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
 am__aclocal_m4_deps = $(top_srcdir)/configure.ac
@@ -47,13 +47,13 @@ CONFIG_CLEAN_FILES  CONFIG_CLEAN_VPATH_FILES  am__installdirs = "$(DESTDIR)$(bindir)"
 PROGRAMS = $(bin_PROGRAMS)
-am_mlmmj_recieve_strip_OBJECTS = mlmmj-recieve-strip.$(OBJEXT) \
+am_mlmmj_receive_strip_OBJECTS = mlmmj-receive-strip.$(OBJEXT) \
 	mygetline.$(OBJEXT) memory.$(OBJEXT) readn.$(OBJEXT) \
 	strgen.$(OBJEXT) random-int.$(OBJEXT) log_error.$(OBJEXT) \
 	print-version.$(OBJEXT) writen.$(OBJEXT) dumpfd2fd.$(OBJEXT) \
 	ctrlvalues.$(OBJEXT) chomp.$(OBJEXT)
-mlmmj_recieve_strip_OBJECTS = $(am_mlmmj_recieve_strip_OBJECTS)
-mlmmj_recieve_strip_LDADD = $(LDADD)
+mlmmj_receive_strip_OBJECTS = $(am_mlmmj_receive_strip_OBJECTS)
+mlmmj_receive_strip_LDADD = $(LDADD)
 DEFAULT_INCLUDES = -I.@am__isrc@ -I$(top_builddir)
 depcomp = $(SHELL) $(top_srcdir)/depcomp
 am__depfiles_maybe = depfiles
@@ -62,8 +62,8 @@ COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
 	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
 CCLD = $(CC)
 LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
-SOURCES = $(mlmmj_recieve_strip_SOURCES)
-DIST_SOURCES = $(mlmmj_recieve_strip_SOURCES)
+SOURCES = $(mlmmj_receive_strip_SOURCES)
+DIST_SOURCES = $(mlmmj_receive_strip_SOURCES)
 ETAGS = etags
 CTAGS = ctags
 DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
@@ -157,7 +157,7 @@ top_srcdir = @top_srcdir@
 AUTOMAKE_OPTIONS = foreign
 AM_CFLAGS = -g -Wall -pedantic -Wsign-compare -DDEFAULTTEXTDIR='"@textlibdir@"'
 INCLUDES = -I$(srcdir)/../../include
-mlmmj_recieve_strip_SOURCES = mlmmj-recieve-strip.c ../../src/mygetline.c ../../src/memory.c ../../src/readn.c  \
+mlmmj_receive_strip_SOURCES = mlmmj-receive-strip.c ../../src/mygetline.c ../../src/memory.c ../../src/readn.c  \
 				../../src/strgen.c ../../src/random-int.c  ../../src/log_error.c ../../src/print-version.c \
 				../../src/writen.c ../../src/dumpfd2fd.c ../../src/ctrlvalues.c ../../src/chomp.c
 
@@ -174,9 +174,9 @@ $(srcdir)/Makefile.in:  $(srcdir)/Makefile.am  $(am__configure_deps)
 	      exit 1;; \
 	  esac; \
 	done; \
-	echo ' cd $(top_srcdir) && $(AUTOMAKE) --foreign contrib/recievestrip/Makefile'; \
+	echo ' cd $(top_srcdir) && $(AUTOMAKE) --foreign contrib/receivestrip/Makefile'; \
 	$(am__cd) $(top_srcdir) && \
-	  $(AUTOMAKE) --foreign contrib/recievestrip/Makefile
+	  $(AUTOMAKE) --foreign contrib/receivestrip/Makefile
 .PRECIOUS: Makefile
 Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
 	@case '$?' in \
@@ -232,9 +232,9 @@ uninstall-binPROGRAMS:
 
 clean-binPROGRAMS:
 	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)
-mlmmj-recieve-strip$(EXEEXT): $(mlmmj_recieve_strip_OBJECTS) $(mlmmj_recieve_strip_DEPENDENCIES) 
-	@rm -f mlmmj-recieve-strip$(EXEEXT)
-	$(LINK) $(mlmmj_recieve_strip_OBJECTS) $(mlmmj_recieve_strip_LDADD) $(LIBS)
+mlmmj-receive-strip$(EXEEXT): $(mlmmj_receive_strip_OBJECTS) $(mlmmj_receive_strip_DEPENDENCIES) 
+	@rm -f mlmmj-receive-strip$(EXEEXT)
+	$(LINK) $(mlmmj_receive_strip_OBJECTS) $(mlmmj_receive_strip_LDADD) $(LIBS)
 
 mostlyclean-compile:
 	-rm -f *.$(OBJEXT)
@@ -247,7 +247,7 @@ distclean-compile:
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/dumpfd2fd.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/log_error.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/memory.Po@am__quote@
-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-recieve-strip.Po@am__quote@
+@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-receive-strip.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mygetline.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/print-version.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/random-int.Po@am__quote@
diff --git a/contrib/recievestrip/README b/contrib/receivestrip/README
similarity index 86%
rename from contrib/recievestrip/README
rename to contrib/receivestrip/README
index ca95b0a..29264bb 100644
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
similarity index 98%
rename from contrib/recievestrip/mlmmj-recieve-strip.c
rename to contrib/receivestrip/mlmmj-receive-strip.c
index 57580a1..23e404e 100644
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
@@ -361,7 +361,7 @@ static int dump_mail(int infd, int outfd,char* listdir) {
 
 	/* dump rest of mail */
         if(dumpfd2fd(infd, outfd) != 0) {
-		log_error(LOG_ARGS, "Could not recieve mail");
+		log_error(LOG_ARGS, "Could not receive mail");
 		return -1;
         }
 
@@ -479,12 +479,12 @@ int main(int argc, char **argv)
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
@@ -498,7 +498,7 @@ int main(int argc, char **argv)
 	 * Now we fork so we can exit with success since it could potentially
 	 * take a long time for mlmmj-send to finish delivering the mails and
 	 * returning, making it susceptible to getting a SIGKILL from the
-	 * mailserver invoking mlmmj-recieve.
+	 * mailserver invoking mlmmj-receive.
 	 */
 	if (!nofork) {
 		childpid = fork();
diff --git a/include/do_all_the_voodo_here.h b/include/do_all_the_voodoo_here.h
similarity index 85%
rename from include/do_all_the_voodo_here.h
rename to include/do_all_the_voodoo_here.h
index cf86d43..c2c69a8 100644
--- a/include/do_all_the_voodo_here.h
+++ b/include/do_all_the_voodoo_here.h
@@ -1,6 +1,6 @@
 /* Copyright (C) 2004 Mads Martin Joergensen <mmj at mmj.dk>
  *
- * $Id: do_all_the_voodo_here.h,v 1.5 2004/06/20 17:27:22 mortenp Exp $
+ * $Id: do_all_the_voodoo_here.h,v 1.5 2004/06/20 17:27:22 mortenp Exp $
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to
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
similarity index 89%
rename from include/mlmmj-recieve.h
rename to include/mlmmj-receive.h
index 40393b4..316a57d 100644
--- a/include/mlmmj-recieve.h
+++ b/include/mlmmj-receive.h
@@ -1,6 +1,6 @@
 /* Copyright (C) 2002, 2003 Mads Martin Joergensen <mmj at mmj.dk>
  *
- * $Id: mlmmj-recieve.h,v 1.2 2004/06/16 21:11:53 mmj Exp $
+ * $Id: mlmmj-receive.h,v 1.2 2004/06/16 21:11:53 mmj Exp $
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to
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
index 693aace..4924580 100644
--- a/man/mlmmj-bounce.1
+++ b/man/mlmmj-bounce.1
@@ -29,7 +29,7 @@ be:
 The above shows that message number 109 bounced 1094409801 seconds after epoch
 which is in human date stamps is Sunday September 5th 20:43:21 2004.
 
-The last bounce mail recieved to the address is saved in <listdir>/bounce/<addrstring>.lastmsg.
+The last bounce mail received to the address is saved in <listdir>/bounce/<addrstring>.lastmsg.
 
 When the \fB\-p\fR option is used it sends out a probe email including info
 that it's a bounce probe and a list of the bounced message numbers. The
diff --git a/man/mlmmj-list.1 b/man/mlmmj-list.1
index 51ca25a..a25bad7 100644
--- a/man/mlmmj-list.1
+++ b/man/mlmmj-list.1
@@ -1,4 +1,4 @@
-.TH mlmmj-list "1" "November 2004" mlmmj-recieve
+.TH mlmmj-list "1" "November 2004" mlmmj-receive
 .SH NAME
 mlmmj-list \- list people / subscribers associated with a list
 .SH SYNOPSIS
diff --git a/man/mlmmj-process.1 b/man/mlmmj-process.1
index fd49305..db2b4f2 100644
--- a/man/mlmmj-process.1
+++ b/man/mlmmj-process.1
@@ -41,7 +41,7 @@ This could be headers like List-ID: or Reply-To:
 List control
 
 In case there's a mail with a recipient delimiter it's not a regular list mail.
-Processing of these happens in mlmmj-recieve as well. Examples of such are
+Processing of these happens in mlmmj-receive as well. Examples of such are
 subscription requests, mails to owner etc.
 It will base it's recipient delimiter detection on the Delivered-To: header if
 present. If not, the To: header is used.
diff --git a/man/mlmmj-recieve.1 b/man/mlmmj-receive.1
similarity index 82%
rename from man/mlmmj-recieve.1
rename to man/mlmmj-receive.1
index 394c3c1..8cf0e69 100644
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
@@ -15,13 +15,13 @@ mlmmj-recieve \- recieve mails for an mlmmj managed mailinglist
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
index 5ed4ecf..b01115b 100644
--- a/man/mlmmj-sub.1
+++ b/man/mlmmj-sub.1
@@ -37,7 +37,7 @@ owning the list directory. This is done to make sure that new files created are
 having correct permissions.
 
 The nomail version of the list is a list version where people are subscribed
-like usual, but they won't recieve any postings to the list. This is useful for
+like usual, but they won't receive any postings to the list. This is useful for
 people who read the mailinglist through a news gateway, but want to be able to
 post to the list.
 
diff --git a/src/Makefile.am b/src/Makefile.am
index 80f5199..79a906c 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -5,7 +5,7 @@ AUTOMAKE_OPTIONS = foreign
 AM_CFLAGS = -g -Wall -pedantic -Wsign-compare -DDEFAULTTEXTDIR='"@textlibdir@"'
 INCLUDES = -I$(srcdir)/../include
 
-bin_PROGRAMS = mlmmj-send mlmmj-recieve mlmmj-process mlmmj-sub \
+bin_PROGRAMS = mlmmj-send mlmmj-receive mlmmj-process mlmmj-sub \
                mlmmj-unsub mlmmj-bounce mlmmj-maintd mlmmj-list
 
 bin_SCRIPTS = mlmmj-make-ml.sh
@@ -19,7 +19,7 @@ mlmmj_send_SOURCES = mlmmj-send.c writen.c mail-functions.c itoa.c chomp.c \
 		     statctrl.c ctrlvalue.c getaddrsfromfd.c readn.c \
 		     getlistdelim.c
 
-mlmmj_recieve_SOURCES = mlmmj-recieve.c writen.c random-int.c strgen.c \
+mlmmj_receive_SOURCES = mlmmj-receive.c writen.c random-int.c strgen.c \
 			print-version.c log_error.c dumpfd2fd.c memory.c \
 			log_oper.c mylocking.c readn.c
 
@@ -27,7 +27,7 @@ mlmmj_process_SOURCES = mlmmj-process.c writen.c find_email_adr.c \
 			incindexfile.c itoa.c getlistaddr.c chomp.c \
 			mylocking.c listcontrol.c random-int.c strgen.c \
 			print-version.c send_help.c prepstdreply.c \
-			do_all_the_voodo_here.c mygetline.c gethdrline.c \
+			do_all_the_voodoo_here.c mygetline.c gethdrline.c \
 			log_error.c statctrl.c ctrlvalue.c dumpfd2fd.c \
 			subscriberfuncs.c ctrlvalues.c memory.c log_oper.c \
 			send_list.c readn.c getlistdelim.c unistr.c
diff --git a/src/Makefile.in b/src/Makefile.in
index 3f85323..27caac4 100644
--- a/src/Makefile.in
+++ b/src/Makefile.in
@@ -35,7 +35,7 @@ POST_INSTALL = :
 NORMAL_UNINSTALL = :
 PRE_UNINSTALL = :
 POST_UNINSTALL = :
-bin_PROGRAMS = mlmmj-send$(EXEEXT) mlmmj-recieve$(EXEEXT) \
+bin_PROGRAMS = mlmmj-send$(EXEEXT) mlmmj-receive$(EXEEXT) \
 	mlmmj-process$(EXEEXT) mlmmj-sub$(EXEEXT) mlmmj-unsub$(EXEEXT) \
 	mlmmj-bounce$(EXEEXT) mlmmj-maintd$(EXEEXT) \
 	mlmmj-list$(EXEEXT)
@@ -82,7 +82,7 @@ am_mlmmj_process_OBJECTS = mlmmj-process.$(OBJEXT) writen.$(OBJEXT) \
 	getlistaddr.$(OBJEXT) chomp.$(OBJEXT) mylocking.$(OBJEXT) \
 	listcontrol.$(OBJEXT) random-int.$(OBJEXT) strgen.$(OBJEXT) \
 	print-version.$(OBJEXT) send_help.$(OBJEXT) \
-	prepstdreply.$(OBJEXT) do_all_the_voodo_here.$(OBJEXT) \
+	prepstdreply.$(OBJEXT) do_all_the_voodoo_here.$(OBJEXT) \
 	mygetline.$(OBJEXT) gethdrline.$(OBJEXT) log_error.$(OBJEXT) \
 	statctrl.$(OBJEXT) ctrlvalue.$(OBJEXT) dumpfd2fd.$(OBJEXT) \
 	subscriberfuncs.$(OBJEXT) ctrlvalues.$(OBJEXT) \
@@ -90,12 +90,12 @@ am_mlmmj_process_OBJECTS = mlmmj-process.$(OBJEXT) writen.$(OBJEXT) \
 	readn.$(OBJEXT) getlistdelim.$(OBJEXT) unistr.$(OBJEXT)
 mlmmj_process_OBJECTS = $(am_mlmmj_process_OBJECTS)
 mlmmj_process_LDADD = $(LDADD)
-am_mlmmj_recieve_OBJECTS = mlmmj-recieve.$(OBJEXT) writen.$(OBJEXT) \
+am_mlmmj_receive_OBJECTS = mlmmj-receive.$(OBJEXT) writen.$(OBJEXT) \
 	random-int.$(OBJEXT) strgen.$(OBJEXT) print-version.$(OBJEXT) \
 	log_error.$(OBJEXT) dumpfd2fd.$(OBJEXT) memory.$(OBJEXT) \
 	log_oper.$(OBJEXT) mylocking.$(OBJEXT) readn.$(OBJEXT)
-mlmmj_recieve_OBJECTS = $(am_mlmmj_recieve_OBJECTS)
-mlmmj_recieve_LDADD = $(LDADD)
+mlmmj_receive_OBJECTS = $(am_mlmmj_receive_OBJECTS)
+mlmmj_receive_LDADD = $(LDADD)
 am_mlmmj_send_OBJECTS = mlmmj-send.$(OBJEXT) writen.$(OBJEXT) \
 	mail-functions.$(OBJEXT) itoa.$(OBJEXT) chomp.$(OBJEXT) \
 	incindexfile.$(OBJEXT) checkwait_smtpreply.$(OBJEXT) \
@@ -157,11 +157,11 @@ CCLD = $(CC)
 LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
 SOURCES = $(mlmmj_bounce_SOURCES) $(mlmmj_list_SOURCES) \
 	$(mlmmj_maintd_SOURCES) $(mlmmj_process_SOURCES) \
-	$(mlmmj_recieve_SOURCES) $(mlmmj_send_SOURCES) \
+	$(mlmmj_receive_SOURCES) $(mlmmj_send_SOURCES) \
 	$(mlmmj_sub_SOURCES) $(mlmmj_unsub_SOURCES)
 DIST_SOURCES = $(mlmmj_bounce_SOURCES) $(mlmmj_list_SOURCES) \
 	$(mlmmj_maintd_SOURCES) $(mlmmj_process_SOURCES) \
-	$(mlmmj_recieve_SOURCES) $(mlmmj_send_SOURCES) \
+	$(mlmmj_receive_SOURCES) $(mlmmj_send_SOURCES) \
 	$(mlmmj_sub_SOURCES) $(mlmmj_unsub_SOURCES)
 ETAGS = etags
 CTAGS = ctags
@@ -265,7 +265,7 @@ mlmmj_send_SOURCES = mlmmj-send.c writen.c mail-functions.c itoa.c chomp.c \
 		     statctrl.c ctrlvalue.c getaddrsfromfd.c readn.c \
 		     getlistdelim.c
 
-mlmmj_recieve_SOURCES = mlmmj-recieve.c writen.c random-int.c strgen.c \
+mlmmj_receive_SOURCES = mlmmj-receive.c writen.c random-int.c strgen.c \
 			print-version.c log_error.c dumpfd2fd.c memory.c \
 			log_oper.c mylocking.c readn.c
 
@@ -273,7 +273,7 @@ mlmmj_process_SOURCES = mlmmj-process.c writen.c find_email_adr.c \
 			incindexfile.c itoa.c getlistaddr.c chomp.c \
 			mylocking.c listcontrol.c random-int.c strgen.c \
 			print-version.c send_help.c prepstdreply.c \
-			do_all_the_voodo_here.c mygetline.c gethdrline.c \
+			do_all_the_voodoo_here.c mygetline.c gethdrline.c \
 			log_error.c statctrl.c ctrlvalue.c dumpfd2fd.c \
 			subscriberfuncs.c ctrlvalues.c memory.c log_oper.c \
 			send_list.c readn.c getlistdelim.c unistr.c
@@ -391,9 +391,9 @@ mlmmj-maintd$(EXEEXT): $(mlmmj_maintd_OBJECTS) $(mlmmj_maintd_DEPENDENCIES)
 mlmmj-process$(EXEEXT): $(mlmmj_process_OBJECTS) $(mlmmj_process_DEPENDENCIES) 
 	@rm -f mlmmj-process$(EXEEXT)
 	$(LINK) $(mlmmj_process_OBJECTS) $(mlmmj_process_LDADD) $(LIBS)
-mlmmj-recieve$(EXEEXT): $(mlmmj_recieve_OBJECTS) $(mlmmj_recieve_DEPENDENCIES) 
-	@rm -f mlmmj-recieve$(EXEEXT)
-	$(LINK) $(mlmmj_recieve_OBJECTS) $(mlmmj_recieve_LDADD) $(LIBS)
+mlmmj-receive$(EXEEXT): $(mlmmj_receive_OBJECTS) $(mlmmj_receive_DEPENDENCIES) 
+	@rm -f mlmmj-receive$(EXEEXT)
+	$(LINK) $(mlmmj_receive_OBJECTS) $(mlmmj_receive_LDADD) $(LIBS)
 mlmmj-send$(EXEEXT): $(mlmmj_send_OBJECTS) $(mlmmj_send_DEPENDENCIES) 
 	@rm -f mlmmj-send$(EXEEXT)
 	$(LINK) $(mlmmj_send_OBJECTS) $(mlmmj_send_LDADD) $(LIBS)
@@ -448,7 +448,7 @@ distclean-compile:
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/chomp.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ctrlvalue.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/ctrlvalues.Po@am__quote@
-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/do_all_the_voodo_here.Po@am__quote@
+@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/do_all_the_voodoo_here.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/dumpfd2fd.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/find_email_adr.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/getaddrsfromfd.Po@am__quote@
@@ -467,7 +467,7 @@ distclean-compile:
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-list.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-maintd.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-process.Po@am__quote@
-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-recieve.Po@am__quote@
+@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-receive.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-send.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-sub.Po@am__quote@
 @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/mlmmj-unsub.Po@am__quote@
diff --git a/src/do_all_the_voodo_here.c b/src/do_all_the_voodoo_here.c
similarity index 96%
rename from src/do_all_the_voodo_here.c
rename to src/do_all_the_voodoo_here.c
index e875979..86db399 100644
--- a/src/do_all_the_voodo_here.c
+++ b/src/do_all_the_voodoo_here.c
@@ -1,6 +1,6 @@
 /* Copyright (C) 2004 Mads Martin Joergensen <mmj at mmj.dk>
  *
- * $Id: do_all_the_voodo_here.c,v 1.26 2005/05/09 12:50:15 mmj Exp $
+ * $Id: do_all_the_voodoo_here.c,v 1.26 2005/05/09 12:50:15 mmj Exp $
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to
@@ -31,7 +31,7 @@
 #include "strgen.h"
 #include "chomp.h"
 #include "ctrlvalue.h"
-#include "do_all_the_voodo_here.h"
+#include "do_all_the_voodoo_here.h"
 #include "log_error.h"
 #include "wrappers.h"
 #include "memory.h"
@@ -75,7 +75,7 @@ void getinfo(const char *line, struct mailhdr *readhdrs)
 	}
 }
 
-int do_all_the_voodo_here(int infd, int outfd, int hdrfd, int footfd,
+int do_all_the_voodoo_here(int infd, int outfd, int hdrfd, int footfd,
 		 const char **delhdrs, struct mailhdr *readhdrs,
 		 struct strlist *allhdrs, const char *prefix)
 {
diff --git a/src/mlmmj-make-ml.sh b/src/mlmmj-make-ml.sh
index 341896e..9e39859 100644
--- a/src/mlmmj-make-ml.sh
+++ b/src/mlmmj-make-ml.sh
@@ -120,9 +120,9 @@ echo "$OWNER" > "$LISTDIR"/"control/owner"
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
@@ -130,7 +130,7 @@ if [ -z "$MLMMJMAINTD" ]; then
 	MLMMJMAINTD="/path/to/mlmmj-maintd"
 fi
 
-ALIAS="$LISTNAME:  \"|$MLMMJRECIEVE -L $SPOOLDIR/$LISTNAME/\""
+ALIAS="$LISTNAME:  \"|$MLMMJRECEIVE -L $SPOOLDIR/$LISTNAME/\""
 CRONENTRY="0 */2 * * * \"$MLMMJMAINTD -F -L $SPOOLDIR/$LISTNAME/\""
 
 if [ -n "$A_CREATE" ]; then
diff --git a/src/mlmmj-make-ml.sh.in b/src/mlmmj-make-ml.sh.in
index da90623..ae9233e 100755
--- a/src/mlmmj-make-ml.sh.in
+++ b/src/mlmmj-make-ml.sh.in
@@ -120,9 +120,9 @@ echo "$OWNER" > "$LISTDIR"/"control/owner"
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
@@ -130,7 +130,7 @@ if [ -z "$MLMMJMAINTD" ]; then
 	MLMMJMAINTD="/path/to/mlmmj-maintd"
 fi
 
-ALIAS="$LISTNAME:  \"|$MLMMJRECIEVE -L $SPOOLDIR/$LISTNAME/\""
+ALIAS="$LISTNAME:  \"|$MLMMJRECEIVE -L $SPOOLDIR/$LISTNAME/\""
 CRONENTRY="0 */2 * * * \"$MLMMJMAINTD -F -L $SPOOLDIR/$LISTNAME/\""
 
 if [ -n "$A_CREATE" ]; then
diff --git a/src/mlmmj-process.c b/src/mlmmj-process.c
index 0e88123..96c70d1 100644
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
@@ -448,13 +448,13 @@ int main(int argc, char **argv)
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
@@ -474,10 +474,10 @@ int main(int argc, char **argv)
 
 	subjectprefix = ctrlvalue(listdir, "prefix");
 
-	if(do_all_the_voodo_here(rawmailfd, donemailfd, hdrfd, footfd,
+	if(do_all_the_voodoo_here(rawmailfd, donemailfd, hdrfd, footfd,
 				(const char**)delheaders->strs, readhdrs,
 				&allheaders, subjectprefix) < 0) {
-		log_error(LOG_ARGS, "Error in do_all_the_voodo_here");
+		log_error(LOG_ARGS, "Error in do_all_the_voodoo_here");
 		exit(EXIT_FAILURE);
 	}
 
@@ -585,16 +585,16 @@ int main(int argc, char **argv)
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
 			close(donemailfd);
 			unlink(mailfile);
-			log_oper(listdir, OPLOGFNAME, "mlmmj-recieve: sending"
+			log_oper(listdir, OPLOGFNAME, "mlmmj-receive: sending"
 					" mail from %s to owner",
 					efrom);
 			execlp(mlmmjsend, mlmmjsend,
diff --git a/src/mlmmj-recieve.c b/src/mlmmj-receive.c
similarity index 95%
rename from src/mlmmj-recieve.c
rename to src/mlmmj-receive.c
index 9bd1eb8..09db70b 100644
--- a/src/mlmmj-recieve.c
+++ b/src/mlmmj-receive.c
@@ -1,6 +1,6 @@
 /* Copyright (C) 2002, 2003 Mads Martin Joergensen <mmj at mmj.dk>
  *
- * $Id: mlmmj-recieve.c,v 1.31 2008/11/02 20:54:40 mortenp Exp $
+ * $Id: mlmmj-receive.c,v 1.31 2008/11/02 20:54:40 mortenp Exp $
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to
@@ -142,12 +142,12 @@ int main(int argc, char **argv)
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
@@ -161,7 +161,7 @@ int main(int argc, char **argv)
 	 * Now we fork so we can exit with success since it could potentially
 	 * take a long time for mlmmj-send to finish delivering the mails and
 	 * returning, making it susceptible to getting a SIGKILL from the
-	 * mailserver invoking mlmmj-recieve.
+	 * mailserver invoking mlmmj-receive.
 	 */
 	if (!nofork) {
 		childpid = fork();
diff --git a/src/mlmmj-send.c b/src/mlmmj-send.c
index d0d6621..4222b6a 100644
--- a/src/mlmmj-send.c
+++ b/src/mlmmj-send.c
@@ -446,7 +446,7 @@ int send_mail_verp(int sockfd, struct strlist *addrs, char *mailmap,
 	}
 	for(i = 0; i < addrs->count; i++) {
 		if(gotsigterm) {
-			log_error(LOG_ARGS, "TERM signal recieved, "
+			log_error(LOG_ARGS, "TERM signal received, "
 					"shutting down.");
 			return -1;
 		}
@@ -640,7 +640,7 @@ int send_mail_many_list(int sockfd, const char *from, const char *replyto,
 		}
 		if(gotsigterm && listaddr && archivefilename) {
 			/* we got SIGTERM, so save the addresses and bail */
-			log_error(LOG_ARGS, "TERM signal recieved, "
+			log_error(LOG_ARGS, "TERM signal received, "
 						"shutting down.");
 			index = get_index_from_filename(archivefilename);
 			status = requeuemail(listdir, index, addrs, i);
-- 
1.7.0.3


