From: "Christian Gleerup" <cromozon@swn.nu>
Date: Tue, 24 Nov 2015 07:45:07 +0000
Subject: Re[2]: [mlmmj] Configuration problems using mlmmj+postfix
Message-Id: <4ce322e7d195df0799d97db012cc3eee@swn.nu>
List-Id: <mlmmj.mlmmj.org>
References: <02b18adf31d229fc17a1b9015444850b@swn.nu>
In-Reply-To: <02b18adf31d229fc17a1b9015444850b@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mlmmj@mlmmj.org


you are right, the port is overridden in 


/etc/mlmmj/nyhedsbrev/control/smtpport


the old server must have listened to port 10025. 
would you recomend me just changing it to 25? Or should I change postfix and the firewall to listen to 10025


Ohh and one more thing,
when I change the configuration, and the configuration is right so Things start working. 
I would like to be sure the old mails are 'not' send, since they are only relevant for one day (newsletter)
should I just empty the /var/spool/mlmmj/nyhedsbrev/queue using the commandline or should i use some mlmmj command?


kind regards
Christian Gleerup


-----Original Message----- 
> From: "Piotr Auksztulewicz" <mlmmj-listrcpt@hasiok.net> 
> To: mlmmj@mlmmj.org 
> Date: 24/11/2015 04:18 
> Subject: Re: [mlmmj] Configuration problems using mlmmj+postfix 
> 
> On Mon, Nov 23, 2015 at 11:08:19PM +0100, Christian Gleerup wrote:
> > Good question,
> > there is 'something' at port 25, here is the output
> 
> I had a quick look at the code, are you sure you are not overriding the
> port in the control/smtpport setting for your list? Also, there's
> a "secret" MLMMJ_TESTING environment variable which overrrides the port
> to 10025 :-)
> 
> -- 
> Piotr "Malgond" Auksztulewicz                     firstname@lastname.net
> 
> 
> 
> 


