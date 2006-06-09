From: Jakob Hirsch <jh@plonk.de>
Date: Fri, 09 Jun 2006 18:41:25 +0000
Subject: Re: delay in mailing to lists?
Message-Id: <4489C0D5.6030201@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <5D67D244-B0A5-4E06-BB80-0FC6B5EC1DAC@gmail.com>
In-Reply-To: <5D67D244-B0A5-4E06-BB80-0FC6B5EC1DAC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Nate Beaty:

> I followed the instructions in README.exim4, and set up a "lists."
> subdomain for mailing lists, but when I try to send a test email to my
> list, Exim shows the following in the log:

The log shows two transactions:
First the inbound mail from natron46@burnaby.textdrive.com to
mlmmj-test@lists.clixel.com, identified by the queue id
1FoYEy-0001NS-As, which gets delivered to mlmmj.
Second, the inbound mail from mlmmj
(mlmmj-test+bounces-13@lists.clixel.com), which is rejected because
lists.clixel.com is resolved (for some reason, maybe you have it in your
/etc/hosts) to 127.0.0.1.
Are you sure you followed exactly the instructions in README.exim4? You
have to put !mlmmj_domains in the "domains" list of the dnslookup router
(and all other routers with such a negative match).

The mlmmj setup seems ok, so it's a Exim issue. If you cannot get it
running, you should post a output of
exim -d+expand -bt mlmmj-test+bounces-13@lists.clixel.com

(though it's a little OT here...)
