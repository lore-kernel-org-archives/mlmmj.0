From: "Magnus Naeslund(k)" <mag@kite.se>
Date: Mon, 07 Aug 2006 00:56:27 +0000
Subject: Delivered-to is causing me some problems
Message-Id: <44D68FBB.6030807@kite.se>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

mlmmj is scanning Delivered-to: headers and trying to match where there listname is by checking for the delimiter. 
This is causing me problems since I would like to be able to use one alias for all lists together with postfix.
I've patched mlmmj-make-ml to create /var/spool/mlmmj/list@domain directories, and i've created virtual aliases in postfix to send the list to one local user like this:

list@domain.com listmgr-list=domain.com

When a mail comes in i dispatch an mlmmj-recieve with the correct directory.
The problem then is that postfix adds a 

Delivered-to: listmgr-list=domain.com@mailserver.com

and this freaks mlmmj out since it can't establish that the mail was sent to the list or something like that.

I'm wondering if I'm going about this the wrong way, or if this is desired to be solved somehow.
I've created a proof of concept patch below that takes care of this problem, but I'm not sure if it is desirable.
One side effect of fixing this the "right" way would be that it could allow to have $delimiter characters in the listname.
For example I'm forced to use the - delimiter, and that might allow me to create a list that's called list-test@domain.

Well, guess I could always create lists that uses this alias system:

virtual_alias:
list@domain.com list_1

local_alias:
list_1: |mlmmj-recieve

but then i'd need two aliases for every list.

Regards,
Magnus

Un-optimal patch:

--- mlmmj-1.2.11-vanilla/src/mlmmj-process.c    2006-01-23 18:44:53.000000000 +0100
+++ mlmmj-1.2.11/src/mlmmj-process.c    2006-08-07 02:35:42.000000000 +0200
@@ -322,7 +322,7 @@
        char *randomstr = NULL, *mqueuename;
        char *mlmmjsend, *mlmmjsub, *mlmmjunsub, *mlmmjbounce;
        char *bindir, *subjectprefix, *discardname, *listaddr, *listdelim;
-       char *listfqdn, *listname, *fromaddr;
+       char *listfqdn, *listname, *listnameanddelim, *fromaddr;
        char *queuefilename, *recipextra, *owner = NULL;
        char *maildata[2] = { "posteraddr", NULL };
        struct stat st;
@@ -516,12 +516,20 @@
                whichto = NULL;

        listdelim = getlistdelim(listdir);
+       listaddr = getlistaddr(listdir);
+       listname = genlistname(listaddr);
+       listnameanddelim = concatstr(2, listname, listdelim);
+
        if(whichto && whichto->emaillist && whichto->emaillist[0]){
-               recipextra = strstr(whichto->emaillist[0], listdelim);
+               recipextra = strstr(whichto->emaillist[0], listnameanddelim);
                if (recipextra)
-                       recipextra += strlen(listdelim);
+                       recipextra += strlen(listnameanddelim);
        } else
                recipextra = NULL;
+
+       myfree(listnameanddelim);
+       myfree(listname);
+       myfree(listaddr);
        myfree(listdelim);

        if(recipextra) {
