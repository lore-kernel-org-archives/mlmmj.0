From: "Gerd v. Egidy" <lists@egidy.de>
Date: Wed, 13 Jan 2010 14:52:44 +0000
Subject: Re: Footer in MIME messages
Message-Id: <201001131552.44276.lists@egidy.de>
List-Id: <mlmmj.mlmmj.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Ben,

> I can see from the mailing list archives that the subject of mlmmj handling
> footers correctly for MIME messages was discussed back in 2005/2006. A
>  patch was made, the latest version of which is, I believe, here:
> 
> http://plonk.de/sw/mlmmj/mlmmj-footer-mime6.patch
> 
> and it was indicated that this would be included in 1.2.10. Four years down
>  the track and we're up to 1.2.16 and it seems this patch hasn't actually
>  made it in. I couldn't find anything in the archives suggesting a change
>  of plan or explaining why it hadn't been included.

as far as I understood the discussions later on, it was preferred not to do 
the MIME-modifications within mlmmj itself.

I wrote a patch which offloads the mime-modification to another task. I use 
the altermime for that. I sent the patch in this mail:

http://mlmmj.org/archive/mlmmj/2008-12/1444.html

I guess it wasn't included because the release process for 1.2.16 was already 
started and it got forgotten later on. Morten?

Kind regards,

Gerd


-- 
Address (better: trap) for people I really don't want to get mail from:
jonas@cactusamerica.com

