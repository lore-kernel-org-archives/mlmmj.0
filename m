From: "Morten K. Poulsen" <morten@afdelingp.dk>
Date: Mon, 14 Mar 2005 09:30:56 +0000
Subject: Re: exim4
Message-Id: <20050314093055.GA5630@pc200694.webdmz.tv2.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Mon, Mar 14, 2005 at 12:55:30AM +0100, Jakob Hirsch wrote:
> >I would prefer for security reasons not to start parsing environment
> >variables. 
> 
> Sounds sensible, but mlmmj uses execvp, which uses PATH itself, so why should
> you have to parse that yourself?

It only uses $PATH if the given argument does not contain a slash. We might as
well use execl() instead of execlp(). I may patch that.

> Another possibility would be to use a hard coded path from configure or some
> header file.

Configure it at build time? Yikes.

> > Besides, with this method, you can have many mlmmj installations in
> > parallel.
> 
> mlmmj uses no config file, so what's the use? Having different versions of
> mlmmj running? That should be done with configure's --program-suffix.
> Otherwise you end up having a directory for every mlmmj installation.

Exactly! I want to use two different versions of mlmmj for the same list, when
testing a new patch. One set of binaries in one directory, the other set in
another directory, and two different aliases. Therefore I _need_ the full path,
and it can not be in the configuration file, as the two versions share it.

Morten

-- 
Morten K. Poulsen <morten@afdelingp.dk>
http://www.afdelingp.dk/
