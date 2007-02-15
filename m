From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Thu, 15 Feb 2007 22:20:36 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <1538.130.83.185.211.1171578036.squirrel@130.83.185.211>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, February 14, 2007 16:15, Sven 'Darkman' Michels wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi me, again ;-)

Hej.

>
> Sven 'Darkman' Michels wrote:
>>
>> Any ideas?
>
> I got another timeslot to get this sorted. It seems now to work and
> i fixed the parse of $maxmailsize$, too. So if anyone is interested,
> here is a cleaned patch:
> http://www.darkman.de/~sven/mlmmj-1.2.13-maxmailsize-darkman.patch
>
> I still get nothing in the logs, but that may some other problem...
>
> What i changed:
>
> - - char *maildata[4] = { "posteraddr", NULL, "maildata", NULL };
> + char *maildata[4] = { "posteraddr", NULL, "maxmailsize", NULL };

*doi*
Sorry for this inconvenience.

>
> and removed two free's:
> myfree(donemailname);
> myfree(mailfile);
> after the unlink and moved the free of maxmailsizestr befor the
> unlink.

Why do you free maxmailsizestr but mailfile and donemailname
not?
Did I miss something?

>
> Please, someone with more mlmmj knowhow or even more c code knowhow,
> take a look if thats okay.
>
> Thanks and regards,
> Sven

Ciao
Chris
