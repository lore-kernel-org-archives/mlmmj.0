From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Wed, 14 Dec 2005 15:06:43 +0000
Subject: Re: MIME footer patch, was: mlmmj-1.2.9-RC2 and scooping up patches
Message-Id: <20051214150642.GZ92814@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <439A50CA.2020703@plonk.de>
In-Reply-To: <439A50CA.2020703@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Dec 10. 2005 04:51]:
> >   http://mlmmj.mmj.dk/files/mlmmj-1.2.9-RC2.tar.bz2
> 
> nice!

Last chance for 1.2.9 final patches.

> And I finally reworked the infamous MIME footer patch. The behaviour is
> now controlled by a new control (footer_mime).
> 
> There are some major changes in the vodoo file:
> - rebuild the while loop that works through the headers
> - removed the strlen(hdrline)=1 check. gethdrline() never returns more
> than one LF and it's always the rightmost character.
> - removed the special handling of headers starting with "mime" (usually
> only the "MIME-Version" header). What was the purpose of it? AFAIK it's
> a header like every else.
> - the result of every writen() is checked now
> 
> The changes are really big, but the code is much clearer now and fairly
> straightforward. As always, comments welcome.

It's nice and fine, but too big to go in 1.2.9 at this point. 1.2.10-RC1
will have it.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
