From: "Christian Gleerup" <christian.gleerup@swn.nu>
Date: Wed, 18 Dec 2013 18:32:46 +0000
Subject: Re[2]: [mlmmj] Problems with microsoft
Message-Id: <c408392279c6e25901ff4e8c5a127271@swn.nu>
List-Id: <mlmmj.mlmmj.org>
References: <ae4208d82aba105e14e3dd198f4ef133@swn.nu>
In-Reply-To: <ae4208d82aba105e14e3dd198f4ef133@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

Hi Ben and list,
   
  I was wondering, what if I used the -B option to simulate a confirmed unsubscription, would that do the trick, or would this problem need a code patch to be solved?
  
 I was thinking that, at the place where the unsubscription is finally effectuated. The function should do a quick cleanup in the bounce folder for the particullar email adress being unsubscribed.

 I looked a bit at the code, but erhm, it is a  bit hard to read for me, if someone can point me in the right direction, I can spare some time to try to fix this.
 Christian

-----Original Message----- 
> From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au> 
> To: "Christian Gleerup" <christian.gleerup@swn.nu>, mlmmj <mlmmj@mlmmj.org> 
> Date: 17/12/2013 05:19 
> Subject: Re: [mlmmj] Problems with microsoft 
> 
> mlmmj-maintd should leave the bounce in the bounce subdir, and send a probe. If it 
> gets no bounce for the probe for a while, it will remove the bounce assuming the 
> user is no longer bouncing. If it does get a bounce to the probe, it will continue 
> probing for a while, but eventually unsubscribe the user for bouncing for too long.
> 
> I think some of the amounts of time it takes to do these things are currently 
> hard-coded. One day this will be fixed, but it's fairly low on the priority list.
> 
> It is possible that if you unsubscribe a user manually, Mlmmj will keep probing 
> them. If that does happen, it's a bug, I suppose, and should be fixed.
> 
> Ben.
> 
> 
> 
> On 15/12/13 9:44 PM, Christian Gleerup wrote:
>  > Hello Ben
>  >
>  > I was a bit impation, and manually deleted those in the bounce folder. (currently
>  > a bit paranoid about getting trappend in Microsofts spam list again).
>  >
>  > Regarding mlmmj-maintd, it is scheduled to run every second hour, and I also tried
>  > to run it manually (without a lot of waiting tough)
>  > mlmmj-maind is setup in cron.d/mlmmj almost identical to the sample on mlmmj's
>  > website.
>  >
>  > 0 */2 * * * root /usr/bin/test -x /usr/bin/mlmmj-maintd && /usr/bin/mlmmj-maintd
>  > -F -d /var/spool/mlmmj
>  >
>  > On the other hand, I don't really understand how mlmmj-maintd works in the
>  > following case:
>  >
>  > 1) mlmmj sends a mail to a some subscriber
>  >
>  > 2) the recipent sends 550, non-existing user.
>  >
>  > 3) I manually parse the 'bounce files' and identify the '550, non-existing user'
>  >
>  > 4) I manully unsubscribe the 'non-existing user' from command line
>  >
>  > ---> at this point, I would expect no more mails getting queued since the user is
>  > no longer subscriber?
>  >
>  > * I would expect mlmmj to either remove the mail from the bounce list when
>  > unsubscribing, or to remove it on the Next mlmmj-maintd run since it is no longer
>  > a subscriber.
>  >
>  > if mlmmj sends a probe for 'removal' detection, isn't it going to stay in the
>  > bounce directory as long as the server responds with 550?
>  >
>  > Is there something I am missing?
>  >
>  > kind regards
>  >
>  > Christian
>  >
>  > -----Original Message-----
>  >  > From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au>
>  >  > To: "Christian Gleerup" <christian.gleerup@swn.nu>
>  >  > Date: 15/12/2013 02:09
>  >  > Subject: Re: [mlmmj] Problems with microsoft
>  >  >
>  >  > Hi, Christian,
>  >  >
>  >  > Mlmmj-maintd should clean it; it will send a probe, wait a while in case
>  >  > a bounce comes back, and if it doesn't, it will remove the bounce. If
>  >  > everything is working properly....
>  >  >
>  >  > Ben.
>  >  >
>  >  >
>  >  >
>  >  > On 14/12/13 5:11 AM, Christian Gleerup wrote:
>  >  > > iw_mail p{margin:0;padding:0;}
>  >  > > Hello list
>  >  > >
>  >  > > I can gladly inform you that my server has finally been allowed to send to
>  > Microsoft Again.
>  >  > >
>  >  > > Yesterday i manually removed a bunch of email addresses where Microsoft
>  > servers had responded 550.
>  >  > > I removed via command line.
>  >  > >
>  >  > > but now when i look in the '.../list/bounce' folder, all the addresses are
>  > still there.
>  >  > > is mlmmj going to clean up here or should I remove them manually?
>  >  > >
>  >  > > I can see postfix is still trying to deliver the mails
>  >  > >
>  >  > > kind regards
>  >  > > Christian
>  >  > >
>  >  > > -----Original Message-----
>  >  > >> From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au
>  > <mailto:mail_ben_schmidt@yahoo.com.au>>
>  >  > >> To: "Christian Gleerup" <christian.gleerup@swn.nu
>  > <mailto:christian.gleerup@swn.nu>>, mlmmj@mlmmj.org <mailto:mlmmj@mlmmj.org>
>  >  > >> Date: 03/12/2013 22:19
>  >  > >> Subject: Re: [mlmmj] Problems with microsoft
>  >  > >>
>  >  > >> On 4/12/13 6:35 AM, Christian Gleerup wrote:
>  >  > >>> I have now updated to 1.2.18, and id did take some time to get the
>  >  > >>> list texts right, but it seems to be worken fine now. (I did a make
>  >  > >>> install, and then moved the installed binaries since the old binaries
>  >  > >>> was installed in a different location)
>  >  > >>
>  >  > >> Perhaps you wanted to give the --prefix argument to configure or
>  >  > >> something. Nevertheless, I'm sure what you did will have worked fine.
>  >  > >>
>  >  > >>> But obviously I still have the problem with sending to hotmail
>  >  > >>> accounts since that is a different problem... but as i noted in
>  >  > >>> another mail, hotmail did, when they accepted mails from me, tell me
>  >  > >>> to take it easy with sending that many mails in a little period of
>  >  > >>> time.
>  >  > >>>
>  >  > >>> so the question is, how can i tell mlmmj+postfix to only deliver x
>  >  > >>> mails pr. hour to the hotmail domain?
>  >  > >>
>  >  > >> I think this is something that should be done at the MTA level, not via
>  >  > >> Mlmmj. Multiple mailing lists and any other mail routed through the
>  >  > >> server will all contribute to Hotmail's limit, so only Postfix as the
>  >  > >> central point of control has enough information to enforce rate
>  >  > >> limiting. A quick Google turns up this, which should give you a starting
>  >  > >> point for investigation:
>  >  > >>
>  >  > >> http://steam.io/2013/04/01/postfix-rate-limiting/
>  >  > >>
>  >  > >>> Also, It will be interesting to see if mlmmj unsubscribes those
>  >  > >>> subscribers after bouncelife (=15 days)  with the accounts from the
>  >  > >>> domain that was taken down 2009.
>  >  > >>
>  >  > >> Indeed, it will. If not, something is broken somewhere, and we will have
>  >  > >> to investigate further....
>  >  > >>
>  >  > >> Smiles,
>  >  > >>
>  >  > >> Ben.
>  >  > >
>  >  > >
>  >  > >
>  >  > >
>  >  > >
>  >  > >




