From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 05 Sep 2006 17:24:49 +0000
Subject: Re: mlmmj-1.2.12-RC1 released
Message-Id: <598fb46d54b32c7715248d5926befb50@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
In-Reply-To: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


On Tue, 5 Sep 2006 08:43:05 +0200, Christian Lackas <c.lackas@fz-juelich.de> wrote:
> * Morten K.Poulsen <morten@afdelingp.dk> [060904 21:52]:
>> I am proud to present the first release candidate with me as maintainer.
> 
> thanks for your great work.

You're welcome. I am just releasing it :)

>> de
>> - bounce-probe
>> - digest
>> - submod-moderator
>> - submod-requester
> 
> You can find a German translation here:
> 
>     http://www.spect-ct.com/temp/mlmmj-texts-de.tgz
>     http://www.spect-ct.com/temp/de/

Thanks a lot! They are committed to CVS now.

> BTW: Do I have to avoid 8-bit characters (like German umlauts) in the
> subject line (that's what I did, however, I was not sure if this is
> actually necessary)?

The short answer: yes.

MUAs should not know how to interpret 8-bit values. Some make a guess, usually at ISO-8859-1 (which is perfect for German), but some do not. This guesswork is what makes 8-bit characters work in the message body. A lot of MTAs and anti-spam tools reject messages with 8-bit characters in their headers. This can be solved with RFC 2047 (see listtexts/fr/ for examples).

I will add support for quoted printable bodies in mlmmj's administrative mails "soon."

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

