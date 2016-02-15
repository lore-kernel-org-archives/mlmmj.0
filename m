From: Ben Schmidt <mail_ben_schmidt@yahoo.com.au>
Date: Mon, 15 Feb 2016 22:21:36 +0000
Subject: Re: [mlmmj] bounces-help and exim
Message-Id: <56C24F70.2090008@yahoo.com.au>
List-Id: <mlmmj.mlmmj.org>
References: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
In-Reply-To: <CAPcb_G+ZVfXtgD1UoxzaitRhyYtWN3ToYu0kC2XgWJjjE9Jrww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

(Forwarding reply to the list, as I accidentally took the conversation off-list 
earlier.)

On 15/02/2016 9:28 pm, Gavin Henry wrote:
 > On 15 February 2016 at 05:38, Ben Schmidt
 > <mail_ben_schmidt@yahoo.com.au> wrote:
 >> Strange.
 >
 > Yes, very. Our smarthost company has blocked our domain for now as
 > it's creating tickets.
 >
 >> It looks like a regular help email, the type you would expect from
 >> sending an email to surevoip-service-status+help@lists.suretec.net but
 >> it's going to mailer-daemon@... as if mailer-daemon sent an email to
 >> that address.
 >
 > Yes, true.
 >
 >> I'm thinking that perhaps something is messed up with your delimiter,
 >> i.e. +bounces-help is being treated like +help (+bounces-help is the
 >> address used when + commands fail, like subscription, etc.).
 >>
 >> Do other + commands work, e.g. subscribing via email?
 >
 > All others work. Oh, I didn't realise +bounces-help should return what
 > +help does?
 >
 > Or should it?
 >
 >> What happens if you send an email to the help address (above) from an
 >> address at which you can receive replies?
 >
 > All + actions are fine.
 >
 >> What if you replace the '+' with a '-'?
 >
 > Fails:
 >
 > root@governor:~# exim -bt surevoip-service-status-bounces-help@lists.suretec.net
 > R: system_aliases for surevoip-service-status-bounces-help@lists.suretec.net
 > surevoip-service-status-bounces-help@lists.suretec.net is
 > undeliverable: Unrouteable address
 >
 >> Is there anything revealing in "mlmmj-operation.log"? There should be an
 >> "XXX requested help" line when help emails are sent out.
 >
 > Just matching lines saying mailer-daemon requested help, as below:
 >
 > root@governor:~# grep -r help /var/spool/mlmmj/surevoip-service-status/*
 >
 > Thu Feb 11 15:50:37 2016 Mailer-Daemon@gladserv.com requested help
 > Thu Feb 11 15:55:22 2016 Mailer-Daemon@gladserv.com requested help
 > Thu Feb 11 16:26:38 2016 Mailer-Daemon@gladserv.com requested help
 > Thu Feb 11 19:53:30 2016 Mailer-Daemon@gladserv.com requested help
 > Thu Feb 11 20:05:22 2016 Mailer-Daemon@gladserv.com requested help
 > Thu Feb 11 20:05:29 2016 Mailer-Daemon@gladserv.com requested help
 > Thu Feb 11 22:21:45 2016 Mailer-Daemon@gladserv.com requested help
 > Fri Feb 12 04:20:24 2016 Mailer-Daemon@gladserv.com requested help
 > Fri Feb 12 10:39:31 2016 gavin.henry@gmail.com requested help
 > Fri Feb 12 10:53:09 2016 gavin.henry@gmail.com requested help
 > Fri Feb 12 15:40:28 2016 Mailer-Daemon@gladserv.com requested help
 > Fri Feb 12 15:43:48 2016 Mailer-Daemon@gladserv.com requested help
 > Fri Feb 12 17:38:37 2016 Mailer-Daemon@gladserv.com requested help
 > Sat Feb 13 03:40:32 2016 Mailer-Daemon@gladserv.com requested help
 > Sat Feb 13 03:55:32 2016 Mailer-Daemon@gladserv.com requested help
 > Sat Feb 13 05:56:50 2016 Mailer-Daemon@gladserv.com requested help
 > Sat Feb 13 21:40:37 2016 Mailer-Daemon@gladserv.com requested help
 > Sat Feb 13 22:08:46 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 00:28:46 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 12:48:50 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 15:40:43 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 16:23:52 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 16:30:55 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 16:31:02 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 17:15:54 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 17:16:15 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 17:16:26 2016 Mailer-Daemon@gladserv.com requested help
 > Sun Feb 14 22:28:53 2016 Mailer-Daemon@gladserv.com requested help
 > Mon Feb 15 03:40:47 2016 Mailer-Daemon@gladserv.com requested help
 > Mon Feb 15 04:09:00 2016 Mailer-Daemon@gladserv.com requested help
 > Mon Feb 15 04:30:47 2016 Mailer-Daemon@gladserv.com requested help
 >
 > P.S. No updates for this year:
 >
 > http://mlmmj.org/archive/mlmmj/
 >


