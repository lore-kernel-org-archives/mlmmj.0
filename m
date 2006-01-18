From: Michael Fleming <mfleming@enlartenment.com>
Date: Wed, 18 Jan 2006 14:26:19 +0000
Subject: Re: mlmmj-1.2.10 bugfix release
Message-Id: <20060119002619.7ddcca51.mfleming@enlartenment.com>
List-Id: <mlmmj.mlmmj.org>
References: <20060118101910.GS87652@mmj.dk>
In-Reply-To: <20060118101910.GS87652@mmj.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mlmmj@mlmmj.org

On Wed, 18 Jan 2006 11:19:10 +0100. Mads Martin Joergensen waffled thusly:

> Hey all,
> 
> This release wasn't scheduled already, but due to a pretty nasty bug in
> the new find_email_adr() function in 1.2.9, it's going out now. There's
> also a little extra than just this bugfix:
> 
> 1.2.10
>  o Fix nasty bug in the new 1.2.9 find_email_adr() making comma in
>    quoted text in From: being discarded as invalid
>  o Simply make all addresses lowercase before doing anything else
>    wrt. sub/unsub and bounce
>  o Add czech listtexts (Lukas Hluze)
>  o Make non list emails (subconf, moderation etc.) also honor relayhost
>    and smtpport
>  o Add tunable to be able to close for subscription only (closedlistsub)
> 
> Enjoy, and upgrade those 1.2.9 boxes. http://mlmmj.mmj.dk/files
> 

I've updated the mlmmj packages I maintain for Fedora Extras (Cores 3, 4 and
Rawhide/devel branch) and they should be available when the Extras
buildsystem next performs a new package push.

Cheers,
Michael.

-- 
Michael Fleming <mfleming@enlartenment.com>
"Bother" said the Borg, "We've assimilated Pooh!"
