From: Christian Laursen <xi@borderworlds.dk>
Date: Mon, 14 Mar 2005 09:29:37 +0000
Subject: Re: exim4
Message-Id: <86r7iiefsu.fsf@borg.borderworlds.dk>
List-Id: <mlmmj.mlmmj.org>
References: <4232593D.2000404@plonk.de>
In-Reply-To: <4232593D.2000404@plonk.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Jakob Hirsch <jh@plonk.de> writes:

> Mads Martin Joergensen wrote:
> 
> >>I've wondered about that myself. If the binaries are installed somewhere
> >>in $PATH, wouldn't that provide sufficient method for finding them?
> > I would prefer for security reasons not to start parsing environment
> > variables.
> 
> Sounds sensible, but mlmmj uses execvp, which uses PATH itself, so why
> should you have to parse that yourself?
> Another possibility would be to use a hard coded path from configure
> or some header file.

The currently implemented approach works very well. I for one don't like
it when things have to change for no good reason.

If it is so annoying to use the full path, write a wrapper.

>  > Besides, with this method, you can have many mlmmj
> > installations in parallel.
> 
> mlmmj uses no config file, so what's the use? Having different
> versions of mlmmj running? That should be done with configure's
> --program-suffix. Otherwise you end up having a directory for every
> mlmmj installation.

A directory for every installation seems far less confusing than one
directory clobbered with mulitple version from my point of view.

-- 
Christian Laursen
