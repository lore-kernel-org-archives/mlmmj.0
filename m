From: "Magnus Naeslund(k)" <mag@kite.se>
Date: Mon, 07 Aug 2006 03:49:14 +0000
Subject: Bug in subscriber searching function is_subbed_in()
Message-Id: <44D6B83A.6030701@kite.se>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I found out that the subscribercode searches the subscriber directory 
and tries to mmap the lockfile it created earlier which size is zero,
hence the logentry:

/usr/bin/mlmmj-sub[25209]: subscriberfuncs.c:61: Could not mmap fd: Invalid argument

I modified the code to skip ALL files that starts with a dot, that
takes care if . and .. directories aswell as the .$file.lock files.

Is this patch acceptable?

Regards,
Magnus


--- mlmmj-1.2.11-vanilla/src/subscriberfuncs.c  2005-02-14 23:59:24.000000000 +0100
+++ mlmmj-1.2.11/src/subscriberfuncs.c  2006-08-07 05:42:49.000000000 +0200
@@ -101,9 +101,8 @@
        }

        while((dp = readdir(subddir)) != NULL) {
-               if(!strcmp(dp->d_name, "."))
-                       continue;
-               if(!strcmp(dp->d_name, ".."))
+                /* Skip "." ".." and ".*.lock" files */
+               if(dp->d_name[0] = '.')
                        continue;

                subreadname = concatstr(2, subddirname, dp->d_name);
