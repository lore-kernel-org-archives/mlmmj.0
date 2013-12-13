From: "Christian Gleerup" <christian.gleerup@swn.nu>
Date: Fri, 13 Dec 2013 18:11:48 +0000
Subject: Re[2]: [mlmmj] Problems with microsoft
Message-Id: <261542a996d8378009f71ca478ff03ca@swn.nu>
List-Id: <mlmmj.mlmmj.org>
References: <ae4208d82aba105e14e3dd198f4ef133@swn.nu>
In-Reply-To: <ae4208d82aba105e14e3dd198f4ef133@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org

iw_mail p{margin:0;padding:0;}
Hello list
 
I can gladly inform you that my server has finally been allowed to send to Microsoft Again.
 
Yesterday i manually removed a bunch of email addresses where Microsoft servers had responded 550.
I removed via command line.
 
but now when i look in the '.../list/bounce' folder, all the addresses are still there.
is mlmmj going to clean up here or should I remove them manually?
 
I can see postfix is still trying to deliver the mails
 
kind regards
Christian
 
-----Original Message----- 
> From: "Ben Schmidt" <mail_ben_schmidt@yahoo.com.au> 
> To: "Christian Gleerup" <christian.gleerup@swn.nu>, mlmmj@mlmmj.org 
> Date: 03/12/2013 22:19 
> Subject: Re: [mlmmj] Problems with microsoft 
> 
> On 4/12/13 6:35 AM, Christian Gleerup wrote:
> > I have now updated to 1.2.18, and id did take some time to get the
> > list texts right, but it seems to be worken fine now. (I did a make
> > install, and then moved the installed binaries since the old binaries
> > was installed in a different location)
> 
> Perhaps you wanted to give the --prefix argument to configure or
> something. Nevertheless, I'm sure what you did will have worked fine.
> 
> > But obviously I still have the problem with sending to hotmail
> > accounts since that is a different problem... but as i noted in
> > another mail, hotmail did, when they accepted mails from me, tell me
> > to take it easy with sending that many mails in a little period of
> > time.
> >
> > so the question is, how can i tell mlmmj+postfix to only deliver x
> > mails pr. hour to the hotmail domain?
> 
> I think this is something that should be done at the MTA level, not via
> Mlmmj. Multiple mailing lists and any other mail routed through the
> server will all contribute to Hotmail's limit, so only Postfix as the
> central point of control has enough information to enforce rate
> limiting. A quick Google turns up this, which should give you a starting
> point for investigation:
> 
> http://steam.io/2013/04/01/postfix-rate-limiting/
> 
> > Also, It will be interesting to see if mlmmj unsubscribes those
> > subscribers after bouncelife (=15 days)  with the accounts from the
> > domain that was taken down 2009.
> 
> Indeed, it will. If not, something is broken somewhere, and we will have
> to investigate further....
> 
> Smiles,
> 
> Ben.




