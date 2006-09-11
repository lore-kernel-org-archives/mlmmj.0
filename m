From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 11 Sep 2006 23:25:59 +0000
Subject: Re: [PATCH] chomp to remove '\r' as well
Message-Id: <20060911232559.GO1815@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <20060911123559.GK1815@mmj.dk>
In-Reply-To: <20060911123559.GK1815@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Morten K. Poulsen <morten@afdelingp.dk> [Sep 11. 2006 20:14]:
> 
> On Mon, 11 Sep 2006 14:35:59 +0200, Mads Martin Joergensen <mmj@mmj.dk> wrote:
> > Anyone object to this behaviour?
> [snip]
> > -       while(str[i] = '\n') {
> > +       while(str[i] = '\n' || str[i] = '\r') {
> 
> Fine by me.
> 
> Was the guy using the twisted BSD variant from Apple Computer, which uses \r and not \n?

No, his sysadmins based on windows added ^M's. BSD wouldn't even think
of such--albeit Apply have touched it :)

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                 -- A. P. J.
