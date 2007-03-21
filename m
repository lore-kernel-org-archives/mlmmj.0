From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Wed, 21 Mar 2007 18:00:49 +0000
Subject: Re: Address Parsing
Message-Id: <428f24780e3f6f722a403e9860c25bb7@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20070320140935.GP25058@suse.de>
In-Reply-To: <20070320140935.GP25058@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi,

Mads Martin Joergensen <mmj@mmj.dk> wrote:
> * Neale Pickett <neale@woozle.org> [Mar 20. 2007 21:51]:
>>> Morten you can log into panther and look in
>>> /usr/src/usr.bin/mail/aux.c
[snip]
>> You guys are awesome, you found a bug with BSD mail?  Way to go!

We may be awsome ;-) But the bug I fixed is not in BSD mail. It is
only in mlmmj. It was added as a part of a fix for mlmmj-1.2.10:

 o Fix nasty bug in the new 1.2.9 find_email_adr() making comma in
   quoted text in From: being discarded as invalid

> ... since you, Morten, have found and fixed a bug in FreeBSD mail
> as Neale points out, you might want to send it yourself to get
> proper credit :-)

Well, no FreeBSD credit for me in this round  ;-)

But the bug is out of mlmmj. That's the main issue.


Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

