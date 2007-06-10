From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Sun, 10 Jun 2007 12:55:28 +0000
Subject: Re: virtual domain support
Message-Id: <bc132c3e3fa3ce7eca1b3e01e386bd88@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <464DAF4C.1030800@gmail.com>
In-Reply-To: <464DAF4C.1030800@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Mehul,

"Mehul N. Sanghvi" <mehul.sanghvi@gmail.com> wrote:
> Morten K. Poulsen said the following on 5/31/2007 1:09 PM:
>>> Why is getting rejected ?
>>
>> Because your host does not know its own FQHN.
>
> I wonder how mailman does things then

What does MailMan use as the domain in the HELO line?

>> How does your /etc/hosts look?
>
> 127.0.0.1   localhost  localhost.localdomain
>
> 192.168.x.x  REAL_HOST

This makes it difficult to diagnose your problems. Is "REAL_HOST"
a short host name or is it fully qualified? I can't see that. If
you wish to "anonymize" your /etc/hosts, please pretend that the
host is in the .example or .example.com domain.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

