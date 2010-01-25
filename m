From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 25 Jan 2010 11:02:45 +0000
Subject: PATCH: Access priority
Message-Id: <4B5D7A55.4090302@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090503060708050009040603"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------090503060708050009040603
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This patch fixes something that I got bitten by last week, and since I spotted the 
place in the code while I was working on the other stuff, I did this too! It 
applies over 1.2.17.

The problem is that if you have a list that is 'moderated' or 'modnonsubposts', 
the 'allow' access keyword is ineffective, but behaves like 'moderate'. This patch 
fixes that so that access rules have priority, and do what they say.

I think this is more intuitive.

Do others agree? Or could this change cause problems? If not, or the perceived 
problems are minor enough, could this be included in mlmmj?

I have tested it, and it works for me.

Ben.


--------------090503060708050009040603
Content-Type: text/x-patch;
 name="mlmmj-access.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-access.patch"

diff -ru mlmmj-1.2.17/src/mlmmj-process.c mlmmj-1.2.17-mod/src/mlmmj-process.c
--- mlmmj-1.2.17/src/mlmmj-process.c	2010-01-11 00:40:57.000000000 +1100
+++ mlmmj-1.2.17-mod/src/mlmmj-process.c	2010-01-25 02:23:23.000000000 +1100
@@ -851,6 +852,9 @@
 	}
 
 startaccess:
+	if(!moderated)
+		moderated = statctrl(listdir, "moderated");
+
 	noaccessdenymails = statctrl(listdir, "noaccessdenymails");
 
 	access_rules = ctrlvalues(listdir, "access");
@@ -917,11 +921,11 @@
 			myfree(donemailname);
 			myfree(discardname);
                 	exit(EXIT_SUCCESS);
+		} else if (accret == ALLOW) {
+			moderated = 0;
 		}
 	}
 
-	if(!moderated)
-		moderated = statctrl(listdir, "moderated");
 	if(moderated) {
 		mqueuename = concatstr(3, listdir, "/moderation/",
 				       randomstr);

--------------090503060708050009040603--


