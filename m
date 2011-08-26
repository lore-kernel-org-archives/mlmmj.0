From: Thomas Jarosch <thomas.jarosch@intra2net.com>
Date: Fri, 26 Aug 2011 08:40:02 +0000
Subject: [mlmmj] [patch] Fix various resouce leaks on error
Message-Id: <201108261040.02638.thomas.jarosch@intra2net.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_iv1VOklUOE7RZvr"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

--Boundary-00=_iv1VOklUOE7RZvr
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

attached patch fixes various resource leaks on error.
Found by code audit with "cppcheck".

Please consider for inclusion.

Cheers,
Thomas

--Boundary-00=_iv1VOklUOE7RZvr
Content-Type: text/x-patch;
  charset="UTF-8";
  name="mlmmj-fix-resource-leaks-on-error.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="mlmmj-fix-resource-leaks-on-error.patch"

Fix various resource leaks on error

Found by code audit with "cppcheck".

Signed-off-by: Thomas Jarosch <thomas.jarosch@intra2net.com>
diff -u -r -p mlmmj-1.2.17.1/contrib/recievestrip/mlmmj-recieve-strip.c mlmmj.patched/contrib/recievestrip/mlmmj-recieve-strip.c
--- mlmmj-1.2.17.1/contrib/recievestrip/mlmmj-recieve-strip.c	2010-08-24 13:27:02.000000000 +0200
+++ mlmmj.patched/contrib/recievestrip/mlmmj-recieve-strip.c	2011-08-26 10:31:01.000000000 +0200
@@ -464,6 +464,7 @@ int main(int argc, char **argv)
 	myfree(randomstr);
 	fd = open(infilename, O_RDWR|O_CREAT|O_EXCL, S_IRUSR|S_IWUSR);
 	while(fd < 0 && errno == EEXIST) {
+		close(fd);
 		myfree(infilename);
 		randomstr = random_str();
 		infilename = concatstr(3, listdir, "/incoming/", randomstr);
diff -u -r -p mlmmj-1.2.17.1/src/mlmmj-bounce.c mlmmj.patched/src/mlmmj-bounce.c
--- mlmmj-1.2.17.1/src/mlmmj-bounce.c	2010-08-24 13:27:04.000000000 +0200
+++ mlmmj.patched/src/mlmmj-bounce.c	2011-08-26 10:26:07.000000000 +0200
@@ -64,18 +64,20 @@ char *fetchindexes(const char *bouncefil
 	}
 
 	if(fstat(fd, &st) < 0) {
-		log_error(LOG_ARGS, "Could not open bounceindexfile %s",
+		log_error(LOG_ARGS, "Could not stat bounceindexfile %s",
 					bouncefile);
 	}
 
 	if(st.st_size == 0) {
 		log_error(LOG_ARGS, "Bounceindexfile %s is size 0",
 					bouncefile);
+		close(fd);
 		return NULL;
 	}
 
 	start = mmap(0, st.st_size, PROT_READ, MAP_SHARED, fd, 0);
 	if(start == MAP_FAILED) {
+		close(fd);
 		log_error(LOG_ARGS, "Could not mmap bounceindexfile");
 		return NULL;
 	}
diff -u -r -p mlmmj-1.2.17.1/src/mlmmj-list.c mlmmj.patched/src/mlmmj-list.c
--- mlmmj-1.2.17.1/src/mlmmj-list.c	2010-08-24 13:27:04.000000000 +0200
+++ mlmmj.patched/src/mlmmj-list.c	2011-08-26 10:33:14.000000000 +0200
@@ -59,24 +59,26 @@ int dumpcount(const char *filename, int 
 	char *start, *next, *cur;
 	struct stat st;
 	size_t len;
+	int ret = -1;
 	
 	if((fd = open(filename, O_RDONLY)) < 0)
-		return -1;
+		goto err_out;
 
 	if(stat(filename, &st) < 0)
-		return -1;
+		goto err_out;
 	
 	if(!S_ISREG(st.st_mode))
-		return -1;
+		goto err_out;
 	
 	/* Nobody there */
 	if(st.st_size == 0) {
-		return 0;
+		ret = 0;
+		goto err_out;
 	}
 
 	start = mmap(0, st.st_size, PROT_READ, MAP_SHARED, fd, 0);
 	if(start == MAP_FAILED)
-		return -1;
+		goto err_out;
 
 	for(next = cur = start; next < start + st.st_size; next++) {
 		if(*next == '\n' || next == start + st.st_size - 1) {
@@ -93,9 +95,11 @@ int dumpcount(const char *filename, int 
 		}
 	}
 	munmap(start, st.st_size);
-	close(fd);
+	ret = 0;
 
-	return 0;
+err_out:
+	close(fd);
+	return ret;
 }
 
 int main(int argc, char **argv)
diff -u -r -p mlmmj-1.2.17.1/src/mlmmj-maintd.c mlmmj.patched/src/mlmmj-maintd.c
--- mlmmj-1.2.17.1/src/mlmmj-maintd.c	2010-08-24 13:27:04.000000000 +0200
+++ mlmmj.patched/src/mlmmj-maintd.c	2011-08-26 10:22:22.000000000 +0200
@@ -618,6 +618,7 @@ int probe_bouncers(const char *listdir, 
 					"-p", (char *)NULL);
 			log_error(LOG_ARGS, "Could not execlp %s",
 						mlmmjbounce);
+			closedir(bouncedir);
 			return 1;
 		}
 	}
@@ -757,6 +758,7 @@ int unsub_bouncers(const char *listdir, 
 					"-a", address, (char *)NULL);
 			log_error(LOG_ARGS, "Could not execlp %s",
 						mlmmjunsub);
+			closedir(bouncedir);
 			return 1;
 		}
 	}
diff -u -r -p mlmmj-1.2.17.1/src/mlmmj-recieve.c mlmmj.patched/src/mlmmj-recieve.c
--- mlmmj-1.2.17.1/src/mlmmj-recieve.c	2010-08-24 13:27:04.000000000 +0200
+++ mlmmj.patched/src/mlmmj-recieve.c	2011-08-26 10:22:22.000000000 +0200
@@ -127,6 +127,7 @@ int main(int argc, char **argv)
 	myfree(randomstr);
 	fd = open(infilename, O_RDWR|O_CREAT|O_EXCL, S_IRUSR|S_IWUSR);
 	while(fd < 0 && errno == EEXIST) {
+		close(fd);
 		myfree(infilename);
 		randomstr = random_str();
 		infilename = concatstr(3, listdir, "/incoming/", randomstr);
diff -u -r -p mlmmj-1.2.17.1/src/mlmmj-sub.c mlmmj.patched/src/mlmmj-sub.c
--- mlmmj-1.2.17.1/src/mlmmj-sub.c	2010-08-24 13:32:20.000000000 +0200
+++ mlmmj.patched/src/mlmmj-sub.c	2011-08-26 10:22:22.000000000 +0200
@@ -84,6 +84,7 @@ void moderate_sub(const char *listdir, c
 
 	fd = open(modfilename, O_RDWR|O_CREAT|O_EXCL, S_IRUSR|S_IWUSR);
 	while(fd < 0 && errno == EEXIST) {
+		close(fd);
 		myfree(modfilename);
 		randomstr = random_str();
 		modfilename = concatstr(3, listdir, "/moderation/subscribe",

--Boundary-00=_iv1VOklUOE7RZvr--

