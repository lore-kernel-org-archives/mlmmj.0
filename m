From: James Scott <jlscott@clear.net.nz>
Date: Mon, 04 Apr 2011 20:02:39 +0000
Subject: RE: [mlmmj] bounces from a closed list back to spoofed email addresses
Message-Id: <F16D597A55F34BE793AF227F912A4844@mainspring.co.nz>
List-Id: <mlmmj.mlmmj.org>
References: <BANLkTi=DTJ6pFmLUF3sc_Lf2heGpWXdxRg@mail.gmail.com>
In-Reply-To: <BANLkTi=DTJ6pFmLUF3sc_Lf2heGpWXdxRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi. I recommend that you implement spam filtering prior to the message
reaching the list software.  Then you can just discard all messages that
have a sufficiently high probability of being spam, without there being any
need to undertake bounce processing. SpamAssassin in your mail path is good
for this.

Regards,

James

> -----Original Message-----
> From: mlmmj@mlmmj.org [mailto:mlmmj@mlmmj.org] On Behalf Of 
> Kovacs Albert
> Sent: Tuesday, 5 April 2011 2:55 a.m.
> To: mlmmj@mlmmj.org
> Subject: [mlmmj] bounces from a closed list back to spoofed 
> email addresses
> 
> Hello,
> 
> I have a problem with one of my closed lists. Whenever a spammer tries
> to send an email, of course mlmmj bounces back a message that it's a
> closed list for subscribers only. So far, it's fine.
> 
> However most of the time spammers enter a fake email address, and
> mlmmj tries to send back the bounces to the spoofed email addresses,
> which is of course impossible, so my postfix queue is filling with
> undeliverable mlmmj messages.
> 
> My question is how to get rid of these messages? It would be nice if
> mlmmj could be set on a per list base to discard (ie. not to send) any
> bounce messages.
> 
> Best regards,
> Bela
> 
> 


