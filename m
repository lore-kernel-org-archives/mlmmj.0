From: "Christian Gleerup" <christian.gleerup@swn.nu>
Date: Sat, 23 Nov 2013 23:26:43 +0000
Subject: Re[2]: [mlmmj] Problems with microsoft
Message-Id: <ae4208d82aba105e14e3dd198f4ef133@swn.nu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


Hi, Ben
 
Thanks a lot for our thorough description!
I will go through the points tomorrow and let you know how it goes.
 
 
Thanks.
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




