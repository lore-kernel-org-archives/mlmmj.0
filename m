From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Fri, 05 Nov 2004 11:49:32 +0000
Subject: Re: feature request: DIR/mimereject
Message-Id: <20041105114932.GA6914@mopo.i.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20041104170533.GK10927@mail.lieber.org>
In-Reply-To: <20041104170533.GK10927@mail.lieber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Fri, Nov 05, 2004 at 11:35:49AM +0000, Kurt Lieber wrote:
> > He probably wants to check the headers of each MIME part in the mail body.
> > That would require parsing the body, and checking the headers of each part
> > - not an easy task. And definitely not an easy thing to do correctly.
> 
> Correct.
[snip]
> An argument can certainly be made that the MTA should handle this instead of
> the ML manager and, if you make that argument, I'll accept it. :)
> However, it is a feature of ezmlm(-idx) so I figured I'd at least ask for it.

It would be a very nice feature to have, no doubt. In out LUG we just disallow
multipart messages (unless they are multipart/signed) but that is probably a
bit to BOFH'ish for most lists :-) It would indeed make sense to allow - for
instance - multipart/related if each part was text/plain, application/x-patch
or image.

It would require that we recursively parsed the body and its parts. mmj and I
have planed a coding session later today, so maybe we should look a bit more
into it. The more I think about it, the nicer it sounds.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
