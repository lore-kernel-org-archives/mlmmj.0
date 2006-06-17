From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Sat, 17 Jun 2006 19:16:02 +0000
Subject: Re: Mail sent to mlmmj-recieve but MLMMJ don't send subscribe
Message-Id: <37163.84.176.107.248.1150571762.squirrel@130.83.185.211>
List-Id: <mlmmj.mlmmj.org>
References: <44916980.7060706@goirand.fr>
In-Reply-To: <44916980.7060706@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hej!
On Thu, June 15, 2006 16:06, Thomas Goirand wrote:
> Hello,
>
> I have a problem with a setup. It seems mlmmj receives the mail, but
> it
> doesn't sends the confirmation email to postfix. Does one of you know
> where and how I should fix it? Any place where I should look at?
>
> What is strange is that it's an automated setup, so it should be the
> same setup as I usually use. I really don't understand...
>
> Here is the postfix log:
>
> connect from node0103.gplhost.net[66.251.193.20]
>
[...]
>
> postfix/smtpd[16083]: disconnect from localhost[127.0.0.1]
>
> amavis[19261]: (19261-04) Passed, <thomas@domain1.fr> ->
> <stoppnazistene.no_testzigo-subscribe@mx.xen330220.gplhost.com>,
> Message-ID: <449167D7.203@domain1.fr>, Hits: -
>
> postfix/smtp[16081]: 46AC5FC015:
> to=<stoppnazistene.no_testzigo-subscribe@mx.xen330220.gplhost.com>,
> orig_to=<testzigo-subscribe@stoppnazistene.no>,
> relay7.0.0.1[127.0.0.1], delay=2, status=sent (250 2.6.0 Ok,
> id261-04, from MTA: 250 Ok: queued as 31066FC018)

Did you change your command delimeter to a '-' (minus sign)?
If not, this might be the problem and the address should read:
testzigo+subscribe@stoppnazistene.no

Ciao
Chris

>
> postfix/qmgr[19244]: 46AC5FC015: removed
>
[...]
