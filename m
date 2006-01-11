From: Thomas Goirand <thomas@goirand.fr>
Date: Wed, 11 Jan 2006 04:16:45 +0000
Subject: MLMMJ and qmail
Message-Id: <43C486AD.30501@goirand.fr>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi !

As said before, we got MLMMJ working with dtc (see 
http://www.gplhost.com/software-dtc.html). It now works perfectly with 
postfix, and I'm trying to make it work with qmail.

At my first tries, it seems there are serious right problems with the 
mlmmj binaries when running with qmail, and I still didn't make it work. 
Here is what I did, I hope somebody can help us to make it work 
automatically with DTC and qmail.

I don't use vpopmail. I think it's a stupid program that doesn't add 
anything to qmail. Qmail understand virtual domains out of the box, so 
vpopmail gives only an alternative auth, and there are plenty of 
alternative checkpassword available.

DTC doesn't use any system accounts, it uses all in nobody:nogroup 
because it's a mess if you use it for large web hosting and thousands of 
accounts you need to move from one server to another. Here is how it is 
setup:

/var/qmail/control:
xen010503.gplhost.com:xen010503-gplhost-com

/var/qmail/rcpthosts:
xen010503.gplhost.com

/var/qmail/users/assign:
+xen010503-gplhost-com-test:nobody:65534:65534:/var/www/sites/dtc/xen010503.gplhost.com/lists/xen010503.gplhost.com_test:::

/var/www/sites/dtc/xen010503.gplhost.com/lists/xen010503.gplhost.com_test/.qmail-default:
|preline /usr/bin/mlmmj-recieve -L 
/var/www/sites/dtc/xen010503.gplhost.com/lists/xen010503.gplhost.com_test

Just right after installing this setup, I had nothing working. When 
sending to test-subscribe@xen010503.gplhost.com qmail says it's 
delivered in the logs, but then it does nothing (it doesn't even try to 
send the confirmation message). After investigations, I've noticed that 
the procmail binary didn't had the same permissions as the mlmmj-recieve 
one. So I did "chown mail /usr/bin/mlmmj-recieve && chmod +s 
/usr/bin/mlmmj-recieve". After I did that, I had the following message 
in my qmail log:

Jan 11 03:43:38 xen010503 /usr/bin/mlmmj-recieve[3147]: 
mlmmj-recieve.c:130: could not create mail file in 
/var/spool/mlmmj/xen010503.gplhost.com_test/incoming directory: 
Permission denied

So I did chmod 777 on that folder, just to see if it works, then had the 
same problem with the queue folder, then did a chmod 777 on all the 
files of the list folder and the same chmod/chown on all the mlmmj 
binaries. The result is the same as at the begining: mlmmj doesn't send 
any confirmation request (and I think it doesn't send anything at 
all...). I believe there is still something wrong with the rights...

All I did is a unix rights mess, and I need to understand more deeply 
how all that works. Any help would be very appreciated.

Other topic: if one of you have it already setup, I'd like to have a 
look at the mlmmj web admin (please contact me in private if you can 
give me an access to it so I can have a quick look).

Best regards, and thanks all of you for you nice MLM,

    Thomas Goirand

