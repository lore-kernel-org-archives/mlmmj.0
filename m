From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 24 May 2004 13:36:09 +0000
Subject: Bouncehandling FIX for mlmmj-0.5.1
Message-Id: <20040524133609.GA56661@panther.mmj.dk>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hey all,

Just discovered that bouncehandling is broken in 0.5.1 since it's not
using the new subscribers.d functionality but the old subscribers file.

Here's a patch to correct it. The patch also includes functionality to
handle bouncing sub/unsub requests.

It's tested against 0.5.1 and it works here:

diff -urp mlmmj-0.5.1.old/src/mlmmj-bounce.c mlmmj-0.5.1/src/mlmmj-bounce.c
--- mlmmj-0.5.1.old/src/mlmmj-bounce.c	2004-04-27 22:11:59.000000000 +0200
+++ mlmmj-0.5.1/src/mlmmj-bounce.c	2004-05-24 15:28:45.000000000 +0200
@@ -15,6 +15,7 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <time.h>
+#include <dirent.h>
 
 #include "mlmmj.h"
 #include "strgen.h"
@@ -32,13 +33,15 @@ static void print_help(const char *prg)
 
 int main(int argc, char **argv)
 {
-	int opt, noprocess = 0;
+	int opt, subread, noprocess = 0;
 	char *listdir = NULL, *address = NULL, *number = NULL;
-	char *filename, *bfilename, *a, *buf;
+	char *subreadname, *bfilename, *a, *buf, *subddirname;
 	size_t len;
 	int fd;
 	time_t t;
 	off_t suboff;
+	DIR *subddir;
+	struct dirent *dp;
 
 	log_set_name(argv[0]);
 
@@ -73,33 +76,81 @@ int main(int argc, char **argv)
 #if 0
 	log_error(LOG_ARGS, "[%s] [%s] [%s]", listdir, address, number);
 #endif
+
+	/* check if it's sub/unsub requests bouncing, and in that case
+	 * simply remove the confirmation file. Variablenames address and
+	 * number are a bit misleading in this case due to the different
+	 * construction of the sub/unsub confirmation From header.
+	 */
+	if(strncmp(address, "confsub-", 8) = 0) {
+		a = concatstr(5, listdir, "/subconf/", address + 8, "-",
+				number);
+		unlink(a);
+		free(a);
+		exit(EXIT_SUCCESS);
+	}
+	if(strncmp(address, "confunsub-", 10) = 0) {
+		a = concatstr(5, listdir, "/unsubconf/", address + 10, "-",
+				number);
+		unlink(a);
+		free(a);
+		exit(EXIT_SUCCESS);
+	}
+	
 	/* save the filename with '=' before replacing it with '@' */
 	bfilename = concatstr(3, listdir, "/bounce/", address);
 
 	a = strchr(address, '=');
-	if (!a) exit(EXIT_SUCCESS);  /* ignore malformed address */
+	if (!a)
+		exit(EXIT_SUCCESS);  /* ignore malformed address */
 	*a = '@';
 
 	/* make sure it's a subscribed address */
-	filename = concatstr(2, listdir, "/subscribers");
-	if ((fd = open(filename, O_RDONLY)) < 0) {
-		log_error(LOG_ARGS, "Could not open '%s'", filename);
-		free(filename); free(bfilename);
+	subddirname = concatstr(2, listdir, "/subscribers.d/");
+	if((subddir = opendir(subddirname)) = NULL) {
+		log_error(LOG_ARGS, "Could not opendir(%s)",
+				    subddirname);
+		free(subddirname);
 		exit(EXIT_FAILURE);
 	}
-	suboff = find_subscriber(fd, address);
+	free(subddirname);
+	while((dp = readdir(subddir)) != NULL) {
+		if(!strcmp(dp->d_name, "."))
+			continue;
+		if(!strcmp(dp->d_name, ".."))
+			continue;
+		subreadname = concatstr(3, listdir, "/subscribers.d/",
+				dp->d_name);
+
+		subread = open(subreadname, O_RDONLY);
+		if(subread = -1) {
+			log_error(LOG_ARGS, "Could not open '%s'",
+					subreadname);
+			free(subreadname);
+			continue;
+		}
+
+		suboff = find_subscriber(subread, address);
+		close(subread);
+		free(subreadname);
+
+		if(suboff = -1)
+			continue;
+		else
+			break;
+	}
+	closedir(subddir);
+
 	if(suboff = -1) {
-		free(filename); free(bfilename);
+		free(bfilename);
 		exit(EXIT_SUCCESS); /* Not subbed, so exit silently */
 	}
 
-	free(filename);
-
 	/* TODO make sure the file we open below is not a symlink */
 	if ((fd = open(bfilename, O_WRONLY|O_APPEND|O_CREAT,
 			S_IRUSR|S_IWUSR)) < 0) {
 		log_error(LOG_ARGS, "Could not open '%s'", bfilename);
-		free(filename); free(bfilename);
+		free(bfilename);
 		exit(EXIT_FAILURE);
 	}
 	free(bfilename);

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
