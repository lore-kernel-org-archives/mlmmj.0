From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Tue, 11 Oct 2005 08:52:45 +0000
Subject: Re: Fw: footer isn't appended to multipart messages (part II: reality check!)
Message-Id: <20051011085245.GJ17022@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <200507052130.02825.lists@seattleserver.com>
In-Reply-To: <200507052130.02825.lists@seattleserver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Oct 11. 2005 09:52]:
> But ok, I yield to the overwhelming majority. :)
> I'll add a switch so people can disable MIME handling. Or should the
> default be "off"?

I think the default should be off, so we're keeping compatibility, and
old installations will never all of a sudden change behaviour.

DIR/control/mimeencapsulate seems like the TUNABLE for it :-)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
