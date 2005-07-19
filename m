From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 19 Jul 2005 09:11:32 +0000
Subject: Re: mlmmj 1.2.9 UNOFFICIAL release, with qmail support
Message-Id: <20050719091132.GR83227@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <42D3CDD00000AB73@ims3a.cp.tin.it>
In-Reply-To: <42D3CDD00000AB73@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Morten K. Poulsen <morten@afdelingp.dk> [Jul 19. 2005 11:10]:
> On Mon, Jul 18, 2005 at 11:41:03PM +0200, Mads Martin Joergensen wrote:
> >  if(owner && strncmp(recipdelim, concatstr(2, RECIPDELIM, "owner@"), 7) = 0) {
> 
> Wouldn't
> 
> if(owner && strncmp(recipdelim, RECIPDELIM"owner@", 7) = 0) {
> 
> do the same? Then the compiler handles the concatenation.

Indeed! I totally forgot about that.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
