From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Tue, 24 Nov 2015 12:29:39 +0000
Subject: Re: [mlmmj] Configuration problems using mlmmj+postfix
Message-Id: <20151124122938.GA6104@europa.afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <2814c8bd343523366b23a6289b918a5f@swn.nu>
In-Reply-To: <2814c8bd343523366b23a6289b918a5f@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On 2015-11-24 at 08:45:07 +0100, Christian Gleerup wrote:
> you are right, the port is overridden in
> 
> /etc/mlmmj/nyhedsbrev/control/smtpport
> 
> the old server must have listened to port 10025.
> would you recomend me just changing it to 25?

Yes, and you can do that by just removing the "smtpport" file.

> should I just empty the /var/spool/mlmmj/nyhedsbrev/queue using the
> commandline or should i use some mlmmj command?

The command line is fine.

Kind regards,
Morten

