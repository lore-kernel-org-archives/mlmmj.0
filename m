From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Fri, 09 Jun 2006 12:23:55 +0000
Subject: Re: delay in mailing to lists?
Message-Id: <20060609122355.GL891@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <5D67D244-B0A5-4E06-BB80-0FC6B5EC1DAC@gmail.com>
In-Reply-To: <5D67D244-B0A5-4E06-BB80-0FC6B5EC1DAC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Nate Beaty <natebeaty@gmail.com> [Jun 09. 2006 07:28]:
> I followed the instructions in README.exim4, and set up a "lists."  
> subdomain for mailing lists, but when I try to send a test email to  
> my list, Exim shows the following in the log:
> 
> 20060609040508.A78ADA7FEB@burnaby.textdrive.com). From  
> <natron46@burnaby.textdrive.com> (host=burnaby.textdrive.com  
> [207.7.108.243]) for mlmmj-test@lists.clixel.com
> 2006-06-08 21:04:57 1FoYEy-0001NS-As <=  
> natron46@burnaby.textdrive.com H=burnaby.textdrive.com  
> [207.7.108.243] P=esmtp S57  
> id 060609040508.A78ADA7FEB@burnaby.textdrive.com
> 2006-06-08 21:04:57 lowest numbered MX record points to local host:  
> clixel.com (while verifying <nate@clixel.com> from host localhost  
> (lists.clixel.com) [127.0.0.1])
> 2006-06-08 21:04:57 H=localhost (lists.clixel.com) [127.0.0.1]  
> F=<mlmmj-test+bounces-13@lists.clixel.com> temporarily rejected RCPT  
> <nate@clixel.com>: lowest numbered MX record points to local host
> 2006-06-08 21:04:57 1FoYEy-0001NS-As => mlmmj-test <mlmmj- 
> test@lists.clixel.com> R=mlmmj_router T=mlmmj_transport
> 2006-06-08 21:04:57 1FoYEy-0001NS-As Completed
> 
> My first concern, which isn't mlmmj-related necessarily, is the  
> "lowest numbered MX record points to local host" error. For all my  
> Googling, I can't pinpoint what would be causing this error, except  
> not having clixel.com in my local_domains (which it is, along with  
> lists.clixel.com and mail.clixel.com).
> 
> Regardless, mlmmj seems to accept the message, but it doesn't  
> propagate it unless I manually run the command "/usr/bin/mlmmj-maintd  
> -F -d /var/spool/mlmmj" -- is this normal? Does mlmmj not send an  
> email as soon as it gets it, but rather waits for the next crontab  
> execution of the mlmmj-maintd command? Or is this delay caused by the  
> "lowest numbered MX record points to local host" error?

No, mlmmj sends it immediately, it's that error causing it. It says it
temporarily rejected it, which means that mlmmj puts it in the requeue
directory to retry next time mlmmj-maintd runs.

Can you do a find in the requeue directory after it fails?

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
