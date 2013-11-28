From: "Christian Gleerup" <christian.gleerup@swn.nu>
Date: Thu, 28 Nov 2013 17:58:07 +0000
Subject: Re[3]: [mlmmj] Problems with microsoft
Message-Id: <0f157bc40b4d59fdc8d287200900fa25@swn.nu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


Hi Again list.
  
 I have downloaded and done a  configure && make of mlmmj 1.2.18.0
 but I haven't done a make install...
  
 I am considering just copying the 8 binaries (mlmmj-(bounce,list,maintd,process, recieve, send, sub, unsub))
 in ~/mlmmj-1.2.18.0/src/ to /usr/bin/ where my old mlmmj files are.
 
is there something I should be aware of or should it just Work? 
(I will give the files same owership, I will delete mlmmj-make-ml and mlmmj-make-ml.sh)
(I have upgraded the installation so I now have 768MB of ram, so I hope there will be no more 'log blackouts')
 
kind regards.
Christian
 -----Original Message----- 
> From: "Christian Gleerup" <christian.gleerup@swn.nu> 
> To: mlmmj@mlmmj.org 
> Date: 28/11/2013 10:49 
> Subject: Re[2]: [mlmmj] Problems with microsoft 
> 
> Hi Ben and list.
>  
> I had 2 reports within the time that my log files covers of people getting a bounce message.
>  
> Only one of the people where complaining about multiple messages, and that pearson was complaing in the 'log blacout'...
> nothing was loged in the time between 10th of november to 24th of november where I restarted the log service.
> The reason seems to be a memory problem so the kernel started killing a lot of processes, 
> now, this sound funny, but I will se what it takes to get an additional 256mb of ram (thats double the current amount!)
> perhaps a restart would also reclaim some memory uptime = 474 days!
>  
> anyways, back on track.
>  
> the other person wasn't complaining, but simlpy stating that she now was able to get her missing mails!
> So I don't know if mlmmj and postfix was behaving well at the time.
> But I did discover something insightfull.
> I have done a wingrep +2 lines for the email in the relevant log file.
>  
> I have replaced the person of interest that i grepped with 'THEONE' bellow
> Notice that hotmail actually starts asking me to back down. ((SNT0-MC1-F9) Unfortunately, some messages from ----IP---- weren't sent. Please try again. We have limits for how many messages can be sent per hour and per day. You can also refer to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
> 
> I am not sure how often postfix/mlmmj tries to send, 
> what does actually happen when mlmmj+postfix sends a new mail, 
> does it send send to everyone as fast as possible, or is there aa queue that is processed in some way?
> does anyone know these 'send' limits that hotmail has?
>  
> grep on 'mail.log.25'
> 22542: Oct 20 10:00:53 lists postfix/smtp[31296]: 395FE468C5: host mx3.hotmail.com[65.55.92.136] said: 421 PR(ct1) (SNT0-MC1-F9) Unfortunately, some messages from ----IP---- weren't sent. Please try again. We have limits for how many messages can be sent per hour and per day. You can also refer to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command)
> 22543: Oct 20 10:00:53 lists postfix/smtp[31296]: 395FE468C5: lost connection with mx3.hotmail.com[65.55.92.136] while sending RCPT TO
> 22544: Oct 20 10:00:53 lists postfix/smtp[31220]: 395FE468C5: to=<THEONE>, relay=mx3.hotmail.com[65.55.37.88]:25, delay=280, delays=0.9/269/9.9/0.83, dsn=2.0.0, status=sent (250 <20131020075613.395FE468C5@lists.DOMAIN> Queued mail for delivery)
> 22545: Oct 20 10:00:53 lists postfix/smtp[31150]: 395FE468C5: to=<SOMEONE@hotmail.com>, relay=mx4.hotmail.com[65.55.92.168]:25, delay=281, delays=0.9/273/6/0.7, dsn=2.0.0, status=sent (250 <20131020075613.395FE468C5@lists.DOMAIN> Queued mail for delivery)
> 22546: Oct 20 10:00:53 lists postfix/cleanup[31297]: 07E21468C7: message-id=<20131020080053.07E21468C7@lists.DOMAIN>
>  
> 99913: Oct 21 00:00:13 lists postfix/smtpd[14427]: connect from localhost[127.0.0.1]
> 99914: Oct 21 00:00:13 lists postfix/smtpd[14427]: BFBEA467F6: client=localhost[127.0.0.1]
> 99915: Oct 21 00:00:13 lists postfix/smtp[14180]: 13724467BD: to=<THEONE>, relay=mx2.hotmail.com[65.55.92.168]:25, conn_use=10, delay=0.71, delays=0.06/0/0.17/0.47, dsn=2.0.0, status=sent (250 <1382306413-14526-mlmmj-2a2efcd7@lists.DOMAIN> Queued mail for delivery)
> 99916: Oct 21 00:00:13 lists postfix/qmgr[19489]: 13724467BD: removed
> 99917: Oct 21 00:00:13 lists postfix/cleanup[14328]: C1BB0467BD: message-id=<20131020220013.C1BB0467BD@lists.DOMAIN>
>  
> grep on 'mail.log.24'
> 06857: Oct 21 08:31:26 lists postfix/smtpd[23429]: 150FF467A8: client=dub0-omc2-s10.dub0.hotmail.com[157.55.1.149]
> 06858: Oct 21 08:31:26 lists postfix/cleanup[23434]: 150FF467A8: message-id=<DUB111-W9462F36FE04DE5FB0BBF80D6010@phx.gbl>
> 06859: Oct 21 08:31:26 lists postfix/qmgr[19489]: 150FF467A8: from=<THEONE>, size=1524, nrcpt=1 (queue active)
> 06860: Oct 21 08:31:26 lists postfix/pipe[23435]: 150FF467A8: to=<listname+get-n@lists.DOMAIN>, relay=mlmmj, delay=0.22, delays=0.2/0.01/0/0.02, dsn=2.0.0, status=sent (delivered via mlmmj service)
> 06861: Oct 21 08:31:26 lists postfix/qmgr[19489]: 150FF467A8: removed
>  
> 07715: Oct 21 08:52:55 lists postfix/smtpd[23673]: 35FD7467A8: client=dub0-omc4-s9.dub0.hotmail.com[157.55.2.84]
> 07716: Oct 21 08:52:55 lists postfix/cleanup[23677]: 35FD7467A8: message-id=<DUB111-W1084B39DD869D8C64438248D6010@phx.gbl>
> 07717: Oct 21 08:52:55 lists postfix/qmgr[19489]: 35FD7467A8: from=<THEONE>, size=3453, nrcpt=1 (queue active)
> 07718: Oct 21 08:52:55 lists postfix/pipe[23678]: 35FD7467A8: to=<listname+owner@lists.DOMAIN>, relay=mlmmj, delay=0.19, delays=0.17/0.01/0/0.01, dsn=2.0.0, status=sent (delivered via mlmmj service)
> 07719: Oct 21 08:52:55 lists postfix/qmgr[19489]: 35FD7467A8: removed
>  
> 07722: Oct 21 08:52:55 lists postfix/smtpd[23681]: 5F08D467A8: client=localhost[127.0.0.1]
> 07723: Oct 21 08:52:55 lists postfix/cleanup[23677]: 5F08D467A8: message-id=<DUB111-W1084B39DD869D8C64438248D6010@phx.gbl>
> 07724: Oct 21 08:52:55 lists postfix/qmgr[19489]: 5F08D467A8: from=<THEONE>, size=3645, nrcpt=1 (queue active)
> 07725: Oct 21 08:52:55 lists postfix/smtpd[23681]: disconnect from localhost[127.0.0.1]
> 07726: Oct 21 08:52:56 lists postfix/scache[23567]: statistics: start interval Oct 21 08:48:55
>  
> Once again, I actually don't know if anything wen't wrong in the style of 'mail up and running storm' in this instance.
> But it think it is an interesting message from hotmail
> would it be possible to ask mlmmj to modify the hotmail messages queue wait time?
> or could i simply set some limit so mlmmj+postfix max can send N mails pr. hour?
>  
> I have cleared the bounces (I saved the Hotmail addresses AND increased the bouncelife before they where wiped)
> I am going to send a newsletter tomorrow, and then clear the bounce list one hour after sending.
>  
> regarding the adresses that should have been removed.
> mlmmj-d runs as 'nobody'
> The owner and Group for all files in the main listdir is 'nobody' and 'nogroup' EXCEPT for mlmmj-d-maintd.lastrun.log that has the group 'root'
> the Owner and Group of listdir/subscribers.d are 50/50 'nobody':'nogroup'  and 'nobody':'root' 
> the mails that should be deleted because the domain is taken Down are spread across both ownership types.
>  
> Regarding the version of mlmmj... I am running 1.2.16
> I would like to upgrade, but since it wasn't me who installed and configured mlmmj, I am a bit reluctant against noodling arround to much :)
> but since I can't send to one third of the people on my list, I guess now is as good as a time as ever.
> I am running debian 5.0.2 with a  2.6.26-2-amd64 kernel
> is there something I should be aware of when upgrading?
> 
> I hope I din't miss answering anything or missed looking at any obvious Places, the only place I could think of was the mail log and relate to the complains a had gotten,
> but I feel I didn't get much closer to the case of the 'bounce/everything is normal storm'
>  
> What I have learned so far is that hotmail seems to have this limit as to how many mails I can send, So I guess this is something that should be solved asap.
>  
>  
> -----Original Message----- 
> > From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au> 
> > To: "Christian Gleerup" <christian.gleerup@swn.nu>, mlmmj <mlmmj@mlmmj.org> 
> > Date: 26/11/2013 22:03 
> > Subject: Re: [mlmmj] Problems with microsoft 
> > 
> > OK, so obviously after being blocked wasn't an ideal time to look at
> > bounce messages and logs, because it's just telling you what you already
> > know: you're blocked. To find out why, we need earlier data.
> > 
> > So once you've jumped through the hoops to get Microsoft to unblock you,
> > you should pay careful attention to what's in "bounce" for MS addresses
> > and see what's going on. That may shed light on what caused you to get
> > blocked. Also you should probably reduce your bouncelife tunable, as
> > discussed. Also, to avoid a massive backlog of mail for MS addresses,
> > you should perhaps remove them from the retry queue (clear out the
> > bounces from Mlmmj'sn> list dir and confirm with mail logs Mlmmj is no
> > longer getting a stack of failed deliveries). That might help you avoid
> > getting your unblock request denied, or getting blocked again straight
> > away because Mlmmj is continuously trying to send probes. It would also
> > avoid the addresses all being unsubscribed (though I guess actually it
> > may be too late for that; O well; I suppose you can always put them back
> > as long as you know what they were).
> > 
> > You didn't seem to include any logs or other information to do with the
> > other issue (people receiving multiple bounce probes). You may need to
> > track down an instance of that occurring, and see what you can find in
> > the logs. Getting samples of the repeat messages would be a good first
> > step, looking at the headers, and trying to trace the deliveries back
> > through your logs (mail server logs, then back to Mlmmj if necessary).
> > 
> > Nevertheless, your logs and bounce files have confirmed that Mlmmj is
> > wired up to Postfix OK, and that bounces are making it all the way back
> > to Mlmmj.
> > 
> > Regarding addresses on the list that should have already been removed:
> > the most likely cause of this is bad permissions. Mlmmj'sn> error checking
> > isn't always brilliant, and sometimes you don't get an informative
> > message when things go wrong (we are working on fixing this). Anyway,
> > check that mlmmj-maintd runs with permission to access the listdir, and
> > that all the files in the listdir have appropriate permissions for
> > mlmmj-maintd, mlmmj when invoked via Postfix, and mlmmj when invoked any
> > other ways you use (commandline/web interfaces). You may need to add
> > users to groups, etc. to make it work. I notice you're using "nobody"
> > for mlmmj, which isn't a good idea. See the tutorial/readme in the docs
> > about integrating Mlmmj with Postfix for details of why, and how to do
> > it better. Anyway, if one method of subscribing users creates files that
> > mlmmj-maintd can't modify, it won't be able to unsubscribe them.
> > 
> > I hope this helps,
> > 
> > Ben.
> > 
> > 
> > 
> > On 25/11/13 2:57 AM, Christian Gleerup wrote:
> > > Hi Ben and List,
> > > I'm been going through the logs, but I am not getting much wiser.
> > >
> > > I hope the information provided here is the correct one, ontherwise please direct me as to what else to look for.
> > >
> > >
> > > Here a snippet from /var/log/mail.log.1
> > > ---- BEGIN SNIP -----------------------------------------------------
> > > Nov 10 06:27:22 lists postfix/smtp[8385]: 1465545E8A: to=<someone@hotmail.com>, relay=mx1.hotmail.com[65.55.37.72]:25, delay=0.94, delays=0.16/0.01/0.59/0.19, dsn=5.0.0, status=bounced (host mx1.hotmail.com[65.55.37.72] said: 550 SC-002 (COL0-MC1-F1) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
> > > Nov 10 06:27:22 lists postfix/smtp[8385]: 1465545E8A: lost connection with mx1.hotmail.com[65.55.37.72] while sending RCPT TO
> > > Nov 10 06:27:22 lists postfix/cleanup[12147]: 108F1467C2: message-id=<20131110052722.108F1467C2@lists.DOMAIN>
> > > Nov 10 06:27:22 lists postfix/cleanup[11855]: 0B321467BD: message-id=<1384061241-12392-mlmmj-5f63aeea@lists.DOMAIN>
> > > Nov 10 06:27:22 lists postfix/smtp[8334]: 50697467AF: to=<someone@live.dk>, relay=mx4.hotmail.com[65.55.92.136]:25, delay=0.73, delays=0.1/0.01/0.47/0.15, dsn=5.0.0, status=bounced (host mx4.hotmail.com[65.55.92.136] said: 550 SC-002 (SNT0-MC1-F19) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
> > > Nov 10 06:27:22 lists postfix/smtp[8334]: 50697467AF: lost connection with mx4.hotmail.com[65.55.92.136] while sending RCPT TO
> > > Nov 10 06:27:22 lists postfix/cleanup[12193]: 17834467C3: message-id=<20131110052722.17834467C3@lists.DOMAIN>
> > > Nov 10 06:27:22 lists postfix/smtpd[12070]: disconnect from localhost[127.0.0.1]
> > > Nov 10 06:27:22 lists postfix/bounce[12246]: 1465545E8A: sender non-delivery notification: 108F1467C2
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 17834467C3: from=<>, size=3464, nrcpt=1 (queue active)
> > > Nov 10 06:27:22 lists postfix/bounce[12248]: 50697467AF: sender non-delivery notification: 17834467C3
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 1465545E8A: removed
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 50697467AF: removed
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 108F1467C2: from=<>, size=3524, nrcpt=1 (queue active)
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 0B321467BD: from=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, size=1015, nrcpt=1 (queue active)
> > > Nov 10 06:27:22 lists postfix/smtpd[12070]: connect from localhost[127.0.0.1]
> > > Nov 10 06:27:22 lists postfix/smtpd[12070]: 42F9545E8A: client=localhost[127.0.0.1]
> > > Nov 10 06:27:22 lists postfix/cleanup[12331]: 42F9545E8A: message-id=<1384061242-12397-mlmmj-70337e4e@lists.DOMAIN>
> > >
> > > Nov 10 06:27:22 lists postfix/pipe[11679]: 108F1467C2: to=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, relay=mlmmj, delay=0.41, delays=0.17/0.01/0/0.23, dsn=2.0.0, status=sent (delivered via mlmmj service)
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 108F1467C2: removed
> > > Nov 10 06:27:22 lists postfix/pipe[12334]: 17834467C3: to=<listname+bounces-probe-someone=live.dk@lists.DOMAIN>, relay=mlmmj, delay=0.38, delays=0.09/0.06/0/0.23, dsn=2.0.0, status=sent (delivered via mlmmj service)
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 17834467C3: removed
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 42F9545E8A: from=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, size=1009, nrcpt=1 (queue active)
> > > Nov 10 06:27:22 lists postfix/smtpd[12070]: disconnect from localhost[127.0.0.1]
> > >
> > > Nov 10 06:27:22 lists postfix/smtp[8370]: 78F99467B9: to=<someone@hotmail.com>, relay=mx3.hotmail.com[65.54.188.126]:25, delay=0.88, delays=0.15/0/0.55/0.18, dsn=5.0.0, status=bounced (host mx3.hotmail.com[65.54.188.126] said: 550 SC-002 (BAY0-MC4-F51) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
> > > Nov 10 06:27:22 lists postfix/smtp[8370]: 78F99467B9: lost connection with mx3.hotmail.com[65.54.188.126] while sending RCPT TO
> > > Nov 10 06:27:22 lists postfix/cleanup[11855]: 7AB27467B3: message-id=<20131110052722.7AB27467B3@lists.DOMAIN>
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 7AB27467B3: from=<>, size=3514, nrcpt=1 (queue active)
> > > Nov 10 06:27:22 lists postfix/smtpd[12070]: connect from localhost[127.0.0.1]
> > > Nov 10 06:27:22 lists postfix/bounce[12246]: 78F99467B9: sender non-delivery notification: 7AB27467B3
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 78F99467B9: removed
> > > Nov 10 06:27:22 lists postfix/smtpd[12070]: 91402467B9: client=localhost[127.0.0.1]
> > > Nov 10 06:27:22 lists postfix/smtp[8390]: C159A467CE: to=<someone@hotmail.com>, relay=mx1.hotmail.com[65.55.92.152]:25, delay=0.8, delays=0.07/0.09/0.48/0.15, dsn=5.0.0, status=bounced (host mx1.hotmail.com[65.55.92.152] said: 550 SC-002 (SNT0-MC2-F38) Unfortunately, messages from ----IP---- weren't sent. Please contact your Internet service provider since part of their network is on our block list. You can also refer your provider to http://mail.live.com/mail/troubleshooting.aspx#errors. (in reply to MAIL FROM command))
> > > Nov 10 06:27:22 lists postfix/smtp[8390]: C159A467CE: lost connection with mx1.hotmail.com[65.55.92.152] while sending RCPT TO
> > > Nov 10 06:27:22 lists postfix/cleanup[12193]: 9A555467C1: message-id=<20131110052722.9A555467C1@lists.DOMAIN>
> > > Nov 10 06:27:22 lists postfix/cleanup[12147]: 91402467B9: message-id=<1384061242-12402-mlmmj-2801aaca@lists.DOMAIN>
> > > Nov 10 06:27:22 lists postfix/pipe[12302]: 7AB27467B3: to=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, relay=mlmmj, delay=0.14, delays=0.08/0.01/0/0.05, dsn=2.0.0, status=sent (delivered via mlmmj service)
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 7AB27467B3: removed
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 9A555467C1: from=<>, size=3520, nrcpt=1 (queue active)
> > > Nov 10 06:27:22 lists postfix/bounce[12233]: C159A467CE: sender non-delivery notification: 9A555467C1
> > > Nov 10 06:27:22 lists postfix/qmgr[19489]: 91402467B9: from=<listname+bounces-probe-someone=hotmail.com@lists.DOMAIN>, size=1009, nrcpt=1 (queue active)
> > > ---- END SNIP -------------------------------------------------------
> > > To me all I see here is that I have been blocked by hotmail and friends.
> > > (We are currently in the process of signing up for the junk mail program.)
> > > last time I recieved something on my own microsoft account was on the 24'th of Oktober,
> > > so I guess that today mlmmj will unsubscribe all the hotmail and live adresses :/
> > > (since I have bouncelife = 2592000)
> > > but on the other hand, I can see i still have some email adresses subscribed, where the domain was taken down somewehre arround the end of 2009!
> > > see next log snippet.
> > > ---- BEGIN SNIP -----------------------------------------------------
> > > Nov 24 13:05:49 lists postfix/qmgr[19489]: F2A1246824: from=<listname+bounces-probe-SOMEONE=tele2adsl.dk@lists.DOMAIN>, size=974, nrcpt=1 (queue active)
> > > Nov 24 13:05:49 lists postfix/qmgr[19489]: F1A2B46879: from=<listname+bounces-probe-SOMEONE=tele2adsl.dk@lists.DOMAIN>, size=975, nrcpt=1 (queue active)
> > > Nov 24 13:05:49 lists postfix/qmgr[19489]: F1B5246827: from=<listname+bounces-probe-SOMEONE=tele2adsl.dk@lists.DOMAIN>, size=982, nrcpt=1 (queue active)
> > > Nov 24 13:05:49 lists postfix/qmgr[19489]: 3F30446978: from=<listname+bounces-probe-SOMEONE=lifecare.as@lists.DOMAIN>, size=964, nrcpt=1 (queue active)
> > > Nov 24 13:05:49 lists postfix/qmgr[19489]: 3F4AD467BE: from=<listname+bounces-probe-SOMEONE=tele2adsl.dk@lists.DOMAIN>, size=972, nrcpt=1 (queue active)
> > > Nov 24 13:05:49 lists postfix/error[617]: F2A1246824: to=<SOMEONE@tele2adsl.dk>, relay=none, delay=176327, delays=176327/0.06/0/0.04, dsn=4.4.3, status=deferred (delivery temporarily suspended: Host or domain name not found. Name service error for name=tele2adsl.dk type=MX: Host not found, try again)
> > > Nov 24 13:05:49 lists postfix/qmgr[19489]: 3A13146A9C: from=<listname+bounces-probe-SOMEONE@lists.DOMAIN>, size=964, nrcpt=1 (queue active)
> > > Nov 24 13:05:49 lists postfix/error[618]: F1A2B46879: to=<SOMEONE@tele2adsl.dk>, relay=none, delay=96500, delays=96500/0.03/0/0.05, dsn=4.4.3, status=deferred (delivery temporarily suspended: Host or domain name not found. Name service error for name=tele2adsl.dk type=MX: Host not found, try again)
> > > ---- END SNIP -------------------------------------------------------
> > > How is this possible?
> > > besides from me adding someone with these adresses recently, but I have arround 80 adresses from this domain, so it seems unlikely.
> > > (I add emails without validation, the adresses comes from lottery where the email adress is written on a piece of paper)
> > > This is the lines from mlmmj.operation.log for today, only suspecies thing here for me is the russian requesting help for the list.
> > > ---- BEGIN SNIP -----------------------------------------------------
> > > Sun Nov 24 02:02:26 2013 mlmmj-maintd: SOMEONE@inco.dk unsubscribed due to bouncing since  Thu Oct 24 13:51:45 2013
> > > Sun Nov 24 02:02:27 2013 mlmmj-recieve: sending mail from listname+bounces-help@lists.DOMAIN to owner
> > > Sun Nov 24 08:06:05 2013 mlmmj-sub: request for regular subscription from SOMEONE@youseeme.dk
> > > Sun Nov 24 09:41:35 2013 mlmmj-sub: SOMEONE@youseeme.dk confirmed subscription to regular list
> > > Sun Nov 24 09:41:35 2013 mlmmj-recieve: sending mail from listname+bounces-help@lists.DOMAIN to owner
> > > Sun Nov 24 10:17:03 2013 mlmmj-sub: request for regular subscription from SOMEONE@stofanet.dk
> > > Sun Nov 24 10:18:09 2013 mlmmj-sub: SOMEONE@stofanet.dk confirmed subscription to regular list
> > > Sun Nov 24 10:18:09 2013 mlmmj-recieve: sending mail from listname+bounces-help@lists.DOMAIN to owner
> > > Sun Nov 24 12:08:33 2013 mlmmj-unsub: SOMEONE@gmail.com requests unsubscribe from regular list
> > > Sun Nov 24 13:42:45 2013 SOMEONE@10ge.ru requested help
> > > ---- END SNIP -------------------------------------------------------
> > >
> > > And the content of mlmmj-maintd.lastrun.log
> > >
> > > ---- BEGIN SNIP -----------------------------------------------------
> > > Starting maintenance run at Sun Nov 24 14:00:01 2013
> > > clean_moderation(/var/spool/mlmmj/listname);
> > > clean_discarded(/var/spool/mlmmj/listname);
> > > clean_subconf(/var/spool/mlmmj/listname);
> > > clean_unsubconf(/var/spool/mlmmj/listname);
> > > resend_queue(/var/spool/mlmmj/listname, /usr/bin/mlmmj-send);
> > > resend_requeue(/var/spool/mlmmj/listname, /usr/bin/mlmmj-send);
> > > clean_nolongerbouncing(/var/spool/mlmmj/listname);
> > > unsub_bouncers(/var/spool/mlmmj/listname, /usr/bin/mlmmj-unsub);
> > > probe_bouncers(/var/spool/mlmmj/listname, /usr/bin/mlmmj-bounce);
> > > run_digests(/var/spool/mlmmj/listname, /usr/bin/mlmmj-send);
> > > ---- END SNIP -------------------------------------------------------
> > >
> > > I can provide you with the full log files if you wan't if so, do you have any ideay how to anonymise the files?
> > > in /etc/postfix/master.cf
> > >
> > > ---- BEGIN SNIP -----------------------------------------------------
> > > mlmmj unix - n n - - pipe
> > >          flags=BFX
> > >          user=nobody:nogroup
> > >          argv=/usr/bin/mlmmj-recieve -L /var/spool/mlmmj/listname/ -s ${sender$
> > > ---- END SNIP -------------------------------------------------------
> > >
> > > in /etc/postfix/main.cf
> > >
> > > ---- BEGIN SNIP -----------------------------------------------------
> > > transport_maps =
> > >          proxy:hash:/etc/postfix/mlmmj_maillists
> > > virtual_mailbox_base = /var/mail
> > > virtual_mailbox_domains =
> > >          proxy:hash:/etc/postfix/mlmmj_domains
> > > virtual_mailbox_maps =
> > >          proxy:hash:/etc/postfix/mlmmj_maillists
> > > ---- END SNIP -------------------------------------------------------
> > >
> > > looking at the bouncelist is not a pretty sight :/ every hotmail and live address is there
> > > basically this confirms that hotmail and live are the majority in the bounce folder.
> > > I can't go thorough all the hotmail.lastmsg, but those I have looked at are there due to being blocked.
> > >
> > > I guess the first thing to do about the Microsoft blockade is to follow up what I will learn from the Microsoft 'junk mail program'
> > >
> > >
> > > since gmail is as big as it is, I looked in the bounce folder for gmail.com bounces, and luckily there is only one :)
> > >
> > > The diagnostics code code in the last message is
> > > Diagnostic-Code: smtp; 550-5.1.1 The email account that you tried to reach does
> > >      not exist. Please try 550-5.1.1 double-checking the recipient's email
> > >      address for typos or 550-5.1.1 unnecessary spaces. Learn more at 550 5.1.1
> > >      http://support.google.com/mail/bin/answer.py?answer=6596
> > >      pz10si9331677lbb.105 - gsmtp
> > >
> > > Would it be possible (and reasonable) to configure mlmmj to unsubsscribe in such cases immediately?
> > >   Any help is greatly appreciated
> > > kind Regards.
> > > Christian
> > > -----Original Message-----
> > >> From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au>
> > >> To: "Christian Gleerup" <christian.gleerup@swn.nu>, mlmmj@mlmmj.org
> > >> Date: 23/11/2013 00:48
> > >> Subject: Re: [mlmmj] Problems with microsoft
> > >>
> > >> Hi, Christian,
> > >>
> > >> Here are some thoughts:
> > >>
> > >>> I use mlmmj to send newsletters, and I have the following problem, but
> > >>> now more serious since Microsoft have blocked the server.
> > >>
> > >> That's annoying. :-)
> > >>
> > >>> Problem 1.
> > >>> Our mail recipients sometimes receives a bunch of mails with the
> > >>> following message "some messaged could not be delivered. If you see
> > >>> this things are back to normal." They get many of these, so they
> > >>> complain.
> > >>> I understand that they get one mail telling them that everything
> > >>> Works, but why 10-40?
> > >>
> > >> It would be helpful to find out where those mails originate--is Mlmmj
> > >> sending a lot of mail to Postfix, or is Postfix sending a lot of mail to
> > >> the next server? There are a few things to look at: (1) your mail logs;
> > >> you should be able to find the messages going out, (2)
> > >> mlmmj.operations.log in the relevant listdir, (3)
> > >> mlmmj-maintd.lastrun.log in the relevant listdir (if you get to it
> > >> quickly enough after it happens), (4) the Message-ID and other headers
> > >> of the received 'duplicate' messages.
> > >>
> > >> Perhaps you could furnish us with some of that information. De-identify
> > >> it by making some small modifications to the email/IP/list addresses in
> > >> it if necessary.
> > >>
> > >>> Is it a configuration problem between mlmmj and postfix?
> > >>
> > >> Possibly.
> > >>
> > >>> I have the following settings for postfix and mlmmj that I think is
> > >>> relevant for the problem. But i don't really understand how they
> > >>> interact, could there be some configuration error so mlmmj fills
> > >>> postfix with a queue due to lack of respone.
> > >>>
> > >>> * /etc/postfix/main.cf
> > >>> bounce_queue_lifetime = 2d
> > >>> minimal_backoff_time = 1800s
> > >>
> > >> This could possibly be relevant if Postfix is trying to send mail to
> > >> mlmmj-receive, succeeding, but receiving a failure response; Postfix
> > >> will keep trying for 2 days to deliver the bounce message to Mlmmj,
> > >> which will keep receiving it and keep thinking the address is bouncing,
> > >> and keep sending bounce probes.
> > >>
> > >> You should be able to determine from your mail logs if this is happening
> > >> (you will see a lot of failed messages from Postfix itself--postmaster,
> > >> or mail_daemon or whatever it uses--to list+bounces addresses).
> > >>
> > >> It would also be helpful to know how Postfix and Mlmmj are linked? What
> > >> do you have in your config files to facilitate delivery of messages to
> > >> Mlmmj?
> > >>
> > >>> * in  'tunables' bouncelife
> > >>> 2592000
> > >>> (30 days)
> > >>
> > >> This shouldn't be too relevant; it's how long Mlmmj waits before giving
> > >> up and unsubscribing the user. If you changed this, bounce probes would
> > >> just turn into unsubscriptions; the cause of the problems wouldn't be
> > >> addressed.
> > >>
> > >>> Problem 2
> > >>> Microsoft think I am doing 'namespace mining', I know I don't. but
> > >>> maybe it is somehow connected to the problem above ?
> > >>
> > >> If this is truly the case, it is probably unrelated to the problem
> > >> above. If you are namespace mining, you are trying lots of addresses
> > >> @hotmail.com (or wherever), hoping to find real ones. In fact, you are
> > >> probably actually getting a lot of bounces for nonexistent addresses.
> > >> So, if, as a responsible mail host, I want to detect if you're namespace
> > >> mining, I would use the number of bounces due to nonexistent addresses
> > >> as a heuristic, and block you if you get a lot of them.
> > >>
> > >> A nonexistent address can't receive a lot of probe messages! It can't
> > >> receive anything. So it's probably not related to the problem above.
> > >>
> > >> However, it could be related to your bouncelife tunable. If an address
> > >> ceases to exist, because it's deleted; or in some cases, if an address
> > >> with wrong spelling is added to the list (e.g. without requiring
> > >> confirmation), Mlmmj is going to receive a bounce message about the
> > >> non-existent address. However, Mlmmj doesn't know whether that bounce
> > >> message is a permanent error or a temporary error (and in fact,
> > >> sometimes, due to misconfiguration, errors that seem permanent are
> > >> actually temporary, so best retried anyway). Therefore Mlmmj will keep
> > >> retrying the address--possibly every 2 hours (however often mlmmj-maintd
> > >> runs; I'm not sure if Mlmmj throttles delivery or not) for *30 days*,
> > >> and every time receive a bounce message due to the non-existent address.
> > >> That many bounces for non-existent addresses would definitely make you
> > >> look like you're namespace mining (if the watchdog software that uses
> > >> the heuristic isn't smart enough to realise they're all for the same
> > >> address or few addresses).
> > >>
> > >> You can check whether this is happening by looking in your listdir. The
> > >> last bounce for each currently-bouncing address is stored in the bounce
> > >> subdir, so you can read them, and see how many addresses (including how
> > >> many from Microsoft) are bouncing, and why.
> > >>
> > >> One reason for doing automatic bounce processing is to minimise
> > >> unnecessary bounces, by unsubscribing users before bounces to them
> > >> become suspicious or waste too much bandwidth; by making your bouncelife
> > >> so high, you've reduced the effectiveness of the feature.
> > >>
> > >>> Best Regards and I hope you can help me.
> > >>
> > >> No trouble. If you need more help, please furnish us with more
> > >> information: mail logs, mlmmj logs, message headers, configuration. All
> > >> this information is useful and necessary for properly tracking down
> > >> these problems.
> > >>
> > >> Ben.
> > >
> > >
> > >
> > >
> > >
> > >






