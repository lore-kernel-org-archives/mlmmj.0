From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Tue, 19 Jul 2005 09:10:20 +0000
Subject: Re: mlmmj 1.2.9 UNOFFICIAL release, with qmail support
Message-Id: <20050719091020.GC5538@mopo.webdmz.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <42D3CDD00000AB73@ims3a.cp.tin.it>
In-Reply-To: <42D3CDD00000AB73@ims3a.cp.tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Jul 18, 2005 at 11:41:03PM +0200, Mads Martin Joergensen wrote:
>  if(owner && strncmp(recipdelim, concatstr(2, RECIPDELIM, "owner@"), 7) = 0) {

Wouldn't

if(owner && strncmp(recipdelim, RECIPDELIM"owner@", 7) = 0) {

do the same? Then the compiler handles the concatenation.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
