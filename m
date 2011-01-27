From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:21 +0000
Subject: [mlmmj] [PATCH 03 of 10] Log abnormal child process termination
Message-Id: <e2c655527310ac0b26ff.1296169161@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295972330 0
# Node ID e2c655527310ac0b26ff151d31ebef51178e2a20
# Parent  83ea9f0b42ece96bb04deb4c3ff023d126198d80
Log abnormal child process termination

diff -r 83ea9f0b42ec -r e2c655527310 src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Tue Jan 25 16:07:44 2011 +0000
+++ b/src/mlmmj-maintd.c	Tue Jan 25 16:18:50 2011 +0000
@@ -211,6 +211,18 @@
 	do /* Parent waits for the child */
 	      pid = waitpid(childpid, &status, 0);
 	while(pid = -1 && errno = EINTR);
+	if (pid != childpid) {
+		log_error(LOG_ARGS, "Failed waiting for child %s",
+			childname);
+	} else if (!WIFEXITED(status)) {
+		errno = 0;
+		log_error(LOG_ARGS, "Child terminated abnormally %s",
+			childname);
+	} else if (WEXITSTATUS(status) != 0) {
+		errno = 0;
+		log_error(LOG_ARGS, "Child terminated with non-zero status %s",
+			childname);
+	}
 }
 
 int resend_queue(const char *listdir, const char *mlmmjsend)

