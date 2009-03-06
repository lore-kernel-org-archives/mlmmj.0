From: "Morten K. Poulsen" <mopo@fabletech.com>
Date: Fri, 06 Mar 2009 16:43:48 +0000
Subject: Re: Web based moderation system for MLMMJ
Message-Id: <1236357828.6389.85.camel@mopo-laptop>
List-Id: <mlmmj.mlmmj.org>
References: <498C406B.9070200@goirand.fr>
In-Reply-To: <498C406B.9070200@goirand.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

Hi Thomas,

On Thu, 2009-03-05 at 07:38 +0800, Thomas Goirand wrote:
> Outch! I normally work with error reporting E_ALL, my bad...
> 
> By the way, I did it right away, because otherwise I will forget.

That one was for me, right? ;-)

> I didn't even think a mail could ever be sent with no From:, Date: or
> such header. How nasty can it be that a mail server is accepting such
> email? :(

I am not sure that it will ever happen in real life, but I had the path
set to the listdir (not listdir/moderation) by error, so that's why it
barfed.

> Attached is a diff to apply.

Thanks, I have committed it to CVS.

> It seems you missed my README, can you re-add it in the folder?

I don't think it was the tarball, so I have copied the text from the
mail body of your original mail into a README file, and committed it to
CVS. Please check it to see if is what you wanted.

The updated version is available here:
http://mlmmj.mmj.dk/~mortenp/mlmmj-php-moderation-cvs20090306.tar.bz2

> Also, why the .htaccess in the translation folder has been renamed to
> dot.htaccess? Is that because you are using CVS?

No, it's because I don't like to have "hidden" files in the
distribution. It's an old BOFH habit.

> To me, it would be wise to switch to Git. You would never regret
> it!!!

Git is just the RCS flavor of the month. I don't see any compelling
arguments in favor of switching. Subversion might be an alternative to
CVS, but what do we gain by switching away from a tried and tested
revision control system which does a perfect job of keeping track of the
source code?

//mopo

-- 
Morten K. Poulsen <mopo@fabletech.com>
CTO, FableTech
http://fabletech.com/

