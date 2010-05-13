From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Thu, 13 May 2010 03:43:13 +0000
Subject: Re: [mlmmj] Setup issue : Suse10.1 and sendmail
Message-Id: <4BEB7551.4080001@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <4BEAF9A6.3040101@isat.co.za>
In-Reply-To: <4BEAF9A6.3040101@isat.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

It looks like mlmmj-recieve is exiting early for some reason.

There may be something in your mail.log (usually in /var/log) that hints
why.

One thing to check is the permissions of /var/spool/mlmmj (rather than
the testing subdirectory). Is it searchable by the user that
mlmmj-recieve runs as? Likewise /var/spool.

I suppose also check that /usr/bin/mlmmj-recieve is accessible and
executable by the user sendmail is attempting to invoke it as.

Ben.



On 13/05/10 4:55 AM, G Stansfield wrote:
> Greetings!
> I am battling to get up and running with mlmmj; my mails are winding up
> in /var/spool/mqueue, and if I try to flush the queue I get an
> "Operating system error, broken pipe". I am probably missing something
> simple, but can't see it for the life of me!
>
> Any help would be most welcome. I give details of what I did below.
> Please tell me if this is too much detail, and I will amend my ways in
> future.
>
> Regards,
> Geoff.
>
> =================================
>
> I am using SuSE10.1 which has sendmail-8.13.6-9 mlmmj-1.2.11-15. The
> setup is a private network (192.168.x.x) using masquerading. The
> production environment will use an ADSL line; my test machine uses a
> dial-up. Both work fine with DNS, routing, POP, sendmail, Apache2 and
> Squid - and very little else. I get the same problem in both
> environments (switch off the ADSL router to catch the mails before they
> escape and come back 5 days later as undeliverable!)
>
> 1) I installed mlmmj from rpm using YaST
>
> 2) I modified sendmail's LOCAL_SHELL_FLAGS settings in
> /usr/share/sendmail/ostype/suse-linux as per Matthias Kilian's mail of
> 29 Jul 2005 (but note the SuSE default included a '0' ). The resulting
> mailer prog entry in sendmail.cf is :
>
> Mprog, P=/bin/sh, F=lsDFMoqeu09P, S=EnvFromL/HdrFromL, R=EnvToL/HdrToL,
> D=$z:/,
> T=X-Unix/X-Unix/X-Unix,
> A=sh -c $u
>
> 3) I created my test list and made the alias entry thus :
> # /usr/bin/mlmmj-make-ml.sh -L testing -a
> and responded to the questions, did a newaliases.
>
> 4) I changed ownership to the DefaultUser defined in /etc/sendmail.cf :
> # chown -R daemon:daemon /var/spool/mlmmj/testing
>
> 5) I added some users and mailed notifications :
> # /usr/bin/mlmmj-sub -L /var/spool/mlmmj/testing/ -a
> geoff@suse10.stansfield -c
> and the mail notification(s) got delivered.
>
> 6) As geoff I mutt to testing@suse10.stansfield and the mail ends up in
> /var/spool/mqueue.
>
> 7) Checked sendmail delivery (after a newaliases) :
> # sendmail -bv testing@suse10.stansfield
> "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/testing/"... deliverable:
> mailer prog, user "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/testing/"
>
> 8) I try flushing the queue and log the problem as follows :
> # sendmail -q -v
>
> Running /var/spool/mqueue/o4BCXUHx003730 (sequence 1 of 1)
> "|/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/testing/"... Connecting to
> prog...
> putbody: write error: Broken pipe
>
> Operating system error.
>
> 9) The only "non standard" tweak to sendmail has been to add a local
> ruleset so mails detailed in virtusertable get delivered locally instead
> of being bounced via the ISP. I can't see that being an issue - the
> mailer for mlmmj is not local but prog.
>
> 10) Now I know I have exhausted my knowledge and need help!!!!!!
>
>
>


