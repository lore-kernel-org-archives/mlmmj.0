From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 08 Feb 2005 16:22:28 +0000
Subject: Re: mlmmj-1.2.3 released. Features added and bugs squashed.
Message-Id: <20050208162228.GG67839@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20050208095412.GE56543@mmj.dk>
In-Reply-To: <20050208095412.GE56543@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Mads Martin Joergensen <mmj@mmj.dk> [Feb 08. 2005 17:20]:
> > > I would like to request a feature. It's been on my wishlist for quite
> > > some time; I would like the port of the outgoing relay server to be
> > > configurable (just changing init_socket.c works i know).
> > 
> > Allan, could you try this patch. It'll make the port configurable with
> > LISTDIR/control/smtpport.
> 
> No, wait, there's a bit missing.

Now it also defaults to 25 ;-))

--- include/init_sockfd.h
+++ include/init_sockfd.h
@@ -24,6 +24,6 @@
 #ifndef INIT_SOCKFD_H
 #define INIT_SOCKFD_H
 
-void init_sockfd(int *sockfd, const char *relayhost);
+void init_sockfd(int *sockfd, const char *relayhost, unsigned short port);
 
 #endif /* INIT_SOCKFD_H */
--- include/mlmmj-send.h	16 Jan 2005 18:43:48 -0000	1.10
+++ include/mlmmj-send.h	8 Feb 2005 16:21:10 -0000
@@ -45,7 +45,7 @@
 		   size_t mailsize, const char *from, const char *listdir,
 		   const char *hdrs, size_t hdrslen, const char *body,
 		   size_t bodylen, const char *extra);
-int initsmtp(int *sockfd, const char *relayhost);
+int initsmtp(int *sockfd, const char *relayhost, unsigned short port);
 int endsmtp(int *sockfd);
 
 #endif /* MMJML_SEND_H */
--- src/init_sockfd.c
+++ src/init_sockfd.c
@@ -32,11 +32,10 @@
 #include "init_sockfd.h"
 #include "log_error.h"
 
-void init_sockfd(int *sockfd, const char *relayhost)
+void init_sockfd(int *sockfd, const char *relayhost, unsigned short port)
 {
 	int len;
 	struct sockaddr_in addr;
-	u_short port = 25;
 
 	if (getenv("MLMMJ_TESTING")) {
 		relayhost = "127.0.0.1";
--- src/mlmmj-send.c
+++ src/mlmmj-send.c
@@ -290,13 +290,13 @@
 	return 0;
 }
 
-int initsmtp(int *sockfd, const char *relayhost)
+int initsmtp(int *sockfd, const char *relayhost, unsigned short port)
 {
 	int retval = 0;
 	char *reply = NULL;
 	char *myhostname = hostnamestr();
 	
-	init_sockfd(sockfd, relayhost);
+	init_sockfd(sockfd, relayhost, port);
 	
 	if((reply = checkwait_smtpreply(*sockfd, MLMMJ_CONNECT)) != NULL) {
 		log_error(LOG_ARGS, "No proper greeting to our connect"
@@ -600,7 +600,7 @@
 	char *mlmmjbounce = NULL, *bindir, *mailmap, *probefile, *a;
 	char *body = NULL, *hdrs = NULL, *memmailsizestr = NULL, *verp = NULL;
 	char relay[16], *listname, *listfqdn, *verpfrom, *maxverprecipsstr;
-	char strindex[32], *reply;
+	char strindex[32], *reply, *strport;
 	ssize_t memmailsize = 0;
 	DIR *subddir;
 	struct dirent *dp;
@@ -608,6 +608,7 @@
 	struct hostent *relayent;
 	uid_t uid;
 	struct strlist stl;
+	unsigned short smtpport = 25;
 
 	CHECKFULLPATH(argv[0]);
 	
@@ -863,11 +864,14 @@
 				strncpy(relay, RELAYHOST, sizeof(relay));
 		}
 	}
+	strport = ctrlvalue(listdir, "smtpport");
+	if(strport)
+		smtpport = (unsigned short)atol(strport);
 
 	switch(listctrl[0]) {
 	case '1': /* A single mail is to be sent */
 	case '6':
-		initsmtp(&sockfd, relay);
+		initsmtp(&sockfd, relay, smtpport);
 		sendres = send_mail(sockfd, bounceaddr, to_addr, replyto,
 				mailmap, st.st_size, listdir, NULL,
 				hdrs, hdrslen, body, bodylen);
@@ -910,7 +914,7 @@
 		}
 		break;
 	case '2': /* Moderators */
-		initsmtp(&sockfd, relay);
+		initsmtp(&sockfd, relay, smtpport);
 		if(send_mail_many_fd(sockfd, bounceaddr, NULL, mailmap,
 				     st.st_size, subfd, NULL, NULL, listdir,
 				     NULL, hdrs, hdrslen, body, bodylen))
@@ -919,7 +923,7 @@
 			endsmtp(&sockfd);
 		break;
 	case '3': /* resending earlier failed mails */
-		initsmtp(&sockfd, relay);
+		initsmtp(&sockfd, relay, smtpport);
 		if(send_mail_many_fd(sockfd, NULL, NULL, mailmap, st.st_size,
 				subfd, listaddr, mailfilename, listdir,
 				mlmmjbounce, hdrs, hdrslen, body, bodylen))
@@ -929,7 +933,7 @@
 		unlink(subfilename);
 		break;
 	case '4': /* send mails to owner */
-		initsmtp(&sockfd, relay);
+		initsmtp(&sockfd, relay, smtpport);
 		if(send_mail_many_fd(sockfd, bounceaddr, NULL, mailmap,
 				st.st_size, subfd, listaddr, mailfilename,
 				listdir, mlmmjbounce, hdrs, hdrslen, body,
@@ -939,7 +943,7 @@
 			endsmtp(&sockfd);
 		break;
 	case '5': /* bounceprobe - handle relayhost local users bouncing*/
-		initsmtp(&sockfd, relay);
+		initsmtp(&sockfd, relay, smtpport);
 		sendres = send_mail(sockfd, bounceaddr, to_addr, replyto,
 				mailmap, st.st_size, listdir, NULL,
 				hdrs, hdrslen, body, bodylen);
@@ -999,7 +1003,7 @@
 		}
 		
 		if(verp) {
-			initsmtp(&sockfd, relay);
+			initsmtp(&sockfd, relay, smtpport);
 			if(write_mail_from(sockfd, verpfrom, verp)) {
 				log_error(LOG_ARGS,
 						"Could not write MAIL FROM\n");
@@ -1034,7 +1038,7 @@
 				res = getaddrsfromfd(&stl, subfd,
 						maxverprecips);
 				if(stl.count = maxverprecips) {
-					initsmtp(&sockfd, relay);
+					initsmtp(&sockfd, relay, smtpport);
 					if(verp) {
 						sendres = send_mail_verp(
 								sockfd, &stl,
@@ -1072,7 +1076,7 @@
 
 		}
 		if(stl.count) {
-			initsmtp(&sockfd, relay);
+			initsmtp(&sockfd, relay, smtpport);
 			if(verp) {
 				sendres = send_mail_verp(sockfd, &stl, mailmap,
 						st.st_size, verpfrom, listdir,

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
