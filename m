From: Neale Pickett <neale@woozle.org>
Date: Mon, 26 Sep 2005 01:01:16 +0000
Subject: case-insensitive list names patch
Message-Id: <4337485C.3080707@woozle.org>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

This patch makes the names of the lists case-insensitive.  I suspect 
most mail servers ignore case in mail addresses, so this might not be an 
unreasonable default.

--- src/mlmmj-process.c~        2005-09-19 22:03:01.000000000 -0600
+++ src/mlmmj-process.c 2005-09-24 09:37:06.000000000 -0600
@@ -612,7 +612,7 @@
                for(i = 0; i < toemails.emailcount; i++) {
                        for(j = 0; j < alternates->count; j++) {
                                chomp(alternates->strs[j]);
-                               if(strcmp(alternates->strs[j],
+                               if(strcasecmp(alternates->strs[j],
                                        toemails.emaillist[i]) = 0)
                                        intocc = 1;
                        }
@@ -620,7 +620,7 @@
                for(i = 0; i < ccemails.emailcount; i++) {
                        for(j = 0; j < alternates->count; j++) {
                                chomp(alternates->strs[j]);
-                               if(strcmp(alternates->strs[j],
+                               if(strcasecmp(alternates->strs[j],
                                        ccemails.emaillist[i]) = 0)
                                        intocc = 1;
                        }


