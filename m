From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Fri, 13 Jun 2008 08:06:17 +0000
Subject: [patch] silence error message in mlmmj-maintd
Message-Id: <200806131006.17639.thomas.jarosch@intra2net.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_5piUIxVT9inEtvy"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

--Boundary-00=_5piUIxVT9inEtvy
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello together,

attached patch silences the following error message in
mlmmj-maintd if archiving is disabled:

-----------------------------
Jun 13 02:02:37 intranator /usr/bin/mlmmj-maintd[22978]: mlmmj-maintd.c:838: 
Could not open '/var/spool/mlmmj/test/index': No such file or directory
-----------------------------

Are there any plans to release a new version
including the two patches I sent earlier?

Cheers,
Thomas

--Boundary-00=_5piUIxVT9inEtvy
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mlmmj-silence-maintd-warning.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mlmmj-silence-maintd-warning.patch"

diff -u -r -p mlmmj.orig/src/mlmmj-maintd.c mlmmj-1.2.15/src/mlmmj-maintd.c
--- mlmmj.orig/src/mlmmj-maintd.c	Fri Jun 13 09:35:23 2008
+++ mlmmj-1.2.15/src/mlmmj-maintd.c	Fri Jun 13 09:53:21 2008
@@ -44,6 +44,7 @@
 #include "ctrlvalue.h"
 #include "send_digest.h"
 #include "mylocking.h"
+#include "statctrl.h"
 #include "log_oper.h"
 
 static void print_help(const char *prg)
@@ -771,6 +772,9 @@ int run_digests(const char *listdir, con
 	int fd, indexfd, lock;
 	size_t lenbuf, lenstr;
 	
+	if (statctrl(listdir, "noarchive") == 1)
+	    return 0;
+
 	digestintervalstr = ctrlvalue(listdir, "digestinterval");
 	if (digestintervalstr) {
 		digestinterval = (time_t)atol(digestintervalstr);

--Boundary-00=_5piUIxVT9inEtvy--
