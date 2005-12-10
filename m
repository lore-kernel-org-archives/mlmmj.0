From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 10 Dec 2005 19:26:18 +0000
Subject: Re: mlmmj-1.2.9-RC2 and scooping up patches
Message-Id: <20051210192618.GQ92814@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20051206135000.GA92814@mmj.dk>
In-Reply-To: <20051206135000.GA92814@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Dec 10. 2005 05:06]:
> Mads Martin Joergensen wrote:
> 
> > I've just created 1.2.9-RC2, with the new find_email_adr() from Neale
> 
> Ah, and something else: If VERP is active and a rcpt is rejected by the
> smtp server (nonexisting user), no further rcpts are tried.

Nope, they're added to requeue all of them. In the case of VERP, it's
not recommended to continue as soon as one is rejected.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
