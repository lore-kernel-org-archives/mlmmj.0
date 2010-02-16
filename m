From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Tue, 16 Feb 2010 06:15:54 +0000
Subject: Re: PATCH: Memory leak appending original mail
Message-Id: <1266300954.9646.67.camel@mopo-laptop>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-tFartbFgwsQ7aViTtYb7"
List-Id: <mlmmj.mlmmj.org>
References: <4B5EBDA6.7070501@yahoo.com.au>
In-Reply-To: <4B5EBDA6.7070501@yahoo.com.au>
To: mlmmj@mlmmj.org


--=-tFartbFgwsQ7aViTtYb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-02-03 at 15:02 +1100, Ben Schmidt wrote:
> How tremendously embarrassing...
> 
> Note to self: The correct way to fix a memory leak is not to introduce
> a double free.

True :-)

> Revised patch attached.

I looked at the code, and got thinking. Since the loop is only entered
if str is not NULL, and str is only used inside the loop, couldn't we
just free str inside the loop?

Proposed patch attached.

Morten

-- 
Morten Shearman Kirkegaard <moki@fabletech.com>
CTO, FableTech
http://fabletech.com/

--=-tFartbFgwsQ7aViTtYb7
Content-Disposition: attachment; filename="patch-mlmmj-1.2.17-origmail.diff"
Content-Type: text/x-patch; name="patch-mlmmj-1.2.17-origmail.diff"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Index: src/prepstdreply.c
===================================================================
RCS file: /home/mmj/MMJCVS/mlmmj/src/prepstdreply.c,v
retrieving revision 1.28
diff -u -r1.28 prepstdreply.c
--- src/prepstdreply.c	5 Nov 2007 21:23:37 -0000	1.28
+++ src/prepstdreply.c	16 Feb 2010 06:13:27 -0000
@@ -145,10 +145,9 @@
 				value = concatstr(3, value, " ", str);
 				if(tmp)
 					myfree(tmp);
+				myfree(str);
 				count++;
 			}
-			if(str)
-				myfree(str);
 			close(mailfd);
 		}else{
 			log_error(LOG_ARGS, "Could not substitute $originalmail$ (mailname == %s)",mailname);

--=-tFartbFgwsQ7aViTtYb7--


