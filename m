From: "Christian Gleerup" <christian.gleerup@swn.nu>
Date: Sun, 24 Nov 2013 15:57:42 +0000
Subject: Re[2]: [mlmmj] Problems with microsoft
Message-Id: <392582f09683355a7b443b19621c3079@swn.nu>
List-Id: <mlmmj.mlmmj.org>
References: <ae4208d82aba105e14e3dd198f4ef133@swn.nu>
In-Reply-To: <ae4208d82aba105e14e3dd198f4ef133@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

iw_mail p{margin:0;padding:0;}iw_mail p{margin:0;padding:0;}iw_mail p{margin:0;padding:0;}iw_mail p{margin:0;padding:0;}
Hi Ben and List,
I'm been going through the logs, but I am not getting much wiser.
 
I hope the information provided here is the correct one, ontherwise please direct me as to what else to look for.
 
 
Here a snippet from /var/log/mail.log.1
---- BEGIN SNIP -----------------------------------------------------
Nov 10 06:27:22 lists postfix/smtp[8385]: 1465545E8A: to=<someone@hotmail.com>, relay=mx1.hotmail.com[65.55.37.72]:25, delay=0.94, delays=0.16/0.01/0.59/0.19, dsn=5.0.0, status=bounced (host mx1.hotmail.com[65.55.37.72] said: 550 SC-002 (COL0-MC1-F1) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
Nov 10 06:27:22 lists postfix/smtp[8385]: 1465545E8A: lost connection with mx1.hotmail.com[65.55.37.72] while sending RCPT TO
Nov 10 06:27:22 lists postfix/cleanup[12147]: 108F1467C2: message-id=<20131110052722.108F1467C2@lists.DOMAIN>
Nov 10 06:27:22 lists postfix/cleanup[11855]: 0B321467BD: message-id=<1384061241-12392-mlmmj-5f63aeea@lists.DOMAIN>
Nov 10 06:27:22 lists postfix/smtp[8334]: 50697467AF: to=<someone@live.dk>, relay=mx4.hotmail.com[65.55.92.136]:25, delay=0.73, delays=0.1/0.01/0.47/0.15, dsn=5.0.0, status=bounced (host mx4.hotmail.com[65.55.92.136] said: 550 SC-002 (SNT0-MC1-F19) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
Nov 10 06:27:22 lists postfix/smtp[8334]: 50697467AF: lost connection with mx4.hotmail.com[65.55.92.136] while sending RCPT TO
Nov 10 06:27:22 lists postfix/cleanup[12193]: 17834467C3: message-id=<20131110052722.17834467C3@lists.DOMAIN>
Nov 10 06:27:22 lists postfix/smtpd[12070]: disconnect from localhost[127.0.0.1]
Nov 10 06:27:22 lists postfix/bounce[12246]: 1465545E8A: sender non-delivery notification: 108F1467C2
Nov 10 06:27:22 lists postfix/qmgr[19489]: 17834467C3: from=<>, size=3464, nrcpt=1 (queue active)
Nov 10 06:27:22 lists postfix/bounce[12248]: 50697467AF: sender non-delivery notification: 17834467C3
Nov 10 06:27:22 lists postfix/qmgr[19489]: 1465545E8A: removed
Nov 10 06:27:22 lists postfix/qmgr[19489]: 50697467AF: removed
Nov 10 06:27:22 lists postfix/qmgr[19489]: 108F1467C2: from=<>, size=3524, nrcpt=1 (queue active)
Nov 10 06:27:22 lists postfix/qmgr[19489]: 0B321467BD: from=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, size=1015, nrcpt=1 (queue active)
Nov 10 06:27:22 lists postfix/smtpd[12070]: connect from localhost[127.0.0.1]
Nov 10 06:27:22 lists postfix/smtpd[12070]: 42F9545E8A: client=localhost[127.0.0.1]
Nov 10 06:27:22 lists postfix/cleanup[12331]: 42F9545E8A: message-id=<1384061242-12397-mlmmj-70337e4e@lists.DOMAIN>

Nov 10 06:27:22 lists postfix/pipe[11679]: 108F1467C2: to=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, relay=mlmmj, delay=0.41, delays=0.17/0.01/0/0.23, dsn=2.0.0, status=sent (delivered via mlmmj service)
Nov 10 06:27:22 lists postfix/qmgr[19489]: 108F1467C2: removed
Nov 10 06:27:22 lists postfix/pipe[12334]: 17834467C3: to=<listname+bounces-probe-someone=live.dk@lists.DOMAIN>, relay=mlmmj, delay=0.38, delays=0.09/0.06/0/0.23, dsn=2.0.0, status=sent (delivered via mlmmj service)
Nov 10 06:27:22 lists postfix/qmgr[19489]: 17834467C3: removed
Nov 10 06:27:22 lists postfix/qmgr[19489]: 42F9545E8A: from=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, size=1009, nrcpt=1 (queue active)
Nov 10 06:27:22 lists postfix/smtpd[12070]: disconnect from localhost[127.0.0.1]

Nov 10 06:27:22 lists postfix/smtp[8370]: 78F99467B9: to=<someone@hotmail.com>, relay=mx3.hotmail.com[65.54.188.126]:25, delay=0.88, delays=0.15/0/0.55/0.18, dsn=5.0.0, status=bounced (host mx3.hotmail.com[65.54.188.126] said: 550 SC-002 (BAY0-MC4-F51) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
Nov 10 06:27:22 lists postfix/smtp[8370]: 78F99467B9: lost connection with mx3.hotmail.com[65.54.188.126] while sending RCPT TO
Nov 10 06:27:22 lists postfix/cleanup[11855]: 7AB27467B3: message-id=<20131110052722.7AB27467B3@lists.DOMAIN>
Nov 10 06:27:22 lists postfix/qmgr[19489]: 7AB27467B3: from=<>, size=3514, nrcpt=1 (queue active)
Nov 10 06:27:22 lists postfix/smtpd[12070]: connect from localhost[127.0.0.1]
Nov 10 06:27:22 lists postfix/bounce[12246]: 78F99467B9: sender non-delivery notification: 7AB27467B3
Nov 10 06:27:22 lists postfix/qmgr[19489]: 78F99467B9: removed
Nov 10 06:27:22 lists postfix/smtpd[12070]: 91402467B9: client=localhost[127.0.0.1]
Nov 10 06:27:22 lists postfix/smtp[8390]: C159A467CE: to=<someone@hotmail.com>, relay=mx1.hotmail.com[65.55.92.152]:25, delay=0.8, delays=0.07/0.09/0.48/0.15, dsn=5.0.0, status=bounced (host mx1.hotmail.com[65.55.92.152] said: 550 SC-002 (SNT0-MC2-F38) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
Nov 10 06:27:22 lists postfix/smtp[8390]: C159A467CE: lost connection with mx1.hotmail.com[65.55.92.152] while sending RCPT TO
Nov 10 06:27:22 lists postfix/cleanup[12193]: 9A555467C1: message-id=<20131110052722.9A555467C1@lists.DOMAIN>
Nov 10 06:27:22 lists postfix/cleanup[12147]: 91402467B9: message-id=<1384061242-12402-mlmmj-2801aaca@lists.DOMAIN>
Nov 10 06:27:22 lists postfix/pipe[12302]: 7AB27467B3: to=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, relay=mlmmj, delay=0.14, delays=0.08/0.01/0/0.05, dsn=2.0.0, status=sent (delivered via mlmmj service)
Nov 10 06:27:22 lists postfix/qmgr[19489]: 7AB27467B3: removed
Nov 10 06:27:22 lists postfix/qmgr[19489]: 9A555467C1: from=<>, size=3520, nrcpt=1 (queue active)
Nov 10 06:27:22 lists postfix/bounce[12233]: C159A467CE: sender non-delivery notification: 9A555467C1
Nov 10 06:27:22 lists postfix/qmgr[19489]: 91402467B9: from=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, size=1009, nrcpt=1 (queue active)
---- END SNIP -------------------------------------------------------
To me all I see here is that I have been blocked by hotmail and friends. 
(We are currently in the process of signing up for the junk mail program.)
last time I recieved something on my own microsoft account was on the 24'th of Oktober, 
so I guess that today mlmmj will unsubscribe all the hotmail and live adresses :/
(since I have bouncelife = 2592000)
but on the other hand, I can see i still have some email adresses subscribed, where the domain was taken down somewehre arround the end of 2009!
see next log snippet.
---- BEGIN SNIP -----------------------------------------------------
Nov 24 13:05:49 lists postfix/qmgr[19489]: F2A1246824: from=<listname+bounces-probe-SOMEONE=tele2adsl.dk@lists.DOMAIN>, size=974, nrcpt=1 (queue active)
Nov 24 13:05:49 lists postfix/qmgr[19489]: F1A2B46879: from=<listname+bounces-probe-SOMEONE=tele2adsl.dk@lists.DOMAIN>, size=975, nrcpt=1 (queue active)
Nov 24 13:05:49 lists postfix/qmgr[19489]: F1B5246827: from=<listname+bounces-probe-SOMEONE=tele2adsl.dk@lists.DOMAIN>, size=982, nrcpt=1 (queue active)
Nov 24 13:05:49 lists postfix/qmgr[19489]: 3F30446978: from=<listname+bounces-probe-SOMEONE=lifecare.as@lists.DOMAIN>, size=964, nrcpt=1 (queue active)
Nov 24 13:05:49 lists postfix/qmgr[19489]: 3F4AD467BE: from=<listname+bounces-probe-SOMEONE=tele2adsl.dk@lists.DOMAIN>, size=972, nrcpt=1 (queue active)
Nov 24 13:05:49 lists postfix/error[617]: F2A1246824: to=<SOMEONE@tele2adsl.dk>, relay=none, delay=176327, delays=176327/0.06/0/0.04, dsn=4.4.3, status=deferred (delivery temporarily suspended: Host or domain name not found. Name service error for name=tele2adsl.dk type=MX: Host not found, try again)
Nov 24 13:05:49 lists postfix/qmgr[19489]: 3A13146A9C: from=<listname+bounces-probe-SOMEONE@lists.DOMAIN>, size=964, nrcpt=1 (queue active)
Nov 24 13:05:49 lists postfix/error[618]: F1A2B46879: to=<SOMEONE@tele2adsl.dk>, relay=none, delay=96500, delays=96500/0.03/0/0.05, dsn=4.4.3, status=deferred (delivery temporarily suspended: Host or domain name not found. Name service error for name=tele2adsl.dk type=MX: Host not found, try again)
---- END SNIP -------------------------------------------------------
How is this possible? 
besides from me adding someone with these adresses recently, but I have arround 80 adresses from this domain, so it seems unlikely.
(I add emails without validation, the adresses comes from lottery where the email adress is written on a piece of paper)
This is the lines from mlmmj.operation.log for today, only suspecies thing here for me is the russian requesting help for the list.
---- BEGIN SNIP -----------------------------------------------------
Sun Nov 24 02:02:26 2013 mlmmj-maintd: SOMEONE@inco.dk unsubscribed due to bouncing since  Thu Oct 24 13:51:45 2013
Sun Nov 24 02:02:27 2013 mlmmj-recieve: sending mail from listname+bounces-help@lists.DOMAIN to owner
Sun Nov 24 08:06:05 2013 mlmmj-sub: request for regular subscription from SOMEONE@youseeme.dk
Sun Nov 24 09:41:35 2013 mlmmj-sub: SOMEONE@youseeme.dk confirmed subscription to regular list
Sun Nov 24 09:41:35 2013 mlmmj-recieve: sending mail from listname+bounces-help@lists.DOMAIN to owner
Sun Nov 24 10:17:03 2013 mlmmj-sub: request for regular subscription from SOMEONE@stofanet.dk
Sun Nov 24 10:18:09 2013 mlmmj-sub: SOMEONE@stofanet.dk confirmed subscription to regular list
Sun Nov 24 10:18:09 2013 mlmmj-recieve: sending mail from listname+bounces-help@lists.DOMAIN to owner
Sun Nov 24 12:08:33 2013 mlmmj-unsub: SOMEONE@gmail.com requests unsubscribe from regular list
Sun Nov 24 13:42:45 2013 SOMEONE@10ge.ru requested help
---- END SNIP -------------------------------------------------------
 
And the content of mlmmj-maintd.lastrun.log

---- BEGIN SNIP -----------------------------------------------------
Starting maintenance run at Sun Nov 24 14:00:01 2013
clean_moderation(/var/spool/mlmmj/listname);
clean_discarded(/var/spool/mlmmj/listname);
clean_subconf(/var/spool/mlmmj/listname);
clean_unsubconf(/var/spool/mlmmj/listname);
resend_queue(/var/spool/mlmmj/listname, /usr/bin/mlmmj-send);
resend_requeue(/var/spool/mlmmj/listname, /usr/bin/mlmmj-send);
clean_nolongerbouncing(/var/spool/mlmmj/listname);
unsub_bouncers(/var/spool/mlmmj/listname, /usr/bin/mlmmj-unsub);
probe_bouncers(/var/spool/mlmmj/listname, /usr/bin/mlmmj-bounce);
run_digests(/var/spool/mlmmj/listname, /usr/bin/mlmmj-send);
---- END SNIP -------------------------------------------------------
 
I can provide you with the full log files if you wan't if so, do you have any ideay how to anonymise the files?
in /etc/postfix/master.cf

---- BEGIN SNIP -----------------------------------------------------
mlmmj unix - n n - - pipe
        flags=BFX
        user=nobody:nogroup
        argv=/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/listname/ -s ${sender$
---- END SNIP -------------------------------------------------------
 
in /etc/postfix/main.cf

---- BEGIN SNIP -----------------------------------------------------
transport_maps =
        proxy:hash:/etc/postfix/mlmmj_maillists
virtual_mailbox_base = /var/mail
virtual_mailbox_domains =
        proxy:hash:/etc/postfix/mlmmj_domains
virtual_mailbox_maps =
        proxy:hash:/etc/postfix/mlmmj_maillists
---- END SNIP -------------------------------------------------------
 
looking at the bouncelist is not a pretty sight :/ every hotmail and live address is there
basically this confirms that hotmail and live are the majority in the bounce folder.
I can't go thorough all the hotmail.lastmsg, but those I have looked at are there due to being blocked.
 
I guess the first thing to do about the Microsoft blockade is to follow up what I will learn from the Microsoft 'junk mail program'
 
 
since gmail is as big as it is, I looked in the bounce folder for gmail.com bounces, and luckily there is only one :)
 
The diagnostics code code in the last message is
Diagnostic-Code: smtp; 550-5.1.1 The email account that you tried to reach does
    not exist. Please try 550-5.1.1 double-checking the recipient's email
    address for typos or 550-5.1.1 unnecessary spaces. Learn more at 550 5.1.1
    http://support.google.com/mail/bin/answer.py?answer=6596
    pz10si9331677lbb.105 - gsmtp
 
Would it be possible (and reasonable) to configure mlmmj to unsubsscribe in such cases immediately?
 Any help is greatly appreciated
kind Regards.
Christian
-----Original Message----- 
> From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au> 
> To: "Christian Gleerup" <christian.gleerup@swn.nu>, mlmmj@mlmmj.org 
> Date: 23/11/2013 00:48 
> Subject: Re: [mlmmj] Problems with microsoft 
> 
> Hi, Christian,
> 
> Here are some thoughts:
> 
> > I use mlmmj to send newsletters, and I have the following problem, but
> > now more serious since Microsoft have blocked the server.
> 
> That's annoying. :-)
> 
> > Problem 1.
> > Our mail recipients sometimes receives a bunch of mails with the
> > following message "some messaged could not be delivered. If you see
> > this things are back to normal." They get many of these, so they
> > complain.
> > I understand that they get one mail telling them that everything
> > Works, but why 10-40?
> 
> It would be helpful to find out where those mails originate--is Mlmmj
> sending a lot of mail to Postfix, or is Postfix sending a lot of mail to
> the next server? There are a few things to look at: (1) your mail logs;
> you should be able to find the messages going out, (2)
> mlmmj.operations.log in the relevant listdir, (3)
> mlmmj-maintd.lastrun.log in the relevant listdir (if you get to it
> quickly enough after it happens), (4) the Message-ID and other headers
> of the received 'duplicate' messages.
> 
> Perhaps you could furnish us with some of that information. De-identify
> it by making some small modifications to the email/IP/list addresses in
> it if necessary.
> 
> > Is it a configuration problem between mlmmj and postfix?
> 
> Possibly.
> 
> > I have the following settings for postfix and mlmmj that I think is
> > relevant for the problem. But i don't really understand how they
> > interact, could there be some configuration error so mlmmj fills
> > postfix with a queue due to lack of respone.
> >
> > * /etc/postfix/main.cf
> > bounce_queue_lifetime = 2d
> > minimal_backoff_time = 1800s
> 
> This could possibly be relevant if Postfix is trying to send mail to
> mlmmj-receive, succeeding, but receiving a failure response; Postfix
> will keep trying for 2 days to deliver the bounce message to Mlmmj,
> which will keep receiving it and keep thinking the address is bouncing,
> and keep sending bounce probes.
> 
> You should be able to determine from your mail logs if this is happening
> (you will see a lot of failed messages from Postfix itself--postmaster,
> or mail_daemon or whatever it uses--to list+bounces addresses).
> 
> It would also be helpful to know how Postfix and Mlmmj are linked? What
> do you have in your config files to facilitate delivery of messages to
> Mlmmj?
> 
> > * in  'tunables' bouncelife
> > 2592000
> > (30 days)
> 
> This shouldn't be too relevant; it's how long Mlmmj waits before giving
> up and unsubscribing the user. If you changed this, bounce probes would
> just turn into unsubscriptions; the cause of the problems wouldn't be
> addressed.
> 
> > Problem 2
> > Microsoft think I am doing 'namespace mining', I know I don't. but
> > maybe it is somehow connected to the problem above ?
> 
> If this is truly the case, it is probably unrelated to the problem
> above. If you are namespace mining, you are trying lots of addresses
> @hotmail.com (or wherever), hoping to find real ones. In fact, you are
> probably actually getting a lot of bounces for nonexistent addresses.
> So, if, as a responsible mail host, I want to detect if you're namespace
> mining, I would use the number of bounces due to nonexistent addresses
> as a heuristic, and block you if you get a lot of them.
> 
> A nonexistent address can't receive a lot of probe messages! It can't
> receive anything. So it's probably not related to the problem above.
> 
> However, it could be related to your bouncelife tunable. If an address
> ceases to exist, because it's deleted; or in some cases, if an address
> with wrong spelling is added to the list (e.g. without requiring
> confirmation), Mlmmj is going to receive a bounce message about the
> non-existent address. However, Mlmmj doesn't know whether that bounce
> message is a permanent error or a temporary error (and in fact,
> sometimes, due to misconfiguration, errors that seem permanent are
> actually temporary, so best retried anyway). Therefore Mlmmj will keep
> retrying the address--possibly every 2 hours (however often mlmmj-maintd
> runs; I'm not sure if Mlmmj throttles delivery or not) for *30 days*,
> and every time receive a bounce message due to the non-existent address.
> That many bounces for non-existent addresses would definitely make you
> look like you're namespace mining (if the watchdog software that uses
> the heuristic isn't smart enough to realise they're all for the same
> address or few addresses).
> 
> You can check whether this is happening by looking in your listdir. The
> last bounce for each currently-bouncing address is stored in the bounce
> subdir, so you can read them, and see how many addresses (including how
> many from Microsoft) are bouncing, and why.
> 
> One reason for doing automatic bounce processing is to minimise
> unnecessary bounces, by unsubscribing users before bounces to them
> become suspicious or waste too much bandwidth; by making your bouncelife
> so high, you've reduced the effectiveness of the feature.
> 
> > Best Regards and I hope you can help me.
> 
> No trouble. If you need more help, please furnish us with more
> information: mail logs, mlmmj logs, message headers, configuration. All
> this information is useful and necessary for properly tracking down
> these problems.
> 
> Ben.




