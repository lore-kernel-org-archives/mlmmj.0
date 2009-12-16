From: "Robin H. Johnson" <robbat2@gentoo.org>
Date: Wed, 16 Dec 2009 02:58:17 +0000
Subject: [PATCH] Re: requeued mail files going missing from archive/
Message-Id: <robbat2-20091216T025726-844574632Z@orbis-terrarum.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mYYhpFXgKVw71fwr"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org


--mYYhpFXgKVw71fwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 16, 2009 at 02:04:35AM +0000, Robin H. Johnson wrote:
> Lately I've had a lot of mail be requeued, and I'm running into some of the
> requeue subdirectories existing, but the original mail that goes with them
> going missing after being delivered only to some users.
Patch that fixes it attached.

If the maintd visited more than one mail in the /requeue/ directory, and the
FIRST one set the fromrequeuedir flag to unlink the mail file, the flag was NOT
cleared and caused mail in the real archive to be erronously removed.

Signed-off-by: Robin H. Johnson <robbat2@gentoo.org>

-- 
Robin Hugh Johnson
Gentoo Linux: Developer, Trustee & Infrastructure Lead
E-Mail     : robbat2@gentoo.org
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--mYYhpFXgKVw71fwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mlmmj-1.2.16-requeue-unlink-fix.patch"

If the maintd visited more than one mail in the /requeue/ directory, and the
FIRST one set the fromrequeuedir flag to unlink the mail file, the flag was NOT
cleared and caused mail in the real archive to be erronously removed.

Signed-off-by: Robin H. Johnson <robbat2@gentoo.org>

diff -Nuar --exclude mlmmj-make-ml.sh mlmmj-1.2.16.orig/src/mlmmj-maintd.c mlmmj-1.2.16/src/mlmmj-maintd.c
--- mlmmj-1.2.16.orig/src/mlmmj-maintd.c	2008-10-31 14:20:51.000000000 +0000
+++ mlmmj-1.2.16/src/mlmmj-maintd.c	2009-12-16 02:11:16.848146214 +0000
@@ -373,7 +373,7 @@
 	struct stat st;
 	pid_t childpid, pid;
 	time_t t;
-	int status, fromrequeuedir = 0;
+	int status, fromrequeuedir;
 
 	if(chdir(dirname) < 0) {
 		log_error(LOG_ARGS, "Could not chdir(%s)", dirname);
@@ -408,6 +408,10 @@
 
 		archivefilename = concatstr(3, listdir, "/archive/",
 						dp->d_name);
+
+		/* Explicitly initialize for each mail we examine */
+		fromrequeuedir = 0;
+
 		if(stat(archivefilename, &st) < 0) {
 			/* Might be it's just not moved to the archive
 			 * yet because it's still getting sent, so just

--mYYhpFXgKVw71fwr--

