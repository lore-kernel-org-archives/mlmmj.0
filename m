From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Wed, 30 Jun 2004 09:24:07 +0000
Subject: Re: mlmmj-webinterface (for mlmmj-0.8.1)
Message-Id: <20040630092407.GB2375@mopo.tv2.local>
List-Id: <mlmmj.mlmmj.org>
References: <Pine.LNX.4.58.0406271300400.4730@hermes.cthiel.de>
In-Reply-To: <Pine.LNX.4.58.0406271300400.4730@hermes.cthiel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, Jun 30, 2004 at 03:19:15AM +0200, Christoph Thiel wrote:
> > All the variables in TUNABLES could be adjusted from there, checkboxes,
> > inputlines and textfields.
> 
> Well, on the whole it wouldn't be to hard, but the problem is to get the
> permissions right, and I don't really now how to handle that.

If the permissions on the control directory is 2770 and the group is one
that the web server shares with the mail server, all control files will
get this group. Then it is just a matter of setting the permissions on
the files to something like 660, as far as I can see.

Best regards,
Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
