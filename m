From: "Mehul N. Sanghvi" <mehul.sanghvi@gmail.com>
Date: Fri, 08 Jun 2007 10:46:42 +0000
Subject: Re: virtual domain support
Message-Id: <46693392.5050006@gmail.com>
List-Id: <mlmmj.mlmmj.org>
References: <464DAF4C.1030800@gmail.com>
In-Reply-To: <464DAF4C.1030800@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Morten K. Poulsen said the following on 5/31/2007 1:09 PM:
> Hi Mehul,
> 
> "Mehul N. Sanghvi" <mehul.sanghvi@gmail.com> wrote:
>> In trying to send a message to the list I get the following
>> entries in the /var/log/mail.log file:
> [snip]
>> May 30 23:54:51 REAL_HOST postfix/smtpd[17679]: NOQUEUE: reject: RCPT from
>> localhost.localdomain[127.0.0.1]: 504 5.5.2 <REAL_HOST>: Helo command
>> rejected:
>> need fully-qualified hostname; from=<mlmmj-test+bounces-help@VHOST.TLD>
>> to=<USER@VHOST.TLD> proto=SMTP helo=<REAL_HOST>
> [snip]
>> Why is getting rejected ?
> 
> Because your host does not know its own FQHN.
> 

I wonder how mailman does things then, because my mailing lists work fine in 
Mailman on the same system.  But Mailman is overkill for what I want to do

>> I would like mlmmj to use the VHOST.TLD in the HELO rather then the
>> REAL_HOST, is that possible ?
> 
> No, that is not possible.
> 
> Mlmmj asks the operating system - via gethostname() - what its hostname is.
> Then it does a lookup - via gethostbyname() - to get the host's FQHN.
> 
> How does your /etc/hosts look?

127.0.0.1   localhost  localhost.localdomain

192.168.x.x  REAL_HOST



cheers,

      mehul
-- 
Mehul N. Sanghvi
email: mehul.sanghvi@gmail.com
