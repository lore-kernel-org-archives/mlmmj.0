From: Neale Pickett <neale@woozle.org>
Date: Mon, 10 Oct 2005 19:31:26 +0000
Subject: Re: [CFT] mlmmj-1.2.9-RC1
Message-Id: <200510101331.26538.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <20051009151204.GB17022@mmj.dk>
In-Reply-To: <20051009151204.GB17022@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Here's a little thing I found, which I guess could cause segfaults in 
low-memory situations:

--- old-mlmmj-1/src/strgen.c    2005-10-10 13:30:29.565420691 -0600
+++ new-mlmmj-1/src/strgen.c    2005-10-10 10:50:22.000000000 -0600
@@ -245,7 +245,7 @@
        const char *weekday = NULL, *month = NULL;

        /* 6 + 26 + ' ' + timezone which is 5 + '\n\0' = 40 */
-       timestr = (char *)malloc(40);
+       timestr = (char *)mymalloc(40);
        t = time(NULL);

        localtime_r(&t, &lttm);
