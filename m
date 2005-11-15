From: Neale Pickett <neale@woozle.org>
Date: Tue, 15 Nov 2005 21:36:01 +0000
Subject: Re: case sensitivity of email addresses
Message-Id: <200511151436.01887.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <200511150837.22197.neale@woozle.org>
In-Reply-To: <200511150837.22197.neale@woozle.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday 15 November 2005 02:26 pm, Mads Martin Joergensen wrote:
>
> We want mlmmj to be case insensitive. We're not doing RFC2821--that's
> supposed to be handled by the smtpd delivering to mlmmj.
>
> Anyone have a patch, just for this?

I think this will do the most important bit.  Patch against RC1.


--- mlmmj-process.c~    2005-10-09 08:17:52.000000000 -0600
+++ mlmmj-process.c     2005-11-15 14:34:49.000000000 -0700
@@ -619,7 +619,7 @@
                for(i = 0; i < toemails.emailcount; i++) {
                        for(j = 0; j < alternates->count; j++) {
                                chomp(alternates->strs[j]);
-                               if(strcmp(alternates->strs[j],
+                               if(strcasecmp(alternates->strs[j],
                                        toemails.emaillist[i]) = 0)
                                        intocc = 1;
                        }
@@ -627,7 +627,7 @@
                for(i = 0; i < ccemails.emailcount; i++) {
                        for(j = 0; j < alternates->count; j++) {
                                chomp(alternates->strs[j]);
-                               if(strcmp(alternates->strs[j],
+                               if(strcasecmp(alternates->strs[j],
                                        ccemails.emaillist[i]) = 0)
                                        intocc = 1;
                        }

