From: Nate Beaty <natebeaty@gmail.com>
Date: Fri, 09 Jun 2006 05:28:35 +0000
Subject: delay in mailing to lists?
Message-Id: <5D67D244-B0A5-4E06-BB80-0FC6B5EC1DAC@gmail.com>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

I followed the instructions in README.exim4, and set up a "lists."  
subdomain for mailing lists, but when I try to send a test email to  
my list, Exim shows the following in the log:

20060609040508.A78ADA7FEB@burnaby.textdrive.com). From  
<natron46@burnaby.textdrive.com> (host=burnaby.textdrive.com  
[207.7.108.243]) for mlmmj-test@lists.clixel.com
2006-06-08 21:04:57 1FoYEy-0001NS-As <=  
natron46@burnaby.textdrive.com H=burnaby.textdrive.com  
[207.7.108.243] P=esmtp S57  
id 060609040508.A78ADA7FEB@burnaby.textdrive.com
2006-06-08 21:04:57 lowest numbered MX record points to local host:  
clixel.com (while verifying <nate@clixel.com> from host localhost  
(lists.clixel.com) [127.0.0.1])
2006-06-08 21:04:57 H=localhost (lists.clixel.com) [127.0.0.1]  
F=<mlmmj-test+bounces-13@lists.clixel.com> temporarily rejected RCPT  
<nate@clixel.com>: lowest numbered MX record points to local host
2006-06-08 21:04:57 1FoYEy-0001NS-As => mlmmj-test <mlmmj- 
test@lists.clixel.com> R=mlmmj_router T=mlmmj_transport
2006-06-08 21:04:57 1FoYEy-0001NS-As Completed

My first concern, which isn't mlmmj-related necessarily, is the  
"lowest numbered MX record points to local host" error. For all my  
Googling, I can't pinpoint what would be causing this error, except  
not having clixel.com in my local_domains (which it is, along with  
lists.clixel.com and mail.clixel.com).

Regardless, mlmmj seems to accept the message, but it doesn't  
propagate it unless I manually run the command "/usr/bin/mlmmj-maintd  
-F -d /var/spool/mlmmj" -- is this normal? Does mlmmj not send an  
email as soon as it gets it, but rather waits for the next crontab  
execution of the mlmmj-maintd command? Or is this delay caused by the  
"lowest numbered MX record points to local host" error?

I'm running debian Ubuntu Dapper Drake, with dnsmasq, Exim 4.62, and  
mlmmj-1.2.11.

Nate.

--
Clixel Design & Coding ~ http://clixel.com/

