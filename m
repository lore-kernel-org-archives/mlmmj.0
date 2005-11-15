From: Neale Pickett <neale@woozle.org>
Date: Tue, 15 Nov 2005 19:59:12 +0000
Subject: Re: -bounces-help loops
Message-Id: <200511151259.12750.neale@woozle.org>
List-Id: <mlmmj.mlmmj.org>
References: <200511150843.46931.neale@woozle.org>
In-Reply-To: <200511150843.46931.neale@woozle.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Tuesday 15 November 2005 08:43 am, you wrote:
> So I have a couple of mail hosts stuck in a "-bounces-help loop".  They
> send mail to listname-bounces-help, which then replies with a message
> explaining options.  But that mail has a SMTP "mail from" of
> listname-bounces-help.  The remote mailer for whatever reason accepts the
> mail, then bounces it to the "mail from", and thus goes the loop.
>
> A solution to this would be to have -bounces-help mail (mail in response to
> a message to -bounces-help) come from some other address that doesn't
> respond. Maybe -bounce-loop.  I'll work on a patch for this, but maybe
> there's a better way?

Here's the patch against 1.2.9-RC1.  It will undoubtedly apply with some fuzz, 
as my tree is increasingly divergent from RC1.


Tue Nov 15 12:44:56 MST 2005  Neale Pickett <neale@woozle.org>
  * fix for -bounces-help loops
diff -rN -u old-mlmmj-darcs/src/mlmmj-process.c 
new-mlmmj-darcs/src/mlmmj-process.c
--- old-mlmmj-darcs/src/mlmmj-process.c 2005-11-15 12:50:45.000000000 -0700
+++ new-mlmmj-darcs/src/mlmmj-process.c 2005-11-15 12:42:30.000000000 -0700
@@ -546,6 +546,10 @@
        myfree(listdelim);

        if(recipextra) {
+                if (strncmp(recipextra, "bounce-loop@", 12) = 0) {
+                        /* Discard bounce loops */
+                        exit(0);
+                }
                owner = concatstr(2, listdir, "/control/owner");
                if(owner && strncmp(recipextra, "owner@", 6) = 0) {
                        /* strip envelope from before resending */
diff -rN -u old-mlmmj-darcs/src/send_help.c new-mlmmj-darcs/src/send_help.c
--- old-mlmmj-darcs/src/send_help.c     2005-11-15 12:50:45.000000000 -0700
+++ new-mlmmj-darcs/src/send_help.c     2005-11-15 12:40:45.000000000 -0700
@@ -53,7 +53,7 @@
        listname = genlistname(listaddr);
        listfqdn = genlistfqdn(listaddr);

-       fromaddr = concatstr(4, listname, listdelim, "bounces-help@", 
listfqdn);
+       fromaddr = concatstr(4, listname, listdelim, "bounce-loop@", 
listfqdn);
        myfree(listdelim);

        queuefilename = prepstdreply(listdir, "listhelp", "$listowner$",

