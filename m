From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 09 Dec 2010 13:04:35 +0000
Subject: Re: [mlmmj] private lists with mlmmj
Message-Id: <4D00D3E3.6010505@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050709090207040500050008"
List-Id: <mlmmj.mlmmj.org>
References: <AANLkTikNkR-mQiMo2f3MVOStmn2VSgOat+O3Pbe0iAdO@mail.gmail.com>
In-Reply-To: <AANLkTikNkR-mQiMo2f3MVOStmn2VSgOat+O3Pbe0iAdO@mail.gmail.com>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------050709090207040500050008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I actually wrote the attached patch a few days ago for another purpose, but it 
could be brought to bear on this problem. It adds an executable 'mlmmj-subbed' 
which simply prints out 'yes' or 'no', depending upon whether a given address is 
subscribed to the list or not.

I use a PHP script to call mlmmj-subbed and examine the output to decide whether 
to grant access to the user based solely on their email address which I ask them 
to enter on a form (with no password). It wouldn't be hard to use a similar PHP 
wrapper around mail archives, asking for an email address before granting access.

Maybe one day mlmmj-subbed, or something similar, will be part of Mlmmj. So far it 
is just a bit of a quick hack, though, and not very carefully thought through.

Making it work is also a bit of a hack. Mlmmj makes its subscriber files readable 
only by their owner, which isn't my web user which is running the PHP scripts. So 
I use sudo to allow mlmmj-subbed to be run by the web user as the Mlmmj user, with 
a hardcoded listdir.

Anyway, it may help, I guess.

Ben.



On 8/12/10 9:26 PM, Florian Effenberger wrote:
> Hi,
>
> we're quite happy with mlmmj and public mailing lists. For internal
> lists, so far, we've been using Mailman, and I'm thinking of
> continuing that because:
>
> * archives are available to all subscribers with ther individual
> username and password
> * every subscriber can change his address on his own
>
> With mlmmj, I'd have to do some magic .htaccess trick for the
> archives, and address changes would have to be done by an
> administrator. From my feeling, I'd love to move private lists to
> mlmmj as well, to have all lists with one list manager, so I'm asking
> here if someone has some good ideas on how to deal with the above to
> problems?
>
> Thanks,
> Florian
>
>
>

--------------050709090207040500050008
Content-Type: text/x-patch;
 name="mlmmj-subbed.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mlmmj-subbed.patch"

diff -r 44778d21edad -r 88d7744d11fc .hgignore
--- a/.hgignore	Sun Dec 05 19:13:25 2010 +1100
+++ b/.hgignore	Sun Dec 05 19:16:09 2010 +1100
@@ -29,6 +29,7 @@
 ^src/mlmmj-receive$
 ^src/mlmmj-send$
 ^src/mlmmj-sub$
+^src/mlmmj-subbed$
 ^src/mlmmj-unsub$
 
 # Other generated files
diff -r 44778d21edad -r 88d7744d11fc src/Makefile.am
--- a/src/Makefile.am	Sun Dec 05 19:13:25 2010 +1100
+++ b/src/Makefile.am	Sun Dec 05 19:16:09 2010 +1100
@@ -6,7 +6,8 @@
 INCLUDES = -I$(srcdir)/../include
 
 bin_PROGRAMS = mlmmj-send mlmmj-receive mlmmj-process mlmmj-sub \
-               mlmmj-unsub mlmmj-bounce mlmmj-maintd mlmmj-list
+               mlmmj-unsub mlmmj-bounce mlmmj-maintd mlmmj-list \
+					mlmmj-subbed
 
 bin_SCRIPTS = mlmmj-make-ml
 
@@ -45,6 +46,9 @@
 			prepstdreply.c memory.c statctrl.c readn.c \
 			getlistdelim.c unistr.c ctrlvalue.c
 			
+mlmmj_subbed_SOURCES = mlmmj-subbed.c subscriberfuncs.c print-version.c \
+			log_error.c mygetline.c memory.c strgen.c random-int.c readn.c
+
 mlmmj_bounce_SOURCES = mlmmj-bounce.c print-version.c log_error.c \
 		       subscriberfuncs.c strgen.c random-int.c writen.c \
 		       prepstdreply.c mygetline.c chomp.c getlistaddr.c \
diff -r 44778d21edad -r 88d7744d11fc src/mlmmj-subbed.c
--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
+++ b/src/mlmmj-subbed.c	Sun Dec 05 19:16:09 2010 +1100
@@ -0,0 +1,126 @@
+/* Copyright (C) 2002, 2003 Mads Martin Joergensen <mmj at mmj.dk>
+ *
+ * $Id$
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <errno.h>
+#include <syslog.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <libgen.h>
+#include <sys/wait.h>
+#include <ctype.h>
+
+#include "mlmmj.h"
+#include "mlmmj-sub.h"
+#include "mylocking.h"
+#include "wrappers.h"
+#include "getlistaddr.h"
+#include "getlistdelim.h"
+#include "strgen.h"
+#include "subscriberfuncs.h"
+#include "log_error.h"
+#include "mygetline.h"
+#include "statctrl.h"
+#include "prepstdreply.h"
+#include "memory.h"
+#include "ctrlvalues.h"
+#include "chomp.h"
+
+static void print_help(const char *prg)
+{
+	printf("Usage: %s -L /path/to/list -a john@doe.org\n"
+	       "       [-h] [-V]\n"
+	       " -a: Email address to check\n"
+	       " -h: This help\n"
+	       " -L: Full path to list directory\n"
+	       " -V: Print version\n", prg);
+	exit(0);
+}
+
+int main(int argc, char **argv)
+{
+	char *listdir = NULL, *address = NULL;
+	char *lowcaseaddr;
+	int opt, i, subbed;
+
+	CHECKFULLPATH(argv[0]);
+
+	log_set_name(argv[0]);
+
+	while ((opt = getopt(argc, argv, "hVUL:a:")) != -1) {
+		switch(opt) {
+		case 'a':
+			address = optarg;
+			break;
+		case 'h':
+			print_help(argv[0]);
+			break;
+		case 'L':
+			listdir = optarg;
+			break;
+		case 'V':
+			print_version(argv[0]);
+			exit(0);
+		}
+	}
+
+	if(listdir == NULL) {
+		fprintf(stderr, "You have to specify -L\n");
+		fprintf(stderr, "%s -h for help\n", argv[0]);
+		exit(2);
+	}
+	
+	if(address == NULL) {
+		fprintf(stderr, "You have to specify -a\n");
+		fprintf(stderr, "%s -h for help\n", argv[0]);
+		exit(2);
+	}
+
+	if(strchr(address, '@') == NULL) {
+		exit(2);
+	}
+
+	/* Make the address lowercase */
+	lowcaseaddr = mystrdup(address);
+	i = 0;
+	while(lowcaseaddr[i]) {
+		lowcaseaddr[i] = tolower(lowcaseaddr[i]);
+		i++;
+	}
+	address = lowcaseaddr;
+
+	subbed = is_subbed(listdir, address);
+
+	myfree(address);
+
+	if(subbed) {
+		printf("no\n");
+		return 1;
+	}
+	printf("yes\n");
+	return 0;
+}

--------------050709090207040500050008--

