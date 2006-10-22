From: Benoit DOLEZ <bdolez@ant-computing.com>
Date: Sun, 22 Oct 2006 17:44:34 +0000
Subject: SIGSEGV in resolving hostname
Message-Id: <453BAE02.7030501@ant-computing.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=_azote-27627-1161539075-0001-2"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_azote-27627-1161539075-0001-2
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

When there is not reverse for the hostname, the gethostbyname return 
NULL. There is no check of the return value in the function 
hostnamestr() (strgen:144). Because of the SIGSEGV generated, the normal 
might not working.

Here you can find a patch, the hostname is used in the HELO part. It 
might be interesting to specify the hostname in the config, for the 
moment, I had a patch that use the non reversed hostname if the 
hostnamestr return NULL.

Under Slakware, the hostname command return the first part of the FQDN 
hostname.

Benoit

-- 
Benoit DOLEZ
GSM: +33 6 21 05 91 69                mailto:bdolez@ant-computing.com

--=_azote-27627-1161539075-0001-2
Content-Type: text/x-patch; name="mlmmj-hostname-no-reverse.patch"; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mlmmj-hostname-no-reverse.patch"

diff -r -u mlmmj-1.2.12-RC4/src/mlmmj-send.c mlmmj-1.2.12-RC4-flx0.1/src/mlmmj-send.c
--- mlmmj-1.2.12-RC4/src/mlmmj-send.c	2006-06-21 23:50:48.000000000 +0200
+++ mlmmj-1.2.12-RC4-flx0.1/src/mlmmj-send.c	2006-10-22 19:23:19.000000000 +0200
@@ -326,7 +326,19 @@
 	int retval = 0;
 	char *reply = NULL;
 	char *myhostname = hostnamestr();
-	
+
+        if (!myhostname) {
+              char tmp[256];
+              if (gethostname(tmp, 256) != 0) {
+                   perror("FATAL: gethostname()");
+                   exit(1);
+              }
+              if (!(myhostname = mystrdup(tmp))) {
+                   perror("FATAL: mystrdup()");
+                   exit(1);
+              }
+        }      
+
 	init_sockfd(sockfd, relayhost, port);
 	
 	if((reply = checkwait_smtpreply(*sockfd, MLMMJ_CONNECT)) != NULL) {
diff -r -u mlmmj-1.2.12-RC4/src/strgen.c mlmmj-1.2.12-RC4-flx0.1/src/strgen.c
--- mlmmj-1.2.12-RC4/src/strgen.c	2006-09-03 14:11:14.000000000 +0200
+++ mlmmj-1.2.12-RC4-flx0.1/src/strgen.c	2006-10-22 19:16:08.000000000 +0200
@@ -144,7 +144,7 @@
         hostname[sizeof(hostname)-1] = '\0';
         hostlookup = gethostbyname(hostname);
 
-        return mystrdup(hostlookup->h_name);
+        return (hostlookup ? mystrdup(hostlookup->h_name) : NULL);
 }
 
 char *mydirname(const char *path)

--=_azote-27627-1161539075-0001-2--
