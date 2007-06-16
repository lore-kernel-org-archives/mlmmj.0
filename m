From: Ansgar Burchardt <ansgar@2007.43-1.org>
Date: Sat, 16 Jun 2007 11:14:43 +0000
Subject: [PATCH] configure option to build and install mlmmj-recieve-strip
Message-Id: <20070616111443.GA18142@jigoku.43-1.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi,

I added an option to configure to build and install mlmmj-recieve-strip.

Ansgar

--- a/README
+++ b/README
@@ -29,6 +29,10 @@ To use mlmmj, do the following:
 
     $ ./configure && make && make install
 
+		If you want to filter multipart/mime messages, pass the option
+		--enable-recieve-strip to configure, and take a look at
+		contrib/recievestrip/README.
+
  1) Configure a recipient delimiter. The default is to use '+', and in
     Postfix it's done by adding
 
--- a/configure.ac
+++ b/configure.ac
@@ -33,6 +33,11 @@ exec_prefix=$savex
 
 AC_SUBST(textlibdir)
 
+AC_ARG_ENABLE([recieve-strip],
+  AS_HELP_STRING([--enable-recieve-strip],
+                 [build mlmmj-recieve-strip (default is no)]))
+AM_CONDITIONAL(WANT_RECIEVESTRIP, test x"$enable_recieve_strip" = xyes)
+
 # Checks for library functions.
 AC_FUNC_MALLOC
 AC_CHECK_FUNCS([ftruncate memset socket strerror strncasecmp snprintf fcntl])
--- a/contrib/recievestrip/Makefile.am
+++ b/contrib/recievestrip/Makefile.am
@@ -5,7 +5,9 @@ AUTOMAKE_OPTIONS = foreign
 AM_CFLAGS = -g -Wall -pedantic -Wsign-compare -DDEFAULTTEXTDIR='"@textlibdir@"'
 INCLUDES = -I$(srcdir)/../../include
 
-noinst_PROGRAMS = mlmmj-recieve-strip
+if WANT_RECIEVESTRIP
+  bin_PROGRAMS = mlmmj-recieve-strip
+endif
 
 mlmmj_recieve_strip_SOURCES = mlmmj-recieve-strip.c ../../src/mygetline.c ../../src/memory.c ../../src/readn.c  \
 				../../src/strgen.c ../../src/random-int.c  ../../src/log_error.c ../../src/print-version.c \

