From: Morten K. Poulsen <morten@afdelingp.dk>
Date: Tue, 20 Feb 2007 23:01:15 +0000
Subject: Re: mlmmj maxmailsize patch
Message-Id: <798fb4667da8019097da0144d4b27f3e@mail.n0rd.dk>
List-Id: <mlmmj.mlmmj.org>
References: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
In-Reply-To: <6171a10dca36fac0233ac365eec3e560@mail.n0rd.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org


Hi,

"Christoph Wilke" <chris@filmkreis.tu-darmstadt.de> wrote:
> On Sun, February 18, 2007 13:20, Sven 'Darkman' Michels wrote:
>> so i was "right" with removing the two free's?
> 
> You were. But I don't have an idea why.
> And if it is correct to have no myfree()s there.
> Maybe someone can clarify this, please?

The myfree()s should be there. And having them there should not
cause any kind of problems. If it does, could you try to debug
it? We might have some other memory bug, which is triggered by
the myfree()s.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/

