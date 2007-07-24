From: Alexander Kardailsky <kardailsky@gmail.com>
Date: Tue, 24 Jul 2007 18:13:01 +0000
Subject: Re: mlmmj bug with qmail+vpopmail
Message-Id: <337110112.20070724221301@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <1603698924.20070721141017@gmail.com>
In-Reply-To: <1603698924.20070721141017@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Dear Alexander,

Saturday, July 21, 2007, 2:10:17 PM, you wrote:

> Dear mlmmj,

>   Just installed the latest version of the mlmmj on freebsd 6.1 box
>   and tried to work with it. I created test list sw-test and
>   configured .qmail-sw-test and .qmail-sw-test-default files.
>   Subscription was ok. However, when I tried to send email to the list
>   I got the following error: 
>   listcontrol.c:740: Unknown command "test". Ignoring mail: Unknown error: 0
>   Anyone else has such problem?

    I think I fixed that problem. I've added one more check in
    mlmmj-process.c :

-  } else if(dtemails.emailcount >= 1) {
+  } else if(dtemails.emailcount >= 1 && strcmp(dtemails.emaillist[0], getlistaddr(listdir)) != 0) {
    /* parse the (first) Delivered-To: header */
    recipextra = recipient_extra(listdir, dtemails.emaillist[0]);
-  } else if(toemails.emailcount >= 1) {
+  } else if(toemails.emailcount >= 1 && strcmp(toemails.emaillist[0], getlistaddr(listdir)) != 0) {
    /* parse the (first) To: header */
    
   I think there is no needed recipextra in case mailing list
   name and To: or Delivered-To: addresses are equals.


-- 
Best regards,
 Alexander

