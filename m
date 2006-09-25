From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Mon, 25 Sep 2006 20:49:24 +0000
Subject: Re: [PATCH] Subscriber other (was: Moderator subscription)
Message-Id: <6f289252f9f2d3e993f0a0e8f6fe565b@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <45183676.9010702@kite.se>
In-Reply-To: <45183676.9010702@kite.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi Magnus,

"Magnus Naeslund(k)" <mag@kite.se> wrote:
> Mads Martin Joergensen wrote:
>> Absolutely they will. Patches are ALWAYS more than welcome :)
> 
> I'll make you eat those words :)

Haha :)

> This is an initial patch for the functionality that I was asking about.

Thanks. The patch looks fine, but you'll probably have to resubmit it a few days after mlmmj-1.2.12 is out. We are known for ignoring patches ;)

[snip]
> So if this patch is near lift off, I'll patch up the -help text to display
> help for this command.

Yep, help text is a good idea.

> P.S. I noticed that the "param" variable is sometimes freed, but sometimes
> not. What is the rule here?

Well, the rule is to free all memory. But IIRC every case ends with an execlp(), so it will not matter. It's just for the sake of Valgrind and me.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

