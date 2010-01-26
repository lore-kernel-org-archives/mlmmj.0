From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Tue, 26 Jan 2010 10:02:14 +0000
Subject: PATCH: Memory leak appending original mail
Message-Id: <4B5EBDA6.7070501@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020909010006070003000907"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------020909010006070003000907
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I found a memory leak. Patch attached.
Ben.


--------------020909010006070003000907
Content-Type: text/x-patch;
 name="mlmmj-origmail-memleak.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-origmail-memleak.patch"

diff -r 99ec9f826d35 src/prepstdreply.c
--- a/src/prepstdreply.c	Tue Jan 26 18:25:03 2010 +1100
+++ b/src/prepstdreply.c	Tue Jan 26 20:54:10 2010 +1100
@@ -145,6 +145,7 @@
 				value = concatstr(3, value, " ", str);
 				if(tmp)
 					myfree(tmp);
+				myfree(str);
 				count++;
 			}
 			if(str)

--------------020909010006070003000907--


