From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Wed, 03 Feb 2010 04:02:09 +0000
Subject: Re: PATCH: Memory leak appending original mail
Message-Id: <4B68F541.9090009@yahoo.com.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020302060404090101050108"
List-Id: <mlmmj.mlmmj.org>
References: <4B5EBDA6.7070501@yahoo.com.au>
In-Reply-To: <4B5EBDA6.7070501@yahoo.com.au>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------020302060404090101050108
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

How tremendously embarrassing...

Note to self: The correct way to fix a memory leak is not to introduce a double free.

Revised patch attached.

Ben.



On 26/01/10 9:02 PM, Ben Schmidt wrote:
> I found a memory leak. Patch attached.
> Ben.
>

--------------020302060404090101050108
Content-Type: text/x-patch;
 name="mlmmj-origmail-memleak.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mlmmj-origmail-memleak.patch"

diff -r f48f18a405ee src/prepstdreply.c
--- a/src/prepstdreply.c	Wed Feb 03 14:57:37 2010 +1100
+++ b/src/prepstdreply.c	Wed Feb 03 14:59:45 2010 +1100
@@ -145,6 +145,8 @@
 				value = concatstr(3, value, " ", str);
 				if(tmp)
 					myfree(tmp);
+				myfree(str);
+				str = NULL;
 				count++;
 			}
 			if(str)

--------------020302060404090101050108--


