From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 14 Mar 2005 08:56:29 +0000
Subject: Re: exim4
Message-Id: <20050314085629.GB19605@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Mar 14. 2005 00:48]:
> >>runs into the same problems as me: return_path_add is needed in the 
> >>transport calling mlmmj-recieve. I had a hard time finding that out, 
> >Could you maybe write it into README.exim and send it to me, then I'll
> >include it.
> 
> Sure, in the next days.

Nice.

> btw, after I had it running, I saw a post in the archive about just this 
> subject (http://mlmmj.mmj.dk/archive/0154.html). Should have checked the 
> archives a little more thoroughly...

The README also has this: "Also make sure that exim will add the
envelope from in the Return-Path: header."

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
