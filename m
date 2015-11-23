From: Morten Shearman Kirkegaard <moki@fabletech.com>
Date: Mon, 23 Nov 2015 19:12:12 +0000
Subject: Re: [mlmmj] Configuration problems using mlmmj+postfix
Message-Id: <20151123191206.GA2949@europa.afdelingp.dk>
List-Id: <mlmmj.mlmmj.org>
References: <2814c8bd343523366b23a6289b918a5f@swn.nu>
In-Reply-To: <2814c8bd343523366b23a6289b918a5f@swn.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Christian,

On 2015-11-23 at 19:20:38 +0100, Christian Gleerup wrote:
> I have some problems getting mlmmj to send mails out, and I don't know
> where to look, so I hope you can help me.
> 
> I have the following clues
> In /var/log/mail.err
> Nov 23 16:00:01 Lists /usr/local/bin/mlmmj-send[21648]:
> init_sockfd.c:56: Could not connect to 127.0.0.1: Connection refused

By default mlmmj uses 127.0.0.1 as relay host, when sending mails. It
appears that you don't have an SMTP server listening there.

Does the following command (assuming you're on Linux) show an SMTP
daemon?

$ netstat -nltp

Kind regards,
Morten

