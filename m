From: Jakob Hirsch <jh@plonk.de>
Date: Mon, 11 Sep 2006 09:17:38 +0000
Subject: Re: mlmmj-1.2.12-RC1 released
Message-Id: <450529B2.4030106@plonk.de>
List-Id: <mlmmj.mlmmj.org>
References: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
In-Reply-To: <34f6b3c998e8d4bb4bd464d07c87532c@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Quoting Morten K. Poulsen:

>>> I do not like the idea of having MIME parsing in the list manager
>>>  itself. Or any kind of mail body parsing, for that matter.
>> Um, we had this discussion on this list about 9 months ago. Mads 
>> promised to include this in 1.2.10-RC1...
> Yes, I see. But he didn't keep that promise.

So you could do it for him :)

>> Most of the patch is simplyfing the "voodoo" and making it less
>> ugly, which I felt should be done because it got even more ugly
>> with the mime stuff in it. This should be done even without the
>> mime stuff.
> I still do not like the idea of having MIME parsing in the list

I understand your concern. MIME seems to have a bad reputation when it
comes to handling in software. But the patched mlmmj is really not doing
much: Take the message (with MIME headers, if present) and put it into a
new MIME envelope. This is really not rocket science.
And as Sven pointed out: There's already the functionality of adding a
footer. I think there is some feature, it should be done right, not half
hearted. Or at least there should be at warning in the description of
the feature about its limitation (euphemised). MIME is not something new
 and fancy, many MUAs use it today, so any decent mail processing
software should at least be able to deal with its basics.

> manager, but I will have another look at the patch after the release
> of mlmmj-1.2.12.

Uh, I think I heard something like that before. :)

>> PS: For some strange reason, I cannot mail you directly. My MTA
>> times out after send its EHLO, but your SMTP greeting comes fast
>> when I telnet the smtp port of mail.n0rd.dk, so the connection
>> seems to be ok.
> worksforme

looked into it, again. It works here if I disable tcp window scaling
(RFC1323) with "echo 0 > /proc/sys/net/ipv4/tcp_window_scaling". This
indicates a broken firewall somewhere in the path (probably near your
server, I tested from various sites and all of them had this). See e.g.
http://kerneltrap.org/node/6723.


