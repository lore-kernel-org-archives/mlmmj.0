From: "Christian Gleerup" <cromozon@swn.nu>
Date: Wed, 25 Nov 2015 09:59:38 +0000
Subject: Re[3]: [mlmmj] Configuration problems using mlmmj+postfix
Message-Id: <db178b5cd12436fb253fe745e57f0310@swn.nu>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi again list,

There still seems to be a problem,
Now I have a doubt if the server receives the mail at all and the errors was all from old mailqueue that I copied from the old server?

any hint on what I should look at besided DNS/MX-records?


-----Original Message----- 
> From: "Christian Gleerup" <cromozon@swn.nu> 
> To: mlmmj@mlmmj.org, "Morten Shearman Kirkegaard" <moki@fabletech.com> 
> Date: 24/11/2015 14:48 
> Subject: Re[2]: [mlmmj] Configuration problems using mlmmj+postfix 
> 
> Morten and Piotr
> 
> I have updated and deleted the emails, now the 'editor' just need to write a new newsletter and see if it is send out.
> 
> thank you both for you help.
> 
> Kind Regards
> Christian Gleerup
> 
> 
> -----Original Message----- 
> > From: "Morten Shearman Kirkegaard" <moki@fabletech.com> 
> > To: mlmmj@mlmmj.org 
> > Date: 24/11/2015 13:48 
> > Subject: Re: [mlmmj] Configuration problems using mlmmj+postfix 
> > 
> > On 2015-11-24 at 08:45:07 +0100, Christian Gleerup wrote:
> > > you are right, the port is overridden in
> > > 
> > > /etc/mlmmj/nyhedsbrev/control/smtpport
> > > 
> > > the old server must have listened to port 10025.
> > > would you recomend me just changing it to 25?
> > 
> > Yes, and you can do that by just removing the "smtpport" file.
> > 
> > > should I just empty the /var/spool/mlmmj/nyhedsbrev/queue using the
> > > commandline or should i use some mlmmj command?
> > 
> > The command line is fine.
> > 
> > Kind regards,
> > Morten
> > 
> > 
> > 
> >


