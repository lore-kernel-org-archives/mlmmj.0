From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 11 Oct 2005 12:24:03 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality check!)
Message-Id: <20051011122403.GM17022@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Oct 11. 2005 11:30]:
> >> But ok, I yield to the overwhelming majority. :)
> >> I'll add a switch so people can disable MIME handling. Or should the
> >> default be "off"?
> > I think the default should be off, so we're keeping compatibility,
> > and old installations will never all of a sudden change behaviour.
> 
> sounds sensible.
> 
> > DIR/control/mimeencapsulate seems like the TUNABLE for it :-)
> 
> something like footer_use_mime sounded logical for me, as it's only
> used if there's a footer, but I don't really care about that.

/me neither. You're making the patch, call it what you want.

> About the writen()s you mentioned: abort if they fail?

Like this first writen in mlmmj-process.c:

    if(writen(queuefd, tmp, strlen(tmp)) < 0)
            log_error(LOG_ARGS, "Could not write line for "
                                 "moderatemail");

You mention you've found other writen() calls that there's no check for.
It might very well be the case, but it's a bug then. Albeit a minor one,
since writen() catches EINTR and ensures that all bytes one wants to
write are written by calling write() subsequently.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
