From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 21 Jan 2006 15:33:44 +0000
Subject: Re: Treatment of Delivered-To headers (Re: mlmmj-recieve silently discarding messagesail?)
Message-Id: <20060121153344.GG58097@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Morten K. Poulsen <morten@afdelingp.dk> [Jan 21. 2006 13:06]:
> Quoting Mads Martin Joergensen <mmj@mmj.dk>:
> >>Having an extra commandline switch just makes it a tiny bit more
> >>difficult to set up.
> >
> >Agreed it's a bit more difficult. I'm just pr. default cautious about
> >reading environment variables :-)
> 
> Fair enough :-)
> 
> I've been searching a bit, and it appears that Postfix and Exim also 
> sets the environment variables, although EXTENSION must be configured 
> for Exim.

If these are set, would it perhaps be possible to invoke it like this
from /etc/aliases or .qmail-foo?

 mlmmj-recieve -L /path/to/list -R $RECIPIENT

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
