From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Fri, 06 Mar 2009 20:40:19 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <1236372019.6389.95.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Thomas,

On Sat, 2009-03-07 at 03:36 +0800, Thomas Goirand wrote:
> > I don't think it was the tarball, so I have copied the text from the
> > mail body of your original mail into a README file, and committed it to
> > CVS. Please check it to see if is what you wanted.
> 
> Perfect then. That was more or less the same stuff.

Cool. Let me know if you have any changes or additions.

> >> Also, why the .htaccess in the translation folder has been renamed to
> >> dot.htaccess? Is that because you are using CVS?
> > 
> > No, it's because I don't like to have "hidden" files in the
> > distribution. It's an old BOFH habit.
> 
> It's ok then, but does your Makefile renames it?

No, there is no Makefile any longer (and it would IMO be just as bad as
distributing the file directly). But I added a word about it in the
README, just like there is for web/php-admin and web/perl-admin. I hope
that's good enough. I haven't heard about any confusion from anybody
about the other interfaces.

Morten

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

