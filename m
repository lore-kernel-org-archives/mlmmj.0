From: "Christoph Wilke" <chris@filmkreis.tu-darmstadt.de>
Date: Fri, 16 Feb 2007 19:19:59 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <1460.130.83.185.211.1171653599.squirrel@130.83.185.211>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, February 16, 2007 03:45, Sven 'Darkman' Michels wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hey,
>
> Christoph Wilke wrote:
>>> - - char *maildata[4] = { "posteraddr", NULL, "maildata", NULL };
>>> + char *maildata[4] = { "posteraddr", NULL, "maxmailsize", NULL };
>>
>> *doi*
>> Sorry for this inconvenience.
>
> No Problem, for me as a no-coder it just takes a little longer
> to understand such patches, but at least i got this fixed ;)
>
>
>>> and removed two free's:
>>> myfree(donemailname);
>>> myfree(mailfile);
>>> after the unlink and moved the free of maxmailsizestr befor the
>>> unlink.
>>
>> Why do you free maxmailsizestr but mailfile and donemailname
>> not?
>> Did I miss something?
>
> well, simple: if i free them, it doesn't work anymore. When i
> leave them as you posted them, the reject mail isn't send to the
> user anymore. I get a file in queue which *should* go to the user,
> but they never get sent out. After removing the two frees, it
> works. Thats why i asked for a review ;)

Interesting.
In my understanding prepstdreply() creates a real file and
return its descriptor. Mlmmjsend() only operates on this
existing fd (queuefilename) and shouldn't care about
donemailname and mailfile.
So the variables could be freed (the associated files are
already removed (unlinked)).

-- Or not??

>
> Regards,
> Sven
>
> PS: your mailaddress was bouncing, got this fixed? ;)

Ciao
Chris

ps. I know. Forgot to save the config before restarting the
router... *doiagain*

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.2 (GNU/Linux)
>
> iD8DBQFF1RrZQoCguWUBzBwRAjGVAJ9NbP4s+s2bixPesBcNVYEAVj9NiACfdvfP
> YskITftEQwlX+pg1XE3NEbE=
> =92cT
> -----END PGP SIGNATURE-----
>

