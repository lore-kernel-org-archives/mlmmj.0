From: Mads Martin Joergensen <mmj@mmj.dk>
Date: Mon, 14 Mar 2005 08:55:00 +0000
Subject: Re: exim4
Message-Id: <20050314085459.GA19605@mmj.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

* Jakob Hirsch <jh@plonk.de> [Mar 14. 2005 00:55]:
> Mads Martin Joergensen wrote:
> 
> >>I've wondered about that myself. If the binaries are installed somewhere
> >>in $PATH, wouldn't that provide sufficient method for finding them?
> >I would prefer for security reasons not to start parsing environment
> >variables. 
> 
> Sounds sensible, but mlmmj uses execvp, which uses PATH itself, so why 
> should you have to parse that yourself?

This assumes that mlmmj is installed in the PATH, which very often is
not the case. mlmmj binaries are run by some unpriviliged user, which
often doesn't have a path. That would lead to execlp searching in /bin
and /usr/bin for binaries, but all the BSDs for one have it installed in
/usr/local/bin.

> Another possibility would be to use a hard coded path from configure or 
> some header file.
> 
> > Besides, with this method, you can have many mlmmj installations in
> > parallel.
> 
> mlmmj uses no config file, so what's the use? Having different versions 
> of mlmmj running? That should be done with configure's --program-suffix. 
> Otherwise you end up having a directory for every mlmmj installation.

But then you couldn't move the binaries around, and it would add
constraints. If it's so bad for you, just create a small shell wrapper
which solves it all for you?

The use for several installations is needed for people running
production systems.

-- 
Mads Martin Joergensen, http://mmj.dk
"Why make things difficult, when it is possible to make them cryptic
 and totally illogical, with just a little bit more effort?"
                                -- A. P. J.
