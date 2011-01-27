From: Richard Mortimer <richm@oldelvet.org.uk>
Date: Thu, 27 Jan 2011 22:59:20 +0000
Subject: [mlmmj] [PATCH 02 of 10] Use a common wait_for_child function. This will make
Message-Id: <83ea9f0b42ece96bb04d.1296169160@duncow>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

# HG changeset patch
# User Richard Mortimer <richm@oldelvet.org.uk>
# Date 1295971664 0
# Node ID 83ea9f0b42ece96bb04deb4c3ff023d126198d80
# Parent  ceda2c7e58db6611f80b5cb80f2f96cf53501db8
Use a common wait_for_child function. This will make it easier to report
child errors in a consistent way.

diff -r ceda2c7e58db -r 83ea9f0b42ec src/mlmmj-maintd.c
--- a/src/mlmmj-maintd.c	Tue Jan 25 15:21:40 2011 +0000
+++ b/src/mlmmj-maintd.c	Tue Jan 25 16:07:44 2011 +0000
@@ -204,6 +204,15 @@
 	return ret;
 }
 
+void wait_for_child(const pid_t childpid, const char *childname)
+{
+	int status;
+	pid_t pid;
+	do /* Parent waits for the child */
+	      pid = waitpid(childpid, &status, 0);
+	while(pid = -1 && errno = EINTR);
+}
+
 int resend_queue(const char *listdir, const char *mlmmjsend)
 {
 	DIR *queuedir;
@@ -211,9 +220,9 @@
 	char *mailname, *fromname, *toname, *reptoname, *from, *to, *repto;
 	char *ch, *dirname = concatstr(2, listdir, "/queue/");
 	char *bouncelifestr;
-	pid_t childpid, pid;
+	pid_t childpid;
 	struct stat st;
-	int fromfd, tofd, fd, status, err = 0;
+	int fromfd, tofd, fd, err = 0;
 	time_t t, bouncelife = 0;
 
 	if(chdir(dirname) < 0) {
@@ -334,9 +343,7 @@
 			myfree(from);
 			myfree(to);
 			myfree(repto);
-			do /* Parent waits for the child */
-			      pid = waitpid(childpid, &status, 0);
-			while(pid = -1 && errno = EINTR);
+			wait_for_child(childpid, mlmmjsend);
 		} else {
 			if(repto) {
 				execlp(mlmmjsend, mlmmjsend,
@@ -375,9 +382,9 @@
 	char *dirname = concatstr(2, listdir, "/requeue/");
 	char *archivefilename, *subfilename, *subnewname;
 	struct stat st;
-	pid_t childpid, pid;
+	pid_t childpid;
 	time_t t;
-	int status, fromrequeuedir;
+	int fromrequeuedir;
 
 	if(chdir(dirname) < 0) {
 		log_error(LOG_ARGS, "Could not chdir(%s)", dirname);
@@ -467,9 +474,7 @@
 		if(childpid > 0) {
 			myfree(archivefilename);
 			myfree(subnewname);
-			do /* Parent waits for the child */
-			      pid = waitpid(childpid, &status, 0);
-			while(pid = -1 && errno = EINTR);
+			wait_for_child(childpid, mlmmjsend);
 		} else {
 			execlp(mlmmjsend, mlmmjsend,
 					"-l", "3",
@@ -564,8 +569,7 @@
 	char *probefile, *s;
 	struct dirent *dp;
 	struct stat st;
-	pid_t pid, childpid;
-	int status;
+	pid_t childpid;
 	
 	if(chdir(dirname) < 0) {
 		log_error(LOG_ARGS, "Could not chdir(%s)", dirname);
@@ -615,9 +619,7 @@
 		}
 
 		if(childpid > 0) {
-			do /* Parent waits for the child */
-				pid = waitpid(childpid, &status, 0);
-			while(pid = -1 && errno = EINTR);
+			wait_for_child(childpid, mlmmjbounce);
 		} else {
 			probefile = mystrdup(dp->d_name);
 			execlp(mlmmjbounce, mlmmjbounce,
@@ -643,8 +645,8 @@
 	char *bouncelifestr;
 	struct dirent *dp;
 	struct stat st;
-	pid_t pid, childpid;
-	int status, fd;
+	pid_t childpid;
+	int fd;
 	time_t bouncetime, t, bouncelife = 0;
 	
 	if(chdir(dirname) < 0) {
@@ -753,9 +755,7 @@
 					" %s", address, bouncedata);
 			myfree(address);
 			myfree(bouncedata);
-			do /* Parent waits for the child */
-				pid = waitpid(childpid, &status, 0);
-			while(pid = -1 && errno = EINTR);
+			wait_for_child(childpid, mlmmjunsub);
 			unlink(dp->d_name);
 			a = concatstr(2, dp->d_name, ".lastmsg");
 			unlink(a);

