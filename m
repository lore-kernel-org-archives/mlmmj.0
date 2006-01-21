From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Sat, 21 Jan 2006 11:56:24 +0000
Subject: Re: Treatment of Delivered-To headers (Re: mlmmj-recieve silently discarding messagesail?)
Message-Id: <20060121115624.GF58097@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
In-Reply-To: <Pine.LNX.4.61.0601202202460.6540@e-smith.charlieb.ott.istop.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Morten K. Poulsen <morten@afdelingp.dk> [Jan 21. 2006 12:55]:
> Quoting Mads Martin Joergensen <mmj@mmj.dk>:
> >>Unless you tell me I'm way off track, I'll try to get a patch together. It
> >>should be safe to assume that $RECIPIENT won't be set under other MTAs. If
> >>you think it's not, then we could use a command line flag to only activate
> >>the environment check under qmail.
> >
> >I would love a patch doing this, with a a commandline option to
> >configure it. No need to read environment variables anywhere else than
> >qmail AFAIK.
> 
> Do we need a commandline switch? If qmail puts the values (which other 
> MTAs put in headers) in environment variables, the code could be 
> changed to something like the following pseudo code:
> 
> envelope_to = getenv("RECIPIENT");
> 
> if (!envelope_to)
>    envelope_to = getheader("Delivered-To");
> 
> if (!envelope_to)
>    envelope_to = getheader("To");
> 
> if (!envelope_to)
>    abort();
> 
> ... and likewise for sender.
> 
> Having an extra commandline switch just makes it a tiny bit more 
> difficult to set up.

Agreed it's a bit more difficult. I'm just pr. default cautious about
reading environment variables :-)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
