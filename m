From: Jakob Hirsch <jh@plonk.de>
Date: Fri, 13 May 2005 17:53:56 +0000
Subject: incorrect Date header
Message-Id: <4284E9B4.9020406@plonk.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090608070008050703020107"
List-Id: <mlmmj.mlmmj.org>
To: mlmmj@mlmmj.org

This is a multi-part message in MIME format.
--------------090608070008050703020107
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

mlmmj's Date header is possibly not RFC2822 compliant (discovered by 
spamassassin, not by me). The attached patch fixes this.

--------------090608070008050703020107
Content-Type: text/plain;
 name="mlmmj-date.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mlmmj-date.diff"

--- strgen.c	2005-05-13 19:32:46.000000000 +0200
+++ strgen.c	2005-05-13 19:37:43.000000000 +0200
@@ -246,7 +246,6 @@

 	/* 6 + 26 + ' ' + timezone which is 5 + '\n\0' == 40 */
 	timestr = (char *)malloc(40);
-	strcpy(timestr, "Date: ");
 	t = time(NULL);

 	localtime_r(&t, &lttm);
@@ -311,7 +310,7 @@
 	}


-	snprintf(timestr, 40, "Date: %s, %02d %s %d %d:%d:%d %+05d\n",
+	snprintf(timestr, 40, "Date: %s, %02d %s %04d %02d:%02d:%02d %+05d\n",
 			weekday, lttm.tm_mday, month, lttm.tm_year + 1900,
 			lttm.tm_hour, lttm.tm_min, lttm.tm_sec, ((int)t)/36);


--------------090608070008050703020107--
