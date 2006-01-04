From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 04 Jan 2006 19:30:56 +0000
Subject: Re: mlmlmj control files
Message-Id: <20060104193055.GB72159@mmj.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3V7upXqbjpZ4EhLz"
List-Id: <mlmmj.mlmmj.org>
References: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
In-Reply-To: <33221.80.166.75.19.1136194203.squirrel@mail.junc.org>
To: mlmmj@mlmmj.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Mads Martin Joergensen <mmj@mmj.dk> [Jan 02. 2006 17:49]:
> Relayhost has the same problem, and I really should fix it tomorrow on
> my last vacation day--it's a pretty ridiculous and annoying bug.
> 
> Problem is that in the case of administrative mails, there was no need
> to pass a list directory to mlmmj-send, and thus does there two files
> not get read.

So it wasn't tomorrow, but the day after tomorrow :-)

Please test--I might have forgotten a place.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="smtpport-relayhost.diff"

--- ChangeLog	4 Jan 2006 19:10:36 -0000	1.144
+++ ChangeLog	4 Jan 2006 19:26:53 -0000
@@ -1,3 +1,5 @@
+ o Make non list emails (subconf, moderation etc.) also honor relayhost
+   and smtpport
  o Add tunable to be able to close for subscription only (closedlistsub)
 1.2.9
  o Make find_email_adr() more robust (BSD, Neale Pickett)
--- src/mlmmj-maintd.c	20 Jun 2005 13:23:55 -0000	1.55
+++ src/mlmmj-maintd.c	4 Jan 2006 19:26:53 -0000
@@ -335,6 +335,7 @@
 			if(repto) {
 				execlp(mlmmjsend, mlmmjsend,
 						"-l", "1",
+						"-L", listdir,
 						"-m", mailname,
 						"-F", from,
 						"-T", to,
@@ -343,6 +344,7 @@
 			} else {
 				execlp(mlmmjsend, mlmmjsend,
 						"-l", "1",
+						"-L", listdir,
 						"-m", mailname,
 						"-F", from,
 						"-T", to,
--- src/mlmmj-process.c	15 Nov 2005 21:46:52 -0000	1.70
+++ src/mlmmj-process.c	4 Jan 2006 19:26:53 -0000
@@ -562,6 +562,7 @@
 					efromemails.emaillist[0]);
 			execlp(mlmmjsend, mlmmjsend,
 					"-l", "4",
+					"-L", listdir,
 					"-F", efromemails.emaillist[0],
 					"-s", owner,
 					"-a",
@@ -666,6 +667,7 @@
 		myfree(donemailname);
 		execlp(mlmmjsend, mlmmjsend,
 				"-l", "1",
+				"-L", listdir,
 				"-T", fromemails.emaillist[0],
 				"-F", fromaddr,
 				"-m", queuefilename, (char *)NULL);
@@ -755,6 +757,7 @@
 			myfree(randomstr);
 			execlp(mlmmjsend, mlmmjsend,
 					"-l", "1",
+					"-L", listdir,
 					"-T", fromemails.emaillist[0],
 					"-F", fromaddr,
 					"-m", queuefilename, (char *)NULL);
--- src/mlmmj-sub.c	9 Oct 2005 14:17:52 -0000	1.44
+++ src/mlmmj-sub.c	4 Jan 2006 19:26:53 -0000
@@ -81,6 +81,7 @@
 
 	execlp(mlmmjsend, mlmmjsend,
 				"-l", "1",
+				"-L", listdir,
 				"-T", subaddr,
 				"-F", fromaddr,
 				"-m", queuefilename, (char *)NULL);
@@ -127,6 +128,7 @@
 	myfree(maildata[1]);
 	execlp(mlmmjsend, mlmmjsend,
 			"-l", "1",
+			"-L", listdir,
 			"-T", tostr,
 			"-F", fromaddr,
 			"-m", queuefilename, (char *)NULL);
@@ -217,6 +219,7 @@
 
 	execlp(mlmmjsend, mlmmjsend,
 				"-l", "1",
+				"-L", listdir,
 				"-T", subaddr,
 				"-F", fromaddr,
 				"-m", queuefilename, (char *)NULL);
@@ -266,6 +269,7 @@
 	
 	execlp(mlmmjsend, mlmmjsend,
 				"-l", "1",
+				"-L", listdir,
 				"-T", subaddr,
 				"-F", fromaddr,
 				"-m", queuefilename, (char *)NULL);
--- src/mlmmj-unsub.c	9 Oct 2005 14:17:52 -0000	1.41
+++ src/mlmmj-unsub.c	4 Jan 2006 19:26:53 -0000
@@ -81,6 +81,7 @@
 
 	execlp(mlmmjsend, mlmmjsend,
 				"-l", "1",
+				"-L", listdir,
 				"-T", subaddr,
 				"-F", fromaddr,
 				"-m", queuefilename, (char *)NULL);
@@ -129,6 +130,7 @@
 
 	execlp(mlmmjsend, mlmmjsend,
 			"-l", "1",
+			"-L", listdir,
 			"-T", tostr,
 			"-F", fromaddr,
 			"-m", queuefilename, (char *)NULL);
@@ -220,6 +222,7 @@
 
 	execlp(mlmmjsend, mlmmjsend,
 				"-l", "1",
+				"-L", listdir,
 				"-T", subaddr,
 				"-F", fromaddr,
 				"-m", queuefilename, (char *)NULL);
@@ -310,6 +313,7 @@
 
 	execlp(mlmmjsend, mlmmjsend,
 				"-l", "1",
+				"-L", listdir,
 				"-T", subaddr,
 				"-F", fromaddr,
 				"-m", queuefilename, (char *)NULL);
--- src/send_help.c	9 Oct 2005 14:17:52 -0000	1.18
+++ src/send_help.c	4 Jan 2006 19:26:53 -0000
@@ -69,6 +69,7 @@
 
 	execlp(mlmmjsend, mlmmjsend,
 				"-l", "1",
+				"-L", listdir,
 				"-T", emailaddr,
 				"-F", fromaddr,
 				"-m", queuefilename, (char *)NULL);
--- src/send_list.c	9 Oct 2005 14:17:52 -0000	1.4
+++ src/send_list.c	4 Jan 2006 19:26:53 -0000
@@ -115,6 +115,7 @@
 
 	execlp(mlmmjsend, mlmmjsend,
 				"-l", "1",
+				"-L", listdir,
 				"-T", emailaddr,
 				"-F", fromaddr,
 				"-m", queuefilename, (char *)NULL);

--3V7upXqbjpZ4EhLz--
