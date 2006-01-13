From: Thomas Goirand <thomas@goirand.fr>
Date: Fri, 13 Jan 2006 13:40:32 +0000
Subject: Re: Is anyone using mlmmj with qmail?
Message-Id: <43C7ADD0.3020000@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601112014230.3643@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601112014230.3643@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org



Mads Martin Joergensen wrote:

>I'll gladly try to help. Can you show is the delivery from the logs, and
>one of the mails not getting through.
>  
>
I'm glad you are glad! :)

Jan 13 13:33:12 xen010503 qmail: 1137159192.427929 new msg 557233
Jan 13 13:33:12 xen010503 qmail: 1137159192.427973 info msg 557233: 
bytes 599 from <thomas@goirand.fr> qp 18561 uid 64011
Jan 13 13:33:12 xen010503 qmail: 1137159192.508078 starting delivery 1: 
msg 557233 to local 
xen010503-gplhost-com-test-subscribe@xen010503.gplhost.com
Jan 13 13:33:12 xen010503 qmail: 1137159192.508432 status: local 1/10 
remote 0/20
Jan 13 13:33:12 xen010503 qmail: 1137159192.881010 delivery 1: success: 
did_0+0+1/
Jan 13 13:33:12 xen010503 qmail: 1137159192.881048 status: local 0/10 
remote 0/20
Jan 13 13:33:12 xen010503 qmail: 1137159192.881414 end msg 557233

Here is the log. As you can see, it's doing the delivery correctly. The 
problem is that it seems it's not sending it to mlmmj-recieve. My 
.qmail-default contains the following:

|preline -f /usr/bin/mlmmj-recieve -L 
/var/spool/mlmmj/xen010503.gplhost.com_test -F

What is strange, is that when I just type "preline -f 
/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/xen010503.gplhost.com_test" 
on the command line, it says "preline: usage: preline cmd [ arg ... ]" 
so it seems to be wrong.

>Is it ending up in discarded/ directory?
>  
>
Where is that folder supposed to be? If it's supposed to be in the list 
folder, then mlmmj-make-ml didn't make it.

Would you like to login in my test server and have a try? If you do, I 
can give you the root (it's a xen VPS I use only for my internal tests).

Regards,

    Thomas Goirand


